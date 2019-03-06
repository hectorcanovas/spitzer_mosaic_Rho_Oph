;Code to rotate the IRAC images
;Examples:
; doit_2, 'OPH_ALL_COMB_IRAC4_mosaic'
; doit_2, 'OPH_ALL_COMB_IRAC1_mosaic_wcs_aligned'
; doit_2, 'OPH_ALL_COMB_IRAC2_mosaic_wcs_aligned'
pro doit_2, inp_img


;Read Original Image ================================
irac  = readfits(inp_img + '.fits', header)
dims  = size(irac)
xdim  = dims[1]
ydim  = dims[2]

;Make the image square-larger =======================
xdim_n  = ydim + 700
xdim_p  = abs(xdim - xdim_n)/2 ; Pivotal point
irac_i  = dblarr(xdim_n, ydim) ; "Intermediate image"
irac_i[xdim_p:xdim_p+xdim-1,*] = irac


;Update reference pixels ============================
crpix_1  = FXPAR(header,'crpix1')
FXADDPAR, header,'crpix1', crpix_1 + xdim_p
FXADDPAR, header,'NAXIS1', xdim_n

window,0
tvfrm,irac_i <30 >0,/asp,/bar,/sample
arrows, header, 400, 200


;Rotate Image and update astrometry =================
r_angle = FXPAR(header,'CROTA2')
hrot, irac_i, header, irac_r, header_r, r_angle, -1, -1, 2

window,1
tvfrm,irac_r <30 >0,/asp,/bar,/sample
arrows, header_r, 400, 200


;Write fits image =====================================
writefits, inp_img + '_rotated.fits', float(irac_r), header_r
stop
return
end
