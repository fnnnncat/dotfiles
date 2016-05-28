set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'mattn/emmet-vim'
Plugin 'ap/vim-css-color'
Plugin 'tomasr/molokai'
Plugin 'fatih/vim-go'
Plugin 'SirVer/ultisnips'
Plugin 'wincent/command-t'
Plugin 'scrooloose/nerdtree'
Plugin 'Chiel92/vim-autoformat'

call vundle#end()
filetype plugin indent on  

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


filetype off
set nu
set nocompatible
syntax enable
colorscheme molokai
set ts=2
set shiftwidth=4
set tabstop=4
set expandtab
set guifont=Source_Code_Pro:h24
set mouse=a
set backspace=indent,eol,start
set exrc
set secure

let g:CommandTMaxFiles=20000

set wildignore+=node_modules,Applications

