"""
CaSSI RITA programmatic file access & download scripts

Based on a combination of 
https://github.com/spacetelescope/mast_notebooks/blob/roman-prelaunch/notebooks/Roman/CaSSI_Supplementary_Telementry_Retrieval/cassi_supptelem_query_download_script.py
and Eric Switzer's (https://github.com/eric-switzer) CaSSI query and download scripts from 
https://github.com/RomanSpaceTelescope/RST_commissioning (non-public repo).
"""
import os
from pathlib import Path
import time
from datetime import datetime
import sys
import argparse
import warnings
from concurrent.futures import ThreadPoolExecutor, as_completed
from threading import Lock
import requests

import numpy as np
from pandas import DataFrame


# SETTINGS FOR RITA:
ARCHIVE = "roman"
DATAGROUP = "rita"
TIMEOUT = 300 # seconds
RESULT_LIMIT = 100

# pylint: disable=W0613

# -------------------------------------------------------------
# URL UTILITIES

def get_cassi_rita_search_url(datagroup, provenance):
    """Get CaSSI search URL"""
    return f"https://mast.stsci.edu/cassi/api/v0.1/{datagroup}/search/{provenance}"

def get_cassi_download_url(archive, datagroup):
    """Get CaSSI download URL."""
    return f"https://mast.stsci.edu/cassi/api/v0.1/download/{archive}/{datagroup}"

# -------------------------------------------------------------
# DOWNLOAD UTILITIES
# Parallel download functions are based heavily on Eric Switzer's
# parallel download code.
# Could be a stand-alone subpackage/file, but for now
# will be copied to each helper function separately to enable
# stand-alone, no dependency functionality.

# Thread-safe counter for progress tracking
class DownloadTracker:
    """
    Thread-safe counter for progress tracking.
    Written by Eric Switzer.
    """
    def __init__(self, total_files, verbose=True):
        self.total_files = total_files
        self.completed = 0
        self.failed = 0
        self.lock = Lock()
        self.start_time = time.time()
        self.verbose = verbose

    def increment_completed(self):
        """Increment completed download counter"""
        with self.lock:
            self.completed += 1
            self._print_status()

    def increment_failed(self):
        """Increment failed download counter"""
        with self.lock:
            self.failed += 1
            self._print_status()

    def _print_status(self):
        if self.verbose:
            elapsed = time.time() - self.start_time
            rate = self.completed / elapsed if elapsed > 0 else 0
            print(f"Progress: {self.completed}/{self.total_files} completed, "
                f"{self.failed} failed | {rate:.2f} files/sec | "
                f"Elapsed: {elapsed:.1f}s")



