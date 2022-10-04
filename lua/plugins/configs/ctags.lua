local map = require("utils").map
local disable_mapping_at = require("utils").disable_mapping_at

local M = {}

M.setup = function()
  map("n", "<leader>a", function()
    return disable_mapping_at("alpha") and vim.cmd("TagbarToggle")
  end)
end

M.config = function()
  vim.cmd("let g:tagbar_position = 'topleft vertical'")
  vim.cmd("let g:tagbar_width = 28")
  vim.cmd("let g:tagbar_compact = 1")
end

return M
