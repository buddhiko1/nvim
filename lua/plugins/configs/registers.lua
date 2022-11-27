local load = require("utils").load

local M = {}

M.config = function()
  local registers = load("registers")
  local options = {
    symbols = {
      newline = "⏎",
      space = " ",
      tab = "·",
      register_type_charwise = "ᶜ", -- The character to show when a register will be applied in a char-wise fashion
      register_type_linewise = "ˡ", -- The character to show when a register will be applied in a line-wise fashion
      register_type_blockwise = "ᵇ", -- The character to show when a register will be applied in a block-wise fashion
    },
    window = {
      max_width = 100,
      highlight_cursorline = true,
      border = "single",
      transparency = 0,
    },
  }
  registers.setup(options)
end
return M
