" Key rebinds shared between vim (vim/.vimrc) and neovim (vim/shared.vim).
let mapleader = ","
set timeoutlen=500 " set leader timeout to 500 ms

inoremap jk <Esc>                        " hit jk in insert mode to esc

" Edit the real config entry point in the repo, not $MYVIMRC -- that only
" resolves to the thin loader stub each editor sources at startup.
if has('nvim')
    nnoremap <leader>ev :edit ~/dotfiles/nvim/init.lua<cr>
else
    nnoremap <leader>ev :edit ~/dotfiles/vim/.vimrc<cr>
endif

nnoremap <leader>p "*p
" paste from clipboard
nnoremap <leader>P "*P
" ^^^
nnoremap <leader>y "*y
nnoremap <leader>h :nohl<cr>
""" "cease highlighting
nnoremap <leader>q :q<cr>
nnoremap <leader>z za<cr>


vnoremap <leader>i[ di[]<Esc>P
" surround visual mode selection in square brackets

" remap arrow keys to no-op to force me to learn hjkl
inoremap <Up>    <nop>
inoremap <Right> <nop>
inoremap <Left>  <nop>
inoremap <Down>  <nop>
nnoremap <Up>    <nop>
nnoremap <Right> <nop>
nnoremap <Left>  <nop>
nnoremap <Down>  <nop>