def download_cassi_file(
    product_url,
    endpoint_url=get_cassi_download_url(ARCHIVE, DATAGROUP),
    token=None,
    folder="downloads/",
    filename=None,
    overwrite=False,
    return_info=True,
    verbose=True,
    tracker=None,
    thread_id=None,
):
    """
    Download a file from the CaSSI API, with data rate tracking 
    for optional parallel execution.
    
    Parameters
    ----------
    product_url : str
        Product URL for download.
    endpoint_url : str
        API endpoint URL.
    token : str or None
        MAST API token. If None, retrieved from env var.
    folder : str
        Output directory for download.
    filename : str
        Optional output filename. 
        Default: None, and filename is derived from product_url.
    overwrite : bool
        If True, overwrite any existing file with the same name
        in the specified output folder. 
        Default: False, with no download for an existing file.
    return_info : bool
        If True, return success/fail info.
    verbose : bool
        If True, print summary information. Default: True.
    tracker : DownloadTracker instance or None
        DownloadTracker instance for progress tracking.
        Default: None.
    thread_id : int
        Optional thread identifier for logging, for parallel execution.
        
    Returns
    -------
    status : int
       Success status for each retrieval
    results : dict, optional
        If `return_info` is True, return download status/stats info.
    """
    thread_label = f"[Thread {thread_id}]" if (thread_id is not None) else ""

    if endpoint_url is None:
        raise ValueError("`endpoint_url` must be set!")

    if token is None:
        token = parse_token(token)

    # Ensure output directory exists
    Path(folder).mkdir(exist_ok=True)

    # Payload header:
    headers = {
        "Content-Type": "application/json",
        "Authorization": f'token {token}'
    }

    payload = {"product_url": product_url}


    if filename is None:
        # Extract base filename from URL:
        filename = product_url.split('/')[-1]

    status = 0

    start_time = time.time()
    if (not os.path.exists(f"{folder}/{filename}")) | overwrite:
        try:
            if verbose:
                print(f"{thread_label} Downloading {filename}...")

            response = requests.post(
                endpoint_url,
                headers=headers,
                json=payload,
                timeout=TIMEOUT,
                stream=True
            )

            # Check for errors
            if response.status_code != 200:
                print(f"Error: {response.status_code}")
                print(f"Response: {response.text}")
                response.raise_for_status()

            # Get file size
            downloaded_size = 0

            # Write file in chunks and track progress
            with open(f"{folder}/{filename}", "wb") as f:
                for chunk in response.iter_content(chunk_size=8192):
                    if chunk:
                        f.write(chunk)
                        downloaded_size += len(chunk)

            # Calculate statistics
            elapsed_time = time.time() - start_time
            download_rate = downloaded_size / elapsed_time if elapsed_time > 0 else 0
            download_rate_mb = download_rate / (1024 * 1024)  # MB/s

            if verbose:
                print(
                    f"{thread_label} - {filename} - "
                    f"{downloaded_size/(1024*1024):.2f} MB in {elapsed_time:.1f}s - "
                    f"{download_rate_mb:.2f} MB/s"
                )

            if tracker:
                tracker.increment_completed()

            results = {
                'success': True,
                'url': product_url,
                'filename': filename,
                'filepath': f"{folder}/{filename}",
                'size_bytes': downloaded_size,
                'elapsed_seconds': elapsed_time,
                'rate_mbps': download_rate_mb,
                'error': None
            }

        except requests.exceptions.HTTPError as e:
            elapsed_time = time.time() - start_time
            print(f"{thread_label} ✗ Failed to download {filename}: {e}")

            status = 1
            results = {
                'success': False,
                'url': product_url,
                'filename': filename,
                'filepath': None,
                'size_bytes': 0,
                'elapsed_seconds': elapsed_time,
                'rate_mbps': 0,
                'error': str(e)
            }

    else:
        # File already downloaded:
        if verbose:
            print(f"{thread_label} File {filename} already downloaded")
        elapsed_time = time.time() - start_time
        results = {
            'success': True,
            'url': product_url,
            'filename': filename,
            'filepath': f"{folder}/{filename}",
            'size_bytes': np.nan,                    # Not downloaded
            'elapsed_seconds': elapsed_time,
            'rate_mbps': np.nan,                     # Not downloaded
            'error': None
        }

    if return_info:
        return status, results

    return status


