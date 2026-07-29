" General settings shared between vim (vim/vim.vim) and neovim (vim/neovim.vim).

" Must run before `syntax enable` below: when a file is passed on the
" command line, `syntax enable` is what actually triggers filetype
" detection for the already-loaded buffer, running ftplugin/markdown.vim
" right then. If folding.vim's global foldmethod default (and
" g:markdown_folding) aren't set yet at that point, markdown folding
" (za/zM on headings) silently doesn't work -- either because
" g:markdown_folding is unset when the ftplugin checks it, or because
" folding.vim's later `set foldmethod=syntax` clobbers the local
" foldmethod=expr the ftplugin just set for this buffer.
source ~/dotfiles/vim/folding.vim

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

set shell=bash        " Open bash with :terminal
set shellcmdflag=-c   " Run shell commands (e.g. :!, filter) via bash -c
