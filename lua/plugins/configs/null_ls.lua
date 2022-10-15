local load = require("utils").load
local map = require("utils").map

local M = {}

M.setup = function()
end

M.config = function()
  local null_ls = load("null-ls")
  local options = {
    sources = {
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.diagnostics.eslint,
      null_ls.builtins.completion.spell,
    },
  }
  null_ls.setup(options)
end
return M