def download_cassi_files(
    product_urls,
    endpoint_url=get_cassi_download_url(ARCHIVE, DATAGROUP),
    folder="download/",
    token=None,
    parallel=True,
    max_workers=2,
    filenames=None,
    overwrite=False,
    return_info=True,
    verbose=True,
    **kwargs
):
    """
    Download files to directory, optionally with 
    parallel processing.
    
    Parameters
    ----------
    product_urls : str or list
        Product URLs for download.
    endpoint_url : str
        API endpoint URL.
    folder : str
        Directory in which to write output files.
    token : str or None
        MAST API token. If None, retrieved from env var.
    filenames : list or None
        Optional list of filenames (same length as product_urls).
        Default: None, with filenames determined from product_urls.
    parallel : bool
        If True, download files with parallel processing.
        Default: True.
    max_workers : int
        Maximum number of workers for parallel downloads.
        Default: 2.
    overwrite : bool
        If True, overwrite any existing file(s) with the same name(s)
        in the specified output folder. 
        Default: False, and existing files will not be re-downloaded.
    return_info : bool
        If True, return success/fail info and URL lists, for retrying.
    verbose : bool
        If True, print summary information. Default: True.
        
    Returns
    -------
    status : int
       Overall success status for full-set retrieval. 0: all downloaded; 1: some/all failed.
    results : DataFrame, optional
        If `return_info` is True, return download status/stats info.
    successful_files : list, optional
        If `return_info` is True, return filepaths to successfully downloaded files.
    failed_urls : list, optional
        If `return_info` is True, return URLs of files that failed to download.

    """
    if endpoint_url is None:
        raise ValueError("`endpoint_url` must be set!")

    # Ensure product_urls is a list:
    if isinstance(product_urls, str):
        product_urls = [product_urls]

    # If filenames is a str:
    if isinstance(filenames, str):
        # Make a list
        filenames = [filenames]

    # Prepare URL-filename pairs
    # Follows from E. Swizter's handling
    if filenames is None:
        items = [(url, None) for url in product_urls]
    else:
        # Ensure same length as product_urls:
        if len(filenames) != len(product_urls):
            raise ValueError(
                "`filenames` must be the same length as `product_urls`!"
            )
        items = list(zip(product_urls, filenames))

    # Ensure output directory exists
    Path(folder).mkdir(exist_ok=True)

    results = []

    if parallel:
        # Create tracker
        tracker = DownloadTracker(len(items), verbose=verbose)

        if verbose:
            print(
                f"\nStarting parallel download of {len(items)} file(s) "
                f"with {max_workers} workers..."
            )
            print("=" * 80)


        # Use ThreadPoolExecutor for parallel downloads
        with ThreadPoolExecutor(max_workers=max_workers) as executor:
            # Submit all download tasks
            future_to_url = {
                executor.submit(
                    download_cassi_file,
                    product_url,
                    endpoint_url,
                    token,
                    folder,
                    filename,
                    overwrite,
                    True,   # return_info
                    verbose,
                    tracker,
                    i
                ): (product_url, filename) for i, (product_url, filename) in enumerate(items)
            }

            # Collect results as they complete
            for future in as_completed(future_to_url):
                _, result = future.result()      # Ignore individual status.
                results.append(result)
    else:
        # Serial download:
        if verbose:
            print(f"\nStarting download of {len(items)} file(s)...")
            print("=" * 80)

        tracker = None
        start_time = time.time()
        for (product_url, filename) in items:
            # Ignore individual status.
            _, result = download_cassi_file(
                product_url,
                endpoint_url=endpoint_url,
                token=token,
                folder=folder,
                filename=filename,
                overwrite=overwrite,
                return_info=True,
                verbose=verbose,
            )
            results.append(result)

    # Create results DataFrame
    results_df = DataFrame(results)

    # Separate successful and failed downloads
    successful = results_df[results_df['success']]
    failed = results_df[~results_df['success']]

    # Print summary
    if verbose:
        print("=" * 80)
        print(f"\n{'='*80}")
        print("DOWNLOAD SUMMARY")
        print(f"{'='*80}")
        print(f"Total files: {len(results)}")
        print(f"Successful: {len(successful)}")
        print(f"Failed: {len(failed)}")

    status = 0
    if len(successful) > 0:
        total_size_gb = successful['size_bytes'].sum() / (1024**3)
        if parallel:
            total_time = tracker.start_time and (time.time() - tracker.start_time) or 0
        else:
            total_time = time.time() - start_time


        with warnings.catch_warnings():
            warnings.simplefilter("ignore", category=RuntimeWarning)
            avg_rate = np.nanmean(successful['rate_mbps'])
            max_rate = np.nanmax(successful['rate_mbps'])
            min_rate = np.nanmin(successful['rate_mbps'])

        if verbose:
            print("\nDownload Statistics:")
            print(f"  Total size: {total_size_gb:.2f} GB")
            print(f"  Total time: {total_time:.1f} seconds")
            print(f"  Overall rate: {(total_size_gb * 1024) / total_time:.2f} MB/s")
            print(f"  Average rate per thread: {avg_rate:.2f} MB/s")
            print(f"  Max rate: {max_rate:.2f} MB/s")
            print(f"  Min rate: {min_rate:.2f} MB/s")

    if len(failed) > 0:
        status = 1

        if verbose:
            print("\nFailed downloads:")
            for _, row in failed.iterrows():
                print(f"  - {row['filename']}: {row['error']}")

    if return_info:
        return status, results_df, successful['filepath'].tolist(), failed['url'].tolist()

    return status


