
" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=80

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
			\ if line("'\"") > 1 && line("'\"") <= line("$") |
			\	exe "normal! g`\"" |
			\ endif





" Syntastic autocheck
augroup AutoSyntastic
	autocmd!
	autocmd BufReadPost * call s:syntastic()
	autocmd BufWritePost * call s:syntastic()
augroup END

function! s:syntastic()
	SyntasticCheck
	call lightline#update()
endfunction

