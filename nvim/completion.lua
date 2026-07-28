-- lazy.nvim spec, loaded by plugins.lua.
-- blink.cmp is the popup/autocomplete engine; lsp.lua merges its
-- capabilities into every LSP client so servers know to send richer
-- completion data (snippets, resolve support, etc).
return {
    "saghen/blink.cmp",
    version = "*",
    opts = {
        keymap = { preset = "enter" },
        sources = {
            default = { "lsp", "path", "buffer" },
        },
    },
}