# -------------------------------------------------------------
# RITA QUERY & DOWNLOAD FUNCTIONS

def parse_token(token):
    """Parse API token.

    If token is not passed as an argument, try reading it from the
    environment variables. If it's not set, prompt the user for it.
    """
    if token is None:
        token = os.environ.get("MAST_API_TOKEN")
    if not token:
        raise ValueError(
            "No token provided. Set $MAST_API_TOKEN environment "
            "variable or pass token parameter."
        )
    return token


def _ensure_datetime(date, hms_tuple=(0,0,0)):
    if date is None:
        return date
    if 'T' in date:
        return date

    dt = datetime.fromisoformat(date)
    dt2 = datetime(dt.year, dt.month, dt.day, *hms_tuple)
    return dt2.strftime("%Y-%m-%dT%H:%M:%S")


def _get_exposure_start_time_constr(
    earliest_exposure_start_time,
    latest_exposure_start_time,
):
    """Get exposure time constraint in the format for the JSON payload.
    """

    earliest = _ensure_datetime(
        earliest_exposure_start_time,
        hms_tuple=(0,0,0)
    )
    latest = _ensure_datetime(
        latest_exposure_start_time,
        hms_tuple=(23,59,59)
    )

    if (not earliest) & (not latest):
        return {}

    if not latest:
        # latest is None
        return {
            "exposure_start_time": f">={earliest}"
        }
    if not earliest:
        # earliest is None
        return {
            "exposure_start_time": f"<={latest}"
        }

    # Both earliest and latest are set:
    return {
        "exposure_start_time": f"{earliest}..{latest}"
    }


def build_cassi_query(select_cols, conditions_dict, limit=100, offset=0):
    """
    Build CASSI API query payload.
    
    Parameters
    ----------
    select_cols : list-like
        List of column names
    conditions_dict : dict 
        Dictionary of query conditions, where values can be strings or lists
    limit : int
        Query maximum number of results
    offset : int 
        Query result pagination offset

    Returns
    -------
    payload : dict
        Dictinary containing JSON request payload.

    Notes
    -----
    Function written by Eric Switzer.
    """
    payload = {
        "select_cols": select_cols,
        "conditions": [
            {key: value} for key, value in conditions_dict.items()
        ],
        "limit": limit,
        "offset": offset
    }
    return payload


def query_cassi_general(
    select_cols,
    conditions_dict,
    limit=RESULT_LIMIT,
    offset=0,
    endpoint_url=None,
    timeout=TIMEOUT,
    verbose=True,
    token=None,
):
    """
    Query Roman CaSSI API for data and return the response.
    
    Parameters
    ----------
    select_cols : list-like
        List of column names to return.
    conditions_dict : dict
        Dictionary of search conditions.
    limit : int
        Query maximum number of results. Default: 100.
    offset : int 
        Query result pagination offset.
    endpoint_url : str
        API endpoint URL.
    timeout : int
        Query timeout limit, in seconds. Default: 300.
    verbose : bool
        If True, print summary information. Default: True.
    token: str
        MAST API token.
        
    Returns
    -------
    results : DataFrame
       DataFrame containing the results from the CaSSI API request.

    Notes
    -----
    Based on Eric Switzer's function `query_cassi_api` and MAST notebooks 
    helper scripts for JWST and Roman engineering/supplementary data access.
    """
    # Raise error if endpoint URL not specified: this function is fully general.
    if endpoint_url is None:
        raise ValueError("`endpoint_url` must be specified!")

    # Get token from environment if not provided
    token = parse_token(token)

    # Build payload
    payload = build_cassi_query(select_cols, conditions_dict, limit, offset)

    # Set headers with authentication
    headers = {
        "Authorization": f"token {token}",
        "Content-Type": "application/json"
    }

    # Make request
    response = requests.post(
        endpoint_url,
        json=payload,
        headers=headers,
        timeout=timeout,
    )

    # Check for errors
    if response.status_code != 200:
        print(f"Error: {response.status_code}")
        print(f"Response: {response.text}")
        response.raise_for_status()

    data = response.json()
    if 'results' not in data or len(data['results']) == 0:
        if verbose:
            print("No results found")

        return DataFrame()

    df = DataFrame(data['results'])

    if verbose:
        total = data.get('totalResults', len(df))
        print(f"Retrieved {len(df)} of {total} total results, starting at {offset=}")
        if len(df) < total:
            print(f"Use offset={offset + limit} to get next batch")

    return df

