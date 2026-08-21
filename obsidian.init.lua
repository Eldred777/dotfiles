-- Obsidian neovim keybindings, shared between "Personal Vault" and "Work Vault".
-- Sourced from each vault's obsidian.init.lua.

-- hit jk in insert mode to esc
vim.keymap.set("i", "jk", "<Esc>")

-- ---------------
-- Leader keybinds
-- ---------------
vim.g.mapleader = ","
vim.o.timeoutlen = 500 -- leader timeout in ms

-- clipboard paste/yank
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"*p', { desc = 'Paste from system clipboard (*)' })
vim.keymap.set({ 'n', 'v' }, '<leader>P', '"*P', { desc = 'Paste before from system clipboard (*)' })

vim.keymap.set("n", "<leader>h", ":nohl<cr>") -- cease highlighting
vim.keymap.set("n", "<leader>q", ":q<cr>")
vim.keymap.set("n", "<leader>z", "za<cr>") -- toggle fold

-- set for other extensions to use
vim.g.mapleader = "<Space>"
