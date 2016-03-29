
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'						" vundle - Plugin loader

" -- Plugins Helpers

" core
Plugin 'xolox/vim-misc'						" Auto-load Vim scripts (used by vim-easytags) (good!)
Plugin 'Shougo/vimproc.vim'					" Helper used by vimshell

" ui
Plugin 'Shougo/unite.vim'


" -- Vim feature enhancer

Plugin 'sjl/gundo.vim'						" undo tree
Plugin 'szw/vim-ctrlspace'					" Control your space (buffers/tags/workspaces/etc..)
Plugin 'tpope/vim-abolish'					" Helpers for abbreviation, cased substitution & coercion
Plugin 'thinca/vim-visualstar'				" * for visualy selected text

Plugin 'itchyny/lightline.vim'				" statusline builder

" -- Tags managers / users

Plugin 'xolox/vim-easytags'					" ctags file managment and highlighting
Plugin 'majutsushi/tagbar'					" sidebar with arrenged tags of the current file

" -- Insert mode helpers

Plugin 'Raimondi/delimitMate'				" auto insert of second ()''{}[]\"\" etc...
Plugin 'tpope/vim-surround'					" vim-surround
Plugin 'SirVer/ultisnips'					" Advanced snippets

" -- Text refactor / formater

Plugin 'terryma/vim-multiple-cursors'		" multiple cursor
Plugin 'junegunn/vim-easy-align'			" An advanced, easy-to-use Vim alignment plugin.

" -- Syntax checker

Plugin 'scrooloose/syntastic'				" syntastic - as-you-type errors checker

" -- Autocompletion

Plugin 'Valloric/YouCompleteMe'				" Advanced completion engine
"Plugin 'Shougo/neocomplete.vim'				" neocomplete - as-you-type auto-complete

" -- UI

Plugin 'mhinz/vim-startify'					" add a custom startup screen for vim

Plugin 'Bew78LesellB/vim-colors-solarized'	" vim-colors-solarized - favorite colorscheme <3
"Plugin 'NLKNguyen/papercolor-theme'
Plugin 'xterm-color-table.vim'				" Provide some commands to display all cterm colors
Plugin 'ryanoasis/vim-devicons'

" -- File explorer
Plugin 'Shougo/vimfiler.vim'

" Vim Shell
"Plugin 'Shougo/vimshell.vim'

" -- Per language plugins

" Vimperator
Plugin 'superbrothers/vim-vimperator'

" Markdown
Plugin 'gabrielelana/vim-markdown.git'		" markdown advanced syntax highlighter and editor

" C / CPP
Plugin 'octol/vim-cpp-enhanced-highlight'	" Better highlight

" Lua
"Plugin 'xolox/vim-lua-ftplugin'				" Package lua completion (it disable the '"' double completion of delimitMate...)
"Plugin 'xolox/vim-lua-inspect'				" Advanced lua semantic analysis (too heavy)

" ASM
"Plugin 'Shirk/vim-gas'						" Advanced syntax highlighting for GNU Asm

" Arduino
Plugin 'jplaut/vim-arduino-ino'				" Arduino project compilation and deploy
Plugin 'sudar/vim-arduino-syntax'			" Arduino syntax
Plugin 'sudar/vim-arduino-snippets'			" Arduino snippets

" OCaml
Plugin 'the-lambda-church/merlin'			" Context sensitive completion for OCaml + errors + type infos + source browsing
Plugin 'vim-scripts/omlet.vim'				" This mode offers automatic indentation and keyword highlighting

filetype indent on

filetype plugin on
" Enable omni completion
set omnifunc=syntaxcomplete#Complete

set encoding=utf-8

" map leader definition
let mapleader = ","


" always show the statusline
set laststatus=2

" Change color of cursor in insert/normal modes
"
" Start insert mode
let &t_SI = "]12;#009688\007"
" Start replace mode
let &t_SR = "]12;#ff5722\007"

let &t_EI = "]12;white\007"


" Config Helper - TODO: convert as a vim plugin (customizable)
if has('win32') || has ('win64')
	let $VIMHOME = $VIM."/vimfiles"
else
	let $VIMHOME = $HOME."/.vim"
endif

" Configuration file loader

let $TRUE = 1
let $FALSE = 0

function! s:sourceFile(path)
	if filereadable(a:path)
		exec "source " . a:path
		return $TRUE
	endif
	return $FALSE
endfunction

function! s:loadConfigFile(path)
	if s:sourceFile(a:path) == $TRUE
		return
	endif
	if s:sourceFile($VIMHOME . "/config.rc/" . a:path) == $TRUE
		return
	endif
	if s:sourceFile($VIMHOME . "/config.rc/" . a:path . ".rc.vim")
		return
	endif
endfunction

function! s:loadConfigDir(dirpath)
	for filepath in split(globpath("~/.vim/config.rc/" . a:dirpath, "*.rc.vim"), "\n")
		call s:loadConfigFile(filepath)
	endfor
endfunction


"""""""""""""""""""""""""""""""""

call s:loadConfigDir("plugins")


" Disable every gvim gui stuff
if (has("gui"))
	set guioptions=
	set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 11
endif

call s:loadConfigFile("mappings")

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

" Auto indent the next line
set autoindent

" Completion popup
set pumheight=20

" Show non visible chars (tabs/trailing spaces/too long lines/etc..)
set list
set listchars=tab:·\ ,trail:@,precedes:<,extends:>,nbsp:. " how to show differents categories of invisible chars

set scrolloff=3					" minimum lines to keep above and below cursor
set sidescrolloff=16			" minimum chars to keep on the left/right of the cursor
set sidescroll=1				" scroll chars one by one

" Command line options
set wildmenu					" show list instead of just completing
set wildmode=longest:full,full	" command <Tab> completion, list matches, then longest common part, then all.

" setup default fold
"set foldmethod=syntax
"set foldcolumn=2
"set nofoldenable " leave fold open on file open

""" Format options

" Disable auto wrap comment automatically
set formatoptions-=c
set formatoptions-=a

" Enable correct comment join (remove comment start)
set formatoptions+=j

"""

" search
set wildignore+=*.o
set wildignore+=tags

" Default indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab


" TODO Setup X clipboard
" > Use register "* for all yank/delete/change
"""" > Use register "+ for X11 clipboard
"set clipboard=unnamed

"## Setting colorscheme
set t_Co=256
let g:solarized_termcolors = 256
syntax enable " Not 'syntax on' which overrides colorscheme
colorscheme solarized

set background=dark
if (!has("gui_running"))
	set background=light " this is weird but it fixes dark color...
endif


" Nice colors for TabLine
hi TabLineSel term=NONE cterm=NONE ctermfg=187 ctermbg=235 guifg=#eee8d5 guibg=#073642
hi TabLine term=NONE cterm=NONE ctermfg=230 ctermbg=239 guifg=#fdf6e3 guibg=#586e75
hi TabLineFill term=reverse cterm=reverse ctermfg=187 ctermbg=244 guibg=Grey


if has('mouse')
	set mouse=nv " normal & visual
endif

call s:loadConfigFile("autocmd")

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


