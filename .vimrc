set nocompatible
set shell=/bin/zsh
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
set cmdheight=1
set laststatus=2
set backupext=.bak
set ambiwidth=double        
set nobomb
set fileformat=unix
set fileformats=unix,dos,mac
set fileencoding=utf-8      
set guifont=Source_Code_Pro_for_Powerline:h18
set iskeyword+=_,$,@,%,#,-
set pastetoggle=
set matchpairs=(:),{:},[:],<:>
set relativenumber
set shell=sh
set selection=inclusive

if has("gui_running")
  set guioptions-=L       
  set guioptions-=r       
  set guioptions-=b      
endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'mattn/emmet-vim'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tomasr/molokai'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'hail2u/vim-css3-syntax'     
Plugin 'JulesWang/css.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'marijnh/tern_for_vim'
Plugin 'mxw/vim-jsx'
Plugin 'isRuslan/vim-es6'
Plugin 'ap/vim-css-color'
"Plugin 'airblade/vim-gitgutter'

call vundle#end()
filetype plugin indent on
filetype off

let mapleader=';'

"YCM
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

"nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"emmet
let g:user_emmet_mode='a'
let g:user_emmet_expandabbr_key = '<Tab>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

"theme
syntax enable
color molokai

"ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = 'node_modules'

"airline
let g:airline_theme='molokai'
let g:airline_powerline_fonts = 1   
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

"vim-javascript
let javascript_enable_domhtmlcss = 1

"vim-jsx
let g:jsx_ext_required = 0

"scss-syntax
autocmd FileType scss set iskeyword+=-
autocmd BufRead,BufNewFile *.scss set filetype=scss.css

