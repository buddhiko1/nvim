local load = require("utils").load

local M = {}

M.config = function()
  local null_ls = load("null-ls")

  local options = {
    debug = false,
    sources = {}
  }
  null_ls.setup(options)
end

return M