def _prep_conditions_value(value):
    """Prepare conditions value. If string, pass as-is.
    If list, bundle into a single string.
    """
    if isinstance(value, str):
        return value

    return ",".join(value)


def flatten_cassi_rita_dataframe(df):
    """
    Flatten nested dictionaries in CASSI results DataFrame.

    Written by Eric Switzer
    """
    # Handle 'asset' nested structure
    if 'asset' in df.columns:
        # Extract URL
        df['url'] = df['asset'].apply(
            lambda x: x.get('distribution', {}).get('url', {}).get('mast', None)
            if isinstance(x, dict) else None
        )
        # Extract size
        df['file_size'] = df['asset'].apply(
            lambda x: x.get('distribution', {}).get('size', None)
            if isinstance(x, dict) else None
        )
        # Drop original asset column
        df = df.drop('asset', axis=1)

    # Handle 'fileset' nested structure
    if 'fileset' in df.columns:
        df['fileSetSize'] = df['fileset'].apply(
            lambda x: x.get('fileSetSize', None)
            if isinstance(x, dict) else None
        )
        df = df.drop('fileset', axis=1)

    return df


# pylint: disable=C0103
def query_cassi_rita(
    select_cols=None,
    earliest_exposure_start_time=None,
    latest_exposure_start_time=None,
    test_script=None,
    otp_name=None,
    test_phase=None,
    filename=None,
    fileSetName=None,
    detector=None,
    provenance="TVAC1",
    conditions_dict=None,
    limit=RESULT_LIMIT,
    offset=0,
    endpoint_url=None,
    timeout=TIMEOUT,
    flatten=True,
    verbose=True,
    token=None,
    **kwargs
):
    """
    Query Roman CaSSI API for data and return the response.
    
    Parameters
    ----------
    select_cols : list-like
        List of column names to return.

    earliest_exposure_start_time : str or None
        Optional earliest exposure start time in YYYY-MM-DD[THH:MM:SS] format (24hr)
        Note that omitting a time will default to YYYY-MM-DDT00:00:00.
        
    latest_exposure_start_time : str or None
        Optional latest exposure end time in YYYY-MM-DD[THH:MM:SS] format (24hr)
        Note that omitting a time will default to YYYY-MM-DDT23:59:59.

    test_script : str or list or None
        Optional test script / OTP number(s), as either a string or list.
        Wildcards are allowed.

    otp_name : str or list or None
        Alias for "test_script". Wildcards are allowed.

    test_phase : str or list or None
        Optional test phase, as either a string or list.
        
    filename : str or list or None
        Optional filename as either a string or list.

    fileSetName : str or list or None
        Optional filename as either a string or list.
    
    detector : str or list or None:
        Optional detector. Wildcards are allowed.

    conditions_dict : dict or None
        Optional dictionary of search conditions. This can be used
        to place conditions not supported through direct kwargs.
        If constraints for a condition are passed both through a kwarg
        and as an entry in conditions_dict, the kwarg value will
        will take precedence. 
        In the case of earliest/latest exposure start time, passing a kwarg value
        for EITHER will override the entire constraint specified in conditions dict.
        Default: None

    limit : int
        Query maximum number of results. Default: 100.

    offset : int 
        Query result pagination offset.

    endpoint_url : str
        API endpoint URL.

    timeout : int
        Query timeout limit, in seconds. Default: 300.

    flatten : bool
        If True, flatten nested asset/fileset structures.

    verbose : bool
        If True, print summary information. Default: True.

    token: str
        MAST API token.
        
    Returns
    -------
    results : DataFrame
       DataFrame containing the results from the CaSSI API request.

    Notes
    -----
    Based on Eric Switzer's function `query_cassi_api` and MAST notebooks 
    helper scripts for JWST and Roman engineering/supplementary data access.
    """

    if endpoint_url is None:
        endpoint_url = get_cassi_rita_search_url(DATAGROUP, provenance.upper())

    if select_cols is None:
        select_cols = []

    if conditions_dict is None:
        conditions_dict = {}

    exposure_start_time_constr = _get_exposure_start_time_constr(
        earliest_exposure_start_time,
        latest_exposure_start_time
    )
    conditions_dict.update(exposure_start_time_constr)

    if (otp_name is not None) and (test_script is None):
        test_script = otp_name

    include_keys = [
        "test_script",
        "test_phase",
        "filename",
        "fileSetName",
        "detector",
    ]
    for key, val in locals().items():
        if (key in include_keys) and (val is not None):
            conditions_dict.update({key: _prep_conditions_value(val)})

    results = query_cassi_general(
        select_cols,
        conditions_dict,
        limit=limit,
        offset=offset,
        endpoint_url=endpoint_url,
        timeout=timeout,
        verbose=verbose,
        token=token,
    )

    if flatten:
        results = flatten_cassi_rita_dataframe(results)

    return results




