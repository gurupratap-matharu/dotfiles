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

set number				            " Display line numbers beside buffer
set nocompatible			        " Don't maintain compatibility with Vi
set hidden				            " Allow buffer w/o saving
set backspace=indent,eol,start		" Sane backspace behavior
set showcmd				            " Show command in bottom bar
set history=1000			        " Remember last 1000 commands
set encoding=utf-8                  " Make sure VIM knows about encoding
filetype off


" Searching

set ignorecase				" Ignore case when searching
set incsearch				" Search as characters are entered
set hlsearch				" Highlight all matches

" Autorelad vim file when changed on disk
set autoread
au CursorHold * checktime

" PEP8 indentation for python files
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" Configuration for html, css and js files
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" Flag badwhite space
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h matchh BadWhitespace /\s\+$/


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
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Bundle 'Valloric/YouCompleteMe'

" veer make sure all your plugins are added
" above this

call vundle#end()

filetype indent on
filetype plugin on

