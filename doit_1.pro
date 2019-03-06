;Align IRAC 1 & 2 mosaics to IRAC 4 mosaic using header astrometry.
pro doit_1

;Read Original Image ================================
path   = '/Users/hcanovas/Astrofisica/papers/published/2018_cieza_git/fits_data/'
irac_1 = readfits(path + 'OPH_ALL_COMB_IRAC1_mosaic.fits', header_1)
irac_2 = readfits(path + 'OPH_ALL_COMB_IRAC2_mosaic.fits', header_2)
irac_3 = readfits(path + 'OPH_ALL_COMB_IRAC4_mosaic.fits', header_3)


;Align Image to IRAC 4 ==============================
CUBIC  = -0.7
interp = 2
hastrom, irac_1, header_1, irac_1_al, header_1_al, header_3, CUBIC = CUBIC, interp = interp
hastrom, irac_2, header_2, irac_2_al, header_2_al, header_3, CUBIC = CUBIC, interp = interp

writefits, 'OPH_ALL_COMB_IRAC1_mosaic_wcs_aligned.fits', irac_1_al, header_1_al
writefits, 'OPH_ALL_COMB_IRAC2_mosaic_wcs_aligned.fits', irac_2_al, header_2_al
writefits, 'OPH_ALL_COMB_IRAC4_mosaic.fits',             irac_3, header_3 ; Copy file to working directory



stop
return
end
