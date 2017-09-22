" LightLine Configuration :

let g:lightline_solarized_background = 'dark'

let g:lightline = {
			\ 'enable': {
			\   'statusline': 1,
			\   'tabline': 0,
			\ },
			\ 'active': {
			\   'left': [ [ 'mode', 'paste' ], [ 'filename', 'readonly', 'modified' ] ],
			\   'right': [ [ 'lineinfo' ], ['percent'], [ 'filetype' ] ],
			\ },
			\ 'inactive': {
			\   'left':  [ [], [ 'relativepath', 'readonly', 'modified'] ],
			\   'right': [ [], ['percent'] ],
			\ },
			\ 'component': {
			\   'readonly': '%{&readonly ? "" : ""}',
			\   'modified': '%{&modified ? "+" : ""}',
			\ },
			\ 'mode_map': {
			\   'n': 'N', 'i': 'I', 'R': 'R',
			\   'v': 'V', 'V': 'VL', "\<C-v>": 'VB',
			\   's': 'S', 'S': 'SL', "\<C-s>": 'SB',
			\   'c': 'C', 't': 'T',
			\   '?': '?',
			\ },
			\ 'component_function': {
			\   'filename': 'LightLineFilename',
			\   'filetype': 'LightLineFiletype',
			\   'percent': 'LightLinePercent',
			\   'mode': 'LightLineMode',
			\ },
			\ 'separator': { 'left': '', 'right': '' },
			\ 'subseparator': { 'left': '', 'right': '' },
			\ }

function! LightLineFilename()
	let fname = expand('%:t')
	return fname == 'ControlP' ? g:lightline.ctrlp_item :
				\ ('' != fname ? fname : '[No Name]')
endfunction

function! LightLineFiletype()
	return strlen(&filetype) ? &filetype : 'no ft'
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
