let g:easytags_async = 1

" set tags file to current directory
set tags=./tags;
set cpoptions+=d

" make future tags file in current directory
let g:easytags_dynamic_files = 2

let g:easytags_file = '~/.vim/globaltags'

let g:easytags_resolve_links = 1

" add epitech style functions definitions (with tabs)
let g:easytags_languages = {
			\ 'c': {
			\	'args': [
			\		'--regex-c="/^[^\t]+[\t]+([a-z0-9_]+)\(.*\);?$/\1/f"'
			\		],
			\	}
			\}

" Include struct / class members in tag file
" (can make tag file a lot bigger)
let g:easytags_include_members = 1
