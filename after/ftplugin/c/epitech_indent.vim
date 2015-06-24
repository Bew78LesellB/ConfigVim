setlocal tabstop=8 shiftwidth=2 softtabstop=8 noexpandtab
setlocal cindent
setlocal cinkeys=0{,0},!^F 
setlocal cinoptions=>2s,n-s,f0,{s,}0,^-s,L0,l1,b1,+0,c0,C0,(0,us,U1,w0,W0,m1,M0,J1,)30

" Indent all file except the {E.} header, then go back to previous cursor
" location
nnoremap <buffer> <C-f> 10G=G``

setlocal colorcolumn=80
