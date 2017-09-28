set nocompatible
set noswapfile
set hlsearch
set incsearch
set ruler
set number
set history=100
set showcmd
set autoread
set autoindent
set smartindent
set linespace=2
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set cursorline
set nospell
set showmatch
set foldenable
set cmdheight=1
set laststatus=2
set backupext=.bak
set ambiwidth=double
set nobomb
set fileformats=unix,dos,mac
set fenc=utf-8
set fencs=utf-8
set tenc=utf-8
set guifont=Source_Code_Pro_for_Powerline:h18
set iskeyword+=_,$,@,%,#,-
set pastetoggle=
set matchpairs=(:),{:},[:]
set relativenumber
set shell=sh
set selection=inclusive
set mouse=a
set foldmethod=syntax
set foldlevelstart=1
au BufRead,BufNewFile,BufWrite *.conf  set shiftwidth=4

if has("gui_running")
  set guioptions-=L
  set guioptions-=r
  set guioptions-=b
endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'leafgarland/typescript-vim'
Plugin 'ianks/vim-tsx'
Plugin 'Valloric/MatchTagAlways'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'mattn/emmet-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Raimondi/delimitMate'
Plugin 'airblade/vim-gitgutter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/syntastic'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'shougo/unite.vim'
Plugin 'shougo/vimproc.vim'
Plugin 'shougo/neomru.vim'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'altercation/vim-colors-solarized'
Plugin 't9md/vim-choosewin'
Plugin 'fatih/vim-go'

call vundle#end()
filetype plugin indent on

let mapleader=';'

" vim-css3-syntax
setlocal iskeyword+=-

" shortcut
nmap <ESC><ESC> :w<CR>

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{syntasticstatuslineflag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint'
let g:syntastic_html_tidy_quiet_messages = { "level" : "warnings" }

" YCM
let g:ycm_key_list_select_completion = ['<C-n>', '<c-j>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<c-k>']
let g:ycm_autoclose_preview_window_after_completion=1

" nerdtree
au stdinreadpre * let s:std_in=1
nmap <F5> :NERDTreeToggle<CR>

" emmet
au FileType html,jsx,javascript.jsx,typescript.tsx EmmetInstall
let g:user_emmet_install_global = 0
let g:user_emmet_mode='a'
let g:user_emmet_settings = {'javascript.jsx': {'extends': 'jsx'}}

" theme
syntax enable
set background=light
colorscheme solarized
let g:solarized_termcolors=256

" airline
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 1

" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" vim-jsx
let g:jsx_ext_required = 0

" scss-syntax
au FileType scss set iskeyword+=-
au BufRead,BufNewFile *.scss set filetype=scss.css

" vim-multiple-cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" repeat
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

" ag
let g:ag_working_path_mode="r"

" jsdoc
nmap <silent> <C-l> <Plug>(jsdoc)
let g:jsdoc_enable_es6 = 1
let g:jsdoc_user_defined_tags = {
  \ '@author': 'liyunfan1@xiaomi.com',
  \ '@date': strftime('%Y-%m-%d')
  \ }

" unite
nmap <C-x> :Unite -toggle -auto-resize -buffer-name=menu<CR>
nmap <C-p> :Unite -toggle -auto-resize -buffer-name=mixed buffer file_rec/async bookmark<CR>
nmap <C-b> :Unite -toggle -auto-resize -buffer-name=buffer buffer<CR>

call unite#custom#source(
      \ 'file_rec,file_mru,file_rec/async,buffer,grep,locate',
      \ 'ignore_globs',
      \ ['node_modules/', 'output/', 'build/', 'dist/']
      \)
call unite#custom#source(
      \ 'file_rec,file_mru,file_rec/async,buffer,grep,locate',
      \ 'max_candidates',
      \ 99999
      \)

" choosewin
nmap - <Plug>(choosewin)
let g:choosewin_overlay_enable = 1

" vim-go
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_textobj_include_function_doc = 1
let g:go_jump_to_error = 1

" match tag always
let g:mta_use_matchparen_group = 1
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'js': 1,
    \ 'jsx': 1,
    \ 'tsx': 1,
    \ 'ts': 1,
    \ 'css': 1,
    \ 'scss': 1
    \}

" typescript-vim
" setlocal indentkeys+=0

" tsuquyomi
" let g:tsuquyomi_completion_detail = 1
let g:syntastic_typescript_checkers = [] " You shouldn't use 'tsc' checker.

