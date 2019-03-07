# Rho-Oph SFR Color image from Spizer/IRAC mosaics

* Purpose: Combine Spizer/IRAC mosaics to create an infrared color image of the Rho-Ophiuchus Star Forming Region (SFR)
* Input data: Spitzer/IRAC mosaics downloaded from: https://irsa.ipac.caltech.edu/data/SPITZER/C2D/images/OPH/MOSAICS:
  * OPH_ALL_COMB_IRAC1_mosaic.fits (628M)
  * OPH_ALL_COMB_IRAC2_mosaic.fits (629M)
  * OPH_ALL_COMB_IRAC4_mosaic.fits (624M)
* Methods: 
  1. Run IDL codes (NASA/IDL_Pro library & my codes). Examples are given at the header of each code. A directory named "idl_results" storing the processed fits files will be automatically created.
  1. Run the Python Notebooks to create the final image.

* Results: Fig.1 published in first ODISEA paper (Cieza et al. 2018 at http://adsabs.harvard.edu/abs/2019MNRAS.482..698C)

* NOTE: The original mosaic fits files are very heavy so I don't upload them to here. the "doit_1.pro" asks the user for the path to the files before running.
