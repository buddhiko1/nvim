local load = require("utils").load

local M = {}

M.config = function()
  local cmp = load("cmp")
  
  local options = {
    sources = {
      { name = 'nvim_lua' }
    }
  } 
  cmp.setup(options)
end

return M
