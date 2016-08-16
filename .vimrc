"Vundle && Plugin
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ap/vim-css-color'
Plugin 'tomasr/molokai'
Plugin 'scrooloose/nerdtree'
Plugin 'Chiel92/vim-autoformat'
Plugin 'mattn/emmet-vim'
Plugin 'asins/vimcdoc'

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
"set guifont=Source_Code_Pro:h24
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

filetype off
syntax enable
colorscheme molokai

"Emmet Config
let g:user_emmet_mode='a'
let g:user_emmet_leader_key = '<Tab>'

"NERDTree Config
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif "Auto Start NERDTree 
map <C-T> :NERDTree<CR>

"Help Doc
let helptags=$VIM."/vimfiles/doc"
set helplang=cn

"Shortcut
map <C-Z> u
map <C-S> :w
map <C-Y> <C-R>
map <C-C> yy
map <C-X> dd
map <C-V> p
map q :q
