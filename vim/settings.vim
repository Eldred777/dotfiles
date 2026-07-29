" General settings shared between vim (vim/vim.vim) and neovim (vim/neovim.vim).
syntax enable " enable syntax highlighting

" Spaces and tabs
set tabstop=4     " visual spaces per <TAB>
set softtabstop=4 " number of spaces in tab when editing
set expandtab     " tabs are spaces
set shiftwidth=4  " visual spaces for <TAB> - used in nvim LSP format requests

" ui config
set number         " show line numbers
set showcmd        " show cmd in bottom bar
set cursorline     " highlight curr line
filetype indent on " load filetype-specific indent files

" searching
set incsearch      " search as characters typed
set hlsearch       " highlight matches

" folding
source ~/dotfiles/vim/folding.vim

set shell=bash        " Open bash with :terminal
set shellcmdflag=-c   " Run shell commands (e.g. :!, filter) via bash -c
