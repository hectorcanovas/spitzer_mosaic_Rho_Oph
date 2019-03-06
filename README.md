# Rho-Oph SFR Color image from Spizer/IRAC mosaics

* Purpose: Combine Spizer/IRAC mosaics to create an infrared color image of the Rho-Ophiuchus Star Forming Region (SFR)
* Input data: Spitzer/IRAC mosaics downloaded from: https://irsa.ipac.caltech.edu/data/SPITZER/C2D/images/OPH/MOSAICS:
  * OPH_ALL_COMB_IRAC1_mosaic.fits (628M)
  * OPH_ALL_COMB_IRAC2_mosaic.fits (629M)
  * OPH_ALL_COMB_IRAC4_mosaic.fits (624M)
* Methods: 
  1.- Run IDL codes (NASA/IDL_Pro library & my codes tools). Examples are given at the header of each code. A directory named "idl_results" storing the created fit files will be automatically created.
  2.- Run the Python Notebooks to create the final image.

* Results: Fig.1 published in first ODISEA paper (Cieza et al. 2018 at http://adsabs.harvard.edu/abs/2019MNRAS.482..698C)
* NOTE: given the size of the mosaic images  I don't upload them to here.
