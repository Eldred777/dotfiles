-- Neovim key rebinds, mirroring the Key rebinds section of vim/vim.vim.
-- Loaded first by nvim/init.lua: mapleader must be set before any
-- <leader> mapping is defined, here or in the files loaded after it.
vim.g.mapleader = ","
vim.opt.timeoutlen = 500 -- leader timeout, ms

vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<leader>ev", ":edit ~/dotfiles/nvim/init.lua<cr>")

-- System clipboard
vim.keymap.set("n", "<leader>p", '"*p')
vim.keymap.set("n", "<leader>P", '"*P')
vim.keymap.set("n", "<leader>y", '"*y')

vim.keymap.set("n", "<leader>h", ":nohl<cr>") -- stop highlighting from search / ?
vim.keymap.set("n", "<leader>q", ":q<cr>")
vim.keymap.set("n", "<leader>z", "za<cr>")

-- Surround visual mode selection in square brackets
vim.keymap.set("v", "<leader>i[", "di[]<Esc>P")
