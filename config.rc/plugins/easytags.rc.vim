let g:easytags_async = 1

" set tags file to current directory
set tags=./tags;
let g:easytags_dynamic_files = 2	" make future tags file to current directory
set cpoptions+=d

" add epitech style functions definitions (with tabs)
let g:easytags_languages = {
			\ 'c': {
			\	'args': [
			\		'--regex-c="/^[^\t]+[\t]+([a-z0-9_]+)\(.*\);?$/\1/f"'
			\		],
			\	}
			\}
