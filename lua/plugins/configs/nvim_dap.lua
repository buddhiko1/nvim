local load = require("utils").load
local map = require("utils").map

local M = {}

M.setup = function()
  -- keymap
  map('n', '<leader>dc', '<cmd> :lua require"dap".continue()<CR>')
  map('n', '<leader>dd', '<cmd> :lua require"dap".disconnect()<CR>')
  map('n', '<leader>dq', '<cmd> :lua require"dap".close()<CR>')
  map('n', '<leader>dx', '<cmd> :lua require"dap".terminate()<CR>')
  map('n', '<leader>dp', '<cmd> :lua require"dap".pause.toggle()<CR>')
  map('n', '<leader>dbl', '<cmd> :lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>')
  map('n', '<leader>dbc', '<cmd> :lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
  map('n', '<leader>dbt', '<cmd> :lua require"dap".toggle_breakpoint()<CR>')

  map('n', '<leader>ds', '<cmd> :lua require"dap".step_over()<CR>')
  map('n', '<leader>db', '<cmd> :lua require"dap".step_back()<CR>')
  map('n', '<leader>di', '<cmd> :lua require"dap".step_into()<CR>')
  map('n', '<leader>do', '<cmd> :lua require"dap".step_out()<CR>')
  map('n', '<leader>dtc', '<cmd> :lua require"dap".run_to_cursor()<CR>')

  map('n', '<leader>ds', '<cmd> :lua require"dap.ui.variables".scopes()<CR>')
  map('n', '<leader>dh', '<cmd> :lua require"dap.ui.variables".hover()<CR>')
  map('n', '<leader>dhh', '<cmd> :lua require"dap.ui.widgets".hover()<CR>')
  map('v', '<leader>dv', '<cmd> :lua require"dap.ui.variables".visual_hover()<CR>')
  map('n', '<leader>dss', '<cmd> :lua require"dap".session()<CR>')

  map('n', '<leader>dro', '<cmd> :lua require"dap".repl.open()<CR>')
  map('n', '<leader>drt', '<cmd> :lua require"dap".repl.toggle()<CR>')
  map('n', '<leader>drr', '<cmd> :lua require"dap".repl.run_last()<CR>')

  --icon
  local dap_breakpoint = {
    error = {
      text = "",
      texthl = "LspDiagnosticsSignError",
      linehl = "",
      numhl = "",
    },
    rejected = {
      text = "",
      texthl = "LspDiagnosticsSignHint",
      linehl = "",
      numhl = "",
    },
    stopped = {
      text = "",
      texthl = "LspDiagnosticsSignInformation",
      linehl = "DiagnosticUnderlineInfo",
      numhl = "LspDiagnosticsSignInformation",
    },
  }
  vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
  vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
  vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)
end

M.config = function()
  local dap = load('dap')
  dap.adapters.typescript = {
    type = 'executable',
    command = 'ts-node',
    args = { os.getenv('HOME') .. '/Dev/vscode-node-debug2/out/src/nodeDebug.js' },
  }
  dap.configurations.typescript = {
    {
      name = 'Launch',
      type = 'typescript',
      request = 'launch',
      program = '/home/shun/Coding/pali-epub/index.ts',
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = 'inspector',
      console = 'integratedTerminal'
    },
    {
      -- For this to work you need to make sure the node process is started with the `--inspect` flag.
      name = 'Attach to process',
      type = 'node2',
      request = 'attach',
      processId = require 'dap.utils'.pick_process,
    },
  }
end
return M
