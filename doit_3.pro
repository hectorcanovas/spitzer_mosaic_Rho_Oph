;Trim the aligned & rotated images
;Examples:
; doit_3, 'idl_results/*IRAC1_mosaic_wcs_aligned_rotated.fits'
; doit_3, 'idl_results/*IRAC2_mosaic_wcs_aligned_rotated.fits'
; doit_3, 'idl_results/*IRAC4_mosaic_rotated.fits'
pro doit_3, inp_img


;Read Original Image ================================
inp_img = file_search(inp_img)
irac    = readfits(inp_img, header)
dims    = size(irac)
xdim    = dims[1]
ydim    = dims[2]


;TRIM the image square-larger =======================
y_0       = 4000
irac_trim = irac[*, y_0:13000]


;Plot Images ========================================
window,0, XSIZE=1200, YSIZE=500
device,true_color=24,retain=2,decomposed=0
loadct,39     ; Load Rainbow Color Table
!p.multi = [0,2,1]

tvfrm,irac      <30 >0,/asp,/bar,/sample
tvfrm,irac_trim <30 >0,/asp,/bar,/sample
!p.multi = 0

;Update reference pixels ============================
dims_n   = size(irac_trim)
xdim_n   = dims_n[1]
ydim_n   = dims_n[2]
crpix_2  = FXPAR(header,'crpix2')
FXADDPAR, header,'crpix2', crpix_2 - y_0
FXADDPAR, header,'NAXIS2', ydim_n


;Write fits image ===================================
ndir  = 'idl_results/'
pos_1 = strpos(inp_img,'/',/reverse_search)
pos_2 = strpos(inp_img,'.fits')
nname = strmid(inp_img,pos_1+1,pos_2 - pos_1 - 1)

writefits, ndir + nname + '_trimmed.fits', irac_trim, header

stop
return
end
