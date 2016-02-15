
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'						" vundle - Plugin loader

Plugin 'sjl/gundo.vim'						" undo tree
Plugin 'Raimondi/delimitMate'				" auto insert of second ()''{}[]\"\" etc...
Plugin 'itchyny/lightline.vim'				" statusline highlight
Plugin 'scrooloose/syntastic'				" syntastic - as-you-type errors checker
Plugin 'gabrielelana/vim-markdown.git'		" markdown advanced syntax highlighter and editor

Plugin 'mhinz/vim-startify'					" add a custom startup screen for vim

Plugin 'xolox/vim-misc'						" Auto-load Vim scripts (used by vim-easytags) (good!)
Plugin 'xolox/vim-easytags'					" ctags file managment and highlighting
Plugin 'majutsushi/tagbar'					" sidebar with arrenged tags of the current file

Plugin 'tpope/vim-abolish'					" Helpers for abbreviation, cased substitution & coercion
Plugin 'tpope/vim-surround'					" vim-surround
Plugin 'terryma/vim-multiple-cursors'		" multiple cursor
Plugin 'SirVer/ultisnips'					" snippets

Plugin 'Shougo/neocomplete.vim'				" neocomplete - as-you-type auto-complete
Plugin 'szw/vim-ctrlspace'					" Control your space (buffers/tags/workspaces/etc..)

Plugin 'superbrothers/vim-vimperator'

Plugin 'Bew78LesellB/vim-colors-solarized'	" vim-colors-solarized - favorite colorsheme <3
Plugin 'NLKNguyen/papercolor-theme'

Plugin 'Shougo/unite.vim'

" File explorer
Plugin 'Shougo/vimfiler.vim'

Plugin 'xterm-color-table.vim'				" Provide some commands to display all cterm colors

" Vim Shell
Plugin 'Shougo/vimshell.vim'
Plugin 'Shougo/vimproc.vim'					" Helper for vimshell

" C / CPP
"Plugin 'vim-scripts/OmniCppComplete'		" CPP contextual completion
Plugin 'octol/vim-cpp-enhanced-highlight'	" Better highlight
"Plugin 'Rip-Rip/clang_complete'			" Advanced completion using clang

" Lua
Plugin 'xolox/vim-lua-ftplugin'				" Advanced lua completion
"Plugin 'xolox/vim-lua-inspect'				" Advanced lua semantic analysis (too heavy)

" OCaml
Plugin 'the-lambda-church/merlin'			" Context sensitive completion for OCaml + errors + type infos + source browsing

Plugin 'ryanoasis/vim-devicons'

filetype indent on

filetype plugin on
" Enable omni completion
set omnifunc=syntaxcomplete#Complete

set encoding=utf-8

" map leader definition
let mapleader = ","


" always show the statusline
set laststatus=2


" Config Helper - TODO: convert as a vim plugin (customizable)
function! s:loadConfigFile(path)
	if filereadable(a:path)
		exec "source " . a:path
	endif
endfunction

function! s:loadConfigDir(dirpath)
	for filepath in split(globpath("~/.vim/config.rc/" . a:dirpath, "*.vim"), "\n")
		call s:loadConfigFile(filepath)
	endfor
endfunction


call s:loadConfigDir("plugins")


" Disable every gvim gui stuff
if (has("gui"))
	set guioptions=
	set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 11
endif

" Always move in normal mode
inoremap <Left> <nop>
inoremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>

" Save buffer
nnoremap <M-Space> :w<cr>
inoremap <M-Space> <Esc>:w<cr>

nnoremap <C-s> :w<cr>
inoremap <C-s> <Esc>:w<cr>

" Toggle wrap
nnoremap <M-w> :set wrap! wrap?<cr>


"## Setting colorscheme
set t_Co=256
let g:solarized_termcolors = 256
syntax on
colorscheme solarized

set background=dark
if (!has("gui_running"))
	set background=light " this is weird but it fixes dark color...
endif


" Nice colors for TabLine
hi TabLineSel term=NONE cterm=NONE ctermfg=187 ctermbg=235 guifg=#eee8d5 guibg=#073642
hi TabLine term=NONE cterm=NONE ctermfg=230 ctermbg=239 guifg=#fdf6e3 guibg=#586e75
hi TabLineFill term=reverse cterm=reverse ctermfg=187 ctermbg=244 guibg=Grey



" Map the Menu key to do nothing (default will Escape..)
"set <F7>=[29~
"noremap <F7> <nop>

" Open Tagbar
nnoremap <F8> :TagbarToggle<CR>

" Launch SyntasticCheck
nnoremap <M-m> :SyntasticCheck<CR>

" Open a zsh at cwd
nnoremap <M-z> :!zsh<cr>

