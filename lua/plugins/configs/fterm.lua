local load = require("utils").load
local map = require("utils").map

local M = {}

M.setup = function()
  map('n', '<leader>v', '<CMD>lua require("FTerm").toggle()<CR>')
  map('t', '<leader>v', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
end

M.config = function()
  local fterm = load("FTerm")
  local options = {
    border = 'single',
    dimensions = {
      height = 0.9,
      width = 0.9,
    },
  }
  fterm.setup(options)
end

return M
