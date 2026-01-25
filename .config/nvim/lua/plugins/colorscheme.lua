return {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    opts = {
        variant = "moon",
        styles = {
            italic = false,
        },
    },
    config = function(_, opts)
        require("rose-pine").setup(opts or {})
        local ok = pcall(vim.cmd, "colorscheme rose-pine")
        if not ok then
            vim.notify("colorscheme rose-pine not found!")
        end
    end,
}
