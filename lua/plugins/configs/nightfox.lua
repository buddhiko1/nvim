local load = require("utils").load
local map = require("utils").map
local is_windows = require("utils").is_windows

local _switch_alacritty_theme = function(theme)
  local alacritty_path = is_windows() and "C:/Users/adhip/AppData/Roaming/alacritty/" or "~/.config/alacritty/"
  local config_path = alacritty_path .. "alacritty.yml"
  local themes_path = alacritty_path .. "themes"
  local backup_path = alacritty_path .. "alacritty.backup.yml"
  local theme_file = theme .. ".yml"
  local options = " -c " .. config_path .. " -t " .. themes_path .. " -b " .. backup_path .. " -s " .. theme_file
  local command = is_windows() and "silent !alacritty-theme-switch.cmd" or "silent !alacritty-theme-switch"
  command = command .. options
  vim.cmd(command)
end

local _highlight_cursor = function (is_day_theme)
  if is_day_theme then
    vim.cmd("highlight Cursor guibg=black guifg=white")
    vim.cmd("set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20")
  else
    vim.cmd("highlight Cursor guibg=#cc0000 guifg=black")
    vim.cmd("set guicursor=n-v-c-sm:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor")
  end
end

local _switch_theme = function(theme)
  -- must switch alacritty theme frist for fixing screen bug
  _switch_alacritty_theme(theme)
  vim.cmd("colorscheme " .. theme)
  local is_day_theme = theme == "dayfox" or theme == "dawnfox"
  _highlight_cursor(is_day_theme)
end

local M = {}

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
  _switch_theme("nightfox")
  -- _switch_theme("dawnfox")
end

return M
