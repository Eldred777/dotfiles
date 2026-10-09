" Entry point for plain vim (see .vimrc at repo root).
source ~/dotfiles/vim/settings.vim

" -------------------------------------
" Key rebinds
" -------------------------------------
" mapleader must be set before any <leader> mapping is defined.
let mapleader = ","
set timeoutlen=500 " set leader timeout to 500 ms

" hit jk in insert mode to esc
inoremap jk <Esc>
nnoremap <leader>ev :edit ~/dotfiles/vim/vim.vim<cr>

nnoremap <leader>p "*p
nnoremap <leader>P "*P
nnoremap <leader>y "*y
" Stop highlighting from search / ?
nnoremap <leader>h :nohl<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>z za

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
