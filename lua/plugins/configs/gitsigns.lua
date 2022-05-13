local load = require("utils").load

local M = {}

M.config = function()
   local gitsigns = load("gitsigns")

   local options = {
      signs = {
         add = { hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr" },
         change = { hl = "DiffChange", text = "~", numhl = "GitSignsChangeNr" },
         delete = { hl = "DiffDelete", text = "-", numhl = "GitSignsDeleteNr" },
         topdelete = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
         changedelete = { hl = "DiffChangeDelete", text = "~", numhl = "GitSignsChangeNr" },
      },
   }

   gitsigns.setup(options)
end

return M