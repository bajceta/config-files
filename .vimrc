set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
"  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" CtrlP
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree.git'
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
Plugin 'marijnh/tern_for_vim'
Plugin 'scrooloose/nerdcommenter.git'

" Clojure
Plugin 'guns/vim-clojure-static'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'tpope/vim-fireplace.git'
Plugin 'vim-scripts/paredit.vim'
Plugin 'venantius/vim-cljfmt'



call vundle#end()

" Rainbow
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces



let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]




" tabs as spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab

filetype plugin indent on
syntax on
colors abra

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

let mapleader=","

imap jk <Esc>
map rr :%Eval<CR>
hi MatchParen cterm=bold ctermbg=none ctermfg=magenta
