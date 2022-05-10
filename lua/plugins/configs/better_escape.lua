local present, escape = pcall(require, "better_escape")

if not present then
  return
end

local M = {}

M.config = function()
  local options = {
    mapping = { "kj" }, -- a table with mappings to use
    timeout = vim.o.timeoutlen,
    clear_empty_lines = false, -- clear line after escaping if there is only whitespace
    keys = "<Esc>",
  }

  escape.setup(options)
end

return M