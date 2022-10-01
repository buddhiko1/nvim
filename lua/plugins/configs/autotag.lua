local load = require("utils").load

local M = {}

M.config = function()
  local autotag = load("nvim-ts-autotag")
  local options = {
    filetypes = { "html", "xml" },
  }
  autotag.setup(options)
end

return M
