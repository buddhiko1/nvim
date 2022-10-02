local load = require("utils").load

local M = {}

M.config = function()
  local scrollbar = load("scrollview")
  local options = {
    excluded_filetypes = { "neo-tree", "tagbar" },
    current_only = true,
    winblend = 0,
    base = 'right',
    column = 1
  }
  scrollbar.setup(options)
end

return M
