local load = require("utils").load
local map = require("utils").map
local is_windows = require("utils").is_windows

local M = {}

M.setup = function()
  map('n', '<leader>v', '<CMD>lua require("FTerm").toggle()<CR>')
  map('t', '<leader>v', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
end

M.config = function()
  local fterm = load("FTerm")
  local cmd = is_windows() and "powershell /nologo" or os.getenv("SHELL")
  local options = {
    cmd = cmd,
    border = "single",
    dimensions = {
      height = 0.9,
      width = 0.9,
    },
  }

  fterm.setup(options)

  local gitui = fterm:new({
    ft = 'gitui', -- file type
    cmd = "g",
    dimensions = {
      height = 0.9,
      width = 0.9
    }
  })
  local ng = fterm:new({
    ft = 'ng', -- file type
    cmd = "ns",
    dimensions = {
      height = 1.0,
      width = 1.0
    }
  })
  map('n', '<leader>cc', function()
    gitui:toggle()
  end)
  map('n', '<f5>', function()
    ng:toggle()
  end)
end

return M
