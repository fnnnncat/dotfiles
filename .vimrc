"Vundle && Plugin
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'tomasr/molokai'

call vundle#end()
filetype plugin indent on  

autocmd vimenter * NERDTree
