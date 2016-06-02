let g:easytags_async = 1

" set tags file to current directory
set tags=./tags;
set cpoptions+=d

" make future tags file in current directory
let g:easytags_dynamic_files = 2

"let g:easytags_file = '~/.vim/globaltags'
let g:easytags_by_filetype = '~/.vim/ft-tags/'

let g:easytags_resolve_links = 1

" Include struct / class members in tag file
" (can make tag file a lot bigger)
let g:easytags_include_members = 1



" Add tag kinds

" Lua

call xolox#easytags#define_tagkind({
      \ 'filetype': 'lua',
      \ 'hlgroup': 'luaVariable',
      \ 'tagkinds': 'v'})

" C/C++

call xolox#easytags#define_tagkind({
      \ 'filetype': 'cpp',
      \ 'hlgroup': 'cVariable',
      \ 'tagkinds': '[vl]'})
