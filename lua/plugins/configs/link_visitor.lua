local load = require("utils").load
local map = require("utils").map

local M = {}

M.setup = function()
  map({ "n", "v" }, "<leader>o", "<cmd> :VisitLinkNearCursor<CR>")
end

M.config = function()
  local link_visitor = load("link-visitor")

  local options = {
    silent = true,
    skip_confirmation = true
  }

  link_visitor.setup(options)
end
return M
