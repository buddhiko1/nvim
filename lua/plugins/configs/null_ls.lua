local load = require("utils").load
local prettier_cmd = require("constants").prettier_cmd
local eslint_cmd = require("constants").eslint_cmd
-- local cspell_cmd = require("constants").eslint_cmd

local M = {}

M.setup = function() end

M.config = function()
  local null_ls = load("null-ls")
  local options = {
    sources = {
      null_ls.builtins.formatting.prettier.with({
        command = prettier_cmd
      }),
      null_ls.builtins.diagnostics.eslint.with({
        command = eslint_cmd
      }),
      -- null_ls.builtins.diagnostics.stylelint,
      null_ls.builtins.diagnostics.codespell,

      null_ls.builtins.code_actions.eslint.with({
        command = eslint_cmd
      }),
      null_ls.builtins.code_actions.gitsigns,
    },
  }
  null_ls.setup(options)
end
return M
