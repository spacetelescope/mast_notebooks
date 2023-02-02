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
FOLDER=MAST_2023-01-25T1259
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
        <title>MAST_2023-01-25T1259</title>
    </head>
    <body>
        <h2>Manifest for File: MAST_2023-01-25T1259</h2>
        <h3>Total Files: 80</h3>
        <table cellspacing="0" cellpadding="4" rules="all" style="border-width:5px; border-style:solid; border-collapse:collapse;">
            <tr>
                <td><b>URI</b></td>
                <td><b>File</b></td>
                <td><b>Access</b></td>
                <td><b>Status</b></td>
                <td><b>Logged In User</b></td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002001_02103_00001_mirimage_o002_crf.fits</td>
                <td>JWST/jw02733002001_02103_00001_mirimage/jw02733002001_02103_00001_mirimage_o002_crf.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002001_02103_00001_mirimage_cal.fits</td>
                <td>JWST/jw02733002001_02103_00001_mirimage/jw02733002001_02103_00001_mirimage_cal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002001_02103_00001_mirimage_i2d.fits</td>
                <td>JWST/jw02733002001_02103_00001_mirimage/jw02733002001_02103_00001_mirimage_i2d.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002001_02103_00001_mirimage_rate.fits</td>
                <td>JWST/jw02733002001_02103_00001_mirimage/jw02733002001_02103_00001_mirimage_rate.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002001_02103_00001_mirimage_rateints.fits</td>
                <td>JWST/jw02733002001_02103_00001_mirimage/jw02733002001_02103_00001_mirimage_rateints.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002001_02103_00002_mirimage_o002_crf.fits</td>
                <td>JWST/jw02733002001_02103_00002_mirimage/jw02733002001_02103_00002_mirimage_o002_crf.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002001_02103_00002_mirimage_cal.fits</td>
                <td>JWST/jw02733002001_02103_00002_mirimage/jw02733002001_02103_00002_mirimage_cal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002001_02103_00002_mirimage_i2d.fits</td>
                <td>JWST/jw02733002001_02103_00002_mirimage/jw02733002001_02103_00002_mirimage_i2d.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002001_02103_00002_mirimage_rate.fits</td>
                <td>JWST/jw02733002001_02103_00002_mirimage/jw02733002001_02103_00002_mirimage_rate.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002001_02103_00002_mirimage_rateints.fits</td>
                <td>JWST/jw02733002001_02103_00002_mirimage/jw02733002001_02103_00002_mirimage_rateints.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002001_02103_00003_mirimage_o002_crf.fits</td>
                <td>JWST/jw02733002001_02103_00003_mirimage/jw02733002001_02103_00003_mirimage_o002_crf.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002001_02103_00003_mirimage_cal.fits</td>
                <td>JWST/jw02733002001_02103_00003_mirimage/jw02733002001_02103_00003_mirimage_cal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002001_02103_00003_mirimage_i2d.fits</td>
                <td>JWST/jw02733002001_02103_00003_mirimage/jw02733002001_02103_00003_mirimage_i2d.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002001_02103_00003_mirimage_rate.fits</td>
                <td>JWST/jw02733002001_02103_00003_mirimage/jw02733002001_02103_00003_mirimage_rate.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002001_02103_00003_mirimage_rateints.fits</td>
                <td>JWST/jw02733002001_02103_00003_mirimage/jw02733002001_02103_00003_mirimage_rateints.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002001_02103_00004_mirimage_o002_crf.fits</td>
                <td>JWST/jw02733002001_02103_00004_mirimage/jw02733002001_02103_00004_mirimage_o002_crf.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002001_02103_00004_mirimage_cal.fits</td>
                <td>JWST/jw02733002001_02103_00004_mirimage/jw02733002001_02103_00004_mirimage_cal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002001_02103_00004_mirimage_i2d.fits</td>
                <td>JWST/jw02733002001_02103_00004_mirimage/jw02733002001_02103_00004_mirimage_i2d.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002001_02103_00004_mirimage_rate.fits</td>
                <td>JWST/jw02733002001_02103_00004_mirimage/jw02733002001_02103_00004_mirimage_rate.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002001_02103_00004_mirimage_rateints.fits</td>
                <td>JWST/jw02733002001_02103_00004_mirimage/jw02733002001_02103_00004_mirimage_rateints.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002001_02103_00005_mirimage_o002_crf.fits</td>
                <td>JWST/jw02733002001_02103_00005_mirimage/jw02733002001_02103_00005_mirimage_o002_crf.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002001_02103_00005_mirimage_cal.fits</td>
                <td>JWST/jw02733002001_02103_00005_mirimage/jw02733002001_02103_00005_mirimage_cal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002001_02103_00005_mirimage_i2d.fits</td>
                <td>JWST/jw02733002001_02103_00005_mirimage/jw02733002001_02103_00005_mirimage_i2d.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002001_02103_00005_mirimage_rate.fits</td>
                <td>JWST/jw02733002001_02103_00005_mirimage/jw02733002001_02103_00005_mirimage_rate.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002001_02103_00005_mirimage_rateints.fits</td>
                <td>JWST/jw02733002001_02103_00005_mirimage/jw02733002001_02103_00005_mirimage_rateints.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002001_02103_00006_mirimage_o002_crf.fits</td>
                <td>JWST/jw02733002001_02103_00006_mirimage/jw02733002001_02103_00006_mirimage_o002_crf.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002001_02103_00006_mirimage_cal.fits</td>
                <td>JWST/jw02733002001_02103_00006_mirimage/jw02733002001_02103_00006_mirimage_cal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002001_02103_00006_mirimage_i2d.fits</td>
                <td>JWST/jw02733002001_02103_00006_mirimage/jw02733002001_02103_00006_mirimage_i2d.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002001_02103_00006_mirimage_rate.fits</td>
                <td>JWST/jw02733002001_02103_00006_mirimage/jw02733002001_02103_00006_mirimage_rate.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002001_02103_00006_mirimage_rateints.fits</td>
                <td>JWST/jw02733002001_02103_00006_mirimage/jw02733002001_02103_00006_mirimage_rateints.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002001_02103_00007_mirimage_o002_crf.fits</td>
                <td>JWST/jw02733002001_02103_00007_mirimage/jw02733002001_02103_00007_mirimage_o002_crf.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002001_02103_00007_mirimage_cal.fits</td>
                <td>JWST/jw02733002001_02103_00007_mirimage/jw02733002001_02103_00007_mirimage_cal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002001_02103_00007_mirimage_i2d.fits</td>
                <td>JWST/jw02733002001_02103_00007_mirimage/jw02733002001_02103_00007_mirimage_i2d.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002001_02103_00007_mirimage_rate.fits</td>
                <td>JWST/jw02733002001_02103_00007_mirimage/jw02733002001_02103_00007_mirimage_rate.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002001_02103_00007_mirimage_rateints.fits</td>
                <td>JWST/jw02733002001_02103_00007_mirimage/jw02733002001_02103_00007_mirimage_rateints.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002001_02103_00008_mirimage_o002_crf.fits</td>
                <td>JWST/jw02733002001_02103_00008_mirimage/jw02733002001_02103_00008_mirimage_o002_crf.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002001_02103_00008_mirimage_cal.fits</td>
                <td>JWST/jw02733002001_02103_00008_mirimage/jw02733002001_02103_00008_mirimage_cal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002001_02103_00008_mirimage_i2d.fits</td>
                <td>JWST/jw02733002001_02103_00008_mirimage/jw02733002001_02103_00008_mirimage_i2d.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002001_02103_00008_mirimage_rate.fits</td>
                <td>JWST/jw02733002001_02103_00008_mirimage/jw02733002001_02103_00008_mirimage_rate.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002001_02103_00008_mirimage_rateints.fits</td>
                <td>JWST/jw02733002001_02103_00008_mirimage/jw02733002001_02103_00008_mirimage_rateints.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002002_02103_00001_mirimage_o002_crf.fits</td>
                <td>JWST/jw02733002002_02103_00001_mirimage/jw02733002002_02103_00001_mirimage_o002_crf.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002002_02103_00001_mirimage_cal.fits</td>
                <td>JWST/jw02733002002_02103_00001_mirimage/jw02733002002_02103_00001_mirimage_cal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002002_02103_00001_mirimage_i2d.fits</td>
                <td>JWST/jw02733002002_02103_00001_mirimage/jw02733002002_02103_00001_mirimage_i2d.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002002_02103_00001_mirimage_rate.fits</td>
                <td>JWST/jw02733002002_02103_00001_mirimage/jw02733002002_02103_00001_mirimage_rate.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002002_02103_00001_mirimage_rateints.fits</td>
                <td>JWST/jw02733002002_02103_00001_mirimage/jw02733002002_02103_00001_mirimage_rateints.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002002_02103_00002_mirimage_o002_crf.fits</td>
                <td>JWST/jw02733002002_02103_00002_mirimage/jw02733002002_02103_00002_mirimage_o002_crf.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002002_02103_00002_mirimage_cal.fits</td>
                <td>JWST/jw02733002002_02103_00002_mirimage/jw02733002002_02103_00002_mirimage_cal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002002_02103_00002_mirimage_i2d.fits</td>
                <td>JWST/jw02733002002_02103_00002_mirimage/jw02733002002_02103_00002_mirimage_i2d.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002002_02103_00002_mirimage_rate.fits</td>
                <td>JWST/jw02733002002_02103_00002_mirimage/jw02733002002_02103_00002_mirimage_rate.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002002_02103_00002_mirimage_rateints.fits</td>
                <td>JWST/jw02733002002_02103_00002_mirimage/jw02733002002_02103_00002_mirimage_rateints.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002002_02103_00003_mirimage_o002_crf.fits</td>
                <td>JWST/jw02733002002_02103_00003_mirimage/jw02733002002_02103_00003_mirimage_o002_crf.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002002_02103_00003_mirimage_cal.fits</td>
                <td>JWST/jw02733002002_02103_00003_mirimage/jw02733002002_02103_00003_mirimage_cal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002002_02103_00003_mirimage_i2d.fits</td>
                <td>JWST/jw02733002002_02103_00003_mirimage/jw02733002002_02103_00003_mirimage_i2d.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002002_02103_00003_mirimage_rate.fits</td>
                <td>JWST/jw02733002002_02103_00003_mirimage/jw02733002002_02103_00003_mirimage_rate.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002002_02103_00003_mirimage_rateints.fits</td>
                <td>JWST/jw02733002002_02103_00003_mirimage/jw02733002002_02103_00003_mirimage_rateints.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002002_02103_00004_mirimage_o002_crf.fits</td>
                <td>JWST/jw02733002002_02103_00004_mirimage/jw02733002002_02103_00004_mirimage_o002_crf.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002002_02103_00004_mirimage_cal.fits</td>
                <td>JWST/jw02733002002_02103_00004_mirimage/jw02733002002_02103_00004_mirimage_cal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002002_02103_00004_mirimage_i2d.fits</td>
                <td>JWST/jw02733002002_02103_00004_mirimage/jw02733002002_02103_00004_mirimage_i2d.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002002_02103_00004_mirimage_rate.fits</td>
                <td>JWST/jw02733002002_02103_00004_mirimage/jw02733002002_02103_00004_mirimage_rate.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002002_02103_00004_mirimage_rateints.fits</td>
                <td>JWST/jw02733002002_02103_00004_mirimage/jw02733002002_02103_00004_mirimage_rateints.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002002_02103_00005_mirimage_o002_crf.fits</td>
                <td>JWST/jw02733002002_02103_00005_mirimage/jw02733002002_02103_00005_mirimage_o002_crf.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002002_02103_00005_mirimage_cal.fits</td>
                <td>JWST/jw02733002002_02103_00005_mirimage/jw02733002002_02103_00005_mirimage_cal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002002_02103_00005_mirimage_i2d.fits</td>
                <td>JWST/jw02733002002_02103_00005_mirimage/jw02733002002_02103_00005_mirimage_i2d.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002002_02103_00005_mirimage_rate.fits</td>
                <td>JWST/jw02733002002_02103_00005_mirimage/jw02733002002_02103_00005_mirimage_rate.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002002_02103_00005_mirimage_rateints.fits</td>
                <td>JWST/jw02733002002_02103_00005_mirimage/jw02733002002_02103_00005_mirimage_rateints.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002002_02103_00006_mirimage_o002_crf.fits</td>
                <td>JWST/jw02733002002_02103_00006_mirimage/jw02733002002_02103_00006_mirimage_o002_crf.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002002_02103_00006_mirimage_cal.fits</td>
                <td>JWST/jw02733002002_02103_00006_mirimage/jw02733002002_02103_00006_mirimage_cal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002002_02103_00006_mirimage_i2d.fits</td>
                <td>JWST/jw02733002002_02103_00006_mirimage/jw02733002002_02103_00006_mirimage_i2d.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002002_02103_00006_mirimage_rate.fits</td>
                <td>JWST/jw02733002002_02103_00006_mirimage/jw02733002002_02103_00006_mirimage_rate.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002002_02103_00006_mirimage_rateints.fits</td>
                <td>JWST/jw02733002002_02103_00006_mirimage/jw02733002002_02103_00006_mirimage_rateints.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002002_02103_00007_mirimage_o002_crf.fits</td>
                <td>JWST/jw02733002002_02103_00007_mirimage/jw02733002002_02103_00007_mirimage_o002_crf.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002002_02103_00007_mirimage_cal.fits</td>
                <td>JWST/jw02733002002_02103_00007_mirimage/jw02733002002_02103_00007_mirimage_cal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002002_02103_00007_mirimage_i2d.fits</td>
                <td>JWST/jw02733002002_02103_00007_mirimage/jw02733002002_02103_00007_mirimage_i2d.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002002_02103_00007_mirimage_rate.fits</td>
                <td>JWST/jw02733002002_02103_00007_mirimage/jw02733002002_02103_00007_mirimage_rate.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002002_02103_00007_mirimage_rateints.fits</td>
                <td>JWST/jw02733002002_02103_00007_mirimage/jw02733002002_02103_00007_mirimage_rateints.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002002_02103_00008_mirimage_o002_crf.fits</td>
                <td>JWST/jw02733002002_02103_00008_mirimage/jw02733002002_02103_00008_mirimage_o002_crf.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002002_02103_00008_mirimage_cal.fits</td>
                <td>JWST/jw02733002002_02103_00008_mirimage/jw02733002002_02103_00008_mirimage_cal.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002002_02103_00008_mirimage_i2d.fits</td>
                <td>JWST/jw02733002002_02103_00008_mirimage/jw02733002002_02103_00008_mirimage_i2d.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002002_02103_00008_mirimage_rate.fits</td>
                <td>JWST/jw02733002002_02103_00008_mirimage/jw02733002002_02103_00008_mirimage_rate.fits</td>
                <td>PUBLIC</td>
                <td>OK</td>
                <td>anonymous</td>
            </tr>
            
            <tr>
                <td>mast:JWST/product/jw02733002002_02103_00008_mirimage_rateints.fits</td>
                <td>JWST/jw02733002002_02103_00008_mirimage/jw02733002002_02103_00008_mirimage_rateints.fits</td>
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
<<< Downloading File: mast:JWST/product/jw02733002001_02103_00001_mirimage_o002_crf.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002001_02103_00001_mirimage/jw02733002001_02103_00001_mirimage_o002_crf.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002001_02103_00001_mirimage/jw02733002001_02103_00001_mirimage_o002_crf.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002001_02103_00001_mirimage_o002_crf.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002001_02103_00001_mirimage_cal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002001_02103_00001_mirimage/jw02733002001_02103_00001_mirimage_cal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002001_02103_00001_mirimage/jw02733002001_02103_00001_mirimage_cal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002001_02103_00001_mirimage_cal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002001_02103_00001_mirimage_i2d.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002001_02103_00001_mirimage/jw02733002001_02103_00001_mirimage_i2d.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002001_02103_00001_mirimage/jw02733002001_02103_00001_mirimage_i2d.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002001_02103_00001_mirimage_i2d.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002001_02103_00001_mirimage_rate.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002001_02103_00001_mirimage/jw02733002001_02103_00001_mirimage_rate.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002001_02103_00001_mirimage/jw02733002001_02103_00001_mirimage_rate.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002001_02103_00001_mirimage_rate.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002001_02103_00001_mirimage_rateints.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002001_02103_00001_mirimage/jw02733002001_02103_00001_mirimage_rateints.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002001_02103_00001_mirimage/jw02733002001_02103_00001_mirimage_rateints.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002001_02103_00001_mirimage_rateints.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002001_02103_00002_mirimage_o002_crf.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002001_02103_00002_mirimage/jw02733002001_02103_00002_mirimage_o002_crf.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002001_02103_00002_mirimage/jw02733002001_02103_00002_mirimage_o002_crf.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002001_02103_00002_mirimage_o002_crf.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002001_02103_00002_mirimage_cal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002001_02103_00002_mirimage/jw02733002001_02103_00002_mirimage_cal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002001_02103_00002_mirimage/jw02733002001_02103_00002_mirimage_cal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002001_02103_00002_mirimage_cal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002001_02103_00002_mirimage_i2d.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002001_02103_00002_mirimage/jw02733002001_02103_00002_mirimage_i2d.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002001_02103_00002_mirimage/jw02733002001_02103_00002_mirimage_i2d.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002001_02103_00002_mirimage_i2d.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002001_02103_00002_mirimage_rate.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002001_02103_00002_mirimage/jw02733002001_02103_00002_mirimage_rate.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002001_02103_00002_mirimage/jw02733002001_02103_00002_mirimage_rate.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002001_02103_00002_mirimage_rate.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002001_02103_00002_mirimage_rateints.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002001_02103_00002_mirimage/jw02733002001_02103_00002_mirimage_rateints.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002001_02103_00002_mirimage/jw02733002001_02103_00002_mirimage_rateints.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002001_02103_00002_mirimage_rateints.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002001_02103_00003_mirimage_o002_crf.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002001_02103_00003_mirimage/jw02733002001_02103_00003_mirimage_o002_crf.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002001_02103_00003_mirimage/jw02733002001_02103_00003_mirimage_o002_crf.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002001_02103_00003_mirimage_o002_crf.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002001_02103_00003_mirimage_cal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002001_02103_00003_mirimage/jw02733002001_02103_00003_mirimage_cal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002001_02103_00003_mirimage/jw02733002001_02103_00003_mirimage_cal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002001_02103_00003_mirimage_cal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002001_02103_00003_mirimage_i2d.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002001_02103_00003_mirimage/jw02733002001_02103_00003_mirimage_i2d.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002001_02103_00003_mirimage/jw02733002001_02103_00003_mirimage_i2d.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002001_02103_00003_mirimage_i2d.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002001_02103_00003_mirimage_rate.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002001_02103_00003_mirimage/jw02733002001_02103_00003_mirimage_rate.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002001_02103_00003_mirimage/jw02733002001_02103_00003_mirimage_rate.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002001_02103_00003_mirimage_rate.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002001_02103_00003_mirimage_rateints.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002001_02103_00003_mirimage/jw02733002001_02103_00003_mirimage_rateints.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002001_02103_00003_mirimage/jw02733002001_02103_00003_mirimage_rateints.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002001_02103_00003_mirimage_rateints.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002001_02103_00004_mirimage_o002_crf.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002001_02103_00004_mirimage/jw02733002001_02103_00004_mirimage_o002_crf.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002001_02103_00004_mirimage/jw02733002001_02103_00004_mirimage_o002_crf.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002001_02103_00004_mirimage_o002_crf.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002001_02103_00004_mirimage_cal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002001_02103_00004_mirimage/jw02733002001_02103_00004_mirimage_cal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002001_02103_00004_mirimage/jw02733002001_02103_00004_mirimage_cal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002001_02103_00004_mirimage_cal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002001_02103_00004_mirimage_i2d.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002001_02103_00004_mirimage/jw02733002001_02103_00004_mirimage_i2d.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002001_02103_00004_mirimage/jw02733002001_02103_00004_mirimage_i2d.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002001_02103_00004_mirimage_i2d.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002001_02103_00004_mirimage_rate.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002001_02103_00004_mirimage/jw02733002001_02103_00004_mirimage_rate.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002001_02103_00004_mirimage/jw02733002001_02103_00004_mirimage_rate.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002001_02103_00004_mirimage_rate.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002001_02103_00004_mirimage_rateints.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002001_02103_00004_mirimage/jw02733002001_02103_00004_mirimage_rateints.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002001_02103_00004_mirimage/jw02733002001_02103_00004_mirimage_rateints.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002001_02103_00004_mirimage_rateints.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002001_02103_00005_mirimage_o002_crf.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002001_02103_00005_mirimage/jw02733002001_02103_00005_mirimage_o002_crf.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002001_02103_00005_mirimage/jw02733002001_02103_00005_mirimage_o002_crf.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002001_02103_00005_mirimage_o002_crf.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002001_02103_00005_mirimage_cal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002001_02103_00005_mirimage/jw02733002001_02103_00005_mirimage_cal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002001_02103_00005_mirimage/jw02733002001_02103_00005_mirimage_cal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002001_02103_00005_mirimage_cal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002001_02103_00005_mirimage_i2d.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002001_02103_00005_mirimage/jw02733002001_02103_00005_mirimage_i2d.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002001_02103_00005_mirimage/jw02733002001_02103_00005_mirimage_i2d.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002001_02103_00005_mirimage_i2d.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002001_02103_00005_mirimage_rate.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002001_02103_00005_mirimage/jw02733002001_02103_00005_mirimage_rate.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002001_02103_00005_mirimage/jw02733002001_02103_00005_mirimage_rate.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002001_02103_00005_mirimage_rate.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002001_02103_00005_mirimage_rateints.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002001_02103_00005_mirimage/jw02733002001_02103_00005_mirimage_rateints.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002001_02103_00005_mirimage/jw02733002001_02103_00005_mirimage_rateints.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002001_02103_00005_mirimage_rateints.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002001_02103_00006_mirimage_o002_crf.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002001_02103_00006_mirimage/jw02733002001_02103_00006_mirimage_o002_crf.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002001_02103_00006_mirimage/jw02733002001_02103_00006_mirimage_o002_crf.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002001_02103_00006_mirimage_o002_crf.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002001_02103_00006_mirimage_cal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002001_02103_00006_mirimage/jw02733002001_02103_00006_mirimage_cal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002001_02103_00006_mirimage/jw02733002001_02103_00006_mirimage_cal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002001_02103_00006_mirimage_cal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002001_02103_00006_mirimage_i2d.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002001_02103_00006_mirimage/jw02733002001_02103_00006_mirimage_i2d.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002001_02103_00006_mirimage/jw02733002001_02103_00006_mirimage_i2d.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002001_02103_00006_mirimage_i2d.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002001_02103_00006_mirimage_rate.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002001_02103_00006_mirimage/jw02733002001_02103_00006_mirimage_rate.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002001_02103_00006_mirimage/jw02733002001_02103_00006_mirimage_rate.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002001_02103_00006_mirimage_rate.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002001_02103_00006_mirimage_rateints.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002001_02103_00006_mirimage/jw02733002001_02103_00006_mirimage_rateints.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002001_02103_00006_mirimage/jw02733002001_02103_00006_mirimage_rateints.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002001_02103_00006_mirimage_rateints.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002001_02103_00007_mirimage_o002_crf.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002001_02103_00007_mirimage/jw02733002001_02103_00007_mirimage_o002_crf.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002001_02103_00007_mirimage/jw02733002001_02103_00007_mirimage_o002_crf.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002001_02103_00007_mirimage_o002_crf.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002001_02103_00007_mirimage_cal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002001_02103_00007_mirimage/jw02733002001_02103_00007_mirimage_cal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002001_02103_00007_mirimage/jw02733002001_02103_00007_mirimage_cal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002001_02103_00007_mirimage_cal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002001_02103_00007_mirimage_i2d.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002001_02103_00007_mirimage/jw02733002001_02103_00007_mirimage_i2d.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002001_02103_00007_mirimage/jw02733002001_02103_00007_mirimage_i2d.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002001_02103_00007_mirimage_i2d.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002001_02103_00007_mirimage_rate.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002001_02103_00007_mirimage/jw02733002001_02103_00007_mirimage_rate.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002001_02103_00007_mirimage/jw02733002001_02103_00007_mirimage_rate.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002001_02103_00007_mirimage_rate.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002001_02103_00007_mirimage_rateints.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002001_02103_00007_mirimage/jw02733002001_02103_00007_mirimage_rateints.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002001_02103_00007_mirimage/jw02733002001_02103_00007_mirimage_rateints.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002001_02103_00007_mirimage_rateints.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002001_02103_00008_mirimage_o002_crf.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002001_02103_00008_mirimage/jw02733002001_02103_00008_mirimage_o002_crf.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002001_02103_00008_mirimage/jw02733002001_02103_00008_mirimage_o002_crf.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002001_02103_00008_mirimage_o002_crf.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002001_02103_00008_mirimage_cal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002001_02103_00008_mirimage/jw02733002001_02103_00008_mirimage_cal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002001_02103_00008_mirimage/jw02733002001_02103_00008_mirimage_cal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002001_02103_00008_mirimage_cal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002001_02103_00008_mirimage_i2d.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002001_02103_00008_mirimage/jw02733002001_02103_00008_mirimage_i2d.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002001_02103_00008_mirimage/jw02733002001_02103_00008_mirimage_i2d.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002001_02103_00008_mirimage_i2d.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002001_02103_00008_mirimage_rate.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002001_02103_00008_mirimage/jw02733002001_02103_00008_mirimage_rate.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002001_02103_00008_mirimage/jw02733002001_02103_00008_mirimage_rate.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002001_02103_00008_mirimage_rate.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002001_02103_00008_mirimage_rateints.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002001_02103_00008_mirimage/jw02733002001_02103_00008_mirimage_rateints.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002001_02103_00008_mirimage/jw02733002001_02103_00008_mirimage_rateints.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002001_02103_00008_mirimage_rateints.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002002_02103_00001_mirimage_o002_crf.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002002_02103_00001_mirimage/jw02733002002_02103_00001_mirimage_o002_crf.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002002_02103_00001_mirimage/jw02733002002_02103_00001_mirimage_o002_crf.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002002_02103_00001_mirimage_o002_crf.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002002_02103_00001_mirimage_cal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002002_02103_00001_mirimage/jw02733002002_02103_00001_mirimage_cal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002002_02103_00001_mirimage/jw02733002002_02103_00001_mirimage_cal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002002_02103_00001_mirimage_cal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002002_02103_00001_mirimage_i2d.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002002_02103_00001_mirimage/jw02733002002_02103_00001_mirimage_i2d.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002002_02103_00001_mirimage/jw02733002002_02103_00001_mirimage_i2d.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002002_02103_00001_mirimage_i2d.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002002_02103_00001_mirimage_rate.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002002_02103_00001_mirimage/jw02733002002_02103_00001_mirimage_rate.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002002_02103_00001_mirimage/jw02733002002_02103_00001_mirimage_rate.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002002_02103_00001_mirimage_rate.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002002_02103_00001_mirimage_rateints.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002002_02103_00001_mirimage/jw02733002002_02103_00001_mirimage_rateints.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002002_02103_00001_mirimage/jw02733002002_02103_00001_mirimage_rateints.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002002_02103_00001_mirimage_rateints.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002002_02103_00002_mirimage_o002_crf.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002002_02103_00002_mirimage/jw02733002002_02103_00002_mirimage_o002_crf.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002002_02103_00002_mirimage/jw02733002002_02103_00002_mirimage_o002_crf.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002002_02103_00002_mirimage_o002_crf.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002002_02103_00002_mirimage_cal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002002_02103_00002_mirimage/jw02733002002_02103_00002_mirimage_cal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002002_02103_00002_mirimage/jw02733002002_02103_00002_mirimage_cal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002002_02103_00002_mirimage_cal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002002_02103_00002_mirimage_i2d.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002002_02103_00002_mirimage/jw02733002002_02103_00002_mirimage_i2d.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002002_02103_00002_mirimage/jw02733002002_02103_00002_mirimage_i2d.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002002_02103_00002_mirimage_i2d.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002002_02103_00002_mirimage_rate.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002002_02103_00002_mirimage/jw02733002002_02103_00002_mirimage_rate.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002002_02103_00002_mirimage/jw02733002002_02103_00002_mirimage_rate.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002002_02103_00002_mirimage_rate.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002002_02103_00002_mirimage_rateints.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002002_02103_00002_mirimage/jw02733002002_02103_00002_mirimage_rateints.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002002_02103_00002_mirimage/jw02733002002_02103_00002_mirimage_rateints.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002002_02103_00002_mirimage_rateints.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002002_02103_00003_mirimage_o002_crf.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002002_02103_00003_mirimage/jw02733002002_02103_00003_mirimage_o002_crf.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002002_02103_00003_mirimage/jw02733002002_02103_00003_mirimage_o002_crf.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002002_02103_00003_mirimage_o002_crf.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002002_02103_00003_mirimage_cal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002002_02103_00003_mirimage/jw02733002002_02103_00003_mirimage_cal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002002_02103_00003_mirimage/jw02733002002_02103_00003_mirimage_cal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002002_02103_00003_mirimage_cal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002002_02103_00003_mirimage_i2d.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002002_02103_00003_mirimage/jw02733002002_02103_00003_mirimage_i2d.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002002_02103_00003_mirimage/jw02733002002_02103_00003_mirimage_i2d.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002002_02103_00003_mirimage_i2d.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002002_02103_00003_mirimage_rate.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002002_02103_00003_mirimage/jw02733002002_02103_00003_mirimage_rate.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002002_02103_00003_mirimage/jw02733002002_02103_00003_mirimage_rate.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002002_02103_00003_mirimage_rate.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002002_02103_00003_mirimage_rateints.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002002_02103_00003_mirimage/jw02733002002_02103_00003_mirimage_rateints.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002002_02103_00003_mirimage/jw02733002002_02103_00003_mirimage_rateints.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002002_02103_00003_mirimage_rateints.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002002_02103_00004_mirimage_o002_crf.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002002_02103_00004_mirimage/jw02733002002_02103_00004_mirimage_o002_crf.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002002_02103_00004_mirimage/jw02733002002_02103_00004_mirimage_o002_crf.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002002_02103_00004_mirimage_o002_crf.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002002_02103_00004_mirimage_cal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002002_02103_00004_mirimage/jw02733002002_02103_00004_mirimage_cal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002002_02103_00004_mirimage/jw02733002002_02103_00004_mirimage_cal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002002_02103_00004_mirimage_cal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002002_02103_00004_mirimage_i2d.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002002_02103_00004_mirimage/jw02733002002_02103_00004_mirimage_i2d.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002002_02103_00004_mirimage/jw02733002002_02103_00004_mirimage_i2d.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002002_02103_00004_mirimage_i2d.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002002_02103_00004_mirimage_rate.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002002_02103_00004_mirimage/jw02733002002_02103_00004_mirimage_rate.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002002_02103_00004_mirimage/jw02733002002_02103_00004_mirimage_rate.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002002_02103_00004_mirimage_rate.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002002_02103_00004_mirimage_rateints.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002002_02103_00004_mirimage/jw02733002002_02103_00004_mirimage_rateints.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002002_02103_00004_mirimage/jw02733002002_02103_00004_mirimage_rateints.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002002_02103_00004_mirimage_rateints.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002002_02103_00005_mirimage_o002_crf.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002002_02103_00005_mirimage/jw02733002002_02103_00005_mirimage_o002_crf.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002002_02103_00005_mirimage/jw02733002002_02103_00005_mirimage_o002_crf.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002002_02103_00005_mirimage_o002_crf.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002002_02103_00005_mirimage_cal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002002_02103_00005_mirimage/jw02733002002_02103_00005_mirimage_cal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002002_02103_00005_mirimage/jw02733002002_02103_00005_mirimage_cal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002002_02103_00005_mirimage_cal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002002_02103_00005_mirimage_i2d.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002002_02103_00005_mirimage/jw02733002002_02103_00005_mirimage_i2d.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002002_02103_00005_mirimage/jw02733002002_02103_00005_mirimage_i2d.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002002_02103_00005_mirimage_i2d.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002002_02103_00005_mirimage_rate.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002002_02103_00005_mirimage/jw02733002002_02103_00005_mirimage_rate.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002002_02103_00005_mirimage/jw02733002002_02103_00005_mirimage_rate.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002002_02103_00005_mirimage_rate.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002002_02103_00005_mirimage_rateints.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002002_02103_00005_mirimage/jw02733002002_02103_00005_mirimage_rateints.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002002_02103_00005_mirimage/jw02733002002_02103_00005_mirimage_rateints.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002002_02103_00005_mirimage_rateints.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002002_02103_00006_mirimage_o002_crf.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002002_02103_00006_mirimage/jw02733002002_02103_00006_mirimage_o002_crf.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002002_02103_00006_mirimage/jw02733002002_02103_00006_mirimage_o002_crf.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002002_02103_00006_mirimage_o002_crf.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002002_02103_00006_mirimage_cal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002002_02103_00006_mirimage/jw02733002002_02103_00006_mirimage_cal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002002_02103_00006_mirimage/jw02733002002_02103_00006_mirimage_cal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002002_02103_00006_mirimage_cal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002002_02103_00006_mirimage_i2d.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002002_02103_00006_mirimage/jw02733002002_02103_00006_mirimage_i2d.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002002_02103_00006_mirimage/jw02733002002_02103_00006_mirimage_i2d.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002002_02103_00006_mirimage_i2d.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002002_02103_00006_mirimage_rate.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002002_02103_00006_mirimage/jw02733002002_02103_00006_mirimage_rate.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002002_02103_00006_mirimage/jw02733002002_02103_00006_mirimage_rate.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002002_02103_00006_mirimage_rate.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002002_02103_00006_mirimage_rateints.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002002_02103_00006_mirimage/jw02733002002_02103_00006_mirimage_rateints.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002002_02103_00006_mirimage/jw02733002002_02103_00006_mirimage_rateints.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002002_02103_00006_mirimage_rateints.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002002_02103_00007_mirimage_o002_crf.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002002_02103_00007_mirimage/jw02733002002_02103_00007_mirimage_o002_crf.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002002_02103_00007_mirimage/jw02733002002_02103_00007_mirimage_o002_crf.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002002_02103_00007_mirimage_o002_crf.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002002_02103_00007_mirimage_cal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002002_02103_00007_mirimage/jw02733002002_02103_00007_mirimage_cal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002002_02103_00007_mirimage/jw02733002002_02103_00007_mirimage_cal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002002_02103_00007_mirimage_cal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002002_02103_00007_mirimage_i2d.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002002_02103_00007_mirimage/jw02733002002_02103_00007_mirimage_i2d.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002002_02103_00007_mirimage/jw02733002002_02103_00007_mirimage_i2d.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002002_02103_00007_mirimage_i2d.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002002_02103_00007_mirimage_rate.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002002_02103_00007_mirimage/jw02733002002_02103_00007_mirimage_rate.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002002_02103_00007_mirimage/jw02733002002_02103_00007_mirimage_rate.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002002_02103_00007_mirimage_rate.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002002_02103_00007_mirimage_rateints.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002002_02103_00007_mirimage/jw02733002002_02103_00007_mirimage_rateints.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002002_02103_00007_mirimage/jw02733002002_02103_00007_mirimage_rateints.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002002_02103_00007_mirimage_rateints.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002002_02103_00008_mirimage_o002_crf.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002002_02103_00008_mirimage/jw02733002002_02103_00008_mirimage_o002_crf.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002002_02103_00008_mirimage/jw02733002002_02103_00008_mirimage_o002_crf.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002002_02103_00008_mirimage_o002_crf.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002002_02103_00008_mirimage_cal.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002002_02103_00008_mirimage/jw02733002002_02103_00008_mirimage_cal.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002002_02103_00008_mirimage/jw02733002002_02103_00008_mirimage_cal.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002002_02103_00008_mirimage_cal.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002002_02103_00008_mirimage_i2d.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002002_02103_00008_mirimage/jw02733002002_02103_00008_mirimage_i2d.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002002_02103_00008_mirimage/jw02733002002_02103_00008_mirimage_i2d.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002002_02103_00008_mirimage_i2d.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002002_02103_00008_mirimage_rate.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002002_02103_00008_mirimage/jw02733002002_02103_00008_mirimage_rate.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002002_02103_00008_mirimage/jw02733002002_02103_00008_mirimage_rate.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002002_02103_00008_mirimage_rate.fits'





cat <<EOT
<<< Downloading File: mast:JWST/product/jw02733002002_02103_00008_mirimage_rateints.fits
                  To: ${DOWNLOAD_FOLDER}/JWST/jw02733002002_02103_00008_mirimage/jw02733002002_02103_00008_mirimage_rateints.fits
EOT

curl --globoff --location-trusted -f --progress-bar --create-dirs $CONT --output ./${DOWNLOAD_FOLDER}'/JWST/jw02733002002_02103_00008_mirimage/jw02733002002_02103_00008_mirimage_rateints.fits' 'https://mast.stsci.edu/api/v0.1/Download/file?bundle_name=MAST_2023-01-25T1259.sh&uri=mast:JWST/product/jw02733002002_02103_00008_mirimage_rateints.fits'




exit 0
