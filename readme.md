# dotfiles

Vim and Neovim config, sharing as much as makes sense between the two.

## Layout

```
.vimrc                  thin loader -> vim/vim.vim
vim/vim.vim              entry point for plain vim
vim/neovim.vim            entry point for neovim (sourced from nvim/init.lua)
vim/settings.vim          general options, used by all three editors
vim/keybinds.vim          key rebinds, used by all three editors
vim/plugins.vim           Plug declarations shared by plain vim + IdeaVim
                           (neovim has built-in equivalents, see nvim/init.lua)
vim/formatters.vim        formatprg-based formatters, plain vim only
                           (neovim uses conform.nvim instead)

nvim/init.lua             neovim entry point
nvim/keybinds.lua         neovim-only keybinds
nvim/vscode.lua           vscode-neovim-only bindings (fold/jk workarounds)
nvim/plugins.lua          bootstraps lazy.nvim, skipped under vscode-neovim
nvim/completion.lua       lazy.nvim spec: blink.cmp (autocomplete)
nvim/conform.lua          lazy.nvim spec: conform.nvim (formatting)
nvim/lsp.lua              lazy.nvim spec: nvim-lspconfig + mason
nvim/autopairs.lua        lazy.nvim spec: nvim-autopairs

.ideavimrc                entry point for IdeaVim (JetBrains IDEs)
vim/intellij.vim          IdeaVim-only settings/plugins (e.g. NERDTree)

setup.sh                  reproduces the machine setup (see below)
```

Plain vim and IdeaVim use [vim-plug](https://github.com/junegunn/vim-plug)
syntax (plugins declared in `vim/vim.vim`, `vim/plugins.vim`, and
`vim/intellij.vim`); neovim uses [lazy.nvim](https://github.com/folke/lazy.nvim)
(plugins declared in `nvim/plugins.lua` and friends), which bootstraps
itself on first launch.

## Setup

```sh
./setup.sh
```

Writes the thin loader files (`~/.vimrc`, `~/.ideavimrc`, and the
platform's neovim `init.lua`) that point back into this repo, and installs
vim-plug plus the plugins it declares. Safe to re-run -- it backs up
anything it would overwrite rather than clobbering it silently.

Neovim plugins (lazy.nvim, conform.nvim, nvim-lspconfig, mason.nvim)
install themselves the first time neovim starts. LSP servers are not
auto-installed -- run `:Mason` to install `rust_analyzer` / `pyright`
yourself.
