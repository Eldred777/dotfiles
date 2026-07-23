" Formatters (use with gq). Plain vim only -- neovim uses conform.nvim
" instead (see nvim/conform.lua) and doesn't source this file.
augroup MyFormatters
    autocmd!
    " Format Python using Ruff
    autocmd FileType python setlocal formatprg=ruff\ format\ -q\ -
    " Format Rust using rustfmt
    autocmd FileType rust setlocal formatprg=rustfmt
augroup END
