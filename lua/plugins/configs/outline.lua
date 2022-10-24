local load = require("utils").load
local map = require("utils").map
local disable_mapping_at = require("utils").disable_mapping_at

local M = {}

M.setup = function()
  map("n", "<leader>a", function()
    return disable_mapping_at("alpha") and vim.cmd("SymbolsOutline")
  end)
end

M.config = function()
  local outline = load("symbols-outline")
  local options = {
    highlight_hovered_item = true,
    show_guides = true,
    auto_preview = false,
    position = "left",
    relative_width = true,
    width = 15,
    auto_close = false,
    show_symbol_details = false,
    keymaps = {
      toggle_preview = "K",
      rename_symbol = "r",
      fold_all = "Z",
      unfold_all = "z",
    },
  }
  outline.setup(options)
end

return M
