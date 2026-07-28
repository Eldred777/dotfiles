-- lazy.nvim spec, loaded by plugins.lua.
-- Servers aren't auto-installed (no ensure_installed) to keep startup fast
-- and avoid surprise downloads; run :Mason to install rust_analyzer /
-- pyright yourself.
return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "saghen/blink.cmp",
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            automatic_installation = false,
        })

        -- Advertise blink.cmp's extra completion capabilities to every
        -- server via vim.lsp.config's default "*" entry, before enabling.
        vim.lsp.config("*", {
            capabilities = require("blink.cmp").get_lsp_capabilities(),
        })

        -- nvim-lspconfig registers default configs for vim.lsp.config();
        -- vim.lsp.enable() is the current (0.11+) way to turn them on.
        vim.lsp.enable({ "rust_analyzer", "pyright" })

        -- gd/gD/K aren't bound by Neovim's built-in LSP defaults, so map
        -- them here; buffer-local and re-applied on every client attach.
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local opts = { buffer = args.buf }
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            end,
        })
    end,
}
