--Enable the new |lua-loader| that byte-compiles and caches lua files.
if vim.loader then
	vim.loader.enable()
end
require("config.options")
require("config.keymaps")
require("config.lazy")
