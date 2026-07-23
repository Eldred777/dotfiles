-- vscode-neovim only: bindings that call VS Code commands directly,
-- since vscode-neovim's fold engine never syncs to VS Code's folding UI.
-- https://github.com/vscode-neovim/vscode-neovim/issues/58#issuecomment-590020235
if not vim.g.vscode then
    return
end

-- vim/keybinds.vim no-ops arrow keys everywhere to force hjkl, but that's
-- a vim/nvim-only preference -- restore normal arrow-key behavior here so
-- VS Code's own arrow handling isn't broken.
for _, mode in ipairs({ "n", "i" }) do
    for _, key in ipairs({ "<Up>", "<Down>", "<Left>", "<Right>" }) do
        pcall(vim.keymap.del, mode, key)
    end
end

local vscode_api = require("vscode")

local function vscode(cmd)
    return function()
        vscode_api.call(cmd)
    end
end

vim.keymap.set("n", "za", vscode("editor.toggleFold"))
vim.keymap.set("n", "zo", vscode("editor.unfold"))
vim.keymap.set("n", "zO", vscode("editor.unfoldRecursively"))
vim.keymap.set("n", "zc", vscode("editor.fold"))
vim.keymap.set("n", "zC", vscode("editor.foldRecursively"))
vim.keymap.set("n", "zM", vscode("editor.foldAll"))
vim.keymap.set("n", "zR", vscode("editor.unfoldAll"))

-- j/k move by real line instead of display line when folds are involved,
-- since vscode-neovim doesn't sync folds to neovim's own line model.
-- Use gj/gk (display-line motion) unless a count is given or a macro is
-- being recorded/executed, where real j/k must pass through unchanged.
-- https://github.com/vscode-neovim/vscode-neovim/issues/58#issuecomment-1264782696
local function move_cursor(direction)
    if vim.v.count == 0 and vim.fn.reg_recording() == "" and vim.fn.reg_executing() == "" then
        return "g" .. direction
    else
        return direction
    end
end

vim.keymap.set("n", "j", function()
    return move_cursor("j")
end, { expr = true, remap = true })
vim.keymap.set("n", "k", function()
    return move_cursor("k")
end, { expr = true, remap = true })
