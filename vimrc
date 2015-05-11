
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2011 Apr 15

" launch pathogen
execute pathogen#infect() 




" Vim StatusLine configuration :
set laststatus=2		" 2:always show		1:show in splitview		0:never show

" LightLine Configuration :
let g:lightline = {
			\ 'colorscheme': 'solarized_dark',
			\ }


" ==== NERDTree config ====
let g:nerdtree_tabs_open_on_console_startup = 1

" 1: focus nerdtree if opening folder, focus file if opening file
" 2: always focus file at startup
let g:nerdtree_tabs_smart_startup_focus = 2

let g:nerdtree_tabs_autofind = 1

let g:nerdtree_tabs_synchronize_view = 0

nnoremap <M-f> :NERDTreeTabsFind<CR> :wincmd p<CR>



"## Setting colorscheme
set t_Co=256
let g:solarized_termcolors = 256
syntax on
set background=dark
colorscheme solarized
call togglebg#map("<F5>")
call TogBG()
call TogBG()

" Insert a tabulation (Alt + i) in insert mode
set <M-i>=i
inoremap <M-i> <C-V><Tab>

" Indent line in insert mode, then go in normal mode (cursor at bol)
" and stay in normal mode
inoremap <Tab> <Esc>==$

" Indent line in insert mode, and replace the cursor at previous location
" and go back in insert mode
"inoremap <Tab> æ<Esc>==fæxi

" Indent line in normal mode, and replace the cursor at previous location
nnoremap <Tab> ==

nnoremap <C-f> gg=G``

" Toggle relativenumber
nnoremap <M-r>	:set relativenumber! relativenumber?<CR>

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
	finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
	set nobackup		" do not keep a backup file, use versions instead
else
	set backup		" keep a backup file
endif
set history=99		" keep 99 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set hlsearch		" do highlight the serched text
set number
"set incsearch		" do incremental searching

set cursorline		" highlight the current line
set cursorcolumn	" highlight the current column

" ???
map Q gq


" for ctrlp plugin
set runtimepath^=~/.vim/bundle/ctrlp.vim


" run zsh
nnoremap <M-!> :!zsh<CR>


" keep the cursor on current word when searching for current word
nmap * *N




" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
	set mouse=nv " normal & visual
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
	syntax on
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

	" Enable file type detection.
	" Use the default filetype settings, so that mail gets 'tw' set to 72,
	" 'cindent' is on in C files, etc.
	" Also load indent files, to automatically do language-dependent indenting.
	filetype plugin indent on

	" For all text files set 'textwidth' to 78 characters.
	autocmd FileType text setlocal textwidth=78

	" When editing a file, always jump to the last known cursor position.
	" Don't do it when the position is invalid or when inside an event handler
	" (happens when dropping a file on gvim).
	" Also don't do it when the mark is in the first line, that is the default
	" position when opening a file.
	autocmd BufReadPost *
				\ if line("'\"") > 1 && line("'\"") <= line("$") |
				\	 exe "normal! g`\"" |
				\ endif

augroup END

else

	"set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
				\ | wincmd p | diffthis
endif


""""""""""""""""""""""""""""""""""""""""""""""""
" Set backup / swp / undofile dirs in ~/.vim/

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
