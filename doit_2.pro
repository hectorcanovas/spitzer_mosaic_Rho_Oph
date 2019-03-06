;Rotate IRAC images so North (East) is Up (Left)
;Examples:
; doit_2, '/Users/hcanovas/Astrofisica/papers/published/2018_cieza_git/fits_data/*IRAC4_mosaic*'
; doit_2, 'idl_results/*IRAC1*aligned*'
; doit_2, 'idl_results/*IRAC2*aligned*'
pro doit_2, inp_img


;Read Original Image ================================
inp_img = file_search(inp_img)
irac    = readfits(inp_img, header)
dims    = size(irac)
xdim    = dims[1]
ydim    = dims[2]

;Make the image square-larger =======================
xdim_n  = ydim + 700
xdim_p  = abs(xdim - xdim_n)/2 ; Pivotal point
irac_i  = dblarr(xdim_n, ydim) ; "Intermediate image"
irac_i[xdim_p:xdim_p+xdim-1,*] = irac


;Update reference pixels ============================
crpix_1  = FXPAR(header,'crpix1')
FXADDPAR, header,'crpix1', crpix_1 + xdim_p
FXADDPAR, header,'NAXIS1', xdim_n


;Rotate Image and update astrometry =================
r_angle = FXPAR(header,'CROTA2')
hrot, irac_i, header, irac_r, header_r, r_angle, -1, -1, 2


;Plot Images ========================================
window,0, XSIZE=1200, YSIZE=500
device,true_color=24,retain=2,decomposed=0
loadct,39     ; Load Rainbow Color Table

!p.multi = [0,2,1]

tvfrm,irac_i <30 >0,/asp,/bar,/sample, title = 'Input Image'
arrows, header, 15000, 2000,/data

tvfrm,irac_r <30 >0,/asp,/bar,/sample, title = 'Rotated Image'
arrows, header_r, 15000, 2000,/data
!p.multi = 0


;Write fits image =====================================
ndir  = 'idl_results/'
pos_1 = strpos(inp_img,'/',/reverse_search)
pos_2 = strpos(inp_img,'.fits')
nname = strmid(inp_img,pos_1+1,pos_2 - pos_1 - 1)
writefits, ndir + nname + '_rotated.fits', float(irac_r), header_r
stop
return
end
