" LightLine Configuration :

let g:lightline = {
			\ 'colorscheme': 'solarized_dark',
			\ 'enable': {
			\   'statusline': 1,
			\   'tabline': 0,
			\ },
			\ 'active': {
			\   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename', 'readonly', 'modified', 'syntastic'] ],
			\   'right': [ [ 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
			\ },
			\ 'component': {
			\   'readonly': '%{&readonly ? "" : ""}',
			\   'modified': '%{&modified ? "+" : ""}',
			\ },
			\ 'component_expand': {
			\   'syntastic': 'SyntasticStatuslineFlag',
			\ },
			\ 'component_function': {
			\   'filename': 'LightLineFilename',
			\   'fileformat': 'LightLineFileformat',
			\   'filetype': 'LightLineFiletype',
			\   'fileencoding': 'LightLineFileencoding',
			\   'percent': 'LightLinePercent',
			\   'mode': 'LightLineMode',
			\ },
			\ 'component_type': {
			\   'syntastic': 'error',
			\ },
			\ 'separator': { 'left': '', 'right': '' },
			\ 'subseparator': { 'left': '', 'right': '' }
			\ }

function! LightLineFilename()
	let fname = expand('%:t')
	return fname == 'ControlP' ? g:lightline.ctrlp_item :
				\ fname == '__Tagbar__' ? g:lightline.fname :
				\ fname =~ '__Gundo\|NERD_tree' ? '' :
				\ &ft == 'vimfiler' ? vimfiler#get_status_string() :
				\ &ft == 'unite' ? unite#get_status_string() :
				\ &ft == 'vimshell' ? vimshell#get_status_string() :
				\ ('' != fname ? fname : '[No Name]')
endfunction

function! LightLineFileformat()
	return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! LightLineFiletype()
	return strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft'
endfunction

function! LightLineFileencoding()
	return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLinePercent()
	return winwidth(0) > 50 ? line('.') * 100 / line('$') . '%' : ''
endfunction

function! LightLineMode()
	let fname = expand('%:t')
	return fname == '__Tagbar__' ? 'Tagbar' :
				\ fname == '__Gundo__' ? 'Gundo' :
				\ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
				\ fname =~ 'NERD_tree' ? 'NERDTree' :
				\ &ft == 'unite' ? 'Unite' :
				\ &ft == 'vimfiler' ? '' :
				\ &ft == 'vimshell' ? 'VimShell' :
				\ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'
function! TagbarStatusFunc(current, sort, fname, ...) abort
	let g:lightline.fname = a:fname
	return lightline#statusline(0)
endfunction

" TODO: study, why is it a need to update the statusline
augroup AutoSyntastic
	autocmd!
	autocmd BufWritePost * call lightline#update()
augroup END



