-- lazy.nvim spec, loaded by plugins.lua.
-- Servers aren't auto-installed (no ensure_installed) to keep startup fast
-- and avoid surprise downloads; run :Mason to install rust_analyzer /
-- pyright yourself.
return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            automatic_installation = false,
        })

        -- nvim-lspconfig registers default configs for vim.lsp.config();
        -- vim.lsp.enable() is the current (0.11+) way to turn them on.
        vim.lsp.enable({ "rust_analyzer", "pyright" })
    end,
}
