local load = require("utils").load
local map = require("utils").map

local M = {}

M.setup = function()
end

M.config = function()
  local leap = load("searchbox")
  leap.set_default_keymaps()
end
return M