# -------------------------------------------------------------
# COMMAND-LINE CALL UTILITIES


def arg_parser():
    """
    Parser to handle command line arguments.
    """

    parser = argparse.ArgumentParser(
        description=(
            "Query Roman CASSI API for RITA files, "
            "with options to download or count files"
        )
    )

    parser.add_argument(
        "-l", "--limit",
        type=int,
        default=RESULT_LIMIT,
        help=f"Limit for number of results (default: {RESULT_LIMIT})"
    )

    parser.add_argument(
        "-o", "--offset",
        type=int,
        default=0,
        help="Result offset (default: 0)"
    )


    parser.add_argument(
        "-t", "--token",
        type=str,
        help="MAST API token (default: obtained from env var `MAST_API_TOKEN`)",
        default=None,
    )

    # Filtering options
    filter_args = parser.add_argument_group('Filtering Options')

    filter_args.add_argument(
        "-p", "--provenance",
        type=str,
        default="TVAC1",
        help="RITA provenance (TVAC1, TVAC2, FPS)."
    )

    filter_args.add_argument(
        "-s", "--earliest-exposure-start-time",
        type=str,
        default=None,
        help="Optional earliest exposure start time in YYYY-MM-DD[THH:MM:SS] format (24 hr)"
    )
    filter_args.add_argument(
        "-e", "--latest-exposure-start-time",
        type=str,
        default=None,
        help="Optional latest exposure start time in YYYY-MM-DD[THH:MM:SS] format (24 hr)"
    )

    filter_args.add_argument(
        "--detector",
        type=str,
        help=(
            "Detector (in quotes; and comma separated for more than one). "
            "Wildcards are allowed."
        ),
        default=None,
    )


    filter_args.add_argument(
        "--otp-name",
        type=str,
        help=(
            "Alias for --test-script. Optional test script/OTP number(s) "
            "(in quotes; and comma separated for more than one). "
            "Wildcards are allowed."
        ),
        default=None,
    )

    filter_args.add_argument(
        "--test-script",
        type=str,
        help=(
            "Optional test script/OTP number(s) (in quotes; and comma separated for "
            "more than one type)"
        ),
        default=None,
    )
    filter_args.add_argument(
        "--test-phase",
        type=str,
        help="Optional test phase(s) (in quotes; and comma separated for more than one)",
        default=None,
    )

    filter_args.add_argument(
        "--filename",
        type=str,
        help=(
            "Optional filename(s) to search/download (comma separated and "
            "the full list in quotes for more than one filename)"
        ),
        default=None,
    )
    filter_args.add_argument(
        "--fileSetName",
        type=str,
        help=(
            "Optional fileSetName(s) to search/download (comma separated and "
            "the full list in quotes for more than one filename)"
        ),
        default=None,
    )

    # Query options
    query_args = parser.add_argument_group(
        'Query Options (default: lists file information)'
    )
    query_exclusive_args = query_args.add_mutually_exclusive_group()
    query_exclusive_args.add_argument(
        "-c", "--count",
        action='store_true',
        help="Count files"
    )

    query_exclusive_args.add_argument(
        "-d", "--download",
        action='store_true',
        help="Download files"
    )
    query_exclusive_args.add_argument(
        "--list-otp-names",
        action='store_true',
        help="List OTP names/test scripts within query results"
    )

    # Download options
    download_args = parser.add_argument_group('Download Options')
    download_args.add_argument(
        "-f", "--folder",
        type=str,
        default="cassi-rita-data",
        help="Folder to download to"
    )

    download_args.add_argument(
        "--no-parallel-download",
        action="store_true",
        help="Flag to not download files in parallel (i.e., serial download)"
    )
    download_args.add_argument(
        "--max-workers",
        type=int,
        default=2,
        help="Max workers for parallel file download (default: 2)."
    )

    download_args.add_argument(
        "--overwrite",
        action="store_true",
        help=(
            "Flag to OVERWRITE any existing file(s) with the same name(s) "
            "in the specified output folder. By default, existing files will not be "
            "re-downloaded."
        )
    )
    download_args.add_argument(
        "-q", "--quiet",
        action="store_true",
        help="Flag to suppress download status reports."
    )

    return parser


