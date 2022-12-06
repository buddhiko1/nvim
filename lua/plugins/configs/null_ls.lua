local load = require("utils").load

local M = {}

M.setup = function() end

M.config = function()
  local null_ls = load("null-ls")
  local options = {
    sources = {
      null_ls.builtins.formatting.prettier,

      null_ls.builtins.diagnostics.eslint,

      null_ls.builtins.code_actions.eslint,
      -- null_ls.builtins.diagnostics.stylelint,
      null_ls.builtins.code_actions.gitsigns,
      null_ls.builtins.code_actions.gitrebase,
    },
  }
  null_ls.setup(options)
end
return M
