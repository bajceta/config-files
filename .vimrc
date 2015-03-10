set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" CtrlP
Plugin 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
set wildignore+=*/tmp/*,*/target/*,*.so,*.swp,*.zip
Plugin 'rking/ag.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'Chiel92/vim-autoformat'
" needs : npm install -g js-beautify

call vundle#end()

" tabs as spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab

filetype plugin indent on
syntax on
colors darkblue

set nobackup       
set nowritebackup 
set noswapfile   

" panel navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" autoformat
noremap <F3> :Autoformat<CR><CR>

