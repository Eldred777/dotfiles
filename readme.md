# dotfiles

Vim and Neovim config, sharing as much as makes sense between the two.

## Layout

```
.vimrc                  thin loader -> vim/.vimrc
vim/.vimrc               entry point for plain vim
vim/shared.vim            entry point for neovim (sourced from nvim/init.lua)
vim/settings.vim          general options, used by both editors
vim/keybinds.vim          key rebinds, used by both editors
vim/formatters.vim        formatprg-based formatters, plain vim only
                           (neovim uses conform.nvim instead)

nvim/init.lua             neovim entry point
nvim/vscode.lua           vscode-neovim-only bindings (fold/jk workarounds)
nvim/plugins.lua          bootstraps lazy.nvim, skipped under vscode-neovim
nvim/conform.lua          lazy.nvim spec: conform.nvim (formatting)
nvim/lsp.lua              lazy.nvim spec: nvim-lspconfig + mason

setup_vim.sh              reproduces the machine setup (see below)
```

Plain vim uses [vim-plug](https://github.com/junegunn/vim-plug) (plugins
declared in `vim/.vimrc`); neovim uses
[lazy.nvim](https://github.com/folke/lazy.nvim) (plugins declared in
`nvim/plugins.lua` and friends), which bootstraps itself on first launch.

## Setup

```sh
./setup_vim.sh
```

Writes the thin loader files (`~/.vimrc`, and the platform's neovim
`init.lua`) that point back into this repo, and installs vim-plug plus the
plugins it declares. Safe to re-run -- it backs up anything it would
overwrite rather than clobbering it silently.

Neovim plugins (lazy.nvim, conform.nvim, nvim-lspconfig, mason.nvim)
install themselves the first time neovim starts. LSP servers are not
auto-installed -- run `:Mason` to install `rust_analyzer` / `pyright`
yourself.
