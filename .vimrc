"Vundle && Plugin
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tomasr/molokai'
Plugin 'scrooloose/nerdtree'
Plugin 'Chiel92/vim-autoformat'

call vundle#end()
filetype plugin indent on  

autocmd StdinReadPre * let s:std_in=1

"Normal Config
set ambiwidth=double
set noswapfile
set nu
set relativenumber
set ts=2
set shiftwidth=4
set tabstop=4
set expandtab
"set guifont=h24
set mouse=a
set backspace=indent,eol,start
set exrc
set secure
set showmatch
set showcmd
"set fileformat=unix
set autoindent
set whichwrap=b,s,<,>,[,]
set matchpairs=(:),[:],{:},<:>
set smartindent
set ruler
set wrap
set encoding=utf-8

filetype off
syntax enable
colorscheme molokai
