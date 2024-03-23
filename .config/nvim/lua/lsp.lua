local servers = {
  "pyright",
  "clangd",
  "texlab",
  "tsserver",
  "html"
}

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        },
    },
    log_level = vim.log.levels.INFO,
})

require('mason-lspconfig').setup({
    ensure_installed = servers,
    automatic_installation = true,
    handlers = {
        lsp_zero.default_setup,
    },
})
