local load = require("utils").load
local map = require("utils").map

local M = {}

M.setup = function()
  map({ "n", "v" }, "<leader>hc", "<cmd> :Legendary<CR>")
end

M.config = function()
  local legendary = load("legendary")
  legendary.setup()
end
return M
