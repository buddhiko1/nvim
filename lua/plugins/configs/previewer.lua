local map = require("utils").map

local M = {}

M.setup = function()
  map({ "i", "n", "v" }, "<leader>pp", "<cmd> :MarkdownPreviewToggle<CR>")
end

M.config = function()
end

return M
