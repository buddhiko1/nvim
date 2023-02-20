local load = require("utils").load
local map = require("utils").map
local showLine = require("plugins.configs.lualine").showLine

local M = {}

M.setup = function()
  map("n", "<leader>du", function()
    local dapui = load("dapui")
    dapui.toggle()
  end)
end

M.config = function()
  local dapui = load("dapui")

  local optons = {
    icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
    mappings = {
      expand = { "<CR>", "<2-LeftMouse>" },
      open = "o",
      remove = "d",
      edit = "e",
      repl = "r",
      toggle = "t",
    },
    layouts = {
      {
        elements = {
          "breakpoints",
          "scopes",
          -- "stacks",
          "watches",
        },
        size = 40,
        position = "left",
      },
      {
        elements = {
          "repl",
          "console",
        },
        size = 0.25,
        position = "bottom",
      },
    },
    controls = {
      enabled = true,
      element = "repl",
      icons = {
        pause = "",
        play = "",
        step_into = "",
        step_over = "",
        step_out = "",
        step_back = "",
        run_last = "↻",
        terminate = "□",
      },
    },
    floating = {
      border = "single",
      mappings = {
        close = { "q", "<Esc>" },
      },
    },
  }

  dapui.setup(optons)

  -- active dapui automatically
  local dap = load("dap")
  dap.listeners.after["event_initialized"]["dapui_config"] = function(session, body)
    showLine()
    dapui.open()
  end

  -- bug,event listener can't be triggered
  -- dap.listeners.before["event_terminated"]["dapui_config"] = function(session, body)
  --   print("dap terminated event")
  --   dapui.close()
  -- end
  -- dap.listeners.before["event_exited"]["dapui_config"] = function(session, body)
  --   print("dap exit event")
  --   dapui.close()
  -- end
end

return M
