syntax enable				" Enable syntax processing
set termguicolors

" Use the space key as our leader.
let mapleader = "\<Space>"

" Split edit your vimrc. Type space, v, r in sequence to trigger
nmap <leader>vr :sp $MYVIMRC<cr>

" Source (reload) your vimrc. Type space, s, o in sequence to trigger
nmap <leader>so :source $MYVIMRC<cr>

" Map Ctrl-s to write the file
nmap <C-s> :w<cr>

imap jk <esc>
imap kj <esc>
imap <C-s> <esc>:w<cr>


" OPTIONS

set number				" Display line numbers beside buffer
set nocompatible			" Don't maintain compatibility with Vi
set hidden				" Allow buffer w/o saving
set backspace=indent,eol,start		" Sane backspace behavior
set showcmd				" Show command in bottom bar
set history=1000			" Remember last 1000 commands

" Searching

set ignorecase				" Ignore case when searching
set incsearch				" Search as characters are entered
set hlsearch				" Highlight all matches

" Autorelad vim file when changed on disk
set autoread
au CursorHold * checktime

" Spaces and tabs

set tabstop=4				" 4 space tab
set expandtab				" use spaces for tabs
set softtabstop=4			" 4 space tab
set shiftwidth=4
filetype indent on
filetype plugin on
set autoindent


" AUTOCOMMANDS

" Bind `q` to close the buffer for help files
autocmd Filetype help nnoremap <buffer> q :q<CR>


let python_highlight_all=1
syntax on
