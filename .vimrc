set nocompatible
set hlsearch
set incsearch
set ruler
set number
set history=50
set showcmd
set autoread
set autoindent
set smartindent
set linespace=2
set shiftwidth=2
set softtabstop=2
set cursorline
set expandtab
set nospell
set showmatch
set foldenable
"set foldmethod=indent
set cmdheight=1
set laststatus=2
set backupext=.bak
set ambiwidth=double        
set nobomb
set fileformat=unix
set fileformats=unix,dos,mac
set fileencoding=utf-8      
"set guifont=Monaco:h18
set guifont=Source_Code_Pro_for_Powerline:h18
set iskeyword+=_,$,@,%,#,-
set pastetoggle=<leader>to
set matchpairs=(:),{:},[:],<:>
set relativenumber
set shell=sh

if has("gui_running")
  set guioptions-=L       
  set guioptions-=r       
  set guioptions-=b      
endif

autocmd StdinReadPre * let s:std_in=1
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-markdown'
Plugin 'mattn/emmet-vim'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'tomasr/molokai'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on
filetype off

"NERDTree
autocmd VimEnter * if argc()==0 && !exists("s:std_in") | NERDTree | endif 
let NERDTreeDirArrows=0

"Emmet
let g:user_emmet_mode='a'
let g:user_emmet_expandabbr_key = '<Tab>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

"Theme
syntax enable
"set background=dark
"colorscheme material-theme 
color molokai

"CtrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = 'node_modules'

"Airline
let g:airline#extensions#tabline#enabled = 1

