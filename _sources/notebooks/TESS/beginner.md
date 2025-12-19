# Beginner Notebooks

These notebooks are a guide to working with TESS data and associated file formats. Much of the content is based on the beginner Kepler notebooks.

| Notebook                                   | Description                                                                                                                                      |
|--------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------|
| Retrieve Data Validation Products          | Use astroquery to retrieve Data Validation Products.                                                                                             |
| Read and Plot a Data Validation Timeseries | Data Validation (DV) timeseries help evaluate the quality of a planet detection.                                                                 |
| Read and Display a Full Frame Image        | A Full Frame Image (FFI) is created when TESS reads out the entire frame of all four of its cameras. Learn to plot an FFI.                       |
| Read and Plot a Light Curve File           | MAST stores light curves that were created using TESS data. Learn how to read and plot them.                                                     |
| Read and Display a Target Pixel File       | A Target Pixel File records the raw and calibrated flux for a target observed by TESS.                                                           |
| Light Curves through Python Requests       | Rather than using astroquery, you can create a Python request to find TESS targets.                                                              |
| Light Curves through TAP                   | TAP is the Virtual Observatory Table Access Protocol; you can use this instead of astroquery or a Python request to get TESS data.               |
| Searching the TESS Input Catalog           | The TESS Input Catalog is a collection of every bright, optically persistent object in the sky. Learn how to search it for a target of interest. |
| TESS 2-minute Cadence Data                 | Although TESS FFIs are created on a 30-minute cadence, other, more frequently sampled data products are available.                               |
| Generating a Cutout                        | FFIs are large files; it is quicker to generate a cutout of your target pixels and turn them into a light curve.                                 |