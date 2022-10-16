local load = require("utils").load
local map = require("utils").map
local is_windows = require("utils").is_windows

local M = {}

M.setup = function()
  map("n", "<leader>v", "<cmd>lua require('FTerm').toggle()<CR>")
  map("t", "<leader>v", "<C-\\><C-n><CMD>lua require('FTerm').toggle()<CR>")
  map("t", "<Esc>", "<C-\\><C-n><CMD>lua require('FTerm').exit()<CR>")
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
    ft = "gitui",
    cmd = "g",
    dimensions = {
      height = 0.9,
      width = 0.9,
    },
  })
  map("n", "<leader>ug", function()
    gitui:open()
  end)

  local btop = fterm:new({
    ft = "fterm_btop",
    cmd = "btop",
    dimensions = {
      height = 0.9,
      width = 0.9,
    },
  })
  map("n", "<leader>us", function()
    btop:toggle()
  end)

  local ng = fterm:new({
    ft = "ng",
    cmd = "ns",
    dimensions = {
      height = 1.0,
      width = 1.0,
    },
  })
  map("n", "<leader>dw", function()
    ng:open()
  end)
end

return M
