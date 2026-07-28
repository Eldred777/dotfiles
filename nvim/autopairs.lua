-- lazy.nvim spec, loaded by plugins.lua. Neovim-only equivalent of
-- jiangmiao/auto-pairs (vim/vim.vim, plain vim only) -- no IdeaVim
-- equivalent, JetBrains IDEs already auto-close brackets/quotes natively.
return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
}
