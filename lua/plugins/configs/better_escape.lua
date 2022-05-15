local load = require("utils").load

local M = {}

M.config = function()
  local escape = load("better_escape")

  local options = {
    mapping = { "kj" }, -- a table with mappings to use
    timeout = vim.o.timeoutlen,
    clear_empty_lines = false, -- clear line after escaping if there is only whitespace
    keys = "<Esc>",
  }

  escape.setup(options)
end

return M
