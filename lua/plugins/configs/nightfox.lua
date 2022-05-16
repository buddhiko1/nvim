local load = require("utils").load
local map = require("utils").map

local M = {}

M.setup = function()
  vim.g.colors_name = "dawnfox"
  -- theme switch
  map("n", "<leader>t", "colors_name == 'dawnfox' ? '<cmd> :colorscheme duskfox <CR>' : '<cmd> :colorscheme dawnfox <CR>'", { expr = true })
end

M.config = function()
  local nightfox = load("nightfox")
  local options = {
    options = {
      transparent = false,
      terminal_colors = true,
      dim_inactive = true,
      styles = {
        comments = "italic",
        functions = "bold",
        keywords = "italic",
        numbers = "NONE",
        strings = "NONE",
        types = "italic,bold",
        variables = "NONE",
      },
    },
    all = {
      HighLightLineMatches = {
        bg = "#FFDE83",
      },
    },
  }
  nightfox.setup(options)
end

return M
