#!/bin/bash
#
# Requires bash version >= 4
# 
# The script uses the command line tool 'curl' for querying
# the MAST Download service for public and protected data. 
#

type -P curl >&/dev/null || { echo "This script requires curl. Exiting." >&2; exit 1; }



# Check for existing Download Folder
# prompt user for overwrite, if found
let EXTENSION=0
FOLDER=MAST_2023-01-25T1313
DOWNLOAD_FOLDER=$FOLDER
if [ -d $DOWNLOAD_FOLDER ]
then
  echo -n "Download folder ${DOWNLOAD_FOLDER} found, (C)ontinue writing to existing folder or use (N)ew folder? [N]> "
  read -n1 ans
  if [ "$ans" = "c" -o "$ans" = "C" ]
  then
    echo ""
    echo "Downloading to existing folder: ${DOWNLOAD_FOLDER}"
    CONT="-C -"
  else
    while [ -d $DOWNLOAD_FOLDER ]
    do
      ((EXTENSION++))
      DOWNLOAD_FOLDER="${FOLDER}-${EXTENSION}"
    done

    echo ""
    echo "Downloading to new folder: ${DOWNLOAD_FOLDER}"
  fi
fi

# mkdir if it doesn't exist and download files there. 
mkdir -p ${DOWNLOAD_FOLDER}

