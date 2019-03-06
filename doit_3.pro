;Code to trim the images so it can be easily handled
;Examples:
; doit_3, 'OPH_ALL_COMB_IRAC1_mosaic_wcs_aligned_rotated'
; doit_3, 'OPH_ALL_COMB_IRAC2_mosaic_wcs_aligned_rotated'
; doit_3, 'OPH_ALL_COMB_IRAC4_mosaic_rotated'
pro doit_3, inp_img


;Read Original Image ================================
irac  = readfits(inp_img + '.fits', header)
dims  = size(irac)
xdim  = dims[1]
ydim  = dims[2]


;TRIM the image square-larger =======================
y_0       = 4000
irac_trim = irac[*, y_0:13000]

window,0
tvfrm,irac <30 >0,/asp,/bar,/sample
window,1
tvfrm,irac_trim <30 >0,/asp,/bar,/sample

;Update reference pixels ============================
dims_n   = size(irac_trim)
xdim_n   = dims_n[1]
ydim_n   = dims_n[2]
crpix_2  = FXPAR(header,'crpix2')
FXADDPAR, header,'crpix2', crpix_2 - y_0
FXADDPAR, header,'NAXIS2', ydim_n


;Write fits image =====================================
writefits, inp_img + '_trimmed.fits', irac_trim, header
stop
return
end


OPH_ALL_COMB_IRAC1_mosaic.fits
OPH_ALL_COMB_IRAC1_mosaic_wcs_aligned.fits
OPH_ALL_COMB_IRAC1_mosaic_wcs_aligned_rotated.fits
OPH_ALL_COMB_IRAC2_mosaic.fits
OPH_ALL_COMB_IRAC2_mosaic_wcs_aligned.fits
OPH_ALL_COMB_IRAC2_mosaic_wcs_aligned_rotated.fits
OPH_ALL_COMB_IRAC4_mosaic.fits
OPH_ALL_COMB_IRAC4_mosaic_rotated.fits
OPH_ALL_COMB_IRAC4_mosaic_rotated_trimmed.fits
