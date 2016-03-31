" ==== Syntastic config ====

" Put Syntastic in passive mode, we run a check
" in custom autocmd events
let g:syntastic_check_on_open = 0
let g:syntastic_mode_map = {
			\ "mode": "passive",
			\ }
let g:syntastic_check_on_wq = 0

" Populate Location List

let g:syntastic_always_populate_loc_list = 1

"When set to 2 the error window will be automatically closed when no errors are
"  detected, but not opened automatically. >
let g:syntastic_auto_loc_list = 2
let g:syntastic_loc_list_height = 5

" Symbols

"let g:syntastic_error_symbol   = ""

let g:syntastic_warning_symbol = ""
let g:syntastic_error_symbol   = "█"

" Compilations flags

" CPP
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = '-Wall -Wextra --std=c++11'

" C
let g:syntastic_c_compiler = 'gcc'
let g:syntastic_c_compiler_options = '-Wextra -Wall'
let g:syntastic_c_no_default_include_dirs = 1
