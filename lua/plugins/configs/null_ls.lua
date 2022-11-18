local load = require("utils").load

local M = {}

M.setup = function() end

M.config = function()
  local null_ls = load("null-ls")
  local options = {
    sources = {
      null_ls.builtins.formatting.prettierd.with({
        filetypes = { "css", "javascript", "typescript" },
      }),
      null_ls.builtins.formatting.stylua, -- lua

      null_ls.builtins.diagnostics.yamllint,

      null_ls.builtins.code_actions.eslint, -- typescript/css/scss
      null_ls.builtins.code_actions.gitsigns,
      null_ls.builtins.code_actions.gitrebase,
    },
  }
  null_ls.setup(options)
end
return M
