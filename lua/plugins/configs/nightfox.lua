local load = require("utils").load
local map = require("utils").map

local M = {}

M.setup = function()
  -- theme switch
  map("n", "<leader>v", function()
    local theme = vim.g.colors_name
    if theme == "dawnfox" then
      vim.cmd("colorscheme duskfox")
      vim.cmd("highlight Cursor guibg=#b30000 guifg=black")
      vim.cmd("set guicursor=n-v-c-sm:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor")
    else
      vim.cmd("colorscheme dawnfox")
      vim.cmd("set guicursor=n-v-c-sm:block,i-ci-ve:ver25-Cursor,r-cr-o:hor20")
    end
    require("plugins.configs.tabline").reload() -- sync tabline color
    vim.cmd("set laststatus=0") --lualine bug fix
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
