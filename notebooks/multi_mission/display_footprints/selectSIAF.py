###############################################################
# ASB-25623 Notebook to display Telescope/Instrument footprints on sky viewer
#
# ASB-25623     Brian McLean    Initial prototype v0.1 2024-02-29
###############################################################
# Imports

import matplotlib.pyplot as plt
import numpy as np
import pysiaf
###############################################################
# Take user input to create list of aperture siaf info and v2,v3 reference points

def defineApertures(selectedTelescope, selectedInstrument, selectedAperture):
    
    # Create lists of individual apertures that make up selected instrument FOV and get v2,v3 of reference point
    apertureList=[]

    if selectedTelescope.lower() == 'roman':
        telescopeSiaf = pysiaf.Siaf(selectedTelescope)
        if selectedInstrument.lower() == 'wfi':
            if selectedAperture.lower() == 'all' :
                 apertureNames = ['WFI01_FULL', 'WFI02_FULL', 'WFI03_FULL', 'WFI04_FULL', 'WFI05_FULL', 'WFI06_FULL', 
                                  'WFI07_FULL', 'WFI08_FULL', 'WFI09_FULL', 'WFI10_FULL', 'WFI11_FULL', 'WFI12_FULL', 
                                  'WFI13_FULL', 'WFI14_FULL', 'WFI15_FULL', 'WFI16_FULL', 'WFI17_FULL', 'WFI18_FULL']
                 V2Ref = telescopeSiaf.apertures['WFI_CEN'].V2Ref
                 V3Ref = telescopeSiaf.apertures['WFI_CEN'].V3Ref
            else:
                apertureNames=[selectedAperture]                   
                V2Ref = telescopeSiaf.apertures[selectedAperture].V2Ref
                V3Ref = telescopeSiaf.apertures[selectedAperture].V3Ref
        elif selectedInstrument.lower() == 'cgi':
            apertureNames = ['CGI_CEN']
            V2Ref = telescopeSiaf.apertures['CGI_CEN'].V2Ref
            V3Ref = telescopeSiaf.apertures['CGI_CEN'].V3Ref
        elif selectedInstrument.lower() == 'all':
            apertureNames = ['WFI01_FULL', 'WFI02_FULL', 'WFI03_FULL', 'WFI04_FULL', 'WFI05_FULL', 'WFI06_FULL', 
                             'WFI07_FULL', 'WFI08_FULL', 'WFI09_FULL', 'WFI10_FULL', 'WFI11_FULL', 'WFI12_FULL', 
                             'WFI13_FULL', 'WFI14_FULL', 'WFI15_FULL', 'WFI16_FULL', 'WFI17_FULL', 'WFI18_FULL',
                             'BORESIGHT', 'CGI_CEN']
            V2Ref = 0.0
            V3Ref = 0.0
        else:
             print('Unrecognized instrument')
        for name in apertureNames:
            apertureList.append(telescopeSiaf[name])

    elif selectedTelescope.lower() == 'jwst': 
        if selectedInstrument.lower() == 'fgs':
            telescopeSiaf = pysiaf.Siaf(selectedInstrument)
            if selectedAperture.lower() == 'all' :
                apertureNames=['FGS1_FULL','FGS2_FULL']
                V2Ref = +100.0
                V3Ref = -700.0
            else:
                apertureNames=[selectedAperture]    
                V2Ref = telescopeSiaf.apertures[selectedAperture].V2Ref
                V3Ref = telescopeSiaf.apertures[selectedAperture].V3Ref
            for name in apertureNames:
                apertureList.append(telescopeSiaf[name])
        elif selectedInstrument.lower() == 'miri':
            telescopeSiaf = pysiaf.Siaf(selectedInstrument)
            if selectedAperture.lower() == 'all' :
                apertureNames=['MIRIM_FULL','MIRIM_MASKLYOT','MIRIM_MASK1550','MIRIM_MASK1140','MIRIM_MASK1065']
                V2Ref = -425.0
                V3Ref = -375.0
            else:
                apertureNames=[selectedAperture]    
                V2Ref = telescopeSiaf.apertures[selectedAperture].V2Ref
                V3Ref = telescopeSiaf.apertures[selectedAperture].V3Ref
            for name in apertureNames:
                apertureList.append(telescopeSiaf[name])
        elif selectedInstrument.lower() == 'nircam':
            telescopeSiaf = pysiaf.Siaf(selectedInstrument)
            if selectedAperture.lower() == 'all' :
                apertureNames=['NRCA1_FULL','NRCA1_FULL','NRCA3_FULL','NRCA4_FULL','NRCA5_FULL',
                               'NRCB1_FULL','NRCB1_FULL','NRCB3_FULL','NRCB4_FULL','NRCB5_FULL']       
                V2Ref =    0.0
                V3Ref = -500.0
            else:
                apertureNames=[selectedAperture]    
                V2Ref = telescopeSiaf.apertures[selectedAperture].V2Ref
                V3Ref = telescopeSiaf.apertures[selectedAperture].V3Ref
            for name in apertureNames:
                apertureList.append(telescopeSiaf[name])
        elif selectedInstrument.lower() == 'nirspec':
            telescopeSiaf = pysiaf.Siaf(selectedInstrument)
            if selectedAperture.lower() == 'all' :
                apertureNames=['NRS_FULL_MSA1','NRS_FULL_MSA2','NRS_FULL_MSA3','NRS_FULL_MSA4',
                               'NRS1_FULL','NRS2_FULL']
                V2Ref = +375.0
                V3Ref = -425.0
            else:
                apertureNames=[selectedAperture]    
                V2Ref = telescopeSiaf.apertures[selectedAperture].V2Ref
                V3Ref = telescopeSiaf.apertures[selectedAperture].V3Ref
            for name in apertureNames:
                apertureList.append(telescopeSiaf[name])
        elif selectedInstrument.lower() == 'niriss':
            telescopeSiaf = pysiaf.Siaf(selectedInstrument)
            if selectedAperture.lower() == 'all' :
                apertureNames=['NIS_CEN','NIS_AMIFULL']
                V2Ref = -300.0
                V3Ref = -700.0
            else:
                apertureNames=[selectedAperture]    
                V2Ref = telescopeSiaf.apertures[selectedAperture].V2Ref
                V3Ref = telescopeSiaf.apertures[selectedAperture].V3Ref
            for name in apertureNames:
                apertureList.append(telescopeSiaf[name])
        elif selectedInstrument.lower() == 'all':
            telescopeSiaf = pysiaf.Siaf('FGS')
            apertureNames = ['FGS1_FULL','FGS2_FULL']
            for name in apertureNames:
                apertureList.append(telescopeSiaf[name])
            telescopeSiaf = pysiaf.Siaf('MIRI')
            apertureNames=['MIRIM_FULL','MIRIM_MASKLYOT','MIRIM_MASK1550','MIRIM_MASK1140','MIRIM_MASK1065']
            for name in apertureNames:
                apertureList.append(telescopeSiaf[name])
            telescopeSiaf = pysiaf.Siaf('NIRCAM')
            apertureNames=['NRCA1_FULL','NRCA1_FULL','NRCA3_FULL','NRCA4_FULL','NRCA5_FULL',
                           'NRCB1_FULL','NRCB1_FULL','NRCB3_FULL','NRCB4_FULL','NRCB5_FULL']       
            for name in apertureNames:
                apertureList.append(telescopeSiaf[name])
            telescopeSiaf = pysiaf.Siaf('NIRSPEC')
            apertureNames=['NRS_FULL_MSA1','NRS_FULL_MSA2','NRS_FULL_MSA3','NRS_FULL_MSA4',
                           'NRS1_FULL','NRS2_FULL']
            for name in apertureNames:
                apertureList.append(telescopeSiaf[name])
            telescopeSiaf = pysiaf.Siaf('NIRISS')
            apertureNames=['NIS_CEN','NIS_AMIFULL']
            for name in apertureNames:
                apertureList.append(telescopeSiaf[name])
            V2Ref = 0.0
            V3Ref = 0.0
        else:
             print('Unrecognized instrument')

    elif selectedTelescope.lower() == 'hst':       
        telescopeSiaf = pysiaf.Siaf(selectedTelescope)
        if selectedInstrument.lower() == 'acs':
            if selectedAperture.lower() == 'all' :
                apertureNames=['JWFC1','JWFC2','JHRC','JSBC']
                V2Ref = telescopeSiaf.apertures['JWFCENTER'].V2Ref
                V3Ref = telescopeSiaf.apertures['JWFCENTER'].V3Ref
            else:
                apertureNames=[selectedAperture]    
                V2Ref = telescopeSiaf.apertures[selectedAperture].V2Ref
                V3Ref = telescopeSiaf.apertures[selectedAperture].V3Ref
            for name in apertureNames:
                apertureList.append(telescopeSiaf[name])

        elif selectedInstrument.lower() == 'cos':
            if selectedAperture.lower() == 'all' :
                apertureNames=['LFMAC','LNMAC']
                V2Ref = telescopeSiaf.apertures['LFMAC'].V2Ref
                V3Ref = telescopeSiaf.apertures['LFMAC'].V3Ref
            else:
                apertureNames=[selectedAperture]    
                V2Ref = telescopeSiaf.apertures[selectedAperture].V2Ref
                V3Ref = telescopeSiaf.apertures[selectedAperture].V3Ref
            for name in apertureNames:
                apertureList.append(telescopeSiaf[name])
        elif selectedInstrument.lower() == 'fgs':
            if selectedAperture.lower() == 'all' :
                apertureNames=['FGS1','FGS2','FGS3']
                V2Ref = 0.0
                V3Ref = 0.0
            else:
                apertureNames=[selectedAperture]    
                V2Ref = telescopeSiaf.apertures[selectedAperture].V2Ref
                V3Ref = telescopeSiaf.apertures[selectedAperture].V3Ref
            for name in apertureNames:
                apertureList.append(telescopeSiaf[name])
        elif selectedInstrument.lower() == 'nicmos':
            if selectedAperture.lower() == 'all' :
                apertureNames=['NIC1','NIC2','NIC3']
                V2Ref = telescopeSiaf.apertures['NIC1'].V2Ref
                V3Ref = telescopeSiaf.apertures['NIC1'].V3Ref
            else:
                apertureNames=[selectedAperture]    
                V2Ref = telescopeSiaf.apertures[selectedAperture].V2Ref
                V3Ref = telescopeSiaf.apertures[selectedAperture].V3Ref
            for name in apertureNames:
                apertureList.append(telescopeSiaf[name])
        elif selectedInstrument.lower() == 'stis':
            if selectedAperture.lower() == 'all' :
                apertureNames=['OVIS','ONUV','OFUV']
                V2Ref = telescopeSiaf.apertures['OVIS'].V2Ref
                V3Ref = telescopeSiaf.apertures['OVIS'].V3Ref
            else:
                apertureNames=[selectedAperture]    
                V2Ref = telescopeSiaf.apertures[selectedAperture].V2Ref
                V3Ref = telescopeSiaf.apertures[selectedAperture].V3Ref
            for name in apertureNames:
                apertureList.append(telescopeSiaf[name])
        elif selectedInstrument.lower() == 'wfc3':
            if selectedAperture.lower() == 'all' :
                apertureNames=['IUVIS1','IUVIS2','IIR']
                V2Ref = telescopeSiaf.apertures['IIR'].V2Ref
                V3Ref = telescopeSiaf.apertures['IIR'].V3Ref
            else:
                apertureNames=[selectedAperture]    
                V2Ref = telescopeSiaf.apertures[selectedAperture].V2Ref
                V3Ref = telescopeSiaf.apertures[selectedAperture].V3Ref
            for name in apertureNames:
                apertureList.append(telescopeSiaf[name])
        elif selectedInstrument.lower() == 'all':
            apertureNames=['JWFC1','JWFC2','JHRC','JSBC',
                            'LFMAC',
                            'FGS1','FGS2','FGS3',
                            'NIC1','NIC2','NIC3',
                            'OVIS','ONUV','OFUV',
                            'IUVIS1','IUVIS2','IIR']
            V2Ref = 0.0
            V3Ref = 0.0
        else:
             print('Unrecognized instrument')
        for name in apertureNames:
            apertureList.append(telescopeSiaf[name])
    else:
        print('Unrecognized telescope')
            
    return apertureList, V2Ref, V3Ref