def parse_args(parser):
    """
    Parse command line arguments.

    Parameters
    ----------
    parser : argparse.ArguementParser instance
    """

    args = parser.parse_args()

    keys = args.__dict__.keys()

    kwargs_dict = {}
    for name in keys:
        kwargs_dict[name] = getattr(args, name)

    # Postprocessing:
    kwargs_dict['token'] = parse_token(kwargs_dict['token'])
    kwargs_dict['parallel'] = not kwargs_dict['no_parallel_download']

    # For command line: do not return success/fail and download stat info:
    kwargs_dict['return_info'] = False
    kwargs_dict['verbose'] = not kwargs_dict['quiet']

    return kwargs_dict


def count_results_rita(results, n_rjust=8):
    """Count the files of different types returned by the CaSSI query.

    n_rjust is the number of spaces between the end of the longest file 
    type and its file count.
    """
    if len(results) == 0:
        print("No files!")
        return

    counts = results.value_counts("test_script")
    n_longest = max([len(c) for c in counts.keys()]) + 1

    print("Total files:".ljust(n_longest), str(len(results)).rjust(n_rjust))
    for c in counts.keys():
        print(f"{c}:".ljust(n_longest), str(counts[c]).rjust(n_rjust))

def list_results_rita(results, **kwargs):
    """
    List the results returned by the CaSSI query, showing only a subset of the 
    returned column information.
    """

    results_prettified = results[[
        'test_phase', 'test_name', 'test_script', 
        'filename', 'file_size', 'url'
    ]]
    print(results_prettified)


def main():
    """
    Main function
    """

    parser = arg_parser()

    if len(sys.argv)==1:
        parser.print_help(sys.stderr)
        sys.exit(0)

    kwargs_dict = parse_args(parser)

    results = query_cassi_rita(**kwargs_dict)

    if kwargs_dict['count']:
        count_results_rita(results)
        return 0
    elif kwargs_dict['list_otp_names']:
        otp_names = np.unique(results['test_script'])
        msg = f"""OTP names/test scripts : {otp_names.tolist()}
"""
        print(msg)
        return 0
    elif kwargs_dict['download']:
        return download_cassi_files(
            results['url'].tolist(),
            endpoint_url=get_cassi_download_url(ARCHIVE, DATAGROUP),
            **kwargs_dict
        )
    else:
        list_results_rita(results, **kwargs_dict)
        return 0

if __name__ == "__main__":
    sys.exit(main())
