" Entry point for plain vim (see .vimrc at repo root).
source ~/dotfiles/vim/settings.vim

" -------------------------------------
" Key rebinds
" -------------------------------------
source ~/dotfiles/vim/keybinds.vim

" -------------------------------------
" Formatters
" -------------------------------------
source ~/dotfiles/vim/formatters.vim

" -------------------------------------
" Plugins
" -------------------------------------
call plug#begin()

source ~/dotfiles/vim/plugins.vim

Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

call plug#end()
