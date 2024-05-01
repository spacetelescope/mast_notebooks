# Astroquery

## What is Astroquery?
[Astroquery](https://astroquery.readthedocs.io/en/latest/) is a suite of tools for querying online astronomical data sources. There are many modules, each of which are designed to access different datasets, from ALMA to VizieR. The notebooks in this folder use the `astroquery.mast` module to query for data in the MAST Archive.

Releases of astroquery are coordinated by the [astropy project](https://www.astropy.org/index.html).

## For Further Reading
The [`astroquery.mast` readthedocs](https://astroquery.readthedocs.io/en/latest/mast/mast.html) is a great resource for new users. The first half of the readthedocs page is reproduced in the 'beginner_search' notebook.

## Notebooks in this Chapter

| Notebook        | Description                                                                                                                                                  |
|-----------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Beginner Search | An introduction to `astroquery.mast`, covering the three types of queries and data downloads.                                                                |
| Beginner ZCut   | The `zcut` feature enables you to request cutouts from [various deep field surveys](https://mast.stsci.edu/zcut/).                                           |
| Large Downloads | When downloading large datasets, you may encounter timeout errors. This Notebook demonstrates robust queries that are less likely to encounter these issues. |
| Historic Quasar Observations | Much of the data in MAST is archival; from no longer operational missions. Learn to check for archival coverage of your target and analyze the results. |
