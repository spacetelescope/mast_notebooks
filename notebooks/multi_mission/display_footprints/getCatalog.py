#! /usr/bin/env python
# Simple query for gsss catalog using requests interface
# This probably could be done more simply using some of the astropy services, but it is
# helpful to see how it works at a lower level
#
# R. White, 2024 May 15 original example
# B.McLean 2024 May 29 expanded to other search types and created url version for Aladin
# Documentation located at https://outerspace.stsci.edu/display/MASTDATA/Catalog+Access

import requests
from io import BytesIO
from astropy.table import Table

# import pyvo as vo


def gsss_coneSearch(ra, dec, radius, catalog='GSC30', format='votable'):
    serviceurl = 'https://gsss.stsci.edu/webservices/vo/CatalogSearch.aspx'

    # check catalog is allowed
    if catalog not in ('GSC11', 'GSC243', 'GSC30', '2MASS', 'GAIADR3'):
        raise ValueError(
            'catalog must be one of GSC11, GSC243, GSC30, 2MASS, GAIADR3')

    # check format is allowed
    if format not in ('votable', 'csv'):
        raise ValueError('format must be one of votable, csv')

    # set up request with parameters
    params = dict(ra=ra, dec=dec, sr=radius, cat=catalog, format=format)
    r = requests.get(serviceurl, params=params)
    # raise exception on error
    r.raise_for_status()

    # read result into table
    if format == 'csv':
        tab = Table.read(r.text, format='ascii.csv', comment='#')
    else:
        tab = Table.read(BytesIO(r.content), format='votable')
    return tab


def gsss_boxSearch(raMin, decMin, raMax, decMax, catalog='GSC30', format='votable'):
    serviceurl = 'https://gsss.stsci.edu/webservices/vo/CatalogSearch.aspx'

    # check catalog is allowed
    if catalog not in ('GSC11', 'GSC243', 'GSC30', '2MASS', 'GAIADR3'):
        raise ValueError(
            'catalog must be one of GSC11, GSC243, GSC30, 2MASS, GAIADR3')

    # check format is allowed
    if format not in ('votable', 'csv'):
        raise ValueError('format must be one of votable, csv')

    # set up request with parameters
    bbox = str(raMin) + ',' + str(decMin) + ',' + \
        str(raMax) + ',' + str(decMax)
    params = dict(bbox=bbox, cat=catalog, format=format)
    r = requests.get(serviceurl, params=params)
    # raise exception on error
    r.raise_for_status()

    # read result into table
    if format == 'csv':
        tab = Table.read(r.text, format='ascii.csv', comment='#')
    else:
        tab = Table.read(BytesIO(r.content), format='votable')
    return tab


def gsss_stcsSearch(stcs, catalog='GSC30', format='votable'):
    serviceurl = 'https://gsss.stsci.edu/webservices/vo/CatalogSearch.aspx'

    # check catalog is allowed
    if catalog not in ('GSC11', 'GSC243', 'GSC30', '2MASS', 'GAIADR3'):
        raise ValueError(
            'catalog must be one of GSC11, GSC243, GSC30, 2MASS, GAIADR3')

    # check format is allowed
    if format not in ('votable', 'csv'):
        raise ValueError('format must be one of votable, csv')

    # set up request with parameters
    params = dict(cat=catalog, stcs=stcs, format=format)
    r = requests.get(serviceurl, params=params)
    # raise exception on error
    r.raise_for_status()

    # read result into table
    if format == 'csv':
        tab = Table.read(r.text, format='ascii.csv', comment='#')
    else:
        tab = Table.read(BytesIO(r.content), format='votable')
    return tab


def gsss_idSearch(catID, catalog='GSC30', format='votable'):
    serviceurl = 'https://gsss.stsci.edu/webservices/vo/CatalogSearch.aspx'

    # check catalog is allowed
    if catalog not in ('GSC11', 'GSC243', 'GSC30', '2MASS', 'GAIADR3'):
        raise ValueError(
            'catalog must be one of GSC11, GSC243, GSC30, 2MASS, GAIADR3')

    # check format is allowed
    if format not in ('votable', 'csv'):
        raise ValueError('format must be one of votable, csv')

    # set up request with parameters
    params = dict(id=catID, cat=catalog,  format=format)
    r = requests.get(serviceurl, params=params)
    # raise exception on error
    r.raise_for_status()

    # read result into table
    if format == 'csv':
        tab = Table.read(r.text, format='ascii.csv', comment='#')
    else:
        tab = Table.read(BytesIO(r.content), format='votable')
    return tab


