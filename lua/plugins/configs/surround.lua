local load = require("utils").load

local M = {}

M.config = function()
  local surround = load("nvim-surround")

  -- :help nvim-surround
  local options = {
    keymaps = {
      -- insert
      insert = "<C-s>",
      insert_line = "<C-S>",
      normal = "ys",
      normal_cur = "yss", -- current line
      normal_line = "yS", -- new line
      visual = "S",
      visual_line = "SS",

      -- change and delete
      delete = "ds",
      change = "cs",
    },
    aliases = {
      ["a"] = ">",
      ["b"] = ")",
      ["B"] = "}",
      ["r"] = "]",
      ["q"] = { '"', "'", "`" },
      ["s"] = { "}", "]", ")", ">", '"', "'", "`" },
    },
    move_cursor = false,
  }

  surround.setup(options)
end
return M
