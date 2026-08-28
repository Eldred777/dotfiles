" Entry point for plain vim (see .vimrc at repo root).
source ~/dotfiles/vim/settings.vim

" -------------------------------------
" Key rebinds
" -------------------------------------
inoremap jk <Esc>                        " hit jk in insert mode to esc
nnoremap <leader>ev :edit ~/dotfiles/vim/vim.vim<cr>

let mapleader = ","
set timeoutlen=500 " set leader timeout to 500 ms

nnoremap <leader>p \"*p
nnoremap <leader>P \"*P
nnoremap <leader>y \"*y
nnoremap <leader>h :nohl<cr> " Stop highlighting from search / ?
nnoremap <leader>q :q<cr>
nnoremap <leader>z za<cr>

vnoremap <leader>i[ di[]<Esc>P
" surround visual mode selection in square brackets

" -------------------------------------
" Formatters
" -------------------------------------
source ~/dotfiles/vim/formatters.vim

" -------------------------------------
" Plugins
" -------------------------------------
call plug#begin()

Plug 'machakann/vim-highlightedyank' " highlight copied text
Plug 'tpope/vim-commentary'          " gcc/gc commenting motions
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'jiangmiao/auto-pairs'

call plug#end()