cat >${DOWNLOAD_FOLDER}/MANIFEST.HTML<<EOT
<!DOCTYPE html>
<html>
    <head>
        <title>MAST_2023-01-25T1313</title>
    </head>
    <body>
        <h2>Manifest for File: MAST_2023-01-25T1313</h2>
        <h3>Total Files: 450</h3>
        <table cellspacing="0" cellpadding="4" rules="all" style="border-width:5px; border-style:solid; border-collapse:collapse;">
            <tr>
                <td><b>URI</b></td>
                <td><b>File</b></td>
                <td><b>Access</b></td>
                <td><b>Status</b></td>
                <td><b>Logged In User</b></td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001001_02101_00001_nrca1_uncal.fits</td>
                <td>JWST/jw01073001001_02101_00001_nrca1/jw01073001001_02101_00001_nrca1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001001_02101_00001_nrca2_uncal.fits</td>
                <td>JWST/jw01073001001_02101_00001_nrca2/jw01073001001_02101_00001_nrca2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001001_02101_00001_nrca3_uncal.fits</td>
                <td>JWST/jw01073001001_02101_00001_nrca3/jw01073001001_02101_00001_nrca3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001001_02101_00001_nrca4_uncal.fits</td>
                <td>JWST/jw01073001001_02101_00001_nrca4/jw01073001001_02101_00001_nrca4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001001_02101_00001_nrcalong_uncal.fits</td>
                <td>JWST/jw01073001001_02101_00001_nrcalong/jw01073001001_02101_00001_nrcalong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001001_02101_00001_nrcb1_uncal.fits</td>
                <td>JWST/jw01073001001_02101_00001_nrcb1/jw01073001001_02101_00001_nrcb1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001001_02101_00001_nrcb2_uncal.fits</td>
                <td>JWST/jw01073001001_02101_00001_nrcb2/jw01073001001_02101_00001_nrcb2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001001_02101_00001_nrcb3_uncal.fits</td>
                <td>JWST/jw01073001001_02101_00001_nrcb3/jw01073001001_02101_00001_nrcb3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001001_02101_00001_nrcb4_uncal.fits</td>
                <td>JWST/jw01073001001_02101_00001_nrcb4/jw01073001001_02101_00001_nrcb4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001001_02101_00001_nrcblong_uncal.fits</td>
                <td>JWST/jw01073001001_02101_00001_nrcblong/jw01073001001_02101_00001_nrcblong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001001_02101_00002_nrca1_uncal.fits</td>
                <td>JWST/jw01073001001_02101_00002_nrca1/jw01073001001_02101_00002_nrca1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001001_02101_00002_nrca2_uncal.fits</td>
                <td>JWST/jw01073001001_02101_00002_nrca2/jw01073001001_02101_00002_nrca2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001001_02101_00002_nrca3_uncal.fits</td>
                <td>JWST/jw01073001001_02101_00002_nrca3/jw01073001001_02101_00002_nrca3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001001_02101_00002_nrca4_uncal.fits</td>
                <td>JWST/jw01073001001_02101_00002_nrca4/jw01073001001_02101_00002_nrca4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001001_02101_00002_nrcalong_uncal.fits</td>
                <td>JWST/jw01073001001_02101_00002_nrcalong/jw01073001001_02101_00002_nrcalong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001001_02101_00002_nrcb1_uncal.fits</td>
                <td>JWST/jw01073001001_02101_00002_nrcb1/jw01073001001_02101_00002_nrcb1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001001_02101_00002_nrcb2_uncal.fits</td>
                <td>JWST/jw01073001001_02101_00002_nrcb2/jw01073001001_02101_00002_nrcb2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001001_02101_00002_nrcb3_uncal.fits</td>
                <td>JWST/jw01073001001_02101_00002_nrcb3/jw01073001001_02101_00002_nrcb3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001001_02101_00002_nrcb4_uncal.fits</td>
                <td>JWST/jw01073001001_02101_00002_nrcb4/jw01073001001_02101_00002_nrcb4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001001_02101_00002_nrcblong_uncal.fits</td>
                <td>JWST/jw01073001001_02101_00002_nrcblong/jw01073001001_02101_00002_nrcblong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001002_02101_00001_nrca1_uncal.fits</td>
                <td>JWST/jw01073001002_02101_00001_nrca1/jw01073001002_02101_00001_nrca1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001002_02101_00001_nrca2_uncal.fits</td>
                <td>JWST/jw01073001002_02101_00001_nrca2/jw01073001002_02101_00001_nrca2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001002_02101_00001_nrca3_uncal.fits</td>
                <td>JWST/jw01073001002_02101_00001_nrca3/jw01073001002_02101_00001_nrca3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001002_02101_00001_nrca4_uncal.fits</td>
                <td>JWST/jw01073001002_02101_00001_nrca4/jw01073001002_02101_00001_nrca4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001002_02101_00001_nrcalong_uncal.fits</td>
                <td>JWST/jw01073001002_02101_00001_nrcalong/jw01073001002_02101_00001_nrcalong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001002_02101_00001_nrcb1_uncal.fits</td>
                <td>JWST/jw01073001002_02101_00001_nrcb1/jw01073001002_02101_00001_nrcb1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001002_02101_00001_nrcb2_uncal.fits</td>
                <td>JWST/jw01073001002_02101_00001_nrcb2/jw01073001002_02101_00001_nrcb2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001002_02101_00001_nrcb3_uncal.fits</td>
                <td>JWST/jw01073001002_02101_00001_nrcb3/jw01073001002_02101_00001_nrcb3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001002_02101_00001_nrcb4_uncal.fits</td>
                <td>JWST/jw01073001002_02101_00001_nrcb4/jw01073001002_02101_00001_nrcb4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001002_02101_00001_nrcblong_uncal.fits</td>
                <td>JWST/jw01073001002_02101_00001_nrcblong/jw01073001002_02101_00001_nrcblong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001002_02101_00002_nrca1_uncal.fits</td>
                <td>JWST/jw01073001002_02101_00002_nrca1/jw01073001002_02101_00002_nrca1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001002_02101_00002_nrca2_uncal.fits</td>
                <td>JWST/jw01073001002_02101_00002_nrca2/jw01073001002_02101_00002_nrca2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001002_02101_00002_nrca3_uncal.fits</td>
                <td>JWST/jw01073001002_02101_00002_nrca3/jw01073001002_02101_00002_nrca3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001002_02101_00002_nrca4_uncal.fits</td>
                <td>JWST/jw01073001002_02101_00002_nrca4/jw01073001002_02101_00002_nrca4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001002_02101_00002_nrcalong_uncal.fits</td>
                <td>JWST/jw01073001002_02101_00002_nrcalong/jw01073001002_02101_00002_nrcalong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001002_02101_00002_nrcb1_uncal.fits</td>
                <td>JWST/jw01073001002_02101_00002_nrcb1/jw01073001002_02101_00002_nrcb1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001002_02101_00002_nrcb2_uncal.fits</td>
                <td>JWST/jw01073001002_02101_00002_nrcb2/jw01073001002_02101_00002_nrcb2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001002_02101_00002_nrcb3_uncal.fits</td>
                <td>JWST/jw01073001002_02101_00002_nrcb3/jw01073001002_02101_00002_nrcb3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001002_02101_00002_nrcb4_uncal.fits</td>
                <td>JWST/jw01073001002_02101_00002_nrcb4/jw01073001002_02101_00002_nrcb4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001002_02101_00002_nrcblong_uncal.fits</td>
                <td>JWST/jw01073001002_02101_00002_nrcblong/jw01073001002_02101_00002_nrcblong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001003_02101_00001_nrca1_uncal.fits</td>
                <td>JWST/jw01073001003_02101_00001_nrca1/jw01073001003_02101_00001_nrca1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001003_02101_00001_nrca2_uncal.fits</td>
                <td>JWST/jw01073001003_02101_00001_nrca2/jw01073001003_02101_00001_nrca2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001003_02101_00001_nrca3_uncal.fits</td>
                <td>JWST/jw01073001003_02101_00001_nrca3/jw01073001003_02101_00001_nrca3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001003_02101_00001_nrca4_uncal.fits</td>
                <td>JWST/jw01073001003_02101_00001_nrca4/jw01073001003_02101_00001_nrca4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001003_02101_00001_nrcalong_uncal.fits</td>
                <td>JWST/jw01073001003_02101_00001_nrcalong/jw01073001003_02101_00001_nrcalong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001003_02101_00001_nrcb1_uncal.fits</td>
                <td>JWST/jw01073001003_02101_00001_nrcb1/jw01073001003_02101_00001_nrcb1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001003_02101_00001_nrcb2_uncal.fits</td>
                <td>JWST/jw01073001003_02101_00001_nrcb2/jw01073001003_02101_00001_nrcb2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001003_02101_00001_nrcb3_uncal.fits</td>
                <td>JWST/jw01073001003_02101_00001_nrcb3/jw01073001003_02101_00001_nrcb3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001003_02101_00001_nrcb4_uncal.fits</td>
                <td>JWST/jw01073001003_02101_00001_nrcb4/jw01073001003_02101_00001_nrcb4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001003_02101_00001_nrcblong_uncal.fits</td>
                <td>JWST/jw01073001003_02101_00001_nrcblong/jw01073001003_02101_00001_nrcblong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001003_02101_00002_nrca1_uncal.fits</td>
                <td>JWST/jw01073001003_02101_00002_nrca1/jw01073001003_02101_00002_nrca1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001003_02101_00002_nrca2_uncal.fits</td>
                <td>JWST/jw01073001003_02101_00002_nrca2/jw01073001003_02101_00002_nrca2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001003_02101_00002_nrca3_uncal.fits</td>
                <td>JWST/jw01073001003_02101_00002_nrca3/jw01073001003_02101_00002_nrca3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001003_02101_00002_nrca4_uncal.fits</td>
                <td>JWST/jw01073001003_02101_00002_nrca4/jw01073001003_02101_00002_nrca4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001003_02101_00002_nrcalong_uncal.fits</td>
                <td>JWST/jw01073001003_02101_00002_nrcalong/jw01073001003_02101_00002_nrcalong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001003_02101_00002_nrcb1_uncal.fits</td>
                <td>JWST/jw01073001003_02101_00002_nrcb1/jw01073001003_02101_00002_nrcb1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001003_02101_00002_nrcb2_uncal.fits</td>
                <td>JWST/jw01073001003_02101_00002_nrcb2/jw01073001003_02101_00002_nrcb2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001003_02101_00002_nrcb3_uncal.fits</td>
                <td>JWST/jw01073001003_02101_00002_nrcb3/jw01073001003_02101_00002_nrcb3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001003_02101_00002_nrcb4_uncal.fits</td>
                <td>JWST/jw01073001003_02101_00002_nrcb4/jw01073001003_02101_00002_nrcb4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073001003_02101_00002_nrcblong_uncal.fits</td>
                <td>JWST/jw01073001003_02101_00002_nrcblong/jw01073001003_02101_00002_nrcblong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073002001_02101_00001_nrca1_uncal.fits</td>
                <td>JWST/jw01073002001_02101_00001_nrca1/jw01073002001_02101_00001_nrca1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073002001_02101_00001_nrca2_uncal.fits</td>
                <td>JWST/jw01073002001_02101_00001_nrca2/jw01073002001_02101_00001_nrca2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073002001_02101_00001_nrca3_uncal.fits</td>
                <td>JWST/jw01073002001_02101_00001_nrca3/jw01073002001_02101_00001_nrca3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073002001_02101_00001_nrca4_uncal.fits</td>
                <td>JWST/jw01073002001_02101_00001_nrca4/jw01073002001_02101_00001_nrca4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073002001_02101_00001_nrcalong_uncal.fits</td>
                <td>JWST/jw01073002001_02101_00001_nrcalong/jw01073002001_02101_00001_nrcalong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073002001_02101_00001_nrcb1_uncal.fits</td>
                <td>JWST/jw01073002001_02101_00001_nrcb1/jw01073002001_02101_00001_nrcb1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073002001_02101_00001_nrcb2_uncal.fits</td>
                <td>JWST/jw01073002001_02101_00001_nrcb2/jw01073002001_02101_00001_nrcb2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073002001_02101_00001_nrcb3_uncal.fits</td>
                <td>JWST/jw01073002001_02101_00001_nrcb3/jw01073002001_02101_00001_nrcb3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073002001_02101_00001_nrcb4_uncal.fits</td>
                <td>JWST/jw01073002001_02101_00001_nrcb4/jw01073002001_02101_00001_nrcb4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073002001_02101_00001_nrcblong_uncal.fits</td>
                <td>JWST/jw01073002001_02101_00001_nrcblong/jw01073002001_02101_00001_nrcblong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073002001_02101_00002_nrca1_uncal.fits</td>
                <td>JWST/jw01073002001_02101_00002_nrca1/jw01073002001_02101_00002_nrca1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073002001_02101_00002_nrca2_uncal.fits</td>
                <td>JWST/jw01073002001_02101_00002_nrca2/jw01073002001_02101_00002_nrca2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073002001_02101_00002_nrca3_uncal.fits</td>
                <td>JWST/jw01073002001_02101_00002_nrca3/jw01073002001_02101_00002_nrca3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073002001_02101_00002_nrca4_uncal.fits</td>
                <td>JWST/jw01073002001_02101_00002_nrca4/jw01073002001_02101_00002_nrca4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073002001_02101_00002_nrcalong_uncal.fits</td>
                <td>JWST/jw01073002001_02101_00002_nrcalong/jw01073002001_02101_00002_nrcalong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073002001_02101_00002_nrcb1_uncal.fits</td>
                <td>JWST/jw01073002001_02101_00002_nrcb1/jw01073002001_02101_00002_nrcb1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073002001_02101_00002_nrcb2_uncal.fits</td>
                <td>JWST/jw01073002001_02101_00002_nrcb2/jw01073002001_02101_00002_nrcb2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073002001_02101_00002_nrcb3_uncal.fits</td>
                <td>JWST/jw01073002001_02101_00002_nrcb3/jw01073002001_02101_00002_nrcb3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073002001_02101_00002_nrcb4_uncal.fits</td>
                <td>JWST/jw01073002001_02101_00002_nrcb4/jw01073002001_02101_00002_nrcb4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073002001_02101_00002_nrcblong_uncal.fits</td>
                <td>JWST/jw01073002001_02101_00002_nrcblong/jw01073002001_02101_00002_nrcblong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073002001_02101_00003_nrca1_uncal.fits</td>
                <td>JWST/jw01073002001_02101_00003_nrca1/jw01073002001_02101_00003_nrca1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073002001_02101_00003_nrca2_uncal.fits</td>
                <td>JWST/jw01073002001_02101_00003_nrca2/jw01073002001_02101_00003_nrca2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073002001_02101_00003_nrca3_uncal.fits</td>
                <td>JWST/jw01073002001_02101_00003_nrca3/jw01073002001_02101_00003_nrca3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073002001_02101_00003_nrca4_uncal.fits</td>
                <td>JWST/jw01073002001_02101_00003_nrca4/jw01073002001_02101_00003_nrca4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073002001_02101_00003_nrcalong_uncal.fits</td>
                <td>JWST/jw01073002001_02101_00003_nrcalong/jw01073002001_02101_00003_nrcalong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073002001_02101_00003_nrcb1_uncal.fits</td>
                <td>JWST/jw01073002001_02101_00003_nrcb1/jw01073002001_02101_00003_nrcb1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073002001_02101_00003_nrcb2_uncal.fits</td>
                <td>JWST/jw01073002001_02101_00003_nrcb2/jw01073002001_02101_00003_nrcb2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073002001_02101_00003_nrcb3_uncal.fits</td>
                <td>JWST/jw01073002001_02101_00003_nrcb3/jw01073002001_02101_00003_nrcb3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073002001_02101_00003_nrcb4_uncal.fits</td>
                <td>JWST/jw01073002001_02101_00003_nrcb4/jw01073002001_02101_00003_nrcb4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073002001_02101_00003_nrcblong_uncal.fits</td>
                <td>JWST/jw01073002001_02101_00003_nrcblong/jw01073002001_02101_00003_nrcblong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073002001_02101_00004_nrca1_uncal.fits</td>
                <td>JWST/jw01073002001_02101_00004_nrca1/jw01073002001_02101_00004_nrca1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073002001_02101_00004_nrca2_uncal.fits</td>
                <td>JWST/jw01073002001_02101_00004_nrca2/jw01073002001_02101_00004_nrca2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073002001_02101_00004_nrca3_uncal.fits</td>
                <td>JWST/jw01073002001_02101_00004_nrca3/jw01073002001_02101_00004_nrca3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073002001_02101_00004_nrca4_uncal.fits</td>
                <td>JWST/jw01073002001_02101_00004_nrca4/jw01073002001_02101_00004_nrca4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073002001_02101_00004_nrcalong_uncal.fits</td>
                <td>JWST/jw01073002001_02101_00004_nrcalong/jw01073002001_02101_00004_nrcalong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073002001_02101_00004_nrcb1_uncal.fits</td>
                <td>JWST/jw01073002001_02101_00004_nrcb1/jw01073002001_02101_00004_nrcb1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073002001_02101_00004_nrcb2_uncal.fits</td>
                <td>JWST/jw01073002001_02101_00004_nrcb2/jw01073002001_02101_00004_nrcb2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073002001_02101_00004_nrcb3_uncal.fits</td>
                <td>JWST/jw01073002001_02101_00004_nrcb3/jw01073002001_02101_00004_nrcb3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073002001_02101_00004_nrcb4_uncal.fits</td>
                <td>JWST/jw01073002001_02101_00004_nrcb4/jw01073002001_02101_00004_nrcb4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073002001_02101_00004_nrcblong_uncal.fits</td>
                <td>JWST/jw01073002001_02101_00004_nrcblong/jw01073002001_02101_00004_nrcblong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073003001_02101_00001_nrca1_uncal.fits</td>
                <td>JWST/jw01073003001_02101_00001_nrca1/jw01073003001_02101_00001_nrca1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073003001_02101_00001_nrca2_uncal.fits</td>
                <td>JWST/jw01073003001_02101_00001_nrca2/jw01073003001_02101_00001_nrca2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073003001_02101_00001_nrca3_uncal.fits</td>
                <td>JWST/jw01073003001_02101_00001_nrca3/jw01073003001_02101_00001_nrca3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073003001_02101_00001_nrca4_uncal.fits</td>
                <td>JWST/jw01073003001_02101_00001_nrca4/jw01073003001_02101_00001_nrca4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073003001_02101_00001_nrcalong_uncal.fits</td>
                <td>JWST/jw01073003001_02101_00001_nrcalong/jw01073003001_02101_00001_nrcalong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073003001_02101_00001_nrcb1_uncal.fits</td>
                <td>JWST/jw01073003001_02101_00001_nrcb1/jw01073003001_02101_00001_nrcb1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073003001_02101_00001_nrcb2_uncal.fits</td>
                <td>JWST/jw01073003001_02101_00001_nrcb2/jw01073003001_02101_00001_nrcb2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073003001_02101_00001_nrcb3_uncal.fits</td>
                <td>JWST/jw01073003001_02101_00001_nrcb3/jw01073003001_02101_00001_nrcb3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073003001_02101_00001_nrcb4_uncal.fits</td>
                <td>JWST/jw01073003001_02101_00001_nrcb4/jw01073003001_02101_00001_nrcb4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073003001_02101_00001_nrcblong_uncal.fits</td>
                <td>JWST/jw01073003001_02101_00001_nrcblong/jw01073003001_02101_00001_nrcblong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073003001_02101_00002_nrca1_uncal.fits</td>
                <td>JWST/jw01073003001_02101_00002_nrca1/jw01073003001_02101_00002_nrca1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073003001_02101_00002_nrca2_uncal.fits</td>
                <td>JWST/jw01073003001_02101_00002_nrca2/jw01073003001_02101_00002_nrca2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073003001_02101_00002_nrca3_uncal.fits</td>
                <td>JWST/jw01073003001_02101_00002_nrca3/jw01073003001_02101_00002_nrca3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073003001_02101_00002_nrca4_uncal.fits</td>
                <td>JWST/jw01073003001_02101_00002_nrca4/jw01073003001_02101_00002_nrca4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073003001_02101_00002_nrcalong_uncal.fits</td>
                <td>JWST/jw01073003001_02101_00002_nrcalong/jw01073003001_02101_00002_nrcalong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073003001_02101_00002_nrcb1_uncal.fits</td>
                <td>JWST/jw01073003001_02101_00002_nrcb1/jw01073003001_02101_00002_nrcb1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073003001_02101_00002_nrcb2_uncal.fits</td>
                <td>JWST/jw01073003001_02101_00002_nrcb2/jw01073003001_02101_00002_nrcb2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073003001_02101_00002_nrcb3_uncal.fits</td>
                <td>JWST/jw01073003001_02101_00002_nrcb3/jw01073003001_02101_00002_nrcb3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073003001_02101_00002_nrcb4_uncal.fits</td>
                <td>JWST/jw01073003001_02101_00002_nrcb4/jw01073003001_02101_00002_nrcb4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073003001_02101_00002_nrcblong_uncal.fits</td>
                <td>JWST/jw01073003001_02101_00002_nrcblong/jw01073003001_02101_00002_nrcblong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073003001_02101_00003_nrca1_uncal.fits</td>
                <td>JWST/jw01073003001_02101_00003_nrca1/jw01073003001_02101_00003_nrca1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073003001_02101_00003_nrca2_uncal.fits</td>
                <td>JWST/jw01073003001_02101_00003_nrca2/jw01073003001_02101_00003_nrca2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073003001_02101_00003_nrca3_uncal.fits</td>
                <td>JWST/jw01073003001_02101_00003_nrca3/jw01073003001_02101_00003_nrca3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073003001_02101_00003_nrca4_uncal.fits</td>
                <td>JWST/jw01073003001_02101_00003_nrca4/jw01073003001_02101_00003_nrca4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073003001_02101_00003_nrcalong_uncal.fits</td>
                <td>JWST/jw01073003001_02101_00003_nrcalong/jw01073003001_02101_00003_nrcalong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073003001_02101_00003_nrcb1_uncal.fits</td>
                <td>JWST/jw01073003001_02101_00003_nrcb1/jw01073003001_02101_00003_nrcb1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073003001_02101_00003_nrcb2_uncal.fits</td>
                <td>JWST/jw01073003001_02101_00003_nrcb2/jw01073003001_02101_00003_nrcb2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073003001_02101_00003_nrcb3_uncal.fits</td>
                <td>JWST/jw01073003001_02101_00003_nrcb3/jw01073003001_02101_00003_nrcb3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073003001_02101_00003_nrcb4_uncal.fits</td>
                <td>JWST/jw01073003001_02101_00003_nrcb4/jw01073003001_02101_00003_nrcb4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073003001_02101_00003_nrcblong_uncal.fits</td>
                <td>JWST/jw01073003001_02101_00003_nrcblong/jw01073003001_02101_00003_nrcblong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073003001_02101_00004_nrca1_uncal.fits</td>
                <td>JWST/jw01073003001_02101_00004_nrca1/jw01073003001_02101_00004_nrca1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073003001_02101_00004_nrca2_uncal.fits</td>
                <td>JWST/jw01073003001_02101_00004_nrca2/jw01073003001_02101_00004_nrca2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073003001_02101_00004_nrca3_uncal.fits</td>
                <td>JWST/jw01073003001_02101_00004_nrca3/jw01073003001_02101_00004_nrca3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073003001_02101_00004_nrca4_uncal.fits</td>
                <td>JWST/jw01073003001_02101_00004_nrca4/jw01073003001_02101_00004_nrca4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073003001_02101_00004_nrcalong_uncal.fits</td>
                <td>JWST/jw01073003001_02101_00004_nrcalong/jw01073003001_02101_00004_nrcalong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073003001_02101_00004_nrcb1_uncal.fits</td>
                <td>JWST/jw01073003001_02101_00004_nrcb1/jw01073003001_02101_00004_nrcb1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073003001_02101_00004_nrcb2_uncal.fits</td>
                <td>JWST/jw01073003001_02101_00004_nrcb2/jw01073003001_02101_00004_nrcb2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073003001_02101_00004_nrcb3_uncal.fits</td>
                <td>JWST/jw01073003001_02101_00004_nrcb3/jw01073003001_02101_00004_nrcb3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073003001_02101_00004_nrcb4_uncal.fits</td>
                <td>JWST/jw01073003001_02101_00004_nrcb4/jw01073003001_02101_00004_nrcb4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073003001_02101_00004_nrcblong_uncal.fits</td>
                <td>JWST/jw01073003001_02101_00004_nrcblong/jw01073003001_02101_00004_nrcblong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073004001_02101_00001_nrca1_uncal.fits</td>
                <td>JWST/jw01073004001_02101_00001_nrca1/jw01073004001_02101_00001_nrca1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073004001_02101_00001_nrca2_uncal.fits</td>
                <td>JWST/jw01073004001_02101_00001_nrca2/jw01073004001_02101_00001_nrca2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073004001_02101_00001_nrca3_uncal.fits</td>
                <td>JWST/jw01073004001_02101_00001_nrca3/jw01073004001_02101_00001_nrca3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073004001_02101_00001_nrca4_uncal.fits</td>
                <td>JWST/jw01073004001_02101_00001_nrca4/jw01073004001_02101_00001_nrca4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073004001_02101_00001_nrcalong_uncal.fits</td>
                <td>JWST/jw01073004001_02101_00001_nrcalong/jw01073004001_02101_00001_nrcalong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073004001_02101_00001_nrcb1_uncal.fits</td>
                <td>JWST/jw01073004001_02101_00001_nrcb1/jw01073004001_02101_00001_nrcb1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073004001_02101_00001_nrcb2_uncal.fits</td>
                <td>JWST/jw01073004001_02101_00001_nrcb2/jw01073004001_02101_00001_nrcb2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073004001_02101_00001_nrcb3_uncal.fits</td>
                <td>JWST/jw01073004001_02101_00001_nrcb3/jw01073004001_02101_00001_nrcb3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073004001_02101_00001_nrcb4_uncal.fits</td>
                <td>JWST/jw01073004001_02101_00001_nrcb4/jw01073004001_02101_00001_nrcb4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073004001_02101_00001_nrcblong_uncal.fits</td>
                <td>JWST/jw01073004001_02101_00001_nrcblong/jw01073004001_02101_00001_nrcblong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073004001_02101_00002_nrca1_uncal.fits</td>
                <td>JWST/jw01073004001_02101_00002_nrca1/jw01073004001_02101_00002_nrca1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073004001_02101_00002_nrca2_uncal.fits</td>
                <td>JWST/jw01073004001_02101_00002_nrca2/jw01073004001_02101_00002_nrca2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073004001_02101_00002_nrca3_uncal.fits</td>
                <td>JWST/jw01073004001_02101_00002_nrca3/jw01073004001_02101_00002_nrca3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073004001_02101_00002_nrca4_uncal.fits</td>
                <td>JWST/jw01073004001_02101_00002_nrca4/jw01073004001_02101_00002_nrca4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073004001_02101_00002_nrcalong_uncal.fits</td>
                <td>JWST/jw01073004001_02101_00002_nrcalong/jw01073004001_02101_00002_nrcalong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073004001_02101_00002_nrcb1_uncal.fits</td>
                <td>JWST/jw01073004001_02101_00002_nrcb1/jw01073004001_02101_00002_nrcb1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073004001_02101_00002_nrcb2_uncal.fits</td>
                <td>JWST/jw01073004001_02101_00002_nrcb2/jw01073004001_02101_00002_nrcb2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073004001_02101_00002_nrcb3_uncal.fits</td>
                <td>JWST/jw01073004001_02101_00002_nrcb3/jw01073004001_02101_00002_nrcb3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073004001_02101_00002_nrcb4_uncal.fits</td>
                <td>JWST/jw01073004001_02101_00002_nrcb4/jw01073004001_02101_00002_nrcb4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073004001_02101_00002_nrcblong_uncal.fits</td>
                <td>JWST/jw01073004001_02101_00002_nrcblong/jw01073004001_02101_00002_nrcblong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073005001_02101_00001_nrca1_uncal.fits</td>
                <td>JWST/jw01073005001_02101_00001_nrca1/jw01073005001_02101_00001_nrca1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073005001_02101_00001_nrca2_uncal.fits</td>
                <td>JWST/jw01073005001_02101_00001_nrca2/jw01073005001_02101_00001_nrca2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073005001_02101_00001_nrca3_uncal.fits</td>
                <td>JWST/jw01073005001_02101_00001_nrca3/jw01073005001_02101_00001_nrca3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073005001_02101_00001_nrca4_uncal.fits</td>
                <td>JWST/jw01073005001_02101_00001_nrca4/jw01073005001_02101_00001_nrca4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073005001_02101_00001_nrcalong_uncal.fits</td>
                <td>JWST/jw01073005001_02101_00001_nrcalong/jw01073005001_02101_00001_nrcalong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073005001_02101_00001_nrcb1_uncal.fits</td>
                <td>JWST/jw01073005001_02101_00001_nrcb1/jw01073005001_02101_00001_nrcb1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073005001_02101_00001_nrcb2_uncal.fits</td>
                <td>JWST/jw01073005001_02101_00001_nrcb2/jw01073005001_02101_00001_nrcb2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073005001_02101_00001_nrcb3_uncal.fits</td>
                <td>JWST/jw01073005001_02101_00001_nrcb3/jw01073005001_02101_00001_nrcb3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073005001_02101_00001_nrcb4_uncal.fits</td>
                <td>JWST/jw01073005001_02101_00001_nrcb4/jw01073005001_02101_00001_nrcb4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073005001_02101_00001_nrcblong_uncal.fits</td>
                <td>JWST/jw01073005001_02101_00001_nrcblong/jw01073005001_02101_00001_nrcblong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073005001_02101_00002_nrca1_uncal.fits</td>
                <td>JWST/jw01073005001_02101_00002_nrca1/jw01073005001_02101_00002_nrca1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073005001_02101_00002_nrca2_uncal.fits</td>
                <td>JWST/jw01073005001_02101_00002_nrca2/jw01073005001_02101_00002_nrca2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073005001_02101_00002_nrca3_uncal.fits</td>
                <td>JWST/jw01073005001_02101_00002_nrca3/jw01073005001_02101_00002_nrca3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073005001_02101_00002_nrca4_uncal.fits</td>
                <td>JWST/jw01073005001_02101_00002_nrca4/jw01073005001_02101_00002_nrca4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073005001_02101_00002_nrcalong_uncal.fits</td>
                <td>JWST/jw01073005001_02101_00002_nrcalong/jw01073005001_02101_00002_nrcalong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073005001_02101_00002_nrcb1_uncal.fits</td>
                <td>JWST/jw01073005001_02101_00002_nrcb1/jw01073005001_02101_00002_nrcb1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073005001_02101_00002_nrcb2_uncal.fits</td>
                <td>JWST/jw01073005001_02101_00002_nrcb2/jw01073005001_02101_00002_nrcb2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073005001_02101_00002_nrcb3_uncal.fits</td>
                <td>JWST/jw01073005001_02101_00002_nrcb3/jw01073005001_02101_00002_nrcb3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073005001_02101_00002_nrcb4_uncal.fits</td>
                <td>JWST/jw01073005001_02101_00002_nrcb4/jw01073005001_02101_00002_nrcb4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073005001_02101_00002_nrcblong_uncal.fits</td>
                <td>JWST/jw01073005001_02101_00002_nrcblong/jw01073005001_02101_00002_nrcblong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073005001_02101_00003_nrca1_uncal.fits</td>
                <td>JWST/jw01073005001_02101_00003_nrca1/jw01073005001_02101_00003_nrca1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073005001_02101_00003_nrca2_uncal.fits</td>
                <td>JWST/jw01073005001_02101_00003_nrca2/jw01073005001_02101_00003_nrca2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073005001_02101_00003_nrca3_uncal.fits</td>
                <td>JWST/jw01073005001_02101_00003_nrca3/jw01073005001_02101_00003_nrca3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073005001_02101_00003_nrca4_uncal.fits</td>
                <td>JWST/jw01073005001_02101_00003_nrca4/jw01073005001_02101_00003_nrca4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073005001_02101_00003_nrcalong_uncal.fits</td>
                <td>JWST/jw01073005001_02101_00003_nrcalong/jw01073005001_02101_00003_nrcalong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073005001_02101_00003_nrcb1_uncal.fits</td>
                <td>JWST/jw01073005001_02101_00003_nrcb1/jw01073005001_02101_00003_nrcb1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073005001_02101_00003_nrcb2_uncal.fits</td>
                <td>JWST/jw01073005001_02101_00003_nrcb2/jw01073005001_02101_00003_nrcb2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073005001_02101_00003_nrcb3_uncal.fits</td>
                <td>JWST/jw01073005001_02101_00003_nrcb3/jw01073005001_02101_00003_nrcb3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073005001_02101_00003_nrcb4_uncal.fits</td>
                <td>JWST/jw01073005001_02101_00003_nrcb4/jw01073005001_02101_00003_nrcb4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073005001_02101_00003_nrcblong_uncal.fits</td>
                <td>JWST/jw01073005001_02101_00003_nrcblong/jw01073005001_02101_00003_nrcblong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073005001_02101_00004_nrca1_uncal.fits</td>
                <td>JWST/jw01073005001_02101_00004_nrca1/jw01073005001_02101_00004_nrca1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073005001_02101_00004_nrca2_uncal.fits</td>
                <td>JWST/jw01073005001_02101_00004_nrca2/jw01073005001_02101_00004_nrca2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073005001_02101_00004_nrca3_uncal.fits</td>
                <td>JWST/jw01073005001_02101_00004_nrca3/jw01073005001_02101_00004_nrca3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073005001_02101_00004_nrca4_uncal.fits</td>
                <td>JWST/jw01073005001_02101_00004_nrca4/jw01073005001_02101_00004_nrca4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073005001_02101_00004_nrcalong_uncal.fits</td>
                <td>JWST/jw01073005001_02101_00004_nrcalong/jw01073005001_02101_00004_nrcalong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073005001_02101_00004_nrcb1_uncal.fits</td>
                <td>JWST/jw01073005001_02101_00004_nrcb1/jw01073005001_02101_00004_nrcb1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073005001_02101_00004_nrcb2_uncal.fits</td>
                <td>JWST/jw01073005001_02101_00004_nrcb2/jw01073005001_02101_00004_nrcb2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073005001_02101_00004_nrcb3_uncal.fits</td>
                <td>JWST/jw01073005001_02101_00004_nrcb3/jw01073005001_02101_00004_nrcb3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073005001_02101_00004_nrcb4_uncal.fits</td>
                <td>JWST/jw01073005001_02101_00004_nrcb4/jw01073005001_02101_00004_nrcb4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073005001_02101_00004_nrcblong_uncal.fits</td>
                <td>JWST/jw01073005001_02101_00004_nrcblong/jw01073005001_02101_00004_nrcblong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00001_nrca1_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00001_nrca1/jw01073006001_02101_00001_nrca1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00001_nrca2_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00001_nrca2/jw01073006001_02101_00001_nrca2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00001_nrca3_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00001_nrca3/jw01073006001_02101_00001_nrca3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00001_nrca4_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00001_nrca4/jw01073006001_02101_00001_nrca4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00001_nrcalong_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00001_nrcalong/jw01073006001_02101_00001_nrcalong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00001_nrcb1_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00001_nrcb1/jw01073006001_02101_00001_nrcb1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00001_nrcb2_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00001_nrcb2/jw01073006001_02101_00001_nrcb2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00001_nrcb3_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00001_nrcb3/jw01073006001_02101_00001_nrcb3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00001_nrcb4_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00001_nrcb4/jw01073006001_02101_00001_nrcb4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00001_nrcblong_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00001_nrcblong/jw01073006001_02101_00001_nrcblong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00002_nrca1_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00002_nrca1/jw01073006001_02101_00002_nrca1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00002_nrca2_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00002_nrca2/jw01073006001_02101_00002_nrca2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00002_nrca3_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00002_nrca3/jw01073006001_02101_00002_nrca3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00002_nrca4_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00002_nrca4/jw01073006001_02101_00002_nrca4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00002_nrcalong_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00002_nrcalong/jw01073006001_02101_00002_nrcalong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00002_nrcb1_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00002_nrcb1/jw01073006001_02101_00002_nrcb1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00002_nrcb2_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00002_nrcb2/jw01073006001_02101_00002_nrcb2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00002_nrcb3_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00002_nrcb3/jw01073006001_02101_00002_nrcb3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00002_nrcb4_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00002_nrcb4/jw01073006001_02101_00002_nrcb4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00002_nrcblong_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00002_nrcblong/jw01073006001_02101_00002_nrcblong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00003_nrca1_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00003_nrca1/jw01073006001_02101_00003_nrca1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00003_nrca2_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00003_nrca2/jw01073006001_02101_00003_nrca2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00003_nrca3_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00003_nrca3/jw01073006001_02101_00003_nrca3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00003_nrca4_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00003_nrca4/jw01073006001_02101_00003_nrca4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00003_nrcalong_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00003_nrcalong/jw01073006001_02101_00003_nrcalong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00003_nrcb1_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00003_nrcb1/jw01073006001_02101_00003_nrcb1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00003_nrcb2_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00003_nrcb2/jw01073006001_02101_00003_nrcb2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00003_nrcb3_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00003_nrcb3/jw01073006001_02101_00003_nrcb3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00003_nrcb4_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00003_nrcb4/jw01073006001_02101_00003_nrcb4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00003_nrcblong_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00003_nrcblong/jw01073006001_02101_00003_nrcblong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00004_nrca1_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00004_nrca1/jw01073006001_02101_00004_nrca1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00004_nrca2_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00004_nrca2/jw01073006001_02101_00004_nrca2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00004_nrca3_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00004_nrca3/jw01073006001_02101_00004_nrca3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00004_nrca4_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00004_nrca4/jw01073006001_02101_00004_nrca4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00004_nrcalong_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00004_nrcalong/jw01073006001_02101_00004_nrcalong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00004_nrcb1_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00004_nrcb1/jw01073006001_02101_00004_nrcb1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00004_nrcb2_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00004_nrcb2/jw01073006001_02101_00004_nrcb2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00004_nrcb3_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00004_nrcb3/jw01073006001_02101_00004_nrcb3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00004_nrcb4_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00004_nrcb4/jw01073006001_02101_00004_nrcb4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00004_nrcblong_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00004_nrcblong/jw01073006001_02101_00004_nrcblong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00005_nrca1_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00005_nrca1/jw01073006001_02101_00005_nrca1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00005_nrca2_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00005_nrca2/jw01073006001_02101_00005_nrca2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00005_nrca3_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00005_nrca3/jw01073006001_02101_00005_nrca3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00005_nrca4_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00005_nrca4/jw01073006001_02101_00005_nrca4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00005_nrcalong_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00005_nrcalong/jw01073006001_02101_00005_nrcalong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00005_nrcb1_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00005_nrcb1/jw01073006001_02101_00005_nrcb1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00005_nrcb2_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00005_nrcb2/jw01073006001_02101_00005_nrcb2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00005_nrcb3_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00005_nrcb3/jw01073006001_02101_00005_nrcb3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00005_nrcb4_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00005_nrcb4/jw01073006001_02101_00005_nrcb4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00005_nrcblong_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00005_nrcblong/jw01073006001_02101_00005_nrcblong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00006_nrca1_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00006_nrca1/jw01073006001_02101_00006_nrca1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00006_nrca2_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00006_nrca2/jw01073006001_02101_00006_nrca2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00006_nrca3_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00006_nrca3/jw01073006001_02101_00006_nrca3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00006_nrca4_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00006_nrca4/jw01073006001_02101_00006_nrca4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00006_nrcalong_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00006_nrcalong/jw01073006001_02101_00006_nrcalong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00006_nrcb1_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00006_nrcb1/jw01073006001_02101_00006_nrcb1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00006_nrcb2_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00006_nrcb2/jw01073006001_02101_00006_nrcb2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00006_nrcb3_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00006_nrcb3/jw01073006001_02101_00006_nrcb3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00006_nrcb4_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00006_nrcb4/jw01073006001_02101_00006_nrcb4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00006_nrcblong_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00006_nrcblong/jw01073006001_02101_00006_nrcblong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00007_nrca1_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00007_nrca1/jw01073006001_02101_00007_nrca1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00007_nrca2_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00007_nrca2/jw01073006001_02101_00007_nrca2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00007_nrca3_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00007_nrca3/jw01073006001_02101_00007_nrca3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00007_nrca4_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00007_nrca4/jw01073006001_02101_00007_nrca4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00007_nrcalong_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00007_nrcalong/jw01073006001_02101_00007_nrcalong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00007_nrcb1_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00007_nrcb1/jw01073006001_02101_00007_nrcb1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00007_nrcb2_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00007_nrcb2/jw01073006001_02101_00007_nrcb2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00007_nrcb3_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00007_nrcb3/jw01073006001_02101_00007_nrcb3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00007_nrcb4_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00007_nrcb4/jw01073006001_02101_00007_nrcb4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00007_nrcblong_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00007_nrcblong/jw01073006001_02101_00007_nrcblong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00008_nrca1_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00008_nrca1/jw01073006001_02101_00008_nrca1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00008_nrca2_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00008_nrca2/jw01073006001_02101_00008_nrca2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00008_nrca3_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00008_nrca3/jw01073006001_02101_00008_nrca3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00008_nrca4_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00008_nrca4/jw01073006001_02101_00008_nrca4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00008_nrcalong_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00008_nrcalong/jw01073006001_02101_00008_nrcalong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00008_nrcb1_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00008_nrcb1/jw01073006001_02101_00008_nrcb1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00008_nrcb2_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00008_nrcb2/jw01073006001_02101_00008_nrcb2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00008_nrcb3_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00008_nrcb3/jw01073006001_02101_00008_nrcb3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00008_nrcb4_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00008_nrcb4/jw01073006001_02101_00008_nrcb4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00008_nrcblong_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00008_nrcblong/jw01073006001_02101_00008_nrcblong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00009_nrca1_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00009_nrca1/jw01073006001_02101_00009_nrca1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00009_nrca2_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00009_nrca2/jw01073006001_02101_00009_nrca2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00009_nrca3_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00009_nrca3/jw01073006001_02101_00009_nrca3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00009_nrca4_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00009_nrca4/jw01073006001_02101_00009_nrca4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00009_nrcalong_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00009_nrcalong/jw01073006001_02101_00009_nrcalong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00009_nrcb1_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00009_nrcb1/jw01073006001_02101_00009_nrcb1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00009_nrcb2_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00009_nrcb2/jw01073006001_02101_00009_nrcb2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00009_nrcb3_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00009_nrcb3/jw01073006001_02101_00009_nrcb3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00009_nrcb4_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00009_nrcb4/jw01073006001_02101_00009_nrcb4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073006001_02101_00009_nrcblong_uncal.fits</td>
                <td>JWST/jw01073006001_02101_00009_nrcblong/jw01073006001_02101_00009_nrcblong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00001_nrca1_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00001_nrca1/jw01073007001_02101_00001_nrca1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00001_nrca2_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00001_nrca2/jw01073007001_02101_00001_nrca2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00001_nrca3_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00001_nrca3/jw01073007001_02101_00001_nrca3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00001_nrca4_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00001_nrca4/jw01073007001_02101_00001_nrca4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00001_nrcalong_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00001_nrcalong/jw01073007001_02101_00001_nrcalong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00001_nrcb1_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00001_nrcb1/jw01073007001_02101_00001_nrcb1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00001_nrcb2_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00001_nrcb2/jw01073007001_02101_00001_nrcb2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00001_nrcb3_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00001_nrcb3/jw01073007001_02101_00001_nrcb3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00001_nrcb4_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00001_nrcb4/jw01073007001_02101_00001_nrcb4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00001_nrcblong_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00001_nrcblong/jw01073007001_02101_00001_nrcblong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00002_nrca1_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00002_nrca1/jw01073007001_02101_00002_nrca1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00002_nrca2_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00002_nrca2/jw01073007001_02101_00002_nrca2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00002_nrca3_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00002_nrca3/jw01073007001_02101_00002_nrca3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00002_nrca4_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00002_nrca4/jw01073007001_02101_00002_nrca4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00002_nrcalong_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00002_nrcalong/jw01073007001_02101_00002_nrcalong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00002_nrcb1_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00002_nrcb1/jw01073007001_02101_00002_nrcb1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00002_nrcb2_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00002_nrcb2/jw01073007001_02101_00002_nrcb2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00002_nrcb3_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00002_nrcb3/jw01073007001_02101_00002_nrcb3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00002_nrcb4_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00002_nrcb4/jw01073007001_02101_00002_nrcb4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00002_nrcblong_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00002_nrcblong/jw01073007001_02101_00002_nrcblong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00003_nrca1_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00003_nrca1/jw01073007001_02101_00003_nrca1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00003_nrca2_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00003_nrca2/jw01073007001_02101_00003_nrca2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00003_nrca3_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00003_nrca3/jw01073007001_02101_00003_nrca3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00003_nrca4_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00003_nrca4/jw01073007001_02101_00003_nrca4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00003_nrcalong_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00003_nrcalong/jw01073007001_02101_00003_nrcalong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00003_nrcb1_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00003_nrcb1/jw01073007001_02101_00003_nrcb1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00003_nrcb2_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00003_nrcb2/jw01073007001_02101_00003_nrcb2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00003_nrcb3_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00003_nrcb3/jw01073007001_02101_00003_nrcb3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00003_nrcb4_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00003_nrcb4/jw01073007001_02101_00003_nrcb4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00003_nrcblong_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00003_nrcblong/jw01073007001_02101_00003_nrcblong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00004_nrca1_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00004_nrca1/jw01073007001_02101_00004_nrca1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00004_nrca2_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00004_nrca2/jw01073007001_02101_00004_nrca2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00004_nrca3_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00004_nrca3/jw01073007001_02101_00004_nrca3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00004_nrca4_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00004_nrca4/jw01073007001_02101_00004_nrca4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00004_nrcalong_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00004_nrcalong/jw01073007001_02101_00004_nrcalong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00004_nrcb1_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00004_nrcb1/jw01073007001_02101_00004_nrcb1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00004_nrcb2_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00004_nrcb2/jw01073007001_02101_00004_nrcb2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00004_nrcb3_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00004_nrcb3/jw01073007001_02101_00004_nrcb3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00004_nrcb4_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00004_nrcb4/jw01073007001_02101_00004_nrcb4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00004_nrcblong_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00004_nrcblong/jw01073007001_02101_00004_nrcblong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00005_nrca1_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00005_nrca1/jw01073007001_02101_00005_nrca1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00005_nrca2_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00005_nrca2/jw01073007001_02101_00005_nrca2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00005_nrca3_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00005_nrca3/jw01073007001_02101_00005_nrca3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00005_nrca4_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00005_nrca4/jw01073007001_02101_00005_nrca4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00005_nrcalong_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00005_nrcalong/jw01073007001_02101_00005_nrcalong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00005_nrcb1_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00005_nrcb1/jw01073007001_02101_00005_nrcb1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00005_nrcb2_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00005_nrcb2/jw01073007001_02101_00005_nrcb2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00005_nrcb3_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00005_nrcb3/jw01073007001_02101_00005_nrcb3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00005_nrcb4_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00005_nrcb4/jw01073007001_02101_00005_nrcb4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00005_nrcblong_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00005_nrcblong/jw01073007001_02101_00005_nrcblong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00006_nrca1_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00006_nrca1/jw01073007001_02101_00006_nrca1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00006_nrca2_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00006_nrca2/jw01073007001_02101_00006_nrca2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00006_nrca3_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00006_nrca3/jw01073007001_02101_00006_nrca3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00006_nrca4_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00006_nrca4/jw01073007001_02101_00006_nrca4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00006_nrcalong_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00006_nrcalong/jw01073007001_02101_00006_nrcalong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00006_nrcb1_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00006_nrcb1/jw01073007001_02101_00006_nrcb1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00006_nrcb2_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00006_nrcb2/jw01073007001_02101_00006_nrcb2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00006_nrcb3_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00006_nrcb3/jw01073007001_02101_00006_nrcb3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00006_nrcb4_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00006_nrcb4/jw01073007001_02101_00006_nrcb4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00006_nrcblong_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00006_nrcblong/jw01073007001_02101_00006_nrcblong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00007_nrca1_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00007_nrca1/jw01073007001_02101_00007_nrca1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00007_nrca2_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00007_nrca2/jw01073007001_02101_00007_nrca2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00007_nrca3_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00007_nrca3/jw01073007001_02101_00007_nrca3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00007_nrca4_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00007_nrca4/jw01073007001_02101_00007_nrca4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00007_nrcalong_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00007_nrcalong/jw01073007001_02101_00007_nrcalong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00007_nrcb1_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00007_nrcb1/jw01073007001_02101_00007_nrcb1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00007_nrcb2_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00007_nrcb2/jw01073007001_02101_00007_nrcb2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00007_nrcb3_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00007_nrcb3/jw01073007001_02101_00007_nrcb3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00007_nrcb4_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00007_nrcb4/jw01073007001_02101_00007_nrcb4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00007_nrcblong_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00007_nrcblong/jw01073007001_02101_00007_nrcblong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00008_nrca1_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00008_nrca1/jw01073007001_02101_00008_nrca1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00008_nrca2_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00008_nrca2/jw01073007001_02101_00008_nrca2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00008_nrca3_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00008_nrca3/jw01073007001_02101_00008_nrca3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00008_nrca4_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00008_nrca4/jw01073007001_02101_00008_nrca4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00008_nrcalong_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00008_nrcalong/jw01073007001_02101_00008_nrcalong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00008_nrcb1_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00008_nrcb1/jw01073007001_02101_00008_nrcb1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00008_nrcb2_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00008_nrcb2/jw01073007001_02101_00008_nrcb2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00008_nrcb3_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00008_nrcb3/jw01073007001_02101_00008_nrcb3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00008_nrcb4_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00008_nrcb4/jw01073007001_02101_00008_nrcb4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02101_00008_nrcblong_uncal.fits</td>
                <td>JWST/jw01073007001_02101_00008_nrcblong/jw01073007001_02101_00008_nrcblong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00001_nrca1_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00001_nrca1/jw01073007001_02103_00001_nrca1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00001_nrca2_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00001_nrca2/jw01073007001_02103_00001_nrca2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00001_nrca3_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00001_nrca3/jw01073007001_02103_00001_nrca3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00001_nrca4_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00001_nrca4/jw01073007001_02103_00001_nrca4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00001_nrcalong_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00001_nrcalong/jw01073007001_02103_00001_nrcalong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00001_nrcb1_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00001_nrcb1/jw01073007001_02103_00001_nrcb1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00001_nrcb2_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00001_nrcb2/jw01073007001_02103_00001_nrcb2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00001_nrcb3_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00001_nrcb3/jw01073007001_02103_00001_nrcb3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00001_nrcb4_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00001_nrcb4/jw01073007001_02103_00001_nrcb4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00001_nrcblong_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00001_nrcblong/jw01073007001_02103_00001_nrcblong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00002_nrca1_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00002_nrca1/jw01073007001_02103_00002_nrca1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00002_nrca2_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00002_nrca2/jw01073007001_02103_00002_nrca2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00002_nrca3_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00002_nrca3/jw01073007001_02103_00002_nrca3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00002_nrca4_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00002_nrca4/jw01073007001_02103_00002_nrca4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00002_nrcalong_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00002_nrcalong/jw01073007001_02103_00002_nrcalong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00002_nrcb1_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00002_nrcb1/jw01073007001_02103_00002_nrcb1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00002_nrcb2_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00002_nrcb2/jw01073007001_02103_00002_nrcb2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00002_nrcb3_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00002_nrcb3/jw01073007001_02103_00002_nrcb3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00002_nrcb4_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00002_nrcb4/jw01073007001_02103_00002_nrcb4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00002_nrcblong_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00002_nrcblong/jw01073007001_02103_00002_nrcblong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00003_nrca1_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00003_nrca1/jw01073007001_02103_00003_nrca1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00003_nrca2_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00003_nrca2/jw01073007001_02103_00003_nrca2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00003_nrca3_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00003_nrca3/jw01073007001_02103_00003_nrca3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00003_nrca4_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00003_nrca4/jw01073007001_02103_00003_nrca4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00003_nrcalong_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00003_nrcalong/jw01073007001_02103_00003_nrcalong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00003_nrcb1_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00003_nrcb1/jw01073007001_02103_00003_nrcb1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00003_nrcb2_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00003_nrcb2/jw01073007001_02103_00003_nrcb2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00003_nrcb3_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00003_nrcb3/jw01073007001_02103_00003_nrcb3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00003_nrcb4_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00003_nrcb4/jw01073007001_02103_00003_nrcb4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00003_nrcblong_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00003_nrcblong/jw01073007001_02103_00003_nrcblong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00004_nrca1_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00004_nrca1/jw01073007001_02103_00004_nrca1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00004_nrca2_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00004_nrca2/jw01073007001_02103_00004_nrca2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00004_nrca3_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00004_nrca3/jw01073007001_02103_00004_nrca3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00004_nrca4_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00004_nrca4/jw01073007001_02103_00004_nrca4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00004_nrcalong_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00004_nrcalong/jw01073007001_02103_00004_nrcalong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00004_nrcb1_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00004_nrcb1/jw01073007001_02103_00004_nrcb1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00004_nrcb2_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00004_nrcb2/jw01073007001_02103_00004_nrcb2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00004_nrcb3_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00004_nrcb3/jw01073007001_02103_00004_nrcb3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00004_nrcb4_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00004_nrcb4/jw01073007001_02103_00004_nrcb4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00004_nrcblong_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00004_nrcblong/jw01073007001_02103_00004_nrcblong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00005_nrca1_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00005_nrca1/jw01073007001_02103_00005_nrca1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00005_nrca2_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00005_nrca2/jw01073007001_02103_00005_nrca2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00005_nrca3_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00005_nrca3/jw01073007001_02103_00005_nrca3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00005_nrca4_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00005_nrca4/jw01073007001_02103_00005_nrca4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00005_nrcalong_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00005_nrcalong/jw01073007001_02103_00005_nrcalong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00005_nrcb1_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00005_nrcb1/jw01073007001_02103_00005_nrcb1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00005_nrcb2_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00005_nrcb2/jw01073007001_02103_00005_nrcb2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00005_nrcb3_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00005_nrcb3/jw01073007001_02103_00005_nrcb3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00005_nrcb4_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00005_nrcb4/jw01073007001_02103_00005_nrcb4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00005_nrcblong_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00005_nrcblong/jw01073007001_02103_00005_nrcblong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00006_nrca1_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00006_nrca1/jw01073007001_02103_00006_nrca1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00006_nrca2_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00006_nrca2/jw01073007001_02103_00006_nrca2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00006_nrca3_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00006_nrca3/jw01073007001_02103_00006_nrca3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00006_nrca4_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00006_nrca4/jw01073007001_02103_00006_nrca4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00006_nrcalong_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00006_nrcalong/jw01073007001_02103_00006_nrcalong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00006_nrcb1_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00006_nrcb1/jw01073007001_02103_00006_nrcb1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00006_nrcb2_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00006_nrcb2/jw01073007001_02103_00006_nrcb2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00006_nrcb3_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00006_nrcb3/jw01073007001_02103_00006_nrcb3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00006_nrcb4_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00006_nrcb4/jw01073007001_02103_00006_nrcb4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00006_nrcblong_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00006_nrcblong/jw01073007001_02103_00006_nrcblong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00007_nrca1_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00007_nrca1/jw01073007001_02103_00007_nrca1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00007_nrca2_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00007_nrca2/jw01073007001_02103_00007_nrca2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00007_nrca3_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00007_nrca3/jw01073007001_02103_00007_nrca3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00007_nrca4_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00007_nrca4/jw01073007001_02103_00007_nrca4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00007_nrcalong_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00007_nrcalong/jw01073007001_02103_00007_nrcalong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00007_nrcb1_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00007_nrcb1/jw01073007001_02103_00007_nrcb1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00007_nrcb2_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00007_nrcb2/jw01073007001_02103_00007_nrcb2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00007_nrcb3_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00007_nrcb3/jw01073007001_02103_00007_nrcb3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00007_nrcb4_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00007_nrcb4/jw01073007001_02103_00007_nrcb4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00007_nrcblong_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00007_nrcblong/jw01073007001_02103_00007_nrcblong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00008_nrca1_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00008_nrca1/jw01073007001_02103_00008_nrca1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00008_nrca2_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00008_nrca2/jw01073007001_02103_00008_nrca2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00008_nrca3_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00008_nrca3/jw01073007001_02103_00008_nrca3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00008_nrca4_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00008_nrca4/jw01073007001_02103_00008_nrca4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00008_nrcalong_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00008_nrcalong/jw01073007001_02103_00008_nrcalong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00008_nrcb1_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00008_nrcb1/jw01073007001_02103_00008_nrcb1_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00008_nrcb2_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00008_nrcb2/jw01073007001_02103_00008_nrcb2_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00008_nrcb3_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00008_nrcb3/jw01073007001_02103_00008_nrcb3_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00008_nrcb4_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00008_nrcb4/jw01073007001_02103_00008_nrcb4_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw01073007001_02103_00008_nrcblong_uncal.fits</td>
                <td>JWST/jw01073007001_02103_00008_nrcblong/jw01073007001_02103_00008_nrcblong_uncal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
        </table>
    </body>
