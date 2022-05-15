local load = require("utils").load

local M = {}

M.config = function()
  local blankline = load("indent_blankline")

  local options = {
    indentLine_enabled = 1,
    char = "▏",
    filetype_exclude = {
      "help",
      "alpha",
      "packer",
      "lspinfo",
      "TelescopePrompt",
      "TelescopeResults",
      "lsp-installer",
      "",
    },
    show_trailing_blankline_indent = false,
    show_first_indent_level = false,
  }

  blankline.setup(options)
end

return M