def gsss_stcsSearchUrl(stcs, catalog='GSC30', format='votable'):
    serviceurl = 'https://gsss.stsci.edu/webservices/vo/CatalogSearch.aspx'

    # check catalog is allowed
    if catalog not in ('GSC11', 'GSC243', 'GSC30', '2MASS', 'GAIADR3'):
        raise ValueError(
            'catalog must be one of GSC11, GSC243, GSC30, 2MASS, GAIADR3')

    # build simple parameterized request url
    stcs = stcs.rstrip()
    stcs = stcs.replace(' ', '+')
    url = serviceurl + '?CAT=' + catalog + '&FORMAT=' + format + '&STCS=' + stcs

    return url


if __name__ == '__main__':

    # Example calls
    print('StcsSearch')
    tab = gsss_stcsSearch('CIRCLE 83.633083 -22.0145 0.01', format='csv')
    print(tab)
    print('\n')

    print('StcsSearch')
    tab = gsss_stcsSearch(
        'POLYGON 180.428742 -18.893042 180.455582 -18.906816 180.488081 -18.858382 180.461245 -18.84461 180.428742 -18.893042', catalog='2MASS')
    print(tab)
    print('\n')

    print('StcsSearchUrl')
    url = gsss_stcsSearchUrl(
        'POLYGON 180.428742 -18.893042 180.455582 -18.906816 180.488081 -18.858382 180.461245 -18.84461 180.428742 -18.893042', catalog='2MASS')
    print(url)
    print('\n')

    print('StcsSearchUrl')
    url = gsss_stcsSearchUrl('POLYGON ICRS 180.48076550 -18.90746286 180.36817811 -18.84599471 180.30142864 -18.95458865 180.41432099 -19.01546832 POLYGON ICRS 180.61337499 -18.98023404 180.50312512 -18.92019002 180.43676136 -19.02805554 180.54742848 -19.08735321 POLYGON ICRS 180.73180882 -19.04512674 180.62417451 -18.98663388 180.55826413 -19.09366679 180.66641297 -19.15127114 POLYGON ICRS 180.38476223 -19.01148376 180.27151502 -18.95039598 180.20444240 -19.05820395 180.31779889 -19.11865545 POLYGON ICRS 180.51784519 -19.08456614 180.40670457 -19.02503169 180.33977788 -19.13204690 180.45115278 -19.19078688 POLYGON ICRS 180.63621633 -19.14933193 180.52749585 -19.09145779 180.46082317 -19.19758215 180.56989072 -19.25453642 POLYGON ICRS 180.25335389 -19.09618812 180.13933659 -19.03514272 180.07241672 -19.14183101 180.18632000 -19.20224512 POLYGON ICRS 180.38735634 -19.16989687 180.27504199 -19.11044795 180.20799062 -19.21633154 180.32031836 -19.27498977 POLYGON ICRS 180.50441635 -19.23522897 180.39414431 -19.17747224 180.32711227 -19.28245617 180.43751048 -19.33930232 POLYGON ICRS 180.55186501 -18.79003011 180.43978571 -18.72802620 180.37369416 -18.83696491 180.48624657 -18.89847599 POLYGON ICRS 180.68422620 -18.86286330 180.57459440 -18.80208536 180.50908867 -18.91041251 180.61929164 -18.97052512 POLYGON ICRS 180.80236003 -18.92794523 180.69543451 -18.86855323 180.63056183 -18.97614645 180.73814330 -19.03472259 POLYGON ICRS 180.59805274 -18.65938855 180.48626383 -18.59681364 180.42103650 -18.70560914 180.53344622 -18.76782628 POLYGON ICRS 180.73061197 -18.73228130 180.62127088 -18.67067106 180.55680842 -18.77901247 180.66685926 -18.84007709 POLYGON ICRS 180.84833093 -18.79722860 180.74166672 -18.73677286 180.67800074 -18.84451218 180.78542545 -18.90427161 POLYGON ICRS 180.60897167 -18.50998880 180.49711324 -18.44690783 180.43278142 -18.55497840 180.54537773 -18.61789326 POLYGON ICRS 180.74222983 -18.58314454 180.63263703 -18.52068177 180.56922676 -18.62850933 180.67962961 -18.69061808 POLYGON ICRS 180.85952385 -18.64657059 180.75243600 -18.58495039 180.68994762 -18.69236940 180.79789349 -18.75348418', catalog='2MASS')
    print(url)
    print('\n')

    print('ConeSearch')
    tab = gsss_coneSearch(180.0, 30.0, 0.05)
    print(tab)
    print('\n')

    print('BoxSearch')
    tab = gsss_boxSearch(180.0, 30.0, 180.05, 30.05)
    print(tab)
    print('\n')

    print('IdSearch')
    tab = gsss_idSearch('NBQI004317')
    print(tab)
    print('\n')
