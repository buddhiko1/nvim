local load = require("utils").load

local M = {}

M.config = function()
  local notify = load("notify")
  notify.setup()
  vim.notify = notify
  require("telescope").load_extension("notify")
end

return M
