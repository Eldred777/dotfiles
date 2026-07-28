" Entry point for neovim (see nvim/init.lua): general settings and key
" rebinds only. Formatting is handled by nvim/conform.lua instead of
" vim/formatters.vim, and vim/vim.vim's Plugins section is vim-plug, which
" neovim doesn't use. vim/plugins.vim (vim-highlightedyank, vim-commentary)
" isn't sourced here either -- neovim has both built in, see nvim/init.lua.
source ~/dotfiles/vim/settings.vim
source ~/dotfiles/vim/keybinds.vim
