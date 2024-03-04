###############################################################
import matplotlib.pyplot as plt
import numpy as np
import pysiaf

def defineApertures(selectedTelescope, selectedAperture):
    
    # Create lists of individual apertures that make up selected instrument FOV

    if selectedTelescope.lower() == 'roman':
        if selectedAperture == 'WFI':
            referenceAperture = 'WFI_CEN'
            apertureNames = ['WFI01_FULL', 'WFI02_FULL', 'WFI03_FULL', 'WFI04_FULL', 'WFI05_FULL', 'WFI06_FULL', 
                              'WFI07_FULL', 'WFI08_FULL', 'WFI09_FULL', 'WFI10_FULL', 'WFI11_FULL', 'WFI12_FULL', 
                              'WFI13_FULL', 'WFI14_FULL', 'WFI15_FULL', 'WFI16_FULL', 'WFI17_FULL', 'WFI18_FULL']
        elif selectedAperture == 'CGI':
            referenceAperture = 'CGI_CEN'
            apertureNames = ['CGI_CEN']
        elif selectedAperture == 'FOV':
            referenceAperture = 'BORESIGHT'
            apertureNames = ['WFI01_FULL', 'WFI02_FULL', 'WFI03_FULL', 'WFI04_FULL', 'WFI05_FULL', 'WFI06_FULL', 
                              'WFI07_FULL', 'WFI08_FULL', 'WFI09_FULL', 'WFI10_FULL', 'WFI11_FULL', 'WFI12_FULL', 
                              'WFI13_FULL', 'WFI14_FULL', 'WFI15_FULL', 'WFI16_FULL', 'WFI17_FULL', 'WFI18_FULL',
                              'BORESIGHT', 'CGI_CEN', 'WFI_CEN']
        else:
            referenceAperture = selectedAperture
            apertureNames=[selectedAperture]

    if selectedTelescope.lower() == 'jwst':       
        if selectedAperture == 'FGS':
            selectedTelescope=selectedAperture
            referenceAperture='FGS1_FULL'
            apertureNames=['FGS1_FULL','FGS2_FULL']
        elif selectedAperture == 'MIRI':
            selectedTelescope=selectedAperture
            referenceAperture='MIRIM_FULL'
            apertureNames=['MIRIM_FULL']
        elif selectedAperture == 'NIRCAM':
            selectedTelescope=selectedAperture
            referenceAperture='NRCA1_FULL'
            apertureNames=['NRCA1_FULL','NRCA1_FULL','NRCA3_FULL','NRCA4_FULL','NRCA5_FULL',
                           'NRCB1_FULL','NRCB1_FULL','NRCB3_FULL','NRCB4_FULL','NRCB5_FULL']       
        elif selectedAperture == 'NIRISS':
            selectedTelescope=selectedAperture
            referenceAperture='NIS_CEN'
            apertureNames=['NIS_AMIFULL']
        elif selectedAperture == 'NIRSPEC':
            selectedTelescope=selectedAperture
            referenceAperture='NRS_FULL_MSA'
            apertureNames=['NRS_FULL_MSA1','NRS_FULL_MSA2','NRS_FULL_MSA3','NRS_FULL_MSA4',
                           'NRS1_FULL','NRS2_FULL']
        else:
            referenceAperture = selectedAperture
            apertureNames=[selectedAperture]

    if selectedTelescope.lower() == 'hst':       
        if selectedAperture == 'ACS':
            referenceAperture='JWFCENTER'
            apertureNames=['JWFC1','JWFC2','JHRC','JSBC']
        elif selectedAperture == 'COS':
            referenceAperture='LFMAC'
            apertureNames=['LFMAC']
        elif selectedAperture=='FGS':
            referenceAperture='FGS2'
            apertureNames=['FGS1','FGS2','FGS3']
        elif selectedAperture=='NICMOS':
            referenceAperture='NIC1'
            apertureNames=['NIC1','NIC2','NIC3']
        elif selectedAperture=='STIS':
            referenceAperture='OVIS'
            apertureNames=['OVIS','ONUV','OFUV']
        elif selectedAperture=='WFC3':
            referenceAperture='IUVIS1'
            apertureNames=['IUVIS1','IUVIS2','IIR']
        elif selectedAperture == 'FOV':
            referenceAperture='IIR'
            apertureNames=['JWFC1','JWFC2','JHRC','JSBC',
                           #'LFMAC',
                           #'FGS1','FGS2','FGS3',
                           'NIC1','NIC2','NIC3',
                           #'OVIS','ONUV','OFUV',
                           'IUVIS1','IUVIS2','IIR']
        else:
            referenceAperture = selectedAperture
            apertureNames=[selectedAperture]
            
    telescopeSiaf = pysiaf.Siaf(selectedTelescope)
    return referenceAperture, apertureNames, telescopeSiaf

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
            
    return xVertices, yVertices

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