" Discard last search highlight
nnoremap <silent> § :noh \| echo "Search cleared"<cr>

" Goto tabs
nnoremap <M-J> gT
nnoremap <M-K> gt
inoremap <M-J> <esc>gT
inoremap <M-K> <esc>gt

" Insert a tabulation (Alt + i) in insert mode
set <M-i>=é
inoremap <M-i> <C-V><Tab>
nnoremap <M-i> <nop>

" Indent line in normal mode
nnoremap <Tab> mi==`i
inoremap <Tab> <Esc>mi==`il

" Indent visual selection
vnoremap <Tab> :'<,'>normal! ==<cr>

" Format the file
nnoremap <C-f> gg=G``

" Toggle relativenumber
nnoremap <M-r>	:set relativenumber! relativenumber?<CR>

" Show highlight infos
nmap <F2> :echom "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" <CR>

" Toggle PASTE mode
nnoremap <M-p> :set paste! paste?<CR>

" Copy/Paste with system clipboard
" > copy from visual mode
vnoremap <M-c> :'<,'>w !xclip -in -selection clipboard<cr>
" > paste in normal mode
nnoremap <silent> <M-v> :r !xclip -out -selection clipboard<cr>

" ask for sudo passwd and save the file
cnoremap w!! w !sudo tee % >/dev/null


" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first make a new undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" logical undo
nnoremap U <C-r>

"
" OPTIONS
"

" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set backup		" keep a backup file

set history=99		" keep 99 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands

set hlsearch		" do highlight the serched text

" apply smart case searching
set ignorecase
set smartcase

set number
set relativenumber

set cursorline		" highlight the current line
set cursorcolumn	" highlight the current column

set hidden

set timeoutlen=300

" Auto indent the next lie
set autoindent

" Show non visible chars (tabs/trailing spaces/too long lines/etc..)
set list
set listchars=tab:·\ ,trail:@,precedes:<,extends:>,nbsp:. " how to show differents categories of invisible chars

set scrolloff=3					" minimum lines to keep above and below cursor
set sidescrolloff=16			" minimum chars to keep on the left/right of the cursor
set sidescroll=1				" scroll chars one by one

" Command line options
set wildmenu					" show list instead of just completing
set wildmode=longest:full,full	" command <Tab> completion, list matches, then longest common part, then all.


" search
set wildignore+=*.o
set wildignore+=tags

" TODO Setup X clipboard
" > Use register "* for all yank/delete/change
"""" > Use register "+ for X11 clipboard
"set clipboard=unnamed


if has('mouse')
	set mouse=nv " normal & visual
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
	syntax on
endif

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

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
				\ | wincmd p | diffthis
endif


""""""""""""""""""""""""""""""""""""""""""""""""
" Set backup / swp / undo dirs in ~/.vim/

" Save your backups to a less annoying place than the current directory.
" If you have .vim-backup in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/backup or . if all else fails.
if isdirectory($HOME . '/.vim/backup') == 0
	:silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
	:silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
	" undofile - This allows you to use undos after exiting and restarting
	" This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
	" :help undo-persistence
	" This is only present in 7.3+
	if isdirectory($HOME . '/.vim/undo') == 0
		:silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
	endif
	set undodir=./.vim-undo//
	set undodir+=~/.vim/undo//
	set undofile
endif


"###### DEFAULT INDENTATION ######
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab


" 'tabstop' changes the width of the TAB character, plain and simple.
"
" 'softtabstop' affects what happens when you press the <TAB> or <BS> keys. Its default value is the same as the value of 'tabstop', but when using indentation without hard tabs or mixed indentation, you want to set it to the same value as 'shiftwidth'. If 'expandtab' is unset, and 'tabstop' is different from 'softtabstop', the <TAB> key will minimize the amount of spaces inserted by using multiples of TAB characters. For instance, if 'tabstop' is 8, and the amount of consecutive space inserted is 20, two TAB characters and four spaces will be used.
"
" 'shiftwidth' affects what happens when you press >>, << or ==. It also affects how automatic indentation works. (See below.)
"
" 'expandtab' affects what happens when you press the <TAB> key. If 'expandtab' is set, pressing the <TAB> key will always insert 'softtabstop' amount of space characters. Otherwise, the amount of spaces inserted is minimized by using TAB characters.
"
" 'smarttab' affects how <TAB> key presses are interpreted depending on where the cursor is. If 'smarttab' is on, a <TAB> key inserts indentation according to 'shiftwidth' at the beginning of the line, whereas 'tabstop' and 'softtabstop' are used elsewhere. There is seldom any need to set this option, unless it is necessary to use hard TAB characters in body text or code.
