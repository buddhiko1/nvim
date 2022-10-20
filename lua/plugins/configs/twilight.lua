local load = require("utils").load
local map = require("utils").map

local M = {}

M.setup = function() end

M.config = function()
  local twilight = load("twilight")

  local options = {
    dimming = {
      alpha = 0.25, -- amount of dimming
      color = { "Normal", "#ffffff" },
      term_bg = "#000000", -- if guibg=NONE, this will be used to calculate text color
      inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
    },
    context = 15, -- amount of lines we will try to show around the current line
    treesitter = true,
    expand = {
      "function",
      "method",
      "table",
      "if_statement",
    },
    exclude = { "neo-tree", "Outline" },
  }

  twilight.setup(options)
end

return M
