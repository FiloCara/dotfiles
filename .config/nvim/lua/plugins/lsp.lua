return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    opts = {
        servers = {
            "pyright",
            "clangd",
            "texlab",
            "ts_ls",
            "html",
        },
        mason = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
            log_level = vim.log.levels.INFO,
        },
    },
    config = function(_, opts)
        local lsp_zero = require("lsp-zero")
        lsp_zero.on_attach(function(_, bufnr)
            lsp_zero.default_keymaps({ buffer = bufnr })
        end)

        require("mason").setup(opts.mason or {})
        require("mason-lspconfig").setup({
            ensure_installed = opts.servers or {},
            automatic_installation = true,
            handlers = {
                lsp_zero.default_setup,
            },
        })
    end,
}
