local map = require("utils").map

local M = {}

M.setup = function()
  map("n", "<leader>a", "<cmd> :TagbarToggle<CR>")
end

M.config = function()
  vim.cmd("let g:tagbar_position = 'topleft vertical'")
  vim.cmd("let g:tagbar_width = 28")
  vim.cmd("let g:tagbar_compact = 1")
end

return M
