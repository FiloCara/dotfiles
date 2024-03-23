-- Install Packer automatically if it's not installed(Bootstraping)
-- Hint: string concatenation is done by `..`
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer()


-- Reload configurations if we modify plugins.lua
-- Hint
--     <afile> - replaced with the filename of the buffer being manipulated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])


-- Install plugins here - `use ...`
-- Packer.nvim hints
--     after = string or list,           -- Specifies plugins to load before this plugin. See "sequencing" below
--     config = string or function,      -- Specifies code to run after this plugin is loaded
--     requires = string or list,        -- Specifies plugin dependencies. See "dependencies". 
--     ft = string or list,              -- Specifies filetypes which load this plugin.
--     run = string, function, or table, -- Specify operations to be run after successful installs/updates of a plugin

return require('packer').startup(function(use)
    
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    ---------------------------------------
    -- NOTE: PUT YOUR THIRD PARTY PLUGINS HERE --
    ---------------------------------------

    -- Colorscheme
    use { 'projekt0n/github-nvim-theme' , as = "github-theme"}

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = [[require('config.lualine')]],
    }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        requires = { 'nvim-lua/plenary.nvim' },
        config = [[require('config.telescope')]],
    }

    -- Treesitter
    use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate",
        config = [[require('config.treesitter')]],
    })

    -- Autocompletation
    use { 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-buffer' } 
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-cmdline' }
    use { 'hrsh7th/cmp-nvim-lsp' }

    -- Snippets
    use { "L3MON4D3/LuaSnip" }

    -- LSP manager
    use { 'williamboman/mason.nvim' }
    use { 'williamboman/mason-lspconfig.nvim' }

    use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v3.x',
      requires = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},
      }
    }

    -- GIT integration
    use {
        "NeogitOrg/neogit",
        requires = {
            "nvim-lua/plenary.nvim",         -- required
            "sindrets/diffview.nvim",        -- optional - Diff integration
        },
        config = [[require('config.neogit')]],
    }

    use { "tpope/vim-fugitive" }

    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    use { "jay-babu/mason-nvim-dap.nvim" }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    
    if packer_bootstrap then
        require('packer').sync()
    end
end)
