local load = require("utils").load

local M = {}

M.config = function()
  local surround = load("nvim-surround")

  -- :help nvim-surround
  local options = {
    keymaps = {
      insert = "<C-s>",
      insert_line = "<C-s>s",
      normal = "ys",
      normal_cur = "yS", -- current line
      normal_line = "yss", -- new line
      visual = "S",
      visual_line = "SS",
      delete = "ds",
      change = "cs",
    },
  }

  surround.setup(options)
end

return M
