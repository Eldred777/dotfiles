vim.cmd("source ~/dotfiles/vim/neovim.vim")
dofile(vim.fn.expand("~/dotfiles/nvim/vscode.lua"))
dofile(vim.fn.expand("~/dotfiles/nvim/plugins.lua"))

-- Neovim built-ins instead of the vim-highlightedyank/vim-commentary Plug
-- lines that plain vim and IdeaVim need (see vim/plugins.vim): `gc`/`gcc`
-- commenting is a default mapping since 0.10, no setup required; yank
-- highlighting needs one autocmd since it isn't wired up by default.
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight yanked text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.keymap.set("n", "<leader>:w", ":noa w<cr>")
vim.opt.scrolloff = 10
