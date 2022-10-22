local load = require("utils").load

local _switch_alacritty_theme = function(theme)
  local alacrity_dir = require("constants").alacritty_dir
  local config_path = alacrity_dir .. "/alacritty.yml"
  local themes_path = alacrity_dir .. "/themes"
  local backup_path = alacrity_dir .. "/alacritty.backup.yml"
  local theme_file = theme .. ".yml"
  local options = " -c " .. config_path .. " -t " .. themes_path .. " -b " .. backup_path .. " -s " .. theme_file
  local command = require("constants").theme_switch_cmd
  command = command .. options
  vim.cmd(command)
end

local _highlight_cursor = function(is_day_theme)
  if is_day_theme then
    vim.cmd("highlight Cursor guibg=black guifg=white")
    vim.cmd("set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20")
  else
    vim.cmd("highlight Cursor guibg=red guifg=black")
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

M.setup = function() end

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
  local theme = require("constants").terminal_theme
  _switch_theme(theme)
end

return M
