" setup : 
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
"  
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
set wildignore+=*/tmp/*,*/target/*,*.so,*.swp,*.zip,*/node_modules/*
Plugin 'rking/ag.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'Chiel92/vim-autoformat'
" needs : npm install -g js-beautify
Plugin 'marijnh/tern_for_vim'
"install the tern server by running npm install in the bundle/tern_for_vim
"cd .vim/bundle/tern_for_vim && npm install 
Plugin 'scrooloose/nerdcommenter.git'

" Clojure
Plugin 'guns/vim-clojure-static'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'tpope/vim-fireplace.git'
Plugin 'vim-scripts/paredit.vim'
Plugin 'venantius/vim-cljfmt'
Plugin 'scrooloose/syntastic.git'


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
colors Monokai
"colors zephyr
"colors vexorian
" 256-jungle

set nobackup       
set nowritebackup 
set noswapfile   
set autoread                                                                                                                                                                                    


" panel navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let mapleader=","
" autoformat
noremap <F3> :Autoformat<CR>
imap <F3> <c-o>:Autoformat<CR>

noremap <Leader>m :Autoformat<CR>:w<CR>

"autoformat js 
let g:formatdef_my_custom_js = '"esformatter -c ~/.esformatter "'
let g:formatters_javascript = ['my_custom_js']


imap <silent> ,/ <c-o>:call NERDComment("n","Toggle")<CR>
imap jk <Esc>
map rr :w<CR>:%Eval<CR>
map rt :w<Esc>:<C-U>%RunTests<CR>

imap <silent> ,> <c-o>:call PareditMoveRight()<CR>
imap <silent> ,< <c-o>:call PareditMoveLeft()<CR>

hi MatchParen cterm=bold ctermbg=none ctermfg=magenta

nnoremap <Leader>f :Ag <cword><CR>

nmap <Leader>/ :call NERDComment("n","Toggle")<CR>
vmap <Leader>/ :call NERDComment("n","Toggle")<CR>
let NERDSpaceDelims=1

" replace word under the cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

" arduino setup
au BufRead,BufNewFile *.pde set filetype=arduino
au BufRead,BufNewFile *.ino set filetype=arduino


"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_enable_signs=1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let local_eslint = finddir('node_modules', '.;') . '/.bin/eslint'
if matchstr(local_eslint, "^\/\\w") == ''
    let local_eslint = getcwd() . "/" . local_eslint
endif
if executable(local_eslint)
    let g:syntastic_javascript_eslint_exec = local_eslint
endif
"let g:syntastic_javascript_eslint_exec = 
"
"
"
"
" 
"
set number
