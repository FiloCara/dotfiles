local nls = require("null-ls")

local sources = {
  -- python
  nls.builtins.formatting.black.with({extra_args = { "--line-length=120" }}),
  nls.builtins.formatting.isort,
  -- web stuff
  nls.builtins.formatting.prettier
}
nls.setup({ sources = sources })