</html>

EOT

# Download Product Files:



cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073003001_02101_00001_nrca1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073003001_02101_00001_nrca1/jw01073003001_02101_00001_nrca1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073003001_02101_00001_nrca1/jw01073003001_02101_00001_nrca1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073003001_02101_00001_nrca1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073003001_02101_00001_nrca2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073003001_02101_00001_nrca2/jw01073003001_02101_00001_nrca2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073003001_02101_00001_nrca2/jw01073003001_02101_00001_nrca2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073003001_02101_00001_nrca2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073003001_02101_00001_nrca3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073003001_02101_00001_nrca3/jw01073003001_02101_00001_nrca3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073003001_02101_00001_nrca3/jw01073003001_02101_00001_nrca3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073003001_02101_00001_nrca3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073003001_02101_00001_nrca4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073003001_02101_00001_nrca4/jw01073003001_02101_00001_nrca4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073003001_02101_00001_nrca4/jw01073003001_02101_00001_nrca4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073003001_02101_00001_nrca4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073003001_02101_00001_nrcalong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073003001_02101_00001_nrcalong/jw01073003001_02101_00001_nrcalong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073003001_02101_00001_nrcalong/jw01073003001_02101_00001_nrcalong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073003001_02101_00001_nrcalong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073003001_02101_00001_nrcb1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073003001_02101_00001_nrcb1/jw01073003001_02101_00001_nrcb1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073003001_02101_00001_nrcb1/jw01073003001_02101_00001_nrcb1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073003001_02101_00001_nrcb1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073003001_02101_00001_nrcb2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073003001_02101_00001_nrcb2/jw01073003001_02101_00001_nrcb2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073003001_02101_00001_nrcb2/jw01073003001_02101_00001_nrcb2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073003001_02101_00001_nrcb2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073003001_02101_00001_nrcb3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073003001_02101_00001_nrcb3/jw01073003001_02101_00001_nrcb3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073003001_02101_00001_nrcb3/jw01073003001_02101_00001_nrcb3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073003001_02101_00001_nrcb3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073003001_02101_00001_nrcb4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073003001_02101_00001_nrcb4/jw01073003001_02101_00001_nrcb4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073003001_02101_00001_nrcb4/jw01073003001_02101_00001_nrcb4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073003001_02101_00001_nrcb4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073003001_02101_00001_nrcblong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073003001_02101_00001_nrcblong/jw01073003001_02101_00001_nrcblong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073003001_02101_00001_nrcblong/jw01073003001_02101_00001_nrcblong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073003001_02101_00001_nrcblong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073003001_02101_00002_nrca1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073003001_02101_00002_nrca1/jw01073003001_02101_00002_nrca1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073003001_02101_00002_nrca1/jw01073003001_02101_00002_nrca1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073003001_02101_00002_nrca1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073003001_02101_00002_nrca2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073003001_02101_00002_nrca2/jw01073003001_02101_00002_nrca2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073003001_02101_00002_nrca2/jw01073003001_02101_00002_nrca2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073003001_02101_00002_nrca2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073003001_02101_00002_nrca3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073003001_02101_00002_nrca3/jw01073003001_02101_00002_nrca3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073003001_02101_00002_nrca3/jw01073003001_02101_00002_nrca3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073003001_02101_00002_nrca3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073003001_02101_00002_nrca4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073003001_02101_00002_nrca4/jw01073003001_02101_00002_nrca4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073003001_02101_00002_nrca4/jw01073003001_02101_00002_nrca4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073003001_02101_00002_nrca4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073003001_02101_00002_nrcalong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073003001_02101_00002_nrcalong/jw01073003001_02101_00002_nrcalong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073003001_02101_00002_nrcalong/jw01073003001_02101_00002_nrcalong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073003001_02101_00002_nrcalong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073003001_02101_00002_nrcb1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073003001_02101_00002_nrcb1/jw01073003001_02101_00002_nrcb1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073003001_02101_00002_nrcb1/jw01073003001_02101_00002_nrcb1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073003001_02101_00002_nrcb1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073003001_02101_00002_nrcb2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073003001_02101_00002_nrcb2/jw01073003001_02101_00002_nrcb2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073003001_02101_00002_nrcb2/jw01073003001_02101_00002_nrcb2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073003001_02101_00002_nrcb2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073003001_02101_00002_nrcb3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073003001_02101_00002_nrcb3/jw01073003001_02101_00002_nrcb3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073003001_02101_00002_nrcb3/jw01073003001_02101_00002_nrcb3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073003001_02101_00002_nrcb3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073003001_02101_00002_nrcb4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073003001_02101_00002_nrcb4/jw01073003001_02101_00002_nrcb4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073003001_02101_00002_nrcb4/jw01073003001_02101_00002_nrcb4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073003001_02101_00002_nrcb4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073003001_02101_00002_nrcblong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073003001_02101_00002_nrcblong/jw01073003001_02101_00002_nrcblong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073003001_02101_00002_nrcblong/jw01073003001_02101_00002_nrcblong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073003001_02101_00002_nrcblong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073003001_02101_00003_nrca1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073003001_02101_00003_nrca1/jw01073003001_02101_00003_nrca1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073003001_02101_00003_nrca1/jw01073003001_02101_00003_nrca1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073003001_02101_00003_nrca1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073003001_02101_00003_nrca2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073003001_02101_00003_nrca2/jw01073003001_02101_00003_nrca2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073003001_02101_00003_nrca2/jw01073003001_02101_00003_nrca2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073003001_02101_00003_nrca2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073003001_02101_00003_nrca3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073003001_02101_00003_nrca3/jw01073003001_02101_00003_nrca3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073003001_02101_00003_nrca3/jw01073003001_02101_00003_nrca3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073003001_02101_00003_nrca3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073003001_02101_00003_nrca4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073003001_02101_00003_nrca4/jw01073003001_02101_00003_nrca4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073003001_02101_00003_nrca4/jw01073003001_02101_00003_nrca4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073003001_02101_00003_nrca4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073003001_02101_00003_nrcalong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073003001_02101_00003_nrcalong/jw01073003001_02101_00003_nrcalong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073003001_02101_00003_nrcalong/jw01073003001_02101_00003_nrcalong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073003001_02101_00003_nrcalong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073003001_02101_00003_nrcb1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073003001_02101_00003_nrcb1/jw01073003001_02101_00003_nrcb1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073003001_02101_00003_nrcb1/jw01073003001_02101_00003_nrcb1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073003001_02101_00003_nrcb1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073003001_02101_00003_nrcb2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073003001_02101_00003_nrcb2/jw01073003001_02101_00003_nrcb2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073003001_02101_00003_nrcb2/jw01073003001_02101_00003_nrcb2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073003001_02101_00003_nrcb2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073003001_02101_00003_nrcb3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073003001_02101_00003_nrcb3/jw01073003001_02101_00003_nrcb3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073003001_02101_00003_nrcb3/jw01073003001_02101_00003_nrcb3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073003001_02101_00003_nrcb3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073003001_02101_00003_nrcb4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073003001_02101_00003_nrcb4/jw01073003001_02101_00003_nrcb4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073003001_02101_00003_nrcb4/jw01073003001_02101_00003_nrcb4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073003001_02101_00003_nrcb4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073003001_02101_00003_nrcblong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073003001_02101_00003_nrcblong/jw01073003001_02101_00003_nrcblong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073003001_02101_00003_nrcblong/jw01073003001_02101_00003_nrcblong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073003001_02101_00003_nrcblong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073003001_02101_00004_nrca1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073003001_02101_00004_nrca1/jw01073003001_02101_00004_nrca1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073003001_02101_00004_nrca1/jw01073003001_02101_00004_nrca1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073003001_02101_00004_nrca1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073003001_02101_00004_nrca2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073003001_02101_00004_nrca2/jw01073003001_02101_00004_nrca2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073003001_02101_00004_nrca2/jw01073003001_02101_00004_nrca2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073003001_02101_00004_nrca2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073003001_02101_00004_nrca3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073003001_02101_00004_nrca3/jw01073003001_02101_00004_nrca3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073003001_02101_00004_nrca3/jw01073003001_02101_00004_nrca3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073003001_02101_00004_nrca3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073003001_02101_00004_nrca4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073003001_02101_00004_nrca4/jw01073003001_02101_00004_nrca4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073003001_02101_00004_nrca4/jw01073003001_02101_00004_nrca4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073003001_02101_00004_nrca4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073003001_02101_00004_nrcalong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073003001_02101_00004_nrcalong/jw01073003001_02101_00004_nrcalong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073003001_02101_00004_nrcalong/jw01073003001_02101_00004_nrcalong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073003001_02101_00004_nrcalong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073003001_02101_00004_nrcb1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073003001_02101_00004_nrcb1/jw01073003001_02101_00004_nrcb1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073003001_02101_00004_nrcb1/jw01073003001_02101_00004_nrcb1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073003001_02101_00004_nrcb1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073003001_02101_00004_nrcb2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073003001_02101_00004_nrcb2/jw01073003001_02101_00004_nrcb2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073003001_02101_00004_nrcb2/jw01073003001_02101_00004_nrcb2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073003001_02101_00004_nrcb2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073003001_02101_00004_nrcb3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073003001_02101_00004_nrcb3/jw01073003001_02101_00004_nrcb3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073003001_02101_00004_nrcb3/jw01073003001_02101_00004_nrcb3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073003001_02101_00004_nrcb3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073003001_02101_00004_nrcb4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073003001_02101_00004_nrcb4/jw01073003001_02101_00004_nrcb4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073003001_02101_00004_nrcb4/jw01073003001_02101_00004_nrcb4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073003001_02101_00004_nrcb4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073003001_02101_00004_nrcblong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073003001_02101_00004_nrcblong/jw01073003001_02101_00004_nrcblong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073003001_02101_00004_nrcblong/jw01073003001_02101_00004_nrcblong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073003001_02101_00004_nrcblong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073004001_02101_00001_nrca1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073004001_02101_00001_nrca1/jw01073004001_02101_00001_nrca1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073004001_02101_00001_nrca1/jw01073004001_02101_00001_nrca1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073004001_02101_00001_nrca1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073004001_02101_00001_nrca2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073004001_02101_00001_nrca2/jw01073004001_02101_00001_nrca2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073004001_02101_00001_nrca2/jw01073004001_02101_00001_nrca2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073004001_02101_00001_nrca2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073004001_02101_00001_nrca3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073004001_02101_00001_nrca3/jw01073004001_02101_00001_nrca3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073004001_02101_00001_nrca3/jw01073004001_02101_00001_nrca3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073004001_02101_00001_nrca3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073004001_02101_00001_nrca4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073004001_02101_00001_nrca4/jw01073004001_02101_00001_nrca4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073004001_02101_00001_nrca4/jw01073004001_02101_00001_nrca4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073004001_02101_00001_nrca4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073004001_02101_00001_nrcalong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073004001_02101_00001_nrcalong/jw01073004001_02101_00001_nrcalong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073004001_02101_00001_nrcalong/jw01073004001_02101_00001_nrcalong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073004001_02101_00001_nrcalong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073004001_02101_00001_nrcb1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073004001_02101_00001_nrcb1/jw01073004001_02101_00001_nrcb1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073004001_02101_00001_nrcb1/jw01073004001_02101_00001_nrcb1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073004001_02101_00001_nrcb1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073004001_02101_00001_nrcb2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073004001_02101_00001_nrcb2/jw01073004001_02101_00001_nrcb2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073004001_02101_00001_nrcb2/jw01073004001_02101_00001_nrcb2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073004001_02101_00001_nrcb2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073004001_02101_00001_nrcb3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073004001_02101_00001_nrcb3/jw01073004001_02101_00001_nrcb3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073004001_02101_00001_nrcb3/jw01073004001_02101_00001_nrcb3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073004001_02101_00001_nrcb3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073004001_02101_00001_nrcb4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073004001_02101_00001_nrcb4/jw01073004001_02101_00001_nrcb4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073004001_02101_00001_nrcb4/jw01073004001_02101_00001_nrcb4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073004001_02101_00001_nrcb4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073004001_02101_00001_nrcblong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073004001_02101_00001_nrcblong/jw01073004001_02101_00001_nrcblong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073004001_02101_00001_nrcblong/jw01073004001_02101_00001_nrcblong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073004001_02101_00001_nrcblong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073004001_02101_00002_nrca1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073004001_02101_00002_nrca1/jw01073004001_02101_00002_nrca1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073004001_02101_00002_nrca1/jw01073004001_02101_00002_nrca1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073004001_02101_00002_nrca1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073004001_02101_00002_nrca2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073004001_02101_00002_nrca2/jw01073004001_02101_00002_nrca2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073004001_02101_00002_nrca2/jw01073004001_02101_00002_nrca2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073004001_02101_00002_nrca2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073004001_02101_00002_nrca3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073004001_02101_00002_nrca3/jw01073004001_02101_00002_nrca3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073004001_02101_00002_nrca3/jw01073004001_02101_00002_nrca3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073004001_02101_00002_nrca3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073004001_02101_00002_nrca4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073004001_02101_00002_nrca4/jw01073004001_02101_00002_nrca4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073004001_02101_00002_nrca4/jw01073004001_02101_00002_nrca4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073004001_02101_00002_nrca4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073004001_02101_00002_nrcalong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073004001_02101_00002_nrcalong/jw01073004001_02101_00002_nrcalong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073004001_02101_00002_nrcalong/jw01073004001_02101_00002_nrcalong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073004001_02101_00002_nrcalong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073004001_02101_00002_nrcb1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073004001_02101_00002_nrcb1/jw01073004001_02101_00002_nrcb1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073004001_02101_00002_nrcb1/jw01073004001_02101_00002_nrcb1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073004001_02101_00002_nrcb1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073004001_02101_00002_nrcb2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073004001_02101_00002_nrcb2/jw01073004001_02101_00002_nrcb2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073004001_02101_00002_nrcb2/jw01073004001_02101_00002_nrcb2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073004001_02101_00002_nrcb2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073004001_02101_00002_nrcb3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073004001_02101_00002_nrcb3/jw01073004001_02101_00002_nrcb3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073004001_02101_00002_nrcb3/jw01073004001_02101_00002_nrcb3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073004001_02101_00002_nrcb3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073004001_02101_00002_nrcb4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073004001_02101_00002_nrcb4/jw01073004001_02101_00002_nrcb4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073004001_02101_00002_nrcb4/jw01073004001_02101_00002_nrcb4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073004001_02101_00002_nrcb4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073004001_02101_00002_nrcblong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073004001_02101_00002_nrcblong/jw01073004001_02101_00002_nrcblong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073004001_02101_00002_nrcblong/jw01073004001_02101_00002_nrcblong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073004001_02101_00002_nrcblong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073005001_02101_00001_nrca1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073005001_02101_00001_nrca1/jw01073005001_02101_00001_nrca1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073005001_02101_00001_nrca1/jw01073005001_02101_00001_nrca1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073005001_02101_00001_nrca1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073005001_02101_00001_nrca2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073005001_02101_00001_nrca2/jw01073005001_02101_00001_nrca2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073005001_02101_00001_nrca2/jw01073005001_02101_00001_nrca2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073005001_02101_00001_nrca2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073005001_02101_00001_nrca3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073005001_02101_00001_nrca3/jw01073005001_02101_00001_nrca3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073005001_02101_00001_nrca3/jw01073005001_02101_00001_nrca3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073005001_02101_00001_nrca3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073005001_02101_00001_nrca4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073005001_02101_00001_nrca4/jw01073005001_02101_00001_nrca4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073005001_02101_00001_nrca4/jw01073005001_02101_00001_nrca4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073005001_02101_00001_nrca4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073005001_02101_00001_nrcalong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073005001_02101_00001_nrcalong/jw01073005001_02101_00001_nrcalong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073005001_02101_00001_nrcalong/jw01073005001_02101_00001_nrcalong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073005001_02101_00001_nrcalong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073005001_02101_00001_nrcb1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073005001_02101_00001_nrcb1/jw01073005001_02101_00001_nrcb1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073005001_02101_00001_nrcb1/jw01073005001_02101_00001_nrcb1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073005001_02101_00001_nrcb1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073005001_02101_00001_nrcb2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073005001_02101_00001_nrcb2/jw01073005001_02101_00001_nrcb2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073005001_02101_00001_nrcb2/jw01073005001_02101_00001_nrcb2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073005001_02101_00001_nrcb2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073005001_02101_00001_nrcb3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073005001_02101_00001_nrcb3/jw01073005001_02101_00001_nrcb3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073005001_02101_00001_nrcb3/jw01073005001_02101_00001_nrcb3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073005001_02101_00001_nrcb3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073005001_02101_00001_nrcb4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073005001_02101_00001_nrcb4/jw01073005001_02101_00001_nrcb4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073005001_02101_00001_nrcb4/jw01073005001_02101_00001_nrcb4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073005001_02101_00001_nrcb4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073005001_02101_00001_nrcblong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073005001_02101_00001_nrcblong/jw01073005001_02101_00001_nrcblong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073005001_02101_00001_nrcblong/jw01073005001_02101_00001_nrcblong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073005001_02101_00001_nrcblong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073005001_02101_00002_nrca1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073005001_02101_00002_nrca1/jw01073005001_02101_00002_nrca1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073005001_02101_00002_nrca1/jw01073005001_02101_00002_nrca1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073005001_02101_00002_nrca1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073005001_02101_00002_nrca2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073005001_02101_00002_nrca2/jw01073005001_02101_00002_nrca2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073005001_02101_00002_nrca2/jw01073005001_02101_00002_nrca2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073005001_02101_00002_nrca2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073005001_02101_00002_nrca3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073005001_02101_00002_nrca3/jw01073005001_02101_00002_nrca3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073005001_02101_00002_nrca3/jw01073005001_02101_00002_nrca3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073005001_02101_00002_nrca3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073005001_02101_00002_nrca4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073005001_02101_00002_nrca4/jw01073005001_02101_00002_nrca4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073005001_02101_00002_nrca4/jw01073005001_02101_00002_nrca4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073005001_02101_00002_nrca4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073005001_02101_00002_nrcalong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073005001_02101_00002_nrcalong/jw01073005001_02101_00002_nrcalong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073005001_02101_00002_nrcalong/jw01073005001_02101_00002_nrcalong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073005001_02101_00002_nrcalong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073005001_02101_00002_nrcb1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073005001_02101_00002_nrcb1/jw01073005001_02101_00002_nrcb1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073005001_02101_00002_nrcb1/jw01073005001_02101_00002_nrcb1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073005001_02101_00002_nrcb1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073005001_02101_00002_nrcb2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073005001_02101_00002_nrcb2/jw01073005001_02101_00002_nrcb2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073005001_02101_00002_nrcb2/jw01073005001_02101_00002_nrcb2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073005001_02101_00002_nrcb2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073005001_02101_00002_nrcb3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073005001_02101_00002_nrcb3/jw01073005001_02101_00002_nrcb3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073005001_02101_00002_nrcb3/jw01073005001_02101_00002_nrcb3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073005001_02101_00002_nrcb3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073005001_02101_00002_nrcb4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073005001_02101_00002_nrcb4/jw01073005001_02101_00002_nrcb4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073005001_02101_00002_nrcb4/jw01073005001_02101_00002_nrcb4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073005001_02101_00002_nrcb4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073005001_02101_00002_nrcblong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073005001_02101_00002_nrcblong/jw01073005001_02101_00002_nrcblong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073005001_02101_00002_nrcblong/jw01073005001_02101_00002_nrcblong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073005001_02101_00002_nrcblong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073005001_02101_00003_nrca1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073005001_02101_00003_nrca1/jw01073005001_02101_00003_nrca1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073005001_02101_00003_nrca1/jw01073005001_02101_00003_nrca1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073005001_02101_00003_nrca1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073005001_02101_00003_nrca2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073005001_02101_00003_nrca2/jw01073005001_02101_00003_nrca2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073005001_02101_00003_nrca2/jw01073005001_02101_00003_nrca2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073005001_02101_00003_nrca2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073005001_02101_00003_nrca3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073005001_02101_00003_nrca3/jw01073005001_02101_00003_nrca3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073005001_02101_00003_nrca3/jw01073005001_02101_00003_nrca3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073005001_02101_00003_nrca3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073005001_02101_00003_nrca4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073005001_02101_00003_nrca4/jw01073005001_02101_00003_nrca4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073005001_02101_00003_nrca4/jw01073005001_02101_00003_nrca4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073005001_02101_00003_nrca4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073005001_02101_00003_nrcalong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073005001_02101_00003_nrcalong/jw01073005001_02101_00003_nrcalong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073005001_02101_00003_nrcalong/jw01073005001_02101_00003_nrcalong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073005001_02101_00003_nrcalong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073005001_02101_00003_nrcb1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073005001_02101_00003_nrcb1/jw01073005001_02101_00003_nrcb1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073005001_02101_00003_nrcb1/jw01073005001_02101_00003_nrcb1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073005001_02101_00003_nrcb1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073005001_02101_00003_nrcb2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073005001_02101_00003_nrcb2/jw01073005001_02101_00003_nrcb2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073005001_02101_00003_nrcb2/jw01073005001_02101_00003_nrcb2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073005001_02101_00003_nrcb2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073005001_02101_00003_nrcb3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073005001_02101_00003_nrcb3/jw01073005001_02101_00003_nrcb3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073005001_02101_00003_nrcb3/jw01073005001_02101_00003_nrcb3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073005001_02101_00003_nrcb3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073005001_02101_00003_nrcb4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073005001_02101_00003_nrcb4/jw01073005001_02101_00003_nrcb4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073005001_02101_00003_nrcb4/jw01073005001_02101_00003_nrcb4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073005001_02101_00003_nrcb4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073005001_02101_00003_nrcblong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073005001_02101_00003_nrcblong/jw01073005001_02101_00003_nrcblong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073005001_02101_00003_nrcblong/jw01073005001_02101_00003_nrcblong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073005001_02101_00003_nrcblong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073005001_02101_00004_nrca1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073005001_02101_00004_nrca1/jw01073005001_02101_00004_nrca1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073005001_02101_00004_nrca1/jw01073005001_02101_00004_nrca1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073005001_02101_00004_nrca1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073005001_02101_00004_nrca2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073005001_02101_00004_nrca2/jw01073005001_02101_00004_nrca2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073005001_02101_00004_nrca2/jw01073005001_02101_00004_nrca2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073005001_02101_00004_nrca2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073005001_02101_00004_nrca3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073005001_02101_00004_nrca3/jw01073005001_02101_00004_nrca3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073005001_02101_00004_nrca3/jw01073005001_02101_00004_nrca3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073005001_02101_00004_nrca3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073005001_02101_00004_nrca4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073005001_02101_00004_nrca4/jw01073005001_02101_00004_nrca4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073005001_02101_00004_nrca4/jw01073005001_02101_00004_nrca4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073005001_02101_00004_nrca4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073005001_02101_00004_nrcalong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073005001_02101_00004_nrcalong/jw01073005001_02101_00004_nrcalong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073005001_02101_00004_nrcalong/jw01073005001_02101_00004_nrcalong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073005001_02101_00004_nrcalong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073005001_02101_00004_nrcb1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073005001_02101_00004_nrcb1/jw01073005001_02101_00004_nrcb1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073005001_02101_00004_nrcb1/jw01073005001_02101_00004_nrcb1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073005001_02101_00004_nrcb1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073005001_02101_00004_nrcb2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073005001_02101_00004_nrcb2/jw01073005001_02101_00004_nrcb2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073005001_02101_00004_nrcb2/jw01073005001_02101_00004_nrcb2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073005001_02101_00004_nrcb2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073005001_02101_00004_nrcb3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073005001_02101_00004_nrcb3/jw01073005001_02101_00004_nrcb3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073005001_02101_00004_nrcb3/jw01073005001_02101_00004_nrcb3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073005001_02101_00004_nrcb3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073005001_02101_00004_nrcb4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073005001_02101_00004_nrcb4/jw01073005001_02101_00004_nrcb4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073005001_02101_00004_nrcb4/jw01073005001_02101_00004_nrcb4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073005001_02101_00004_nrcb4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073005001_02101_00004_nrcblong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073005001_02101_00004_nrcblong/jw01073005001_02101_00004_nrcblong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073005001_02101_00004_nrcblong/jw01073005001_02101_00004_nrcblong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073005001_02101_00004_nrcblong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001001_02101_00001_nrca1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001001_02101_00001_nrca1/jw01073001001_02101_00001_nrca1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001001_02101_00001_nrca1/jw01073001001_02101_00001_nrca1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001001_02101_00001_nrca1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001001_02101_00001_nrca2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001001_02101_00001_nrca2/jw01073001001_02101_00001_nrca2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001001_02101_00001_nrca2/jw01073001001_02101_00001_nrca2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001001_02101_00001_nrca2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001001_02101_00001_nrca3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001001_02101_00001_nrca3/jw01073001001_02101_00001_nrca3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001001_02101_00001_nrca3/jw01073001001_02101_00001_nrca3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001001_02101_00001_nrca3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001001_02101_00001_nrca4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001001_02101_00001_nrca4/jw01073001001_02101_00001_nrca4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001001_02101_00001_nrca4/jw01073001001_02101_00001_nrca4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001001_02101_00001_nrca4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001001_02101_00001_nrcalong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001001_02101_00001_nrcalong/jw01073001001_02101_00001_nrcalong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001001_02101_00001_nrcalong/jw01073001001_02101_00001_nrcalong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001001_02101_00001_nrcalong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001001_02101_00001_nrcb1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001001_02101_00001_nrcb1/jw01073001001_02101_00001_nrcb1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001001_02101_00001_nrcb1/jw01073001001_02101_00001_nrcb1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001001_02101_00001_nrcb1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001001_02101_00001_nrcb2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001001_02101_00001_nrcb2/jw01073001001_02101_00001_nrcb2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001001_02101_00001_nrcb2/jw01073001001_02101_00001_nrcb2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001001_02101_00001_nrcb2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001001_02101_00001_nrcb3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001001_02101_00001_nrcb3/jw01073001001_02101_00001_nrcb3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001001_02101_00001_nrcb3/jw01073001001_02101_00001_nrcb3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001001_02101_00001_nrcb3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001001_02101_00001_nrcb4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001001_02101_00001_nrcb4/jw01073001001_02101_00001_nrcb4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001001_02101_00001_nrcb4/jw01073001001_02101_00001_nrcb4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001001_02101_00001_nrcb4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001001_02101_00001_nrcblong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001001_02101_00001_nrcblong/jw01073001001_02101_00001_nrcblong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001001_02101_00001_nrcblong/jw01073001001_02101_00001_nrcblong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001001_02101_00001_nrcblong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001001_02101_00002_nrca1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001001_02101_00002_nrca1/jw01073001001_02101_00002_nrca1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001001_02101_00002_nrca1/jw01073001001_02101_00002_nrca1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001001_02101_00002_nrca1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001001_02101_00002_nrca2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001001_02101_00002_nrca2/jw01073001001_02101_00002_nrca2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001001_02101_00002_nrca2/jw01073001001_02101_00002_nrca2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001001_02101_00002_nrca2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001001_02101_00002_nrca3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001001_02101_00002_nrca3/jw01073001001_02101_00002_nrca3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001001_02101_00002_nrca3/jw01073001001_02101_00002_nrca3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001001_02101_00002_nrca3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001001_02101_00002_nrca4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001001_02101_00002_nrca4/jw01073001001_02101_00002_nrca4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001001_02101_00002_nrca4/jw01073001001_02101_00002_nrca4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001001_02101_00002_nrca4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001001_02101_00002_nrcalong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001001_02101_00002_nrcalong/jw01073001001_02101_00002_nrcalong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001001_02101_00002_nrcalong/jw01073001001_02101_00002_nrcalong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001001_02101_00002_nrcalong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001001_02101_00002_nrcb1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001001_02101_00002_nrcb1/jw01073001001_02101_00002_nrcb1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001001_02101_00002_nrcb1/jw01073001001_02101_00002_nrcb1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001001_02101_00002_nrcb1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001001_02101_00002_nrcb2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001001_02101_00002_nrcb2/jw01073001001_02101_00002_nrcb2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001001_02101_00002_nrcb2/jw01073001001_02101_00002_nrcb2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001001_02101_00002_nrcb2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001001_02101_00002_nrcb3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001001_02101_00002_nrcb3/jw01073001001_02101_00002_nrcb3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001001_02101_00002_nrcb3/jw01073001001_02101_00002_nrcb3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001001_02101_00002_nrcb3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001001_02101_00002_nrcb4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001001_02101_00002_nrcb4/jw01073001001_02101_00002_nrcb4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001001_02101_00002_nrcb4/jw01073001001_02101_00002_nrcb4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001001_02101_00002_nrcb4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001001_02101_00002_nrcblong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001001_02101_00002_nrcblong/jw01073001001_02101_00002_nrcblong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001001_02101_00002_nrcblong/jw01073001001_02101_00002_nrcblong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001001_02101_00002_nrcblong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001002_02101_00001_nrca1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001002_02101_00001_nrca1/jw01073001002_02101_00001_nrca1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001002_02101_00001_nrca1/jw01073001002_02101_00001_nrca1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001002_02101_00001_nrca1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001002_02101_00001_nrca2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001002_02101_00001_nrca2/jw01073001002_02101_00001_nrca2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001002_02101_00001_nrca2/jw01073001002_02101_00001_nrca2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001002_02101_00001_nrca2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001002_02101_00001_nrca3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001002_02101_00001_nrca3/jw01073001002_02101_00001_nrca3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001002_02101_00001_nrca3/jw01073001002_02101_00001_nrca3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001002_02101_00001_nrca3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001002_02101_00001_nrca4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001002_02101_00001_nrca4/jw01073001002_02101_00001_nrca4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001002_02101_00001_nrca4/jw01073001002_02101_00001_nrca4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001002_02101_00001_nrca4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001002_02101_00001_nrcalong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001002_02101_00001_nrcalong/jw01073001002_02101_00001_nrcalong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001002_02101_00001_nrcalong/jw01073001002_02101_00001_nrcalong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001002_02101_00001_nrcalong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001002_02101_00001_nrcb1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001002_02101_00001_nrcb1/jw01073001002_02101_00001_nrcb1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001002_02101_00001_nrcb1/jw01073001002_02101_00001_nrcb1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001002_02101_00001_nrcb1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001002_02101_00001_nrcb2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001002_02101_00001_nrcb2/jw01073001002_02101_00001_nrcb2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001002_02101_00001_nrcb2/jw01073001002_02101_00001_nrcb2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001002_02101_00001_nrcb2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001002_02101_00001_nrcb3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001002_02101_00001_nrcb3/jw01073001002_02101_00001_nrcb3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001002_02101_00001_nrcb3/jw01073001002_02101_00001_nrcb3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001002_02101_00001_nrcb3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001002_02101_00001_nrcb4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001002_02101_00001_nrcb4/jw01073001002_02101_00001_nrcb4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001002_02101_00001_nrcb4/jw01073001002_02101_00001_nrcb4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001002_02101_00001_nrcb4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001002_02101_00001_nrcblong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001002_02101_00001_nrcblong/jw01073001002_02101_00001_nrcblong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001002_02101_00001_nrcblong/jw01073001002_02101_00001_nrcblong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001002_02101_00001_nrcblong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001002_02101_00002_nrca1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001002_02101_00002_nrca1/jw01073001002_02101_00002_nrca1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001002_02101_00002_nrca1/jw01073001002_02101_00002_nrca1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001002_02101_00002_nrca1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001002_02101_00002_nrca2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001002_02101_00002_nrca2/jw01073001002_02101_00002_nrca2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001002_02101_00002_nrca2/jw01073001002_02101_00002_nrca2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001002_02101_00002_nrca2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001002_02101_00002_nrca3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001002_02101_00002_nrca3/jw01073001002_02101_00002_nrca3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001002_02101_00002_nrca3/jw01073001002_02101_00002_nrca3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001002_02101_00002_nrca3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001002_02101_00002_nrca4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001002_02101_00002_nrca4/jw01073001002_02101_00002_nrca4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001002_02101_00002_nrca4/jw01073001002_02101_00002_nrca4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001002_02101_00002_nrca4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001002_02101_00002_nrcalong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001002_02101_00002_nrcalong/jw01073001002_02101_00002_nrcalong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001002_02101_00002_nrcalong/jw01073001002_02101_00002_nrcalong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001002_02101_00002_nrcalong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001002_02101_00002_nrcb1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001002_02101_00002_nrcb1/jw01073001002_02101_00002_nrcb1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001002_02101_00002_nrcb1/jw01073001002_02101_00002_nrcb1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001002_02101_00002_nrcb1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001002_02101_00002_nrcb2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001002_02101_00002_nrcb2/jw01073001002_02101_00002_nrcb2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001002_02101_00002_nrcb2/jw01073001002_02101_00002_nrcb2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001002_02101_00002_nrcb2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001002_02101_00002_nrcb3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001002_02101_00002_nrcb3/jw01073001002_02101_00002_nrcb3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001002_02101_00002_nrcb3/jw01073001002_02101_00002_nrcb3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001002_02101_00002_nrcb3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001002_02101_00002_nrcb4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001002_02101_00002_nrcb4/jw01073001002_02101_00002_nrcb4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001002_02101_00002_nrcb4/jw01073001002_02101_00002_nrcb4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001002_02101_00002_nrcb4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001002_02101_00002_nrcblong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001002_02101_00002_nrcblong/jw01073001002_02101_00002_nrcblong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001002_02101_00002_nrcblong/jw01073001002_02101_00002_nrcblong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001002_02101_00002_nrcblong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001003_02101_00001_nrca1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001003_02101_00001_nrca1/jw01073001003_02101_00001_nrca1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001003_02101_00001_nrca1/jw01073001003_02101_00001_nrca1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001003_02101_00001_nrca1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001003_02101_00001_nrca2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001003_02101_00001_nrca2/jw01073001003_02101_00001_nrca2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001003_02101_00001_nrca2/jw01073001003_02101_00001_nrca2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001003_02101_00001_nrca2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001003_02101_00001_nrca3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001003_02101_00001_nrca3/jw01073001003_02101_00001_nrca3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001003_02101_00001_nrca3/jw01073001003_02101_00001_nrca3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001003_02101_00001_nrca3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001003_02101_00001_nrca4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001003_02101_00001_nrca4/jw01073001003_02101_00001_nrca4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001003_02101_00001_nrca4/jw01073001003_02101_00001_nrca4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001003_02101_00001_nrca4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001003_02101_00001_nrcalong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001003_02101_00001_nrcalong/jw01073001003_02101_00001_nrcalong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001003_02101_00001_nrcalong/jw01073001003_02101_00001_nrcalong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001003_02101_00001_nrcalong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001003_02101_00001_nrcb1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001003_02101_00001_nrcb1/jw01073001003_02101_00001_nrcb1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001003_02101_00001_nrcb1/jw01073001003_02101_00001_nrcb1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001003_02101_00001_nrcb1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001003_02101_00001_nrcb2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001003_02101_00001_nrcb2/jw01073001003_02101_00001_nrcb2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001003_02101_00001_nrcb2/jw01073001003_02101_00001_nrcb2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001003_02101_00001_nrcb2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001003_02101_00001_nrcb3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001003_02101_00001_nrcb3/jw01073001003_02101_00001_nrcb3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001003_02101_00001_nrcb3/jw01073001003_02101_00001_nrcb3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001003_02101_00001_nrcb3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001003_02101_00001_nrcb4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001003_02101_00001_nrcb4/jw01073001003_02101_00001_nrcb4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001003_02101_00001_nrcb4/jw01073001003_02101_00001_nrcb4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001003_02101_00001_nrcb4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001003_02101_00001_nrcblong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001003_02101_00001_nrcblong/jw01073001003_02101_00001_nrcblong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001003_02101_00001_nrcblong/jw01073001003_02101_00001_nrcblong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001003_02101_00001_nrcblong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001003_02101_00002_nrca1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001003_02101_00002_nrca1/jw01073001003_02101_00002_nrca1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001003_02101_00002_nrca1/jw01073001003_02101_00002_nrca1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001003_02101_00002_nrca1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001003_02101_00002_nrca2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001003_02101_00002_nrca2/jw01073001003_02101_00002_nrca2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001003_02101_00002_nrca2/jw01073001003_02101_00002_nrca2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001003_02101_00002_nrca2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001003_02101_00002_nrca3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001003_02101_00002_nrca3/jw01073001003_02101_00002_nrca3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001003_02101_00002_nrca3/jw01073001003_02101_00002_nrca3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001003_02101_00002_nrca3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001003_02101_00002_nrca4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001003_02101_00002_nrca4/jw01073001003_02101_00002_nrca4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001003_02101_00002_nrca4/jw01073001003_02101_00002_nrca4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001003_02101_00002_nrca4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001003_02101_00002_nrcalong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001003_02101_00002_nrcalong/jw01073001003_02101_00002_nrcalong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001003_02101_00002_nrcalong/jw01073001003_02101_00002_nrcalong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001003_02101_00002_nrcalong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001003_02101_00002_nrcb1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001003_02101_00002_nrcb1/jw01073001003_02101_00002_nrcb1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001003_02101_00002_nrcb1/jw01073001003_02101_00002_nrcb1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001003_02101_00002_nrcb1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001003_02101_00002_nrcb2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001003_02101_00002_nrcb2/jw01073001003_02101_00002_nrcb2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001003_02101_00002_nrcb2/jw01073001003_02101_00002_nrcb2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001003_02101_00002_nrcb2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001003_02101_00002_nrcb3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001003_02101_00002_nrcb3/jw01073001003_02101_00002_nrcb3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001003_02101_00002_nrcb3/jw01073001003_02101_00002_nrcb3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001003_02101_00002_nrcb3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001003_02101_00002_nrcb4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001003_02101_00002_nrcb4/jw01073001003_02101_00002_nrcb4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001003_02101_00002_nrcb4/jw01073001003_02101_00002_nrcb4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001003_02101_00002_nrcb4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073001003_02101_00002_nrcblong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073001003_02101_00002_nrcblong/jw01073001003_02101_00002_nrcblong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073001003_02101_00002_nrcblong/jw01073001003_02101_00002_nrcblong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073001003_02101_00002_nrcblong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073002001_02101_00001_nrca1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073002001_02101_00001_nrca1/jw01073002001_02101_00001_nrca1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073002001_02101_00001_nrca1/jw01073002001_02101_00001_nrca1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073002001_02101_00001_nrca1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073002001_02101_00001_nrca2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073002001_02101_00001_nrca2/jw01073002001_02101_00001_nrca2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073002001_02101_00001_nrca2/jw01073002001_02101_00001_nrca2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073002001_02101_00001_nrca2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073002001_02101_00001_nrca3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073002001_02101_00001_nrca3/jw01073002001_02101_00001_nrca3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073002001_02101_00001_nrca3/jw01073002001_02101_00001_nrca3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073002001_02101_00001_nrca3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073002001_02101_00001_nrca4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073002001_02101_00001_nrca4/jw01073002001_02101_00001_nrca4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073002001_02101_00001_nrca4/jw01073002001_02101_00001_nrca4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073002001_02101_00001_nrca4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073002001_02101_00001_nrcalong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073002001_02101_00001_nrcalong/jw01073002001_02101_00001_nrcalong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073002001_02101_00001_nrcalong/jw01073002001_02101_00001_nrcalong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073002001_02101_00001_nrcalong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073002001_02101_00001_nrcb1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073002001_02101_00001_nrcb1/jw01073002001_02101_00001_nrcb1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073002001_02101_00001_nrcb1/jw01073002001_02101_00001_nrcb1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073002001_02101_00001_nrcb1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073002001_02101_00001_nrcb2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073002001_02101_00001_nrcb2/jw01073002001_02101_00001_nrcb2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073002001_02101_00001_nrcb2/jw01073002001_02101_00001_nrcb2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073002001_02101_00001_nrcb2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073002001_02101_00001_nrcb3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073002001_02101_00001_nrcb3/jw01073002001_02101_00001_nrcb3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073002001_02101_00001_nrcb3/jw01073002001_02101_00001_nrcb3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073002001_02101_00001_nrcb3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073002001_02101_00001_nrcb4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073002001_02101_00001_nrcb4/jw01073002001_02101_00001_nrcb4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073002001_02101_00001_nrcb4/jw01073002001_02101_00001_nrcb4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073002001_02101_00001_nrcb4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073002001_02101_00001_nrcblong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073002001_02101_00001_nrcblong/jw01073002001_02101_00001_nrcblong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073002001_02101_00001_nrcblong/jw01073002001_02101_00001_nrcblong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073002001_02101_00001_nrcblong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073002001_02101_00002_nrca1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073002001_02101_00002_nrca1/jw01073002001_02101_00002_nrca1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073002001_02101_00002_nrca1/jw01073002001_02101_00002_nrca1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073002001_02101_00002_nrca1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073002001_02101_00002_nrca2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073002001_02101_00002_nrca2/jw01073002001_02101_00002_nrca2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073002001_02101_00002_nrca2/jw01073002001_02101_00002_nrca2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073002001_02101_00002_nrca2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073002001_02101_00002_nrca3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073002001_02101_00002_nrca3/jw01073002001_02101_00002_nrca3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073002001_02101_00002_nrca3/jw01073002001_02101_00002_nrca3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073002001_02101_00002_nrca3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073002001_02101_00002_nrca4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073002001_02101_00002_nrca4/jw01073002001_02101_00002_nrca4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073002001_02101_00002_nrca4/jw01073002001_02101_00002_nrca4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073002001_02101_00002_nrca4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073002001_02101_00002_nrcalong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073002001_02101_00002_nrcalong/jw01073002001_02101_00002_nrcalong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073002001_02101_00002_nrcalong/jw01073002001_02101_00002_nrcalong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073002001_02101_00002_nrcalong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073002001_02101_00002_nrcb1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073002001_02101_00002_nrcb1/jw01073002001_02101_00002_nrcb1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073002001_02101_00002_nrcb1/jw01073002001_02101_00002_nrcb1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073002001_02101_00002_nrcb1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073002001_02101_00002_nrcb2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073002001_02101_00002_nrcb2/jw01073002001_02101_00002_nrcb2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073002001_02101_00002_nrcb2/jw01073002001_02101_00002_nrcb2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073002001_02101_00002_nrcb2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073002001_02101_00002_nrcb3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073002001_02101_00002_nrcb3/jw01073002001_02101_00002_nrcb3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073002001_02101_00002_nrcb3/jw01073002001_02101_00002_nrcb3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073002001_02101_00002_nrcb3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073002001_02101_00002_nrcb4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073002001_02101_00002_nrcb4/jw01073002001_02101_00002_nrcb4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073002001_02101_00002_nrcb4/jw01073002001_02101_00002_nrcb4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073002001_02101_00002_nrcb4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073002001_02101_00002_nrcblong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073002001_02101_00002_nrcblong/jw01073002001_02101_00002_nrcblong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073002001_02101_00002_nrcblong/jw01073002001_02101_00002_nrcblong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073002001_02101_00002_nrcblong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073002001_02101_00003_nrca1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073002001_02101_00003_nrca1/jw01073002001_02101_00003_nrca1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073002001_02101_00003_nrca1/jw01073002001_02101_00003_nrca1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073002001_02101_00003_nrca1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073002001_02101_00003_nrca2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073002001_02101_00003_nrca2/jw01073002001_02101_00003_nrca2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073002001_02101_00003_nrca2/jw01073002001_02101_00003_nrca2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073002001_02101_00003_nrca2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073002001_02101_00003_nrca3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073002001_02101_00003_nrca3/jw01073002001_02101_00003_nrca3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073002001_02101_00003_nrca3/jw01073002001_02101_00003_nrca3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073002001_02101_00003_nrca3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073002001_02101_00003_nrca4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073002001_02101_00003_nrca4/jw01073002001_02101_00003_nrca4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073002001_02101_00003_nrca4/jw01073002001_02101_00003_nrca4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073002001_02101_00003_nrca4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073002001_02101_00003_nrcalong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073002001_02101_00003_nrcalong/jw01073002001_02101_00003_nrcalong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073002001_02101_00003_nrcalong/jw01073002001_02101_00003_nrcalong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073002001_02101_00003_nrcalong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073002001_02101_00003_nrcb1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073002001_02101_00003_nrcb1/jw01073002001_02101_00003_nrcb1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073002001_02101_00003_nrcb1/jw01073002001_02101_00003_nrcb1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073002001_02101_00003_nrcb1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073002001_02101_00003_nrcb2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073002001_02101_00003_nrcb2/jw01073002001_02101_00003_nrcb2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073002001_02101_00003_nrcb2/jw01073002001_02101_00003_nrcb2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073002001_02101_00003_nrcb2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073002001_02101_00003_nrcb3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073002001_02101_00003_nrcb3/jw01073002001_02101_00003_nrcb3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073002001_02101_00003_nrcb3/jw01073002001_02101_00003_nrcb3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073002001_02101_00003_nrcb3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073002001_02101_00003_nrcb4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073002001_02101_00003_nrcb4/jw01073002001_02101_00003_nrcb4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073002001_02101_00003_nrcb4/jw01073002001_02101_00003_nrcb4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073002001_02101_00003_nrcb4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073002001_02101_00003_nrcblong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073002001_02101_00003_nrcblong/jw01073002001_02101_00003_nrcblong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073002001_02101_00003_nrcblong/jw01073002001_02101_00003_nrcblong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073002001_02101_00003_nrcblong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073002001_02101_00004_nrca1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073002001_02101_00004_nrca1/jw01073002001_02101_00004_nrca1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073002001_02101_00004_nrca1/jw01073002001_02101_00004_nrca1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073002001_02101_00004_nrca1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073002001_02101_00004_nrca2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073002001_02101_00004_nrca2/jw01073002001_02101_00004_nrca2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073002001_02101_00004_nrca2/jw01073002001_02101_00004_nrca2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073002001_02101_00004_nrca2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073002001_02101_00004_nrca3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073002001_02101_00004_nrca3/jw01073002001_02101_00004_nrca3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073002001_02101_00004_nrca3/jw01073002001_02101_00004_nrca3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073002001_02101_00004_nrca3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073002001_02101_00004_nrca4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073002001_02101_00004_nrca4/jw01073002001_02101_00004_nrca4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073002001_02101_00004_nrca4/jw01073002001_02101_00004_nrca4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073002001_02101_00004_nrca4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073002001_02101_00004_nrcalong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073002001_02101_00004_nrcalong/jw01073002001_02101_00004_nrcalong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073002001_02101_00004_nrcalong/jw01073002001_02101_00004_nrcalong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073002001_02101_00004_nrcalong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073002001_02101_00004_nrcb1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073002001_02101_00004_nrcb1/jw01073002001_02101_00004_nrcb1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073002001_02101_00004_nrcb1/jw01073002001_02101_00004_nrcb1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073002001_02101_00004_nrcb1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073002001_02101_00004_nrcb2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073002001_02101_00004_nrcb2/jw01073002001_02101_00004_nrcb2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073002001_02101_00004_nrcb2/jw01073002001_02101_00004_nrcb2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073002001_02101_00004_nrcb2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073002001_02101_00004_nrcb3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073002001_02101_00004_nrcb3/jw01073002001_02101_00004_nrcb3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073002001_02101_00004_nrcb3/jw01073002001_02101_00004_nrcb3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073002001_02101_00004_nrcb3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073002001_02101_00004_nrcb4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073002001_02101_00004_nrcb4/jw01073002001_02101_00004_nrcb4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073002001_02101_00004_nrcb4/jw01073002001_02101_00004_nrcb4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073002001_02101_00004_nrcb4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073002001_02101_00004_nrcblong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073002001_02101_00004_nrcblong/jw01073002001_02101_00004_nrcblong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073002001_02101_00004_nrcblong/jw01073002001_02101_00004_nrcblong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073002001_02101_00004_nrcblong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00001_nrca1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00001_nrca1/jw01073006001_02101_00001_nrca1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00001_nrca1/jw01073006001_02101_00001_nrca1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00001_nrca1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00001_nrca2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00001_nrca2/jw01073006001_02101_00001_nrca2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00001_nrca2/jw01073006001_02101_00001_nrca2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00001_nrca2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00001_nrca3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00001_nrca3/jw01073006001_02101_00001_nrca3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00001_nrca3/jw01073006001_02101_00001_nrca3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00001_nrca3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00001_nrca4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00001_nrca4/jw01073006001_02101_00001_nrca4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00001_nrca4/jw01073006001_02101_00001_nrca4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00001_nrca4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00001_nrcalong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00001_nrcalong/jw01073006001_02101_00001_nrcalong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00001_nrcalong/jw01073006001_02101_00001_nrcalong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00001_nrcalong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00001_nrcb1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00001_nrcb1/jw01073006001_02101_00001_nrcb1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00001_nrcb1/jw01073006001_02101_00001_nrcb1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00001_nrcb1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00001_nrcb2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00001_nrcb2/jw01073006001_02101_00001_nrcb2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00001_nrcb2/jw01073006001_02101_00001_nrcb2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00001_nrcb2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00001_nrcb3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00001_nrcb3/jw01073006001_02101_00001_nrcb3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00001_nrcb3/jw01073006001_02101_00001_nrcb3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00001_nrcb3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00001_nrcb4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00001_nrcb4/jw01073006001_02101_00001_nrcb4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00001_nrcb4/jw01073006001_02101_00001_nrcb4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00001_nrcb4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00001_nrcblong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00001_nrcblong/jw01073006001_02101_00001_nrcblong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00001_nrcblong/jw01073006001_02101_00001_nrcblong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00001_nrcblong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00002_nrca1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00002_nrca1/jw01073006001_02101_00002_nrca1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00002_nrca1/jw01073006001_02101_00002_nrca1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00002_nrca1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00002_nrca2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00002_nrca2/jw01073006001_02101_00002_nrca2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00002_nrca2/jw01073006001_02101_00002_nrca2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00002_nrca2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00002_nrca3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00002_nrca3/jw01073006001_02101_00002_nrca3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00002_nrca3/jw01073006001_02101_00002_nrca3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00002_nrca3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00002_nrca4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00002_nrca4/jw01073006001_02101_00002_nrca4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00002_nrca4/jw01073006001_02101_00002_nrca4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00002_nrca4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00002_nrcalong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00002_nrcalong/jw01073006001_02101_00002_nrcalong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00002_nrcalong/jw01073006001_02101_00002_nrcalong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00002_nrcalong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00002_nrcb1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00002_nrcb1/jw01073006001_02101_00002_nrcb1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00002_nrcb1/jw01073006001_02101_00002_nrcb1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00002_nrcb1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00002_nrcb2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00002_nrcb2/jw01073006001_02101_00002_nrcb2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00002_nrcb2/jw01073006001_02101_00002_nrcb2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00002_nrcb2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00002_nrcb3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00002_nrcb3/jw01073006001_02101_00002_nrcb3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00002_nrcb3/jw01073006001_02101_00002_nrcb3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00002_nrcb3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00002_nrcb4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00002_nrcb4/jw01073006001_02101_00002_nrcb4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00002_nrcb4/jw01073006001_02101_00002_nrcb4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00002_nrcb4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00002_nrcblong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00002_nrcblong/jw01073006001_02101_00002_nrcblong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00002_nrcblong/jw01073006001_02101_00002_nrcblong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00002_nrcblong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00003_nrca1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00003_nrca1/jw01073006001_02101_00003_nrca1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00003_nrca1/jw01073006001_02101_00003_nrca1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00003_nrca1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00003_nrca2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00003_nrca2/jw01073006001_02101_00003_nrca2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00003_nrca2/jw01073006001_02101_00003_nrca2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00003_nrca2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00003_nrca3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00003_nrca3/jw01073006001_02101_00003_nrca3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00003_nrca3/jw01073006001_02101_00003_nrca3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00003_nrca3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00003_nrca4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00003_nrca4/jw01073006001_02101_00003_nrca4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00003_nrca4/jw01073006001_02101_00003_nrca4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00003_nrca4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00003_nrcalong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00003_nrcalong/jw01073006001_02101_00003_nrcalong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00003_nrcalong/jw01073006001_02101_00003_nrcalong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00003_nrcalong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00003_nrcb1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00003_nrcb1/jw01073006001_02101_00003_nrcb1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00003_nrcb1/jw01073006001_02101_00003_nrcb1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00003_nrcb1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00003_nrcb2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00003_nrcb2/jw01073006001_02101_00003_nrcb2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00003_nrcb2/jw01073006001_02101_00003_nrcb2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00003_nrcb2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00003_nrcb3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00003_nrcb3/jw01073006001_02101_00003_nrcb3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00003_nrcb3/jw01073006001_02101_00003_nrcb3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00003_nrcb3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00003_nrcb4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00003_nrcb4/jw01073006001_02101_00003_nrcb4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00003_nrcb4/jw01073006001_02101_00003_nrcb4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00003_nrcb4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00003_nrcblong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00003_nrcblong/jw01073006001_02101_00003_nrcblong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00003_nrcblong/jw01073006001_02101_00003_nrcblong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00003_nrcblong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00004_nrca1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00004_nrca1/jw01073006001_02101_00004_nrca1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00004_nrca1/jw01073006001_02101_00004_nrca1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00004_nrca1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00004_nrca2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00004_nrca2/jw01073006001_02101_00004_nrca2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00004_nrca2/jw01073006001_02101_00004_nrca2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00004_nrca2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00004_nrca3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00004_nrca3/jw01073006001_02101_00004_nrca3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00004_nrca3/jw01073006001_02101_00004_nrca3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00004_nrca3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00004_nrca4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00004_nrca4/jw01073006001_02101_00004_nrca4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00004_nrca4/jw01073006001_02101_00004_nrca4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00004_nrca4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00004_nrcalong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00004_nrcalong/jw01073006001_02101_00004_nrcalong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00004_nrcalong/jw01073006001_02101_00004_nrcalong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00004_nrcalong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00004_nrcb1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00004_nrcb1/jw01073006001_02101_00004_nrcb1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00004_nrcb1/jw01073006001_02101_00004_nrcb1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00004_nrcb1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00004_nrcb2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00004_nrcb2/jw01073006001_02101_00004_nrcb2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00004_nrcb2/jw01073006001_02101_00004_nrcb2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00004_nrcb2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00004_nrcb3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00004_nrcb3/jw01073006001_02101_00004_nrcb3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00004_nrcb3/jw01073006001_02101_00004_nrcb3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00004_nrcb3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00004_nrcb4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00004_nrcb4/jw01073006001_02101_00004_nrcb4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00004_nrcb4/jw01073006001_02101_00004_nrcb4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00004_nrcb4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00004_nrcblong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00004_nrcblong/jw01073006001_02101_00004_nrcblong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00004_nrcblong/jw01073006001_02101_00004_nrcblong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00004_nrcblong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00005_nrca1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00005_nrca1/jw01073006001_02101_00005_nrca1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00005_nrca1/jw01073006001_02101_00005_nrca1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00005_nrca1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00005_nrca2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00005_nrca2/jw01073006001_02101_00005_nrca2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00005_nrca2/jw01073006001_02101_00005_nrca2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00005_nrca2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00005_nrca3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00005_nrca3/jw01073006001_02101_00005_nrca3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00005_nrca3/jw01073006001_02101_00005_nrca3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00005_nrca3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00005_nrca4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00005_nrca4/jw01073006001_02101_00005_nrca4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00005_nrca4/jw01073006001_02101_00005_nrca4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00005_nrca4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00005_nrcalong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00005_nrcalong/jw01073006001_02101_00005_nrcalong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00005_nrcalong/jw01073006001_02101_00005_nrcalong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00005_nrcalong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00005_nrcb1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00005_nrcb1/jw01073006001_02101_00005_nrcb1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00005_nrcb1/jw01073006001_02101_00005_nrcb1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00005_nrcb1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00005_nrcb2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00005_nrcb2/jw01073006001_02101_00005_nrcb2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00005_nrcb2/jw01073006001_02101_00005_nrcb2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00005_nrcb2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00005_nrcb3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00005_nrcb3/jw01073006001_02101_00005_nrcb3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00005_nrcb3/jw01073006001_02101_00005_nrcb3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00005_nrcb3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00005_nrcb4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00005_nrcb4/jw01073006001_02101_00005_nrcb4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00005_nrcb4/jw01073006001_02101_00005_nrcb4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00005_nrcb4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00005_nrcblong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00005_nrcblong/jw01073006001_02101_00005_nrcblong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00005_nrcblong/jw01073006001_02101_00005_nrcblong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00005_nrcblong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00006_nrca1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00006_nrca1/jw01073006001_02101_00006_nrca1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00006_nrca1/jw01073006001_02101_00006_nrca1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00006_nrca1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00006_nrca2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00006_nrca2/jw01073006001_02101_00006_nrca2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00006_nrca2/jw01073006001_02101_00006_nrca2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00006_nrca2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00006_nrca3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00006_nrca3/jw01073006001_02101_00006_nrca3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00006_nrca3/jw01073006001_02101_00006_nrca3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00006_nrca3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00006_nrca4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00006_nrca4/jw01073006001_02101_00006_nrca4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00006_nrca4/jw01073006001_02101_00006_nrca4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00006_nrca4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00006_nrcalong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00006_nrcalong/jw01073006001_02101_00006_nrcalong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00006_nrcalong/jw01073006001_02101_00006_nrcalong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00006_nrcalong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00006_nrcb1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00006_nrcb1/jw01073006001_02101_00006_nrcb1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00006_nrcb1/jw01073006001_02101_00006_nrcb1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00006_nrcb1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00006_nrcb2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00006_nrcb2/jw01073006001_02101_00006_nrcb2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00006_nrcb2/jw01073006001_02101_00006_nrcb2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00006_nrcb2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00006_nrcb3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00006_nrcb3/jw01073006001_02101_00006_nrcb3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00006_nrcb3/jw01073006001_02101_00006_nrcb3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00006_nrcb3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00006_nrcb4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00006_nrcb4/jw01073006001_02101_00006_nrcb4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00006_nrcb4/jw01073006001_02101_00006_nrcb4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00006_nrcb4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00006_nrcblong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00006_nrcblong/jw01073006001_02101_00006_nrcblong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00006_nrcblong/jw01073006001_02101_00006_nrcblong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00006_nrcblong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00007_nrca1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00007_nrca1/jw01073006001_02101_00007_nrca1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00007_nrca1/jw01073006001_02101_00007_nrca1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00007_nrca1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00007_nrca2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00007_nrca2/jw01073006001_02101_00007_nrca2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00007_nrca2/jw01073006001_02101_00007_nrca2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00007_nrca2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00007_nrca3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00007_nrca3/jw01073006001_02101_00007_nrca3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00007_nrca3/jw01073006001_02101_00007_nrca3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00007_nrca3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00007_nrca4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00007_nrca4/jw01073006001_02101_00007_nrca4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00007_nrca4/jw01073006001_02101_00007_nrca4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00007_nrca4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00007_nrcalong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00007_nrcalong/jw01073006001_02101_00007_nrcalong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00007_nrcalong/jw01073006001_02101_00007_nrcalong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00007_nrcalong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00007_nrcb1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00007_nrcb1/jw01073006001_02101_00007_nrcb1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00007_nrcb1/jw01073006001_02101_00007_nrcb1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00007_nrcb1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00007_nrcb2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00007_nrcb2/jw01073006001_02101_00007_nrcb2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00007_nrcb2/jw01073006001_02101_00007_nrcb2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00007_nrcb2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00007_nrcb3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00007_nrcb3/jw01073006001_02101_00007_nrcb3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00007_nrcb3/jw01073006001_02101_00007_nrcb3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00007_nrcb3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00007_nrcb4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00007_nrcb4/jw01073006001_02101_00007_nrcb4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00007_nrcb4/jw01073006001_02101_00007_nrcb4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00007_nrcb4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00007_nrcblong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00007_nrcblong/jw01073006001_02101_00007_nrcblong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00007_nrcblong/jw01073006001_02101_00007_nrcblong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00007_nrcblong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00008_nrca1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00008_nrca1/jw01073006001_02101_00008_nrca1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00008_nrca1/jw01073006001_02101_00008_nrca1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00008_nrca1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00008_nrca2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00008_nrca2/jw01073006001_02101_00008_nrca2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00008_nrca2/jw01073006001_02101_00008_nrca2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00008_nrca2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00008_nrca3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00008_nrca3/jw01073006001_02101_00008_nrca3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00008_nrca3/jw01073006001_02101_00008_nrca3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00008_nrca3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00008_nrca4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00008_nrca4/jw01073006001_02101_00008_nrca4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00008_nrca4/jw01073006001_02101_00008_nrca4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00008_nrca4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00008_nrcalong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00008_nrcalong/jw01073006001_02101_00008_nrcalong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00008_nrcalong/jw01073006001_02101_00008_nrcalong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00008_nrcalong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00008_nrcb1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00008_nrcb1/jw01073006001_02101_00008_nrcb1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00008_nrcb1/jw01073006001_02101_00008_nrcb1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00008_nrcb1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00008_nrcb2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00008_nrcb2/jw01073006001_02101_00008_nrcb2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00008_nrcb2/jw01073006001_02101_00008_nrcb2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00008_nrcb2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00008_nrcb3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00008_nrcb3/jw01073006001_02101_00008_nrcb3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00008_nrcb3/jw01073006001_02101_00008_nrcb3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00008_nrcb3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00008_nrcb4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00008_nrcb4/jw01073006001_02101_00008_nrcb4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00008_nrcb4/jw01073006001_02101_00008_nrcb4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00008_nrcb4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00008_nrcblong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00008_nrcblong/jw01073006001_02101_00008_nrcblong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00008_nrcblong/jw01073006001_02101_00008_nrcblong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00008_nrcblong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00009_nrca1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00009_nrca1/jw01073006001_02101_00009_nrca1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00009_nrca1/jw01073006001_02101_00009_nrca1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00009_nrca1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00009_nrca2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00009_nrca2/jw01073006001_02101_00009_nrca2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00009_nrca2/jw01073006001_02101_00009_nrca2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00009_nrca2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00009_nrca3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00009_nrca3/jw01073006001_02101_00009_nrca3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00009_nrca3/jw01073006001_02101_00009_nrca3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00009_nrca3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00009_nrca4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00009_nrca4/jw01073006001_02101_00009_nrca4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00009_nrca4/jw01073006001_02101_00009_nrca4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00009_nrca4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00009_nrcalong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00009_nrcalong/jw01073006001_02101_00009_nrcalong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00009_nrcalong/jw01073006001_02101_00009_nrcalong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00009_nrcalong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00009_nrcb1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00009_nrcb1/jw01073006001_02101_00009_nrcb1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00009_nrcb1/jw01073006001_02101_00009_nrcb1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00009_nrcb1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00009_nrcb2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00009_nrcb2/jw01073006001_02101_00009_nrcb2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00009_nrcb2/jw01073006001_02101_00009_nrcb2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00009_nrcb2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00009_nrcb3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00009_nrcb3/jw01073006001_02101_00009_nrcb3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00009_nrcb3/jw01073006001_02101_00009_nrcb3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00009_nrcb3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00009_nrcb4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00009_nrcb4/jw01073006001_02101_00009_nrcb4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00009_nrcb4/jw01073006001_02101_00009_nrcb4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00009_nrcb4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073006001_02101_00009_nrcblong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073006001_02101_00009_nrcblong/jw01073006001_02101_00009_nrcblong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073006001_02101_00009_nrcblong/jw01073006001_02101_00009_nrcblong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073006001_02101_00009_nrcblong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00001_nrca1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00001_nrca1/jw01073007001_02101_00001_nrca1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00001_nrca1/jw01073007001_02101_00001_nrca1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00001_nrca1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00001_nrca2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00001_nrca2/jw01073007001_02101_00001_nrca2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00001_nrca2/jw01073007001_02101_00001_nrca2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00001_nrca2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00001_nrca3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00001_nrca3/jw01073007001_02101_00001_nrca3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00001_nrca3/jw01073007001_02101_00001_nrca3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00001_nrca3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00001_nrca4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00001_nrca4/jw01073007001_02101_00001_nrca4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00001_nrca4/jw01073007001_02101_00001_nrca4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00001_nrca4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00001_nrcalong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00001_nrcalong/jw01073007001_02101_00001_nrcalong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00001_nrcalong/jw01073007001_02101_00001_nrcalong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00001_nrcalong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00001_nrcb1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00001_nrcb1/jw01073007001_02101_00001_nrcb1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00001_nrcb1/jw01073007001_02101_00001_nrcb1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00001_nrcb1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00001_nrcb2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00001_nrcb2/jw01073007001_02101_00001_nrcb2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00001_nrcb2/jw01073007001_02101_00001_nrcb2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00001_nrcb2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00001_nrcb3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00001_nrcb3/jw01073007001_02101_00001_nrcb3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00001_nrcb3/jw01073007001_02101_00001_nrcb3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00001_nrcb3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00001_nrcb4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00001_nrcb4/jw01073007001_02101_00001_nrcb4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00001_nrcb4/jw01073007001_02101_00001_nrcb4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00001_nrcb4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00001_nrcblong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00001_nrcblong/jw01073007001_02101_00001_nrcblong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00001_nrcblong/jw01073007001_02101_00001_nrcblong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00001_nrcblong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00004_nrca1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00004_nrca1/jw01073007001_02103_00004_nrca1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00004_nrca1/jw01073007001_02103_00004_nrca1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00004_nrca1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00004_nrca2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00004_nrca2/jw01073007001_02103_00004_nrca2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00004_nrca2/jw01073007001_02103_00004_nrca2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00004_nrca2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00004_nrca3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00004_nrca3/jw01073007001_02103_00004_nrca3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00004_nrca3/jw01073007001_02103_00004_nrca3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00004_nrca3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00004_nrca4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00004_nrca4/jw01073007001_02103_00004_nrca4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00004_nrca4/jw01073007001_02103_00004_nrca4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00004_nrca4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00004_nrcalong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00004_nrcalong/jw01073007001_02103_00004_nrcalong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00004_nrcalong/jw01073007001_02103_00004_nrcalong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00004_nrcalong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00004_nrcb1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00004_nrcb1/jw01073007001_02103_00004_nrcb1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00004_nrcb1/jw01073007001_02103_00004_nrcb1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00004_nrcb1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00004_nrcb2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00004_nrcb2/jw01073007001_02103_00004_nrcb2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00004_nrcb2/jw01073007001_02103_00004_nrcb2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00004_nrcb2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00004_nrcb3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00004_nrcb3/jw01073007001_02103_00004_nrcb3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00004_nrcb3/jw01073007001_02103_00004_nrcb3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00004_nrcb3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00004_nrcb4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00004_nrcb4/jw01073007001_02103_00004_nrcb4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00004_nrcb4/jw01073007001_02103_00004_nrcb4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00004_nrcb4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00004_nrcblong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00004_nrcblong/jw01073007001_02103_00004_nrcblong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00004_nrcblong/jw01073007001_02103_00004_nrcblong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00004_nrcblong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00005_nrca1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00005_nrca1/jw01073007001_02103_00005_nrca1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00005_nrca1/jw01073007001_02103_00005_nrca1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00005_nrca1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00005_nrca2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00005_nrca2/jw01073007001_02103_00005_nrca2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00005_nrca2/jw01073007001_02103_00005_nrca2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00005_nrca2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00005_nrca3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00005_nrca3/jw01073007001_02103_00005_nrca3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00005_nrca3/jw01073007001_02103_00005_nrca3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00005_nrca3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00005_nrca4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00005_nrca4/jw01073007001_02103_00005_nrca4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00005_nrca4/jw01073007001_02103_00005_nrca4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00005_nrca4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00005_nrcalong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00005_nrcalong/jw01073007001_02103_00005_nrcalong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00005_nrcalong/jw01073007001_02103_00005_nrcalong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00005_nrcalong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00005_nrcb1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00005_nrcb1/jw01073007001_02103_00005_nrcb1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00005_nrcb1/jw01073007001_02103_00005_nrcb1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00005_nrcb1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00005_nrcb2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00005_nrcb2/jw01073007001_02103_00005_nrcb2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00005_nrcb2/jw01073007001_02103_00005_nrcb2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00005_nrcb2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00005_nrcb3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00005_nrcb3/jw01073007001_02103_00005_nrcb3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00005_nrcb3/jw01073007001_02103_00005_nrcb3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00005_nrcb3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00005_nrcb4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00005_nrcb4/jw01073007001_02103_00005_nrcb4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00005_nrcb4/jw01073007001_02103_00005_nrcb4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00005_nrcb4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00005_nrcblong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00005_nrcblong/jw01073007001_02103_00005_nrcblong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00005_nrcblong/jw01073007001_02103_00005_nrcblong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00005_nrcblong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00006_nrca1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00006_nrca1/jw01073007001_02103_00006_nrca1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00006_nrca1/jw01073007001_02103_00006_nrca1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00006_nrca1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00006_nrca2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00006_nrca2/jw01073007001_02103_00006_nrca2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00006_nrca2/jw01073007001_02103_00006_nrca2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00006_nrca2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00006_nrca3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00006_nrca3/jw01073007001_02103_00006_nrca3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00006_nrca3/jw01073007001_02103_00006_nrca3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00006_nrca3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00006_nrca4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00006_nrca4/jw01073007001_02103_00006_nrca4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00006_nrca4/jw01073007001_02103_00006_nrca4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00006_nrca4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00006_nrcalong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00006_nrcalong/jw01073007001_02103_00006_nrcalong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00006_nrcalong/jw01073007001_02103_00006_nrcalong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00006_nrcalong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00006_nrcb1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00006_nrcb1/jw01073007001_02103_00006_nrcb1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00006_nrcb1/jw01073007001_02103_00006_nrcb1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00006_nrcb1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00006_nrcb2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00006_nrcb2/jw01073007001_02103_00006_nrcb2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00006_nrcb2/jw01073007001_02103_00006_nrcb2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00006_nrcb2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00006_nrcb3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00006_nrcb3/jw01073007001_02103_00006_nrcb3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00006_nrcb3/jw01073007001_02103_00006_nrcb3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00006_nrcb3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00006_nrcb4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00006_nrcb4/jw01073007001_02103_00006_nrcb4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00006_nrcb4/jw01073007001_02103_00006_nrcb4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00006_nrcb4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00006_nrcblong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00006_nrcblong/jw01073007001_02103_00006_nrcblong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00006_nrcblong/jw01073007001_02103_00006_nrcblong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00006_nrcblong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00007_nrca1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00007_nrca1/jw01073007001_02103_00007_nrca1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00007_nrca1/jw01073007001_02103_00007_nrca1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00007_nrca1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00007_nrca2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00007_nrca2/jw01073007001_02103_00007_nrca2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00007_nrca2/jw01073007001_02103_00007_nrca2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00007_nrca2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00007_nrca3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00007_nrca3/jw01073007001_02103_00007_nrca3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00007_nrca3/jw01073007001_02103_00007_nrca3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00007_nrca3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00007_nrca4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00007_nrca4/jw01073007001_02103_00007_nrca4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00007_nrca4/jw01073007001_02103_00007_nrca4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00007_nrca4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00007_nrcalong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00007_nrcalong/jw01073007001_02103_00007_nrcalong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00007_nrcalong/jw01073007001_02103_00007_nrcalong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00007_nrcalong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00007_nrcb1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00007_nrcb1/jw01073007001_02103_00007_nrcb1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00007_nrcb1/jw01073007001_02103_00007_nrcb1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00007_nrcb1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00007_nrcb2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00007_nrcb2/jw01073007001_02103_00007_nrcb2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00007_nrcb2/jw01073007001_02103_00007_nrcb2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00007_nrcb2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00007_nrcb3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00007_nrcb3/jw01073007001_02103_00007_nrcb3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00007_nrcb3/jw01073007001_02103_00007_nrcb3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00007_nrcb3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00007_nrcb4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00007_nrcb4/jw01073007001_02103_00007_nrcb4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00007_nrcb4/jw01073007001_02103_00007_nrcb4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00007_nrcb4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00007_nrcblong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00007_nrcblong/jw01073007001_02103_00007_nrcblong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00007_nrcblong/jw01073007001_02103_00007_nrcblong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00007_nrcblong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00008_nrca1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00008_nrca1/jw01073007001_02103_00008_nrca1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00008_nrca1/jw01073007001_02103_00008_nrca1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00008_nrca1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00008_nrca2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00008_nrca2/jw01073007001_02103_00008_nrca2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00008_nrca2/jw01073007001_02103_00008_nrca2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00008_nrca2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00008_nrca3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00008_nrca3/jw01073007001_02103_00008_nrca3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00008_nrca3/jw01073007001_02103_00008_nrca3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00008_nrca3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00008_nrca4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00008_nrca4/jw01073007001_02103_00008_nrca4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00008_nrca4/jw01073007001_02103_00008_nrca4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00008_nrca4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00008_nrcalong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00008_nrcalong/jw01073007001_02103_00008_nrcalong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00008_nrcalong/jw01073007001_02103_00008_nrcalong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00008_nrcalong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00008_nrcb1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00008_nrcb1/jw01073007001_02103_00008_nrcb1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00008_nrcb1/jw01073007001_02103_00008_nrcb1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00008_nrcb1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00008_nrcb2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00008_nrcb2/jw01073007001_02103_00008_nrcb2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00008_nrcb2/jw01073007001_02103_00008_nrcb2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00008_nrcb2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00008_nrcb3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00008_nrcb3/jw01073007001_02103_00008_nrcb3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00008_nrcb3/jw01073007001_02103_00008_nrcb3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00008_nrcb3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00008_nrcb4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00008_nrcb4/jw01073007001_02103_00008_nrcb4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00008_nrcb4/jw01073007001_02103_00008_nrcb4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00008_nrcb4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00008_nrcblong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00008_nrcblong/jw01073007001_02103_00008_nrcblong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00008_nrcblong/jw01073007001_02103_00008_nrcblong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00008_nrcblong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00002_nrca1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00002_nrca1/jw01073007001_02101_00002_nrca1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00002_nrca1/jw01073007001_02101_00002_nrca1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00002_nrca1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00002_nrca2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00002_nrca2/jw01073007001_02101_00002_nrca2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00002_nrca2/jw01073007001_02101_00002_nrca2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00002_nrca2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00002_nrca3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00002_nrca3/jw01073007001_02101_00002_nrca3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00002_nrca3/jw01073007001_02101_00002_nrca3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00002_nrca3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00002_nrca4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00002_nrca4/jw01073007001_02101_00002_nrca4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00002_nrca4/jw01073007001_02101_00002_nrca4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00002_nrca4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00002_nrcalong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00002_nrcalong/jw01073007001_02101_00002_nrcalong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00002_nrcalong/jw01073007001_02101_00002_nrcalong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00002_nrcalong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00002_nrcb1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00002_nrcb1/jw01073007001_02101_00002_nrcb1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00002_nrcb1/jw01073007001_02101_00002_nrcb1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00002_nrcb1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00002_nrcb2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00002_nrcb2/jw01073007001_02101_00002_nrcb2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00002_nrcb2/jw01073007001_02101_00002_nrcb2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00002_nrcb2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00002_nrcb3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00002_nrcb3/jw01073007001_02101_00002_nrcb3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00002_nrcb3/jw01073007001_02101_00002_nrcb3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00002_nrcb3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00002_nrcb4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00002_nrcb4/jw01073007001_02101_00002_nrcb4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00002_nrcb4/jw01073007001_02101_00002_nrcb4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00002_nrcb4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00002_nrcblong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00002_nrcblong/jw01073007001_02101_00002_nrcblong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00002_nrcblong/jw01073007001_02101_00002_nrcblong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00002_nrcblong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00003_nrca1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00003_nrca1/jw01073007001_02101_00003_nrca1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00003_nrca1/jw01073007001_02101_00003_nrca1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00003_nrca1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00003_nrca2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00003_nrca2/jw01073007001_02101_00003_nrca2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00003_nrca2/jw01073007001_02101_00003_nrca2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00003_nrca2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00003_nrca3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00003_nrca3/jw01073007001_02101_00003_nrca3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00003_nrca3/jw01073007001_02101_00003_nrca3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00003_nrca3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00003_nrca4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00003_nrca4/jw01073007001_02101_00003_nrca4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00003_nrca4/jw01073007001_02101_00003_nrca4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00003_nrca4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00003_nrcalong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00003_nrcalong/jw01073007001_02101_00003_nrcalong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00003_nrcalong/jw01073007001_02101_00003_nrcalong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00003_nrcalong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00003_nrcb1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00003_nrcb1/jw01073007001_02101_00003_nrcb1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00003_nrcb1/jw01073007001_02101_00003_nrcb1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00003_nrcb1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00003_nrcb2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00003_nrcb2/jw01073007001_02101_00003_nrcb2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00003_nrcb2/jw01073007001_02101_00003_nrcb2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00003_nrcb2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00003_nrcb3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00003_nrcb3/jw01073007001_02101_00003_nrcb3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00003_nrcb3/jw01073007001_02101_00003_nrcb3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00003_nrcb3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00003_nrcb4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00003_nrcb4/jw01073007001_02101_00003_nrcb4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00003_nrcb4/jw01073007001_02101_00003_nrcb4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00003_nrcb4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00003_nrcblong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00003_nrcblong/jw01073007001_02101_00003_nrcblong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00003_nrcblong/jw01073007001_02101_00003_nrcblong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00003_nrcblong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00004_nrca1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00004_nrca1/jw01073007001_02101_00004_nrca1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00004_nrca1/jw01073007001_02101_00004_nrca1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00004_nrca1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00004_nrca2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00004_nrca2/jw01073007001_02101_00004_nrca2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00004_nrca2/jw01073007001_02101_00004_nrca2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00004_nrca2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00004_nrca3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00004_nrca3/jw01073007001_02101_00004_nrca3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00004_nrca3/jw01073007001_02101_00004_nrca3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00004_nrca3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00004_nrca4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00004_nrca4/jw01073007001_02101_00004_nrca4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00004_nrca4/jw01073007001_02101_00004_nrca4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00004_nrca4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00004_nrcalong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00004_nrcalong/jw01073007001_02101_00004_nrcalong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00004_nrcalong/jw01073007001_02101_00004_nrcalong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00004_nrcalong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00004_nrcb1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00004_nrcb1/jw01073007001_02101_00004_nrcb1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00004_nrcb1/jw01073007001_02101_00004_nrcb1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00004_nrcb1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00004_nrcb2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00004_nrcb2/jw01073007001_02101_00004_nrcb2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00004_nrcb2/jw01073007001_02101_00004_nrcb2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00004_nrcb2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00004_nrcb3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00004_nrcb3/jw01073007001_02101_00004_nrcb3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00004_nrcb3/jw01073007001_02101_00004_nrcb3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00004_nrcb3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00004_nrcb4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00004_nrcb4/jw01073007001_02101_00004_nrcb4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00004_nrcb4/jw01073007001_02101_00004_nrcb4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00004_nrcb4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00004_nrcblong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00004_nrcblong/jw01073007001_02101_00004_nrcblong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00004_nrcblong/jw01073007001_02101_00004_nrcblong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00004_nrcblong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00005_nrca1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00005_nrca1/jw01073007001_02101_00005_nrca1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00005_nrca1/jw01073007001_02101_00005_nrca1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00005_nrca1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00005_nrca2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00005_nrca2/jw01073007001_02101_00005_nrca2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00005_nrca2/jw01073007001_02101_00005_nrca2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00005_nrca2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00005_nrca3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00005_nrca3/jw01073007001_02101_00005_nrca3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00005_nrca3/jw01073007001_02101_00005_nrca3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00005_nrca3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00005_nrca4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00005_nrca4/jw01073007001_02101_00005_nrca4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00005_nrca4/jw01073007001_02101_00005_nrca4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00005_nrca4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00005_nrcalong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00005_nrcalong/jw01073007001_02101_00005_nrcalong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00005_nrcalong/jw01073007001_02101_00005_nrcalong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00005_nrcalong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00005_nrcb1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00005_nrcb1/jw01073007001_02101_00005_nrcb1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00005_nrcb1/jw01073007001_02101_00005_nrcb1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00005_nrcb1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00005_nrcb2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00005_nrcb2/jw01073007001_02101_00005_nrcb2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00005_nrcb2/jw01073007001_02101_00005_nrcb2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00005_nrcb2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00005_nrcb3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00005_nrcb3/jw01073007001_02101_00005_nrcb3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00005_nrcb3/jw01073007001_02101_00005_nrcb3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00005_nrcb3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00005_nrcb4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00005_nrcb4/jw01073007001_02101_00005_nrcb4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00005_nrcb4/jw01073007001_02101_00005_nrcb4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00005_nrcb4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00005_nrcblong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00005_nrcblong/jw01073007001_02101_00005_nrcblong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00005_nrcblong/jw01073007001_02101_00005_nrcblong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00005_nrcblong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00006_nrca1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00006_nrca1/jw01073007001_02101_00006_nrca1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00006_nrca1/jw01073007001_02101_00006_nrca1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00006_nrca1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00006_nrca2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00006_nrca2/jw01073007001_02101_00006_nrca2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00006_nrca2/jw01073007001_02101_00006_nrca2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00006_nrca2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00006_nrca3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00006_nrca3/jw01073007001_02101_00006_nrca3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00006_nrca3/jw01073007001_02101_00006_nrca3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00006_nrca3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00006_nrca4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00006_nrca4/jw01073007001_02101_00006_nrca4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00006_nrca4/jw01073007001_02101_00006_nrca4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00006_nrca4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00006_nrcalong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00006_nrcalong/jw01073007001_02101_00006_nrcalong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00006_nrcalong/jw01073007001_02101_00006_nrcalong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00006_nrcalong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00006_nrcb1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00006_nrcb1/jw01073007001_02101_00006_nrcb1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00006_nrcb1/jw01073007001_02101_00006_nrcb1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00006_nrcb1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00006_nrcb2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00006_nrcb2/jw01073007001_02101_00006_nrcb2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00006_nrcb2/jw01073007001_02101_00006_nrcb2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00006_nrcb2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00006_nrcb3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00006_nrcb3/jw01073007001_02101_00006_nrcb3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00006_nrcb3/jw01073007001_02101_00006_nrcb3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00006_nrcb3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00006_nrcb4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00006_nrcb4/jw01073007001_02101_00006_nrcb4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00006_nrcb4/jw01073007001_02101_00006_nrcb4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00006_nrcb4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00006_nrcblong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00006_nrcblong/jw01073007001_02101_00006_nrcblong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00006_nrcblong/jw01073007001_02101_00006_nrcblong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00006_nrcblong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00007_nrca1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00007_nrca1/jw01073007001_02101_00007_nrca1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00007_nrca1/jw01073007001_02101_00007_nrca1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00007_nrca1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00007_nrca2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00007_nrca2/jw01073007001_02101_00007_nrca2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00007_nrca2/jw01073007001_02101_00007_nrca2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00007_nrca2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00007_nrca3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00007_nrca3/jw01073007001_02101_00007_nrca3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00007_nrca3/jw01073007001_02101_00007_nrca3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00007_nrca3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00007_nrca4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00007_nrca4/jw01073007001_02101_00007_nrca4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00007_nrca4/jw01073007001_02101_00007_nrca4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00007_nrca4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00007_nrcalong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00007_nrcalong/jw01073007001_02101_00007_nrcalong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00007_nrcalong/jw01073007001_02101_00007_nrcalong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00007_nrcalong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00007_nrcb1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00007_nrcb1/jw01073007001_02101_00007_nrcb1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00007_nrcb1/jw01073007001_02101_00007_nrcb1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00007_nrcb1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00007_nrcb2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00007_nrcb2/jw01073007001_02101_00007_nrcb2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00007_nrcb2/jw01073007001_02101_00007_nrcb2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00007_nrcb2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00007_nrcb3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00007_nrcb3/jw01073007001_02101_00007_nrcb3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00007_nrcb3/jw01073007001_02101_00007_nrcb3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00007_nrcb3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00007_nrcb4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00007_nrcb4/jw01073007001_02101_00007_nrcb4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00007_nrcb4/jw01073007001_02101_00007_nrcb4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00007_nrcb4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00007_nrcblong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00007_nrcblong/jw01073007001_02101_00007_nrcblong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00007_nrcblong/jw01073007001_02101_00007_nrcblong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00007_nrcblong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00008_nrca1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00008_nrca1/jw01073007001_02101_00008_nrca1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00008_nrca1/jw01073007001_02101_00008_nrca1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00008_nrca1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00008_nrca2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00008_nrca2/jw01073007001_02101_00008_nrca2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00008_nrca2/jw01073007001_02101_00008_nrca2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00008_nrca2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00008_nrca3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00008_nrca3/jw01073007001_02101_00008_nrca3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00008_nrca3/jw01073007001_02101_00008_nrca3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00008_nrca3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00008_nrca4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00008_nrca4/jw01073007001_02101_00008_nrca4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00008_nrca4/jw01073007001_02101_00008_nrca4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00008_nrca4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00008_nrcalong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00008_nrcalong/jw01073007001_02101_00008_nrcalong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00008_nrcalong/jw01073007001_02101_00008_nrcalong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00008_nrcalong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00008_nrcb1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00008_nrcb1/jw01073007001_02101_00008_nrcb1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00008_nrcb1/jw01073007001_02101_00008_nrcb1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00008_nrcb1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00008_nrcb2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00008_nrcb2/jw01073007001_02101_00008_nrcb2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00008_nrcb2/jw01073007001_02101_00008_nrcb2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00008_nrcb2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00008_nrcb3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00008_nrcb3/jw01073007001_02101_00008_nrcb3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00008_nrcb3/jw01073007001_02101_00008_nrcb3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00008_nrcb3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00008_nrcb4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00008_nrcb4/jw01073007001_02101_00008_nrcb4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00008_nrcb4/jw01073007001_02101_00008_nrcb4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00008_nrcb4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02101_00008_nrcblong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02101_00008_nrcblong/jw01073007001_02101_00008_nrcblong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02101_00008_nrcblong/jw01073007001_02101_00008_nrcblong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02101_00008_nrcblong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00001_nrca1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00001_nrca1/jw01073007001_02103_00001_nrca1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00001_nrca1/jw01073007001_02103_00001_nrca1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00001_nrca1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00001_nrca2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00001_nrca2/jw01073007001_02103_00001_nrca2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00001_nrca2/jw01073007001_02103_00001_nrca2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00001_nrca2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00001_nrca3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00001_nrca3/jw01073007001_02103_00001_nrca3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00001_nrca3/jw01073007001_02103_00001_nrca3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00001_nrca3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00001_nrca4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00001_nrca4/jw01073007001_02103_00001_nrca4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00001_nrca4/jw01073007001_02103_00001_nrca4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00001_nrca4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00001_nrcalong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00001_nrcalong/jw01073007001_02103_00001_nrcalong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00001_nrcalong/jw01073007001_02103_00001_nrcalong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00001_nrcalong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00001_nrcb1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00001_nrcb1/jw01073007001_02103_00001_nrcb1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00001_nrcb1/jw01073007001_02103_00001_nrcb1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00001_nrcb1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00001_nrcb2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00001_nrcb2/jw01073007001_02103_00001_nrcb2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00001_nrcb2/jw01073007001_02103_00001_nrcb2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00001_nrcb2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00001_nrcb3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00001_nrcb3/jw01073007001_02103_00001_nrcb3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00001_nrcb3/jw01073007001_02103_00001_nrcb3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00001_nrcb3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00001_nrcb4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00001_nrcb4/jw01073007001_02103_00001_nrcb4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00001_nrcb4/jw01073007001_02103_00001_nrcb4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00001_nrcb4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00001_nrcblong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00001_nrcblong/jw01073007001_02103_00001_nrcblong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00001_nrcblong/jw01073007001_02103_00001_nrcblong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00001_nrcblong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00002_nrca1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00002_nrca1/jw01073007001_02103_00002_nrca1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00002_nrca1/jw01073007001_02103_00002_nrca1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00002_nrca1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00002_nrca2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00002_nrca2/jw01073007001_02103_00002_nrca2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00002_nrca2/jw01073007001_02103_00002_nrca2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00002_nrca2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00002_nrca3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00002_nrca3/jw01073007001_02103_00002_nrca3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00002_nrca3/jw01073007001_02103_00002_nrca3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00002_nrca3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00002_nrca4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00002_nrca4/jw01073007001_02103_00002_nrca4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00002_nrca4/jw01073007001_02103_00002_nrca4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00002_nrca4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00002_nrcalong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00002_nrcalong/jw01073007001_02103_00002_nrcalong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00002_nrcalong/jw01073007001_02103_00002_nrcalong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00002_nrcalong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00002_nrcb1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00002_nrcb1/jw01073007001_02103_00002_nrcb1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00002_nrcb1/jw01073007001_02103_00002_nrcb1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00002_nrcb1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00002_nrcb2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00002_nrcb2/jw01073007001_02103_00002_nrcb2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00002_nrcb2/jw01073007001_02103_00002_nrcb2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00002_nrcb2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00002_nrcb3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00002_nrcb3/jw01073007001_02103_00002_nrcb3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00002_nrcb3/jw01073007001_02103_00002_nrcb3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00002_nrcb3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00002_nrcb4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00002_nrcb4/jw01073007001_02103_00002_nrcb4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00002_nrcb4/jw01073007001_02103_00002_nrcb4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00002_nrcb4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00002_nrcblong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00002_nrcblong/jw01073007001_02103_00002_nrcblong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00002_nrcblong/jw01073007001_02103_00002_nrcblong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00002_nrcblong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00003_nrca1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00003_nrca1/jw01073007001_02103_00003_nrca1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00003_nrca1/jw01073007001_02103_00003_nrca1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00003_nrca1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00003_nrca2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00003_nrca2/jw01073007001_02103_00003_nrca2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00003_nrca2/jw01073007001_02103_00003_nrca2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00003_nrca2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00003_nrca3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00003_nrca3/jw01073007001_02103_00003_nrca3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00003_nrca3/jw01073007001_02103_00003_nrca3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00003_nrca3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00003_nrca4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00003_nrca4/jw01073007001_02103_00003_nrca4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00003_nrca4/jw01073007001_02103_00003_nrca4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00003_nrca4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00003_nrcalong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00003_nrcalong/jw01073007001_02103_00003_nrcalong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00003_nrcalong/jw01073007001_02103_00003_nrcalong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00003_nrcalong_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00003_nrcb1_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00003_nrcb1/jw01073007001_02103_00003_nrcb1_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00003_nrcb1/jw01073007001_02103_00003_nrcb1_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00003_nrcb1_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00003_nrcb2_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00003_nrcb2/jw01073007001_02103_00003_nrcb2_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00003_nrcb2/jw01073007001_02103_00003_nrcb2_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00003_nrcb2_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00003_nrcb3_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00003_nrcb3/jw01073007001_02103_00003_nrcb3_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00003_nrcb3/jw01073007001_02103_00003_nrcb3_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00003_nrcb3_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00003_nrcb4_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00003_nrcb4/jw01073007001_02103_00003_nrcb4_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00003_nrcb4/jw01073007001_02103_00003_nrcb4_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00003_nrcb4_uncal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw01073007001_02103_00003_nrcblong_uncal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw01073007001_02103_00003_nrcblong/jw01073007001_02103_00003_nrcblong_uncal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw01073007001_02103_00003_nrcblong/jw01073007001_02103_00003_nrcblong_uncal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1313.sh&uri=mast:JWST/product/jw01073007001_02103_00003_nrcblong_uncal.fits'




exit 0
