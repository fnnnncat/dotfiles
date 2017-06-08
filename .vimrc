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
au BufRead,BufNewFile,BufWrite *.conf  set shiftwidth=4
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

  if has("gui_running")
  set guioptions-=L
  set guioptions-=r
  set guioptions-=b
endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-Plugin'
Plugin 'mattn/emmet-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tomasr/molokai'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Raimondi/delimitMate'
Plugin 'ap/vim-css-color'
Plugin 'airblade/vim-gitgutter'
Plugin 'Chiel92/vim-autoformat'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-markdown'
Plugin 'fatih/vim-go'
Plugin 'rking/ag.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/syntastic'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'justinj/vim-react-snippets'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'shougo/unite.vim'
Plugin 'shougo/vimproc.vim'
Plugin 'shougo/neomru.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'stephpy/vim-yaml'
Plugin 'junegunn/vim-emoji'

call vundle#end()
filetype plugin indent on

let mapleader=';'

" YCM
let g:ycm_autoclose_preview_window_after_completion=1

" gitgutter
let g:gitgutter_sign_added = emoji#for('shit')
let g:gitgutter_sign_modified = emoji#for('imp')
let g:gitgutter_sign_removed = emoji#for('fearful')
let g:gitgutter_sign_modified_removed = emoji#for('new_moon_with_face')

" shortcut
nmap <ESC><ESC> :w<CR>
nmap <tab> v>
nmap <s-tab> v<
nmap <silent> <LEFT> :tabprevious<CR>
nmap <silent> <RIGHT> :tabnext<CR>

" vim-autoformat
nmap <F3> :Autoformat<CR>

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

" ycm
let g:ycm_key_list_select_completion = ['<C-n>', '<c-j>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<c-k>']

" nerdtree
au stdinreadpre * let s:std_in=1
au vimenter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nmap <F5> :NERDTreeToggle<CR>

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" emmet
au FileType html,jsx,javascript.jsx EmmetInstall
let g:user_emmet_install_global = 0
let g:user_emmet_mode='a'
let g:user_emmet_expandabbr_key = '<Tab>'
let g:user_emmet_settings = {'javascript.jsx': {'extends': 'jsx'}}
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" theme
syntax enable
color molokai

" airline
let g:airline_theme='molokai'
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

" markdown
au BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'javascript', 'css', 'sass', 'bash=sh']

" ag
let g:ag_working_path_mode="r"

" tagbar
nmap <F8> :TagbarToggle<CR>

" jsdoc
nmap <silent> <C-l> <Plug>(jsdoc)

" unite
nmap <C-p> :Unite -toggle -auto-resize -buffer-name=mixed buffer file_rec/async bookmark<CR>
call unite#custom#source('file_rec,file_mru,file_rec/async,buffer,grep,locate', 'ignore_globs', ['node_modules/', 'output/'])
call unite#custom#source('file_rec,file_mru,file_rec/async,buffer,grep,locate', 'max_candidates', 99999)

" image
au BufRead *.png,*.jpg,*.jpeg :call DisplayImage()
