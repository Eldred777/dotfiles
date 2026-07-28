-- Neovim-only keybinds (not shared with vim/keybinds.vim).

-- Write without triggering autocmds -- useful when a BufWritePre/autoformat
-- hook is misbehaving and you just want the buffer saved as-is.
vim.keymap.set("n", "<leader>:w", ":noa w<cr>")
