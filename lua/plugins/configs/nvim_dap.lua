local load = require("utils").load
local map = require("utils").map

local M = {}

M.setup = function()
  -- keymap
  map("n", "<leader>dc", "<cmd> :lua require'dap'.continue()<CR>")
  map("n", "<leader>dd", "<cmd> :lua require'dap'.disconnect()<CR>")
  map("n", "<leader>dq", "<cmd> :lua require'dap'.close()<CR>")
  map("n", "<leader>dt", "<cmd> :lua require'dap'.terminate()<CR>")
  map("n", "<leader>dp", "<cmd> :lua require'dap'.pause.toggle()<CR>")
  map("n", "<leader>db", "<cmd> :lua require'dap'.toggle_breakpoint()<CR>")

  map("n", "<leader>dn", "<cmd> :lua require'dap'.step_over()<CR>")
  map("n", "<leader>di", "<cmd> :lua require'dap'.step_into()<CR>")
  map("n", "<leader>do", "<cmd> :lua require'dap'.step_out()<CR>")
  map("n", "<leader>dz", "<cmd> :lua require'dap'.run_to_cursor()<CR>")

  map("n", "<leader>dv", "<cmd> :lua require'dap.ui.variables'.scopes()<CR>")
  map("n", "<leader>dh", "<cmd> :lua require'dap.ui.variables'.hover()<CR>")
  map("n", "<leader>ds", "<cmd> :lua require'dap'.session()<CR>")

  map("n", "<leader>dr", "<cmd> :lua require'dap'.repl.toggle()<CR>")
  map("n", "<leader>dl", "<cmd> :lua require'dap'.repl.run_last()<CR>")

  --icon
  local dap_breakpoint = {
    point = {
      text = "",
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
  vim.fn.sign_define("DapBreakpoint", dap_breakpoint.point)
  vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
  vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)
end

M.config = function()
  local HOME = os.getenv "HOME"
  local DEBUGGER_LOCATION = HOME .. "/Software/vscode-chrome-debug"

  local dap = load("dap")
  dap.adapters.chrome = {
    type = "executable",
    command = "node",
    args = { DEBUGGER_LOCATION .. "/out/src/chromeDebug.js" },
  }

  dap.configurations.javascript = {
    {
      type = "chrome",
      request = "attach",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = "inspector",
      port = 9222,
      webRoot = "${workspaceFolder}",
    },
  }

  dap.configurations.typescript = {
    {
      type = "chrome",
      request = "attach",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = "inspector",
      port = 9222,
      webRoot = "${workspaceFolder}",
    },
  }
end
return M
