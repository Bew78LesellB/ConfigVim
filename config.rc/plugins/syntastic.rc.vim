" ==== Syntastic config ====
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
" do not check synthax when closing the buffer window
let g:syntastic_check_on_wq = 0


"Use c++11
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++11'

let g:syntastic_c_compiler = 'gcc'
let g:syntastic_c_compiler_options = ' -Wextra -Wall -Werror'
let g:syntastic_c_no_default_include_dirs = 1
