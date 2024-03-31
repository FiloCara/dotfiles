--Enable the new |lua-loader| that byte-compiles and caches lua files.
if vim.loader then
	vim.loader.enable()
end
-- Credit to: https://martinlwx.github.io/en/config-neovim-from-scratch/
require('filo.options')
require('filo.plugins')
require('filo.keymaps')
require('filo.colorscheme')
require('filo.autocmp')
require('filo.lsp')
require('filo.dap')
