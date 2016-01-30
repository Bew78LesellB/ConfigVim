" Enable Omni completion
let g:lua_complete_omni = 1

" don't complete theses modules (as they can be long to load)
let g:lua_omni_blacklist = ['pl\.strict', 'lgi', 'lgi\..*']

" Only load builtin lua modules (lightweight completion)
"let g:lua_safe_omni_modules = 1