###############################################################
# Find the selected aperture vertices

def getVertices(apertureSiaf):
    if (apertureSiaf.observatory == 'Roman' and apertureSiaf.AperShape == 'QUAD'):
        xVertices = np.array([apertureSiaf.XIdlVert1,apertureSiaf.XIdlVert2,apertureSiaf.XIdlVert3,apertureSiaf.XIdlVert4])        
        yVertices = np.array([apertureSiaf.YIdlVert1,apertureSiaf.YIdlVert2,apertureSiaf.YIdlVert3,apertureSiaf.YIdlVert4])        
       
    if (apertureSiaf.observatory == 'JWST' and apertureSiaf.AperShape == 'QUAD'):
        xVertices = np.array([apertureSiaf.XIdlVert1,apertureSiaf.XIdlVert2,apertureSiaf.XIdlVert3,apertureSiaf.XIdlVert4])        
        yVertices = np.array([apertureSiaf.YIdlVert1,apertureSiaf.YIdlVert2,apertureSiaf.YIdlVert3,apertureSiaf.YIdlVert4])        

    if (apertureSiaf.observatory == 'HST' and (apertureSiaf.AperShape == 'QUAD' or apertureSiaf.AperShape == 'RECT')):
        xVertices = np.array([apertureSiaf.v1x,apertureSiaf.v2x,apertureSiaf.v3x,apertureSiaf.v4x])        
        yVertices = np.array([apertureSiaf.v1y,apertureSiaf.v2y,apertureSiaf.v3y,apertureSiaf.v4y])
    if (apertureSiaf.observatory == 'HST' and apertureSiaf.AperShape == 'CIRC'):
        xVertices = apertureSiaf.V2Ref       
        yVertices = apertureSiaf.V3Ref
    if (apertureSiaf.observatory == 'HST' and apertureSiaf.AperShape == 'PICK'):
        print('Unsupported shape ',apertureSiaf.AperShape)
        xVertices = None       
        yVertices = None
            
    return xVertices, yVertices
###############################################################
# Take the sky coordinates of the aperture vertices and convert to an STC-S string

def computeStcsFootprint(apertureSiaf, skyRa, skyDec):
    if (apertureSiaf.AperShape == 'QUAD' or apertureSiaf.AperShape == 'RECT'):     
        apertureSregion='POLYGON ICRS {:.8f} {:.8f} {:.8f} {:.8f} {:.8f} {:.8f} {:.8f} {:.8f} '.format(skyRa[0],skyDec[0],skyRa[1],skyDec[1],skyRa[2],skyDec[2],skyRa[3],skyDec[3])
    elif apertureSiaf.AperShape == 'CIRC':
        radius = apertureSiaf.maj/3600.0
        apertureSregion='CIRCLE ICRS {} {} {} '.format(skyRa, skyDec, radius)
    #elif apertureSiaf.AperShape == 'PICK':
        #radius = apertureSiaf.maj/3600.0
        #apertureSregion='POLYGON ICRS {} {} {} '.format(skyRa, skyDec, radius)
    else:
        print('Unsupported shape {}').format(apertureSiaf.AperShape)

    return apertureSregion
###############################################################
