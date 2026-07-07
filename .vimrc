syntax enable " enable syntax highlighting

" Spaces and tabs
set tabstop=4     " visual spaces per <TAB>
set softtabstop=4 " number of spaces in tab when editing
set expandtab     " tabs are spaces

" ui config
set number         " show line numbers
set showcmd        " show cmd in bottom bar 
set cursorline     " highlight curr line
filetype indent on " load filetype-specific indent files 

" searching
set incsearch      " search as characters typed
set hlsearch       " highlight matches

"folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax 
set foldcolumn=2
" Other acceptable values are marker, manual, expr, syntax, diff

" -------------------------------------
" Key rebinds
" -------------------------------------
let mapleader = ","
set timeoutlen=500 " set leader timeout to 500 ms

inoremap jk <Esc>                        " hit jk in insert mode to esc
nnoremap <leader>ev :vsplit $MYVIMRC<cr> " Edit Vimrc

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" remap arrow keys to no-op to force me to learn hjkl
inoremap <Up>    <nop>
inoremap <Right> <nop>
inoremap <Left>  <nop>
inoremap <Down>  <nop>
nnoremap <Up>    <nop>
nnoremap <Right> <nop>
nnoremap <Left>  <nop>
nnoremap <Down>  <nop>

