local load = require("utils").load
local map = require("utils").map

local M = {}

M.setup = function()
  map("n", "<leader>cp", "<cmd> :CccPick <CR>")
  map("n", "<leader>cc", "<cmd> :CccConvert <CR>")
end

M.config = function()
  local ccc = load("ccc")
  local mapping = ccc.mapping
  local options = {
    highlighter = {
      auto_enable = true,
    },
    mappings = {
      ["n"] = mapping.goto_next,
      ["p"] = mapping.goto_prev,
      ["<ESC>"] = mapping.quit,
    },
  }
  ccc.setup(options)
end
return M
