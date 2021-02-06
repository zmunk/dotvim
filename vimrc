filetype plugin indent on

autocmd!

set directory=~/.vim/tmp

set laststatus=2
set splitright

set number
set showcmd
let mapleader = " "

syntax on
set background=dark
colorscheme hybrid

hi MatchParen cterm=bold ctermfg=cyan ctermbg=none

set noesckeys
set mouse=a
"set ttymouse=xterm2
set ttymouse=sgr
set cursorline
set incsearch
set autowrite

au FileType python setlocal formatprg=autopep8\ -

" nerd tree
let g:NERDTreeChDirMode = 2
let NERDTreeMapChangeRoot = 'CC' 

"" commands """""""""""""""""""""""

" split window and open vimrc
command Vimrc :tabe $MYVIMRC

" split window and open vimrc
command Source :source $MYVIMRC

" vertical split terminal
command Vt :vert term

" copy specified range from specified file
" e.g. :Copy 5,10 file.py
command -nargs=+ Copy call Copy(<f-args>)
function! Copy( ... )
    execute printf('r! sed -n %sp %s', a:1, a:2)
endfunction

""""""""""""""""""""""""""""""
" type ctrl+6 for caps in insert mode
for c in range(char2nr('A'), char2nr('Z'))
  execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
  execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
endfor

" kill caps when leaving insert mode
autocmd InsertLeave * set iminsert=0

" go to middle of line
nnoremap gm gM

" select pasted text
nnoremap gp `[v`]

" delete prev word in insert
noremap! <C-BS> <C-W>
noremap! <C-h> <C-W>

" open new tab
nnoremap <leader>t :tabe<CR>

" move between tabs
nnoremap <leader>l :tabn<CR>
nnoremap <leader>h :tabp<CR>

" equal spacing
nnoremap <leader>= <C-w>=

" insert newline below or above without entering insert mode
nnoremap go mmo<Esc>`m
nnoremap gO mmO<Esc>`m

" shortcuts to save and exit
nnoremap <leader>w :w<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>q :q<CR>

nnoremap <leader>m :DoShowMarks<CR>
nnoremap <leader>M :NoShowMarks<CR>

" select all
nnoremap <leader>a gg<S-v>G

" shortcuts to copy/paste from clipboard
vnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>P "+P

" quick window switching
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-j> <C-w>j
map <C-k> <C-w>k

" toggle comments
" source ~/.vim/vcomments.vim
" map <silent> <C-_> :call ToggleComment()<CR>
map <silent> <C-_> <plug>NERDCommenterToggle

" prevent weird behavior when clicking in insert mode
inoremap <LeftMouse> <Esc><LeftMouse>

" vundle
" type :PluginInstall to install new plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'preservim/nerdcommenter'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'jacquesbh/vim-showmarks'
Plugin 'junegunn/goyo.vim'

"dart
Plugin 'dart-lang/dart-vim-plugin'
"Plugin 'natebosch/vim-lsc'
"Plugin 'natebosch/vim-lsc-dart'
Plugin 'neoclide/coc.nvim'
call vundle#end()
" filetype plugin indent on

nnoremap <silent> <F2> :NERDTreeToggle .<CR>

" run python script
autocmd FileType python map <buffer> <F3> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F3> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" :NoMatchParen

" apply changes on save
if has("autocmd")
  augroup NAME_OF_GROUP
    autocmd!
    autocmd bufwritepost .vimrc source $MYVIMRC
  augroup end
endif

autocmd BufWritePost ~/.i3 execute '!i3-msg reload' | redraw!
