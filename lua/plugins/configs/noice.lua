local load = require("utils").load
local map = require("utils").map

local M = {}

M.setup = function()
end

M.config = function()
  local noice = load("noice")
  noice.setup()
end
return M
