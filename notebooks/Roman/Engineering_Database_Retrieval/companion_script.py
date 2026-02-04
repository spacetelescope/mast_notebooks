"""
This script takes a csv file containing one mnemonic, start time,
and end time per line. It will return the associated engineering data, and
includes an example file if no data is specified.
"""

import os
import argparse
import csv
import sys
import urllib.error
import urllib.request
from datetime import datetime
from pathlib import Path

# default file to use if no file specified
DEFAULT_FILE = "SCF_AC_SDR_QBJ_1_20270314T000000_20270316T235959.csv"


def get_mnemonic_datetimes_from_filename(fname):
    splt = fname.split(".")[0].split('_')
    mnemonic = '_'.join(splt[:-2])
    s_time = datetime.fromisoformat(splt[-2]).isoformat()
    e_time = datetime.fromisoformat(splt[-1]).isoformat()

    return mnemonic, s_time, e_time


def download_edb_datafiles(filenames, folder):
    '''
    Download filenames to directory
    
    Parameters
    ----------
    filenames : iterable
        List of string-valued file names to contain the desired mnemonic timeseries
    folder: str
        Directory (relative to cwd) in which to write output files
        
    Returns
    -------
    int
       Success status for each mnemonic retrieval
    '''
            
    Path(folder).mkdir(exist_ok=True)
    
    mast_token = os.getenv("MAST_API_TOKEN")
    headers = {
        "Authorization": f'token {mast_token}'
    }

    urlStr = 'https://mast.stsci.edu/edp/api/v0.1/mnemonics/spa/roman/data?mnemonic={}&s_time={}&e_time={}&result_format=csv' 
    status = 0

    for fname in filenames:
        print(
            f"Downloading File: mast:romanedb/{fname}\n",
            f" To: {folder}/{fname}",
        )
        
        mnemonic, s_time, e_time = get_mnemonic_datetimes_from_filename(fname)
        url = urlStr.format(mnemonic, s_time, e_time)
        # print(f"URL: {url}")
        req = urllib.request.Request(url, headers=headers)
        
        try:
            # Open the URL with the request object and save to file
            with urllib.request.urlopen(req) as response:
                data = response.read().decode('utf-8')
                with open(f"{folder}/{fname}", "w", encoding='utf-8') as f:
                    f.write(data)
        except urllib.error.URLError:
            print("  ***Error downloading file***")
            status = 1
    
    return status  


def _convert_datetime_to_compact_iso(dt):
    return dt.strftime("%Y%m%dT%H%M%S")


def parse_mnemonic_starttime_endtime(req):
    """Given a dictionary with mnemonic, starttime, and endtime construct the edb filename"""

    if "mnemonic" not in req or "starttime" not in req or "endtime" not in req:
        raise ValueError("Request data objects must have mnemonic, startime and endtime defined")
    starttime = _convert_datetime_to_compact_iso(req["starttime"])
    endtime = _convert_datetime_to_compact_iso(req["endtime"])
    mnemonic = req["mnemonic"]
    return f"{mnemonic}_{starttime}_{endtime}.csv"


def parse_edb_query(csvfile):
    """from a csvfile containing lines of mnemonic, starttime, and endtimes, return edb filenames"""
    filenames = []
    with open(csvfile, "r", encoding="utf-8-sig") as csvfh:
        query_reader = csv.reader(csvfh, delimiter=",", quoting=csv.QUOTE_NONE)
        for row in query_reader:
            req = {
                "mnemonic": row[0].strip(),
                "starttime": datetime.fromisoformat(row[1].strip()),
                "endtime": datetime.fromisoformat(row[2].strip()),
            }
            filenames.append(parse_mnemonic_starttime_endtime(req))
    return filenames


def download_edb_datafiles_by_mnemonic_starttime_endtime(requests, folder):
    """Download datafiles by mnemonic/starttime/endtime to directory

    Example

    ```python
    from datetime import datetime

    request = dict()
    request["mnemonic"] = "SCF_AC_SDR_QBJ_1"
    request["starttime"] = datetime(2027,3,14,0,0,0)
    request["endtime"] = datetime(2027,3,16,23,59,59)
    requests = list()
    requests.append(request)
    download_edb_datafiles_by_mnemonic_starttime_endtime(requests, "test")
    ```
    """
    
    filenames = []
    for req in requests:
        filename = parse_mnemonic_starttime_endtime(req)
        print(f"adding file: {filename}")
        filenames.append(filename)
    download_edb_datafiles(filenames, folder)


def parse_args(args):
    """Get command line arguments, use defaults if not specified """
    if args is None:
        args = sys.argv[1:]
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "-f", "--folder", type=str, default="edb-data", help="Folder to download to"
    )
    parser.add_argument(
        "-q",
        "--query",
        type=str,
        help="Query file (csv) containing a mnemonic, starttime, endtime per line",
    )
    parser.add_argument("file", nargs="*", type=str, help="File(s) to download")
    args = parser.parse_args(args)

    filenames = args.file
    if not filenames:
        filenames = []

    folder = args.folder

    csvfile = args.query
    if csvfile:
        mnemonics = parse_edb_query(csvfile)
        filenames += mnemonics

    filenames = set(filenames)

    if not filenames:
        print(f"No files specified, using default file: {DEFAULT_FILE}")
        filenames = {DEFAULT_FILE}

    return filenames, folder


def main(args=None):
    """Collect args from user input, give them to the download function"""
    filenames, folder = parse_args(args)
    return download_edb_datafiles(filenames, folder)


if __name__ == "__main__":
    sys.exit(main())
