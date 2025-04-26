local nls = require("null-ls")

local sources = {
  -- python
  nls.builtins.formatting.black.with({extra_args = { "--line-length=120" }}),
  nls.builtins.formatting.isort,
  -- web stuff
  nls.builtins.formatting.prettier
}
-- TODO: throwing a lot of errors, need to be fixed
-- nls.setup({ sources = sources })
