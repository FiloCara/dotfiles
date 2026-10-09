
return {
    "mason-org/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "neovim/nvim-lspconfig",
        "mason-org/mason.nvim",
    },
    opts = {
        ensure_installed = {
            "pyright",
            "clangd",
            "texlab",
            "ts_ls",
            "html",
        },
        automatic_enable = true,
    },
    config = function(_, opts)
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
            log_level = vim.log.levels.INFO,
        })

        require("mason-lspconfig").setup(opts)

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(event)
                local map = function(keys, func, desc)
                    vim.keymap.set("n", keys, func, {
                        buffer = event.buf,
                        desc = desc,
                    })
                end

                map("K", vim.lsp.buf.hover, "Hover")
                map("gd", vim.lsp.buf.definition, "Definition")
                map("gD", vim.lsp.buf.declaration, "Declaration")
                map("gi", vim.lsp.buf.implementation, "Implementation")
                map("gr", vim.lsp.buf.references, "References")
                map("<F2>", vim.lsp.buf.rename, "Rename")
                map("<F4>", vim.lsp.buf.code_action, "Code action")
                map("gl", vim.diagnostic.open_float, "Diagnostics")
            end,
        })
    end,
}
