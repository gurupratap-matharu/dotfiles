syntax enable				" Enable syntax processing

" Use the space key as our leader.
let mapleader = "\<Space>"

" Split edit your vimrc. Type space, v, r in sequence to trigger
nmap <leader>vr :sp $MYVIMRC<cr>

" Source (reload) your vimrc. Type space, s, o in sequence to trigger
nmap <leader>so :source $MYVIMRC<cr>

" Map Ctrl-s to write the file
nmap <C-s> :w<cr>

" Copy and paste from VIM buffer to clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" To get out of insert mode quickly
imap jk <esc>
imap kj <esc>

" Save file with ctrl-s in insert mode
imap <C-s> <esc>:w<cr>


" OPTIONS
set ruler                           " Show line and column number at bottom
set number				            " Display line numbers beside buffer
set nocompatible			        " Don't maintain compatibility with Vi
set hidden				            " Allow buffer w/o saving
set backspace=indent,eol,start		" Sane backspace behavior
set showcmd				            " Show command in bottom bar
set history=1000			        " Remember last 1000 commands
set encoding=utf-8                  " Make sure VIM knows about encoding
set scrolloff=4                     " Keep atleast 4 lines below cursor


" Searching

set ignorecase				" Ignore case when searching
set incsearch				" Search as characters are entered
set hlsearch				" Highlight all matches

" Autorelad vim file when changed on disk
set autoread

" Spaces and tabs

set tabstop=4				" 4 space tab
set expandtab				" use spaces for tabs
set softtabstop=4			" 4 space tab
set shiftwidth=4
set autoindent

" Folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" AUTOCOMMANDS

" Bind `q` to close the buffer for help files
autocmd Filetype help nnoremap <buffer> q :q<CR>


let python_highlight_all=1
syntax on


" set the runtime path to include Vundle and initialize it
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" veer add your plugins below this

Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'sheerun/vim-polyglot'
Plugin 'dense-analysis/ale'

" veer make sure all your plugins are added
" above this

call vundle#end()

" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0

filetype indent on
filetype plugin on
