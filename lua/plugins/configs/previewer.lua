local map = require("utils").map

local M = {}

M.setup = function()
  map({ "i", "n", "v" }, "<leader>um", "<cmd> :MarkdownPreviewToggle<CR>")
end

M.config = function() end

return M
