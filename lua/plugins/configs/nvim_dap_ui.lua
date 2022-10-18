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
      -- Use a table to apply multiple mappings
      expand = { "<CR>", "<2-LeftMouse>" },
      open = "o",
      remove = "d",
      edit = "e",
      repl = "r",
      toggle = "t",
    },
    -- Expand lines larger than the window
    expand_lines = vim.fn.has("nvim-0.7") == 1,
    layouts = {
      {
        elements = {
          -- Elements can be strings or table with id and size keys.
          "breakpoints",
          "scopes",
          "stacks",
          "watches",
        },
        size = 40, -- 40 columns
        position = "left",
      },
      {
        elements = {
          "repl",
          "console",
        },
        size = 0.25, -- 25% of total lines
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
      max_height = nil, -- These can be integers or a float between 0 and 1.
      max_width = nil, -- Floats will be treated as percentage of your screen.
      border = "single", -- Border style. Can be "single", "double" or "rounded"
      mappings = {
        close = { "q", "<Esc>" },
      },
    },
    windows = { indent = 1 },
    render = {
      max_type_length = nil, -- Can be integer or nil.
      max_value_lines = 100, -- Can be integer or nil.
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
