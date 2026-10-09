# dotfiles

Vim and Neovim config, sharing as much as makes sense between the two.

## Layout

```
.vimrc                  thin loader -> vim/vim.vim
vim/vim.vim              entry point for plain vim
vim/neovim.vim            entry point for neovim (sourced from nvim/init.lua)
vim/settings.vim          general options, shared by plain vim + neovim
vim/folding.vim           folding options (sourced from vim/settings.vim)
vim/formatters.vim        formatprg-based formatters, plain vim only

init.lua                  thin loader -> nvim/init.lua
nvim/init.lua             neovim entry point
nvim/keybinds.lua         neovim key rebinds (mirrors vim/vim.vim's)
nvim/vscode.lua           vscode-neovim-only bindings (fold/jk workarounds)
nvim/plugins.lua          bootstraps lazy.nvim, skipped under vscode-neovim
nvim/completion.lua       lazy.nvim spec: blink.cmp (autocomplete)
nvim/conform.lua          lazy.nvim spec: conform.nvim (formatting, currently disabled)
nvim/lsp.lua              lazy.nvim spec: nvim-lspconfig + mason
nvim/autopairs.lua        lazy.nvim spec: nvim-autopairs

.ideavimrc                entry point for IdeaVim (JetBrains IDEs); self-contained
                           settings, keymaps and plugins (e.g. NERDTree)
obsidian.init.lua         neovim keybindings for Obsidian

.bashrc                   shell config, sourced from ~/.bashrc
setup.sh                  reproduces the machine setup (see below)
```

Each editor carries its own key rebinds (`vim/vim.vim`, `nvim/keybinds.lua`,
`.ideavimrc`); keep them in step by hand.

Plain vim and IdeaVim use [vim-plug](https://github.com/junegunn/vim-plug)
syntax (plugins declared in `vim/vim.vim` and `.ideavimrc`); neovim uses
[lazy.nvim](https://github.com/folke/lazy.nvim) (plugins declared in
`nvim/plugins.lua` and friends), which bootstraps itself on first launch.

## Setup

```sh
./setup.sh
```

Writes the thin loader files (`~/.vimrc`, `~/.ideavimrc`, and the
platform's neovim `init.lua`) that point back into this repo, and installs
vim-plug plus the plugins it declares. Safe to re-run -- it backs up any
loader file it would overwrite rather than clobbering it silently. It also
rewrites `~/.bashrc` to source this repo's `.bashrc`, without a backup.

Neovim plugins (lazy.nvim, blink.cmp, nvim-lspconfig, mason.nvim,
nvim-autopairs) install themselves the first time neovim starts. LSP
servers are not auto-installed -- run `:Mason` to install `rust_analyzer` /
`pyright` / `jdtls` yourself.
