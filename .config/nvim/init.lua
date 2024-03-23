--Enable the new |lua-loader| that byte-compiles and caches lua files.
if vim.loader then
	vim.loader.enable()
end
-- Credit to: https://martinlwx.github.io/en/config-neovim-from-scratch/
require('options')
require('plugins')
require('keymaps')
require('colorscheme')
require('autocmp')
require('lsp')
require('dap')
