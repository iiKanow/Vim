let mapleader=" "
syntax on
set number
set norelativenumber
set cursorline
set wrap
set showcmd
set wildmenu
set nocompatible
set hlsearch
set incsearch
set ignorecase
set smartcase

noremap K 5k
noremap J 5j
noremap = nzz
noremap - Nzz
noremap <LEADER><CR> :nohlsearch<CR>


map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>
map V :vsplit<CR>
map G :split<CR>

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'

call plug#end()

