set nocompatible
set noswapfile
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
autocmd BufRead,BufNewFile,BufWrite *.conf  set shiftwidth=4
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
set fileformats=unix,dos,mac
set fileencoding=utf-8
set guifont=Source_Code_Pro_for_Powerline:h18
set iskeyword+=_,$,@,%,#,-
set pastetoggle=
set matchpairs=(:),{:},[:]
set relativenumber
set shell=sh
set selection=inclusive
set mouse=a

if has("gui_running")
  set guioptions-=L
  set guioptions-=r
  set guioptions-=b
endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
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
Plugin 'airblade/vim-gitgutter'
Plugin 'Chiel92/vim-autoformat'
Plugin 'easymotion/vim-easymotion'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-markdown'
Plugin 'fatih/vim-go'
Plugin 'rking/ag.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/syntastic'
Plugin 'editorconfig/editorconfig-vim'

call vundle#end()
filetype plugin indent on
" filetype off

let mapleader=';'

" shortcut
nnoremap <Esc><Esc> <Esc>:w<CR>
nnoremap <Tab> V>
nnoremap <S-Tab> V<

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint'

" YCM
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

" nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nnoremap <F5> <ESC>:NERDTreeToggle<CR>
imap <F5> <ESC>:NERDTreeToggle<CR>

" emmet
autocmd FileType html,jsx EmmetInstall
let g:user_emmet_install_global = 0
let g:user_emmet_mode='a'
let g:user_emmet_expandabbr_key = '<Tab>'
let g:user_emmet_settings = {'javascript.jsx': {'extends': 'jsx'}}
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
let g:airline#extensions#tabline#buffer_nr_show = 1

nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>d :bdelete<CR>
nnoremap <Leader>l :ls<CR>

"nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

"vim-jsx
let g:jsx_ext_required = 0

"scss-syntax
autocmd FileType scss set iskeyword+=-
autocmd BufRead,BufNewFile *.scss set filetype=scss.css

"easymotion
let g:EasyMotion_smartcase = 1
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)
map <Leader><leader>. <Plug>(easymotion-repeat)

"vim-multiple-cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"repeat
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

"markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'javascript', 'css', 'sass', 'bash=sh']

"ag
let g:ag_working_path_mode="r"

" repeat
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

"tagbar
nmap <F8> :TagbarToggle<CR>

