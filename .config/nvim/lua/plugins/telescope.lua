return {
    "nvim-telescope/telescope.nvim",
    branch = "master",
    cmd = "Telescope",
    keys = {
        { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find files" },
        { "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Live grep" },
        { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Buffers" },
        { "<leader>fm", function() require("telescope.builtin").man_pages() end, desc = "Man pages" },
        { "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Help tags" },
        { "<leader>ft", function() require("telescope.builtin").builtin() end, desc = "Telescope builtins" },
    },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        defaults = {
            layout_config = {
                vertical = { width = 0.8 },
            },
            file_ignore_patterns = { "node_modules", "venv" },
            mappings = {
                i = {
                    ["<C-h>"] = "which_key",
                },
            },
        },
        pickers = {
            man_pages = {
                sections = { "ALL" },
            },
            builtin = {
                previewer = false,
            },
        },
        extensions = {},
    },
}
