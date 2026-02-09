"""
CaSSI Supplementary & Telemetry programmatic 
file access & download scripts
"""
import os
from pathlib import Path
from datetime import datetime
import sys
import argparse
import requests

import numpy as np
from pandas import DataFrame


CASSI_URL_SEARCH = "https://mast.stsci.edu/cassi/api/v0.1/roman/search/Eng"
CASSI_URL_DOWNLOAD = "https://mast.stsci.edu/cassi/api/v0.1/download/roman/eng"
TIMEOUT = 30 # seconds

def _ensure_datetime(date, hms_tuple=(0,0,0)):
    if date is None:
        return date
    if 'T' in date:
        return date

    dt = datetime.fromisoformat(date)
    dt2 = datetime(dt.year, dt.month, dt.day, *hms_tuple)
    return dt2.strftime("%Y-%m-%dT%H:%M:%S")


def parse_token(token):
    """Parse API token.

    If token is not passed as an argument, try reading it from the
    environment variables. If it's not set, prompt the user for it.
    """
    if token is None:
        token = os.environ["MAST_API_TOKEN"]
    return token


def arg_parser():
    """
    Parser to handle command line arguments.
    """

    parser = argparse.ArgumentParser(
        description=(
            "Query Roman CASSI API for supplemental and telemetry data, "
            "with options to download or count files"
        )
    )

    parser.add_argument(
        "-l", "--limit",
        type=int,
        default=50000,
        help="Limit for number of results (default: 50000)"
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
        "-s", "--ingestion-start-date",
        type=str,
        # default="2020-01-01",
        help="Ingestion start date in YYYY-MM-DD[THH:MM:SS] format (24 hr)"
    )
    filter_args.add_argument(
        "-e", "--ingestion-end-date",
        type=str,
        default=None,
        help="Optional ingestion end date in YYYY-MM-DD[THH:MM:SS] format (24hr)"
    )

    filter_args.add_argument(
        "--filetype",
        type=str,
        help="Optional filetype(s) (in quotes; and comma separated for more than one type)",
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
        "--list-filetypes",
        action='store_true',
        help="List file types within query results"
    )

    # Download options
    download_args = parser.add_argument_group('Download Options')
    download_args.add_argument(
        "-f", "--folder",
        type=str,
        default="cassi-data",
        help="Folder to download to"
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

    args_dict = {}

    args_dict['start_date'] = _ensure_datetime(args.start_date, hms_tuple=(0,0,0))
    args_dict['end_date'] = _ensure_datetime(args.end_date, hms_tuple=(23,59,59))

    for name in ['limit', 'filetype', 'folder', 'filename']:
        args_dict[name] = getattr(args, name)

    for name in ['download', 'count']:
        args_dict[f"do_{name}"] = getattr(args, name)

    args_dict['list_filetypes'] = args.list_filetypes

    args_dict['token'] = parse_token(args.token)

    return args_dict


def query_cassi(start_date, end_date, limit, filetype, filename, token):
    """
    Query Roman CaSSI API for supplemental and telemetry data and return the response.
    
    Parameters
    ----------
    start_date : str
        Ingestio start date in YYYY-MM-DD[THH:MM:SS] format (24hr)
        
    end_date : str or None
        Optional ingestion end date in YYYY-MM-DD[THH:MM:SS] format (24hr)
        Note that omitting a time will default to YYYY-MM-DDT00:00:00.

    limit : int
        Limit for number of results

    filetype : str or None
        Optional filetype filter constraints (quoted, with commas separating multiple values).
        Defaults to None (no filetype filtering).

    filename : str or None
        Optional filename (e.g., "CGI_00011850") filter constraint 
        (multiple values can be included, but the list must be comma separated and quoted).
        Defaults to None (no filename filtering).
        
    token: str
        MAST API token
        
    Returns
    -------
    results : DataFrame
       DataFrame containing the results from the CaSSI API request.
    """

    headers = {
        "Content-Type": "application/json",
        "Authorization": f"token {token}"
    }
    if end_date:
        date_range = f">={start_date},<={end_date}"
    else:
        date_range = f">={start_date}"
    payload = {
        "conditions": [
            {"source": "Eng"},
            {"dataGroup": "Eng"},
            {"ingestCompletionDate": date_range}
        ],
        "limit": limit,
        "select_cols": [
            "fileType", "archiveFileName", "startTime", "endTime", "ingestCompletionDate"
        ]
    }

    if filetype is not None:
        payload["conditions"].append({"fileType": filetype})

    if filename is not None:
        payload["conditions"].append({"archiveFileName": filename})

    response = requests.post(
        CASSI_URL_SEARCH,
        headers=headers,
        json=payload,
        timeout=TIMEOUT
    )
    response.raise_for_status()

    # Get data results from the request response
    data = response.json()
    results = DataFrame(data.get("results", []))

    # Presently there are duplicates in the responses; drop these:
    results.drop_duplicates(
        subset=[
            'checksum', 'fileType', 
            'ingestCompletionDate', 'archiveFileName',
            'search_key'
        ],
        inplace=True, ignore_index=True
    )

    return results


def download_cassi_files(results, folder, token):
    """
    Download files to directory
    
    Parameters
    ----------
    results : DataFrame
        Metadata query results
    folder: str
        Directory (relative to cwd) in which to write output files
    token: str
        MAST API token
        
    Returns
    -------
    int
       Success status for each retrieval
    """

    Path(folder).mkdir(exist_ok=True)

    headers = {
        "Content-Type": "application/json",
        "Authorization": f'token {token}'
    }

    status = 0

    for ind in range(len(results)):
        row = results.iloc[ind]
        url = row['distribution'].get('url', {}).get('mast', None)
        if url is None:
            print("***Missing URL***")
            status = 1
        else:

            payload = {"product_url": url}

            try:
                response = requests.post(
                    CASSI_URL_DOWNLOAD,
                    headers=headers,
                    json=payload,
                    timeout=TIMEOUT
                )
                response.raise_for_status()

                with open(f"{folder}/{row['archiveFileName']}", "wb") as f:
                    f.write(response.content)

            except requests.exceptions.HTTPError:
                print("  ***Error downloading file***")
                status = 1

    return status


def count_results(results, n_rjust=8):
    """Count the files of different types returned by the CaSSI query.

    n_rjust is the number of spaces between the end of the longest file 
    type and its file count.
    """
    if len(results) == 0:
        print("No files!")
        return

    counts = results.value_counts("fileType")
    n_longest = max([len(c) for c in counts.keys()]) + 1

    print("Total files:".ljust(n_longest), str(len(results)).rjust(n_rjust))
    for c in counts.keys():
        print(f"{c}:".ljust(n_longest), str(counts[c]).rjust(n_rjust))

def list_results(results):
    """
    List the results returned by the CaSSI query, showing only a subset of the 
    returned column information.
    """

    results_prettified = results[['archiveFileName', 'fileType', 'ingestCompletionDate']]

    ## Preserved in the event wall time start/end search is supported in the future.
    # results_prettified.insert(
    #     len(results_prettified.columns),
    #     'startTime',
    #     np.empty_like(results['times'], dtype="object")
    # )
    # results_prettified.insert(
    #     len(results_prettified.columns),
    #     'endTime',
    #     np.empty_like(results['times'], dtype="object")
    # )
    # for ind in range(len(results)):
    #     if results['times'][ind] is not None:
    #         for key in ['startTime', 'endTime']:
    #             results_prettified.loc[ind, key] = results['times'][ind].get(key, None)

    print(results_prettified)

def main():
    """
    Main function
    """

    parser = arg_parser()

    if len(sys.argv)==1:
        parser.print_help(sys.stderr)
        sys.exit(1)

    args = parse_args(parser)

    results = query_cassi(
        args['start_date'],
        args['end_date'],
        args['limit'],
        args['filetype'],
        args['filename'],
        args['token']
    )

    if args['do_count']:
        count_results(results)
        return 0
    elif args['list_filetypes']:
        filetypes = np.unique(results['fileType'])
        msg = f"""fileTypes: {filetypes.tolist()}
"""
        print(msg)
        return 0
    elif args['do_download']:
        return download_cassi_files(results, args['folder'], args['token'])
    else:
        list_results(results)
        return 0

if __name__ == "__main__":
    sys.exit(main())
