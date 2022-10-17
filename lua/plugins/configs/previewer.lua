local map = require("utils").map

local M = {}

M.setup = function()
  map({ "n" }, "<leader>p", "<cmd> :MarkdownPreviewToggle<CR>")
end

M.config = function() end

return M
