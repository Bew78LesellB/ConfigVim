let g:easytags_async = 1

" set tags file to current directory
set tags=./tags;
set cpoptions+=d
let g:easytags_dynamic_files = 2	" make future tags file to current directory
let g:easytags_file = '~/.vim/globaltags'

" add epitech style functions definitions (with tabs)
let g:easytags_languages = {
			\ 'c': {
			\	'args': [
			\		'--regex-c="/^[^\t]+[\t]+([a-z0-9_]+)\(.*\);?$/\1/f"'
			\		],
			\	}
			\}
