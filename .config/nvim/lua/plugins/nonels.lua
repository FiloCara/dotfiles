return {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        enabled = false,
        sources = {
            -- python
            "black",
            "isort",
            -- web stuff
            "prettier",
        },
    },
    config = function(_, opts)
        if not opts.enabled then
            return
        end
        local nls = require("null-ls")
        local sources = {}
        if vim.tbl_contains(opts.sources or {}, "black") then
            table.insert(sources, nls.builtins.formatting.black.with({ extra_args = { "--line-length=120" } }))
        end
        if vim.tbl_contains(opts.sources or {}, "isort") then
            table.insert(sources, nls.builtins.formatting.isort)
        end
        if vim.tbl_contains(opts.sources or {}, "prettier") then
            table.insert(sources, nls.builtins.formatting.prettier)
        end
        nls.setup({ sources = sources })
    end,
}
