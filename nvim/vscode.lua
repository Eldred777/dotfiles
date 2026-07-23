-- vscode-neovim only: bindings that call VS Code commands directly,
-- since vscode-neovim's fold engine never syncs to VS Code's folding UI.
-- https://github.com/vscode-neovim/vscode-neovim/issues/58#issuecomment-590020235
if not vim.g.vscode then
    return
end

local function vscode(cmd)
    return function()
        vim.fn.VSCodeNotify(cmd)
    end
end

vim.keymap.set("n", "za", vscode("editor.toggleFold"))
vim.keymap.set("n", "zo", vscode("editor.unfold"))
vim.keymap.set("n", "zc", vscode("editor.fold"))
vim.keymap.set("n", "zM", vscode("editor.foldAll"))
vim.keymap.set("n", "zR", vscode("editor.unfoldAll"))
