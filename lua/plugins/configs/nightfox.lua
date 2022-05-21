local load = require("utils").load
local map = require("utils").map

local M = {}

M.setup = function()
  -- theme switch
  map("n", "<leader>v", function()
    local theme = vim.g.colors_name
    if theme == "dawnfox" then
      vim.cmd("colorscheme duskfox")
    else
      vim.cmd("colorscheme dawnfox")
    end
    require("plugins.configs.tabline").reload() -- sync tabline color
  end)
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
  vim.cmd "colorscheme dawnfox"
end

return M
