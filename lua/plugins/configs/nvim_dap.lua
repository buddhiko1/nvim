local load = require("utils").load
local map = require("utils").map
local is_file_exists = require("utils").is_file_exists

local hideLine = require("plugins.configs.lualine").hideLine

local M = {}

M.setup = function()
  -- keymap
  map("n", "<leader>dc", function()
    -- overwrite configuration
    local launch_json = vim.fn.getcwd() .. "/launch.json"
    if is_file_exists(launch_json) then
      require("dap.ext.vscode").load_launchjs(launch_json)
    end
    require("dap").continue()
  end)
  map("n", "<leader>dq", "<cmd> :lua require'dap'.close()<CR>")
  map("n", "<leader>dt", function()
    hideLine()
    require("dap").terminate()
    require("dapui").close()
  end)
  map("n", "<leader>dp", "<cmd> :lua require'dap'.pause.toggle()<CR>")
  map("n", "<leader>db", "<cmd> :lua require'dap'.toggle_breakpoint()<CR>")
  map("n", "<leader>dB", "<cmd> :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
  map("n", "<leader>dx", "<cmd> :lua require'dap'.clear_breakpoints()<CR>")

  map("n", "<leader>dh", "<cmd> :lua require'dap'.step_back()<CR>")
  map("n", "<leader>dl", "<cmd> :lua require'dap'.step_over()<CR>")
  map("n", "<leader>dj", "<cmd> :lua require'dap'.step_into()<CR>")
  map("n", "<leader>dk", "<cmd> :lua require'dap'.step_out()<CR>")
  map("n", "<leader>dz", "<cmd> :lua require'dap'.run_to_cursor()<CR>")
  map("n", "<leader>dK", "<cmd> :lua require'dap'.up()<CR>")
  map("n", "<leader>dJ", "<cmd> :lua require'dap'.down()<CR>")

  map("n", "<leader>d?", "<cmd> :lua require'dap.ui.widgets'.hover()<CR>")
  map("n", "<leader>ds", "<cmd> :lua require'dap'.session()<CR>")

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
      text = "ﰲ",
      texthl = "LspDiagnosticsSignInformation",
      linehl = "DiagnosticUnderlineInfo",
      numhl = "LspDiagnosticsSignInformation",
    },
    conditioned = {
      text = "",
      texthl = "LspDiagnosticsSignInformation",
      linehl = "DiagnosticUnderlineInfo",
      numhl = "LspDiagnosticsSignInformation",
    },
  }
  vim.fn.sign_define("DapBreakpoint", dap_breakpoint.point)
  vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)
  vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
  vim.fn.sign_define("DapBreakpointCondition", dap_breakpoint.conditioned)
end

M.config = function()
  local dap = load("dap")

  -- float console
  -- dap.defaults.fallback.external_terminal = {
  --   command = "alacritty",
  --   args = { "-e" },
  -- }
  -- dap.defaults.fallback.force_external_terminal = true
  -- dap.defaults.fallback.terminal_win_cmd = "50vsplit new"
  -- dap.defaults.fallback.focus_terminal = true
  -- dap.set_log_level("INFO")

  local debugger_dir = require("constants").debugger_dir

  dap.adapters.typescript = function(callback, config)
    local adapter = {}
    if config.name == "Lanunch Node" then
      adapter = {
        type = "executable",
        command = "node",
        args = { debugger_dir .. "/vscode-node-debug2/out/src/nodeDebug.js" },
      }
    else
      adapter = {
        type = "executable",
        command = "node",
        args = { debugger_dir .. "/vscode-chrome-debug/out/src/chromeDebug.js" },
      }
    end
    callback(adapter)
  end

  -- dap.configurations.javascript = {
  --   {
  --     name = "Attach Js",
  --     type = "js",
  --     request = "attach",
  --     program = "${file}",
  --     cwd = "${workspaceFolder}",
  --     sourceMaps = true,
  --     protocol = "inspector",
  --     port = 9222,
  --     webRoot = "${workspaceFolder}",
  --   },
  -- }
  --
  -- dap.configurations.typescript = {
  --   {
  --     name = "Attach Angular",
  --     type = "typescript",
  --     request = "attach",
  --     program = "${file}",
  --     cwd = "${workspaceFolder}",
  --     sourceMaps = true,
  --     protocol = "inspector",
  --     port = 9222,
  --     webRoot = "${workspaceFolder}",
  --   },
  -- }
  --
  -- dap.configurations.typescript = {
  --   {
  --     name = "Lanunch Node",
  --     type = "typescript",
  --     request = "launch",
  --     runtimeArgs = { "-r", "ts-node/register" },
  --     runtimeExecutable = "node",
  --     args = { "--inspect", "${file}" },
  --     skipFiles = { "node_modules/**" },
  --     console = "integratedTerminal",
  --   },
  -- }
end
return M
