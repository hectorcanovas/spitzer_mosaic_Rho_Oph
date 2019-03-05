;Code to rotate the IRAC images.
;
pro doit_1

;Read Original Image ================================
irac_1 = readfits('OPH_ALL_COMB_IRAC1_mosaic.fits', header_1)
irac_2 = readfits('OPH_ALL_COMB_IRAC2_mosaic.fits', header_2)
irac_3 = readfits('OPH_ALL_COMB_IRAC4_mosaic.fits', header_3)


;Align Image to IRAC 4===============================
CUBIC  = -0.7
interp = 2
hastrom, irac_1, header_1, irac_1_al, header_1_al, header_3, CUBIC = CUBIC, interp = interp
hastrom, irac_2, header_2, irac_2_al, header_2_al, header_3, CUBIC = CUBIC, interp = interp

writefits, 'OPH_ALL_COMB_IRAC1_mosaic_wcs_aligned.fits', irac_1_al, header_1_al
writefits, 'OPH_ALL_COMB_IRAC2_mosaic_wcs_aligned.fits', irac_2_al, header_2_al


stop
return
end

