local load = require("utils").load
local map = require("utils").map
local switch_alacritty_theme = require("utils").switch_alacritty_theme

local M = {}

local _switch_theme = function(theme)
  -- must switch alacritty theme frist for fixing screen bug
  switch_alacritty_theme(theme)

  vim.cmd("colorscheme " .. theme)

  -- switch cursor theme
  if theme == "duskfox" then
    vim.cmd("highlight Cursor guibg=#cc0000 guifg=black")
    vim.cmd("set guicursor=n-v-c-sm:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor")
  else
    vim.cmd("colorscheme dawnfox")
    vim.cmd("highlight Cursor guibg=black guifg=white")
    vim.cmd("set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20")
  end
end

M.setup = function()
  -- keymap for toggle theme
  map("n", "<leader>t", function()
    local theme = vim.g.colors_name
    if theme == "dawnfox" then
      _switch_theme("duskfox")
    else
      _switch_theme("dawnfox")
    end
    -- sync tabline color
    require("plugins.configs.tabline").reload()
    --lualine bug fix
    vim.cmd("set laststatus=0")
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

  -- init theme
  -- _switch_theme("duskfox")
  _switch_theme("dawnfox")
end

return M
