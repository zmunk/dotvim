filetype plugin indent on

set directory=~/.vim/tmp

set number
set showcmd
let mapleader = " "

syntax on
set background=dark
colorscheme hybrid

"" commands """""""""""""""""""""""

" split window and open vimrc
command Vimrc :vsp $MYVIMRC

" copy specified range from specified file
command -nargs=+ Copy call Copy(<f-args>)
function! Copy( ... )
    execute printf('r! sed -n %sp %s', a:1, a:2)
endfunction

""""""""""""""""""""""""""""""

" shortcuts to save and exit
nnoremap <leader>w :w<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>q :q<CR>

" quick window switching
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-j> <C-w>j
map <C-k> <C-w>k

" toggle comments
source ~/.vim/vcomments.vim
map <silent> <C-_> :call ToggleComment()<CR>

" auto close when opened quotes/parentheses
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" apply changes on save
if has("autocmd")
  augroup NAME_OF_GROUP
    autocmd!
    autocmd bufwritepost .vimrc source $MYVIMRC
  augroup end
endif

