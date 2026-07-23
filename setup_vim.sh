#!/usr/bin/env sh
# Reproduces the machine setup this dotfiles repo expects: thin loader
# files at the real vim/neovim config locations that point back into
# this repo (mirrors what's already deployed on this machine, since
# Windows symlinks need elevated/dev-mode privileges we can't assume),
# plus vim-plug for plain vim. Safe to re-run; existing files that
# differ are backed up rather than overwritten silently.
set -eu

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

write_loader() {
    dest="$1"
    content="$2"

    mkdir -p "$(dirname "$dest")"

    if [ -f "$dest" ] && [ "$(cat "$dest")" = "$content" ]; then
        echo "Up to date: $dest"
        return
    fi

    if [ -e "$dest" ]; then
        backup="$dest.bak.$(date +%Y%m%d%H%M%S)"
        echo "Backing up existing $dest -> $backup"
        mv "$dest" "$backup"
    fi

    printf '%s\n' "$content" >"$dest"
    echo "Wrote $dest"
}

# Plain vim
write_loader "$HOME/.vimrc" "source ~/dotfiles/.vimrc"

# Neovim: resolve the platform's default config dir
if [ -n "${XDG_CONFIG_HOME:-}" ]; then
    NVIM_CONFIG_DIR="$XDG_CONFIG_HOME/nvim"
elif [ -n "${LOCALAPPDATA:-}" ]; then
    NVIM_CONFIG_DIR="$LOCALAPPDATA/nvim"
else
    NVIM_CONFIG_DIR="$HOME/.config/nvim"
fi
write_loader "$NVIM_CONFIG_DIR/init.lua" "dofile(vim.fn.expand(\"~/dotfiles/nvim/init.lua\"))"

# vim-plug: plugin manager for plain vim
PLUG_VIM="$HOME/.vim/autoload/plug.vim"
if [ -f "$PLUG_VIM" ]; then
    echo "Up to date: $PLUG_VIM"
else
    echo "Installing vim-plug -> $PLUG_VIM"
    curl -fLo "$PLUG_VIM" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Install the plugins declared in vim/.vimrc's Plug block
if command -v vim >/dev/null 2>&1; then
    echo "Running :PlugInstall"
    vim +PlugInstall +qall
else
    echo "vim not on PATH, skipping :PlugInstall -- run it yourself once vim is installed"
fi

echo
echo "Done. lazy.nvim, conform.nvim, and nvim-lspconfig/mason bootstrap themselves on first nvim launch (see nvim/plugins.lua)."
