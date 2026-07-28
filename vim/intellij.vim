" IdeaVim-only additions (see .ideavimrc at repo root). Sourced after
" vim/vim.vim; not used by plain vim or neovim. Only settings/plugins that
" don't make sense outside a JetBrains IDE belong here.

" Show a few lines of context around the cursor.
set scrolloff=5

" Don't use Ex mode, use Q for formatting.
map Q gq

" -- IdeaVim plugins -- https://jb.gg/ideavim-plugins
source ~/dotfiles/vim/plugins.vim
Plug 'preservim/nerdtree' " file tree

" Toggle NERDTree
nnoremap <leader>n :NERDTreeToggle<cr>
