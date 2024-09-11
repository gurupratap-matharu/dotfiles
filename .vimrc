" Enable syntax processing
syntax enable

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


" Options
set ruler                           " Show line and column number at bottom
set number                          " Display line numbers beside buffer
set nocompatible			        " Don't maintain compatibility with Vi
set hidden				            " Allow buffer w/o saving
set backspace=indent,eol,start		" Sane backspace behavior
set showcmd				            " Show command in bottom bar
set history=1000			        " Remember last 1000 commands
set encoding=utf-8                  " Make sure VIM knows about encoding
set scrolloff=4                     " Keep atleast 4 lines below cursor
set tags=./tags;/                   " Set path for ctags file


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

" Mapping to switch buffers quickly
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" AUTOCOMMANDS

" Bind `q` to close the buffer for help files
autocmd Filetype help nnoremap <buffer> q :q<CR>
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript :iabbrev <buffer> clog console.log(``)<Left><Left>
autocmd FileType python :iabbrev <buffer> imoprt import

" Comment lines with a shortcut
autocmd FileType javascript nnoremap <buffer> <Leader>c I// <esc>
autocmd FileType python     nnoremap <buffer> <Leader>c I# <esc>


let python_highlight_all=1
syntax on


" set the runtime path to include Vundle and initialize it
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" veer add your plugins below this

Plugin 'vim-scripts/indentpython.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'sheerun/vim-polyglot'
Plugin 'dense-analysis/ale'
Plugin 'vimwiki/vimwiki'
Plugin 'mattn/emmet-vim'
" veer place your themes here
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'zefei/cake16'

" veer make sure all your plugins are added
" above this

call vundle#end()


"Enable the default matchit plugin
packadd! matchit


" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0

" Declare Ale linters
let g:ale_linters = {
\   'javascript':['standard'],
\   'html':['tidy'],
\   'xhtml':['tidy'],
\   'xml':['xmllint'],
\   'css':['stylelint'],
\   'python':['ruff'],
\   'yaml':['yamllint', 'actionlint'],
\}


" Declare Ale fixers
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'html': ['tidy'],
\   'css': ['prettier'],
\   'scss': ['prettier'],
\   'xhtml': ['tidy'],
\   'xml': ['xmllint'],
\   'javascript': ['standard'],
\   'json': ['jq'],
\   'python': ['black', 'isort'],
\}

let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_python_isort_options = '--profile black -l 100'

filetype indent on
filetype plugin on

" set omnifunc=syntaxcomplete#Complete
set omnifunc=ale#completion#OmniFunc
set signcolumn=yes

" Enable completion where available.
" This setting must be set before ALE is loaded.
"
" You should not turn this setting on if you wish to use ALE as a completion
" source for other completion plugins, like Deoplete.
let g:ale_completion_enabled = 1
set completeopt=menuone,noselect
