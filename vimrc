
filetype plugin indent on

set number
set showcmd
let mapleader = " "

nnoremap <leader>w :w<CR>

map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-j> <C-w>j
map <C-k> <C-w>k


set directory=~/.vim/tmp

" toggle comments
source ~/.vim/vcomments.vim
map <silent> <C-_> :call ToggleComment()<CR>

" auto close when opened quotes/parentheses
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" apply changes on save
if has("autocmd")
  augroup NAME_OF_GROUP
    autocmd!
    autocmd bufwritepost .vimrc source $MYVIMRC
  augroup end
endif

syntax on
set background=dark
colorscheme hybrid
