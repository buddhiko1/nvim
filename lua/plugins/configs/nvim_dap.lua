local load = require("utils").load
local map = require("utils").map

local M = {}

M.setup = function()
  map('n', '<leader>dc', '<cmd> :lua require"dap".continue()<CR>')
  map('n', '<leader>ds', '<cmd> :lua require"dap".step_over()<CR>')
  map('n', '<leader>di', '<cmd> :lua require"dap".step_into()<CR>')
  map('n', '<leader>do', '<cmd> :lua require"dap".step_out()<CR>')
  map('n', '<leader>dt', '<cmd> :lua require"dap".toggle_breakpoint()<CR>')

  map('n', '<leader>ds', '<cmd> :lua require"dap.ui.variables".scopes()<CR>')
  map('n', '<leader>dh', '<cmd> :lua require"dap.ui.variables".hover()<CR>')
  map('n', '<leader>dhh', '<cmd> :lua require"dap.ui.widgets".hover()<CR>')
  map('v', '<leader>dv', '<cmd> :lua require"dap.ui.variables".visual_hover()<CR>')
  map('n', '<leader>df', "<cmd> :lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>")

  map('n', '<leader>db', '<cmd> :lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
  map('n', '<leader>dbb', '<cmd> :lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>')
  map('n', '<leader>dr', '<cmd> :lua require"dap".repl.open()<CR>')
  map('n', '<leader>drr', '<cmd> :lua require"dap".repl.run_last()<CR>')
end

M.config = function()
  local options = {
  }
end

return M
