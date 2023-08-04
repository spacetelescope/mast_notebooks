#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Feb  9 22:21:26 2018

@author: smullally

Command Line script to quickly checked if there are Planned
JWST or current HST observations of a target.

Checks MAST for Observations from JWST and HST

Requires installation of astroquery.

Created by Susan Mullally
February 2018
"""


import astropy
from astroquery.mast import Mast
import getopt
import sys
import numpy as np

def filteredConeSearch(ra,dec,radius,service="",myfilters=None, returnNum=False):
    """
    This function performs a cone search on the MAST CAOM database
    and returns whether any observations overlap with the cone search
    and other filters provided. This only searches planned observations.
    
    Args:
    ra: right ascension in degrees
    dec: declination in degrees
    radius: radius of cone search in arc seconds
    myfilters: Dictionary of what you want to filter on, 
                if None, it searhes mission=JWST and calib_level=-1
    service:  For testing you can change the MAST service to the testbed here.
    returnNum: False. Set to True if you only want the number of observations returned.
    
    Returns:
    results dictionary unless there are more than 1000 observations or less than 1.
    
    """
    
    
    if service=="":
        service="Mast.Caom.Filtered.Position"
    
    if myfilters!=None:
        filters=myfilters
    else:
        filters = [
                {"paramName":"calib_level",
                          "values":["-1"],},
                {"paramName":"obs_collection","values":["JWST"]}
              ]
    cone_search="%f, %f, %f" % (ra,dec,radius/3600)
    
    #First see how many observations there are using COUNT_BIG(*)
    params =  { "columns":"COUNT_BIG(*)",
                "filters":filters,
                "position":cone_search
          }
    
    result=Mast.service_request(service,params)
    numbObs=int(result[0][0])
    print("Found: %u" % numbObs)
    if (numbObs > 2000) | (numbObs == 0) | (returnNum):
        return result
    
    params =  { "columns":"*",
            "filters":filters,
            "position":cone_search
              }
    
    result=Mast.service_request(service,params)
    
    return result


def getMASTCoords(name):
    """
    Use Mast.Name.Lookup to get the ra/dec of your target.
    """
    service = 'Mast.Name.Lookup'
    params ={'input':name,
             'format':'json'}
    response = Mast.service_request_async(service,params)
    result = response[0].json()
    coord=result['resolvedCoordinate']
    ra = coord[0]['ra']
    dec = coord[0]['decl']
    
    return(ra,dec)



def main():
    try:
        options,arg = getopt.getopt(sys.argv[1:],'ht:p:r:m:',['--help','--target','--position','--radius','--maxlines'])
    except:
        print("Input Arguments cannot be read")
        return
    
    target_name = 'Trappist-1'
    radius = 4
    mlines=20
    
    for opt, arg in options:
        if opt in ('-t','--target'):
            target_name=arg
        if opt in ('-p','--position'):
            pos=arg
            target_name=''
        if opt in ('-r','--radius'):
            radius=np.float(arg)
        if opt in ('-m','--maxlines'):
            mlines=int(arg)
        if opt in ('-h','--help'):
            print("\nList Planned JWST Observations and existing HST Observations by target name by querying the MAST Portal.")
            print("-t, --target target name")
            print("-p, --position \"ra dec\" in sexadecimal")
            print("-r , --radius Radius of the cone search in arc seconds (default is 4)")
            print("-m, --maxlines Maximum number of observations to print out. \n   \t\t-1 for all, 20 is default")
            print("Example:  checkMastObs -t \"47 Tuc\" -r 20 -m -1")
            print("\n This code will only print out up to 2000 observations.")
            print("\n")
            return
    
    
    if target_name!="":
        #Do a Name look up.
        try:
            (ra,dec) = getMASTCoords(target_name)
        except IndexError:
            print("Cannot Find Coordinates for %s" % target_name)
            return
            
    else:
        print(pos.split())
        ra=np.float(pos.split()[0])
        dec=np.float(pos.split()[1])
        
    print("\nTarget Information: %s" % target_name)
    print("RA: %f  Dec:%f" % (ra,dec))
    print("======== JWST Planned Observations ===========")
    
    jwstplanned=filteredConeSearch(ra,dec,radius)
    
    try:
        jwstplanned['s_ra'].format = '%7.4f'
        jwstplanned['s_dec'].format = '%7.4f'
        jwstplanned['t_exptime'].format = '%6.2f'
        jwstplanned['proposal_id','obs_title','proposal_pi','target_name','instrument_name','filters','t_exptime','s_ra','s_dec'].pprint(max_lines=mlines, max_width=-1)

    except (ValueError,KeyError) as e:
        if int(jwstplanned[0][0]) == 0:
            print("No Observations Found.")
        else:
            print("Too Many Observations to retrieve.")
    print("\n")
    
    print("======== Existing HST Observations ===========")
    filters = [{"paramName":"obs_collection",
            "values":["HST"]}]
    hsttaken=filteredConeSearch(ra,dec,radius,myfilters=filters)
    
    try:
        hsttaken['s_ra'].format = '%7.4f'
        hsttaken['s_dec'].format = '%7.4f'
        hsttaken['t_exptime'].format = '%6.2f'
        hsttaken['proposal_id','obs_title','proposal_pi','target_name','instrument_name','filters','t_exptime','s_ra','s_dec'].pprint(max_lines=mlines, max_width=-1)
    except (ValueError,KeyError) as e:
        if int(hsttaken[0][0]) == 0:
            print("No Observations Found.")
        else:
            print("Too Many Observations to retrieve.")
     

if __name__=="__main__":
    main()
