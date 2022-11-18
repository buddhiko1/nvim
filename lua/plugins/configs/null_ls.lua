local load = require("utils").load

local M = {}

M.setup = function() end

M.config = function()
  local null_ls = load("null-ls")
  local options = {
    sources = {
      null_ls.builtins.diagnostics.yamllint,

      null_ls.builtins.code_actions.eslint, -- typescript/css/scss
      null_ls.builtins.code_actions.gitsigns,
      null_ls.builtins.code_actions.gitrebase,
    },
  }
  null_ls.setup(options)
end
return M
