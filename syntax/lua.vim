

" match 'myfunc()' and 'myfunc   ()'
syn match luaUserFunc "\<[a-zA-Z][a-zA-Z0-9]*\>\ze\s\{-}("

" match 'MyClass' but not 'MYClass' or 'myClass'
syn match luaClass "\<\u\l\w\{-}\>"

syn keyword luaKeyword self contained


" match 'word space =' contained in 'luaTable'
" TODO !! (doesn't work :(  )
"syn match luaTableField "\<\w\{-1,}\>\ze\s\{-}=" containedin=luaTable containedin=ALLBUT,luaFunctionBlock contained













" add luaTableField as NOT ALLOWED
"syn region luaFunctionBlock matchgroup=luaFunction start=/\<function\>/ end=/\<end\>/  transparent contains=ALLBUT,luaTodo,luaSpecial,luaElseifThen,luaElse,luaThenEnd,luaIn,luaTableField




" We should move this in appropriate file ?
hi link luaKeyword Statement

hi luaTable cterm=bold ctermfg=2
hi luaClass cterm=NONE ctermfg=2

hi link luaUserFunc luaFunc


hi luaTableField cterm=reverse ctermfg=162
