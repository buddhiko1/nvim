local M = {}

M.map = function(mode, keys, command, opts)
  local options = opts or {}
  options.noremap = true
  options.silent = true
  vim.keymap.set(mode, keys, command, options)
end

M.load = function(plugin)
  local present, loaded = pcall(require, plugin)
  if not present then
    error("Couldn't load " .. plugin .. "\n")
  end
  return loaded
end

M.get_palette = function()
  local theme = vim.g.colors_name
  local palette = require('nightfox.palette').load(theme)
  return palette
end

M.is_windows = function()
  return vim.loop.os_uname().sysname == "Windows_NT"
end

M.is_file_exists = function(name)
  local f = io.open(name, "r")
  if f ~= nil then io.close(f) return true else return false end
end

M.switch_alacritty_theme = function(theme)
  local alacritty_path = M.is_windows() and "C:/Users/adhip/AppData/Roaming/alacritty/" or "~/.config/alacritty/"
  local config_path = alacritty_path .. "alacritty.yml"
  local themes_path = alacritty_path .. "themes"
  local backup_path = alacritty_path .. "alacritty.backup.yml"
  local theme_file = theme .. ".yml"
  local options = " -c " .. config_path .. " -t " .. themes_path .. " -b " .. backup_path .. " -s " .. theme_file
  local command = M.is_windows() and "silent !alacritty-theme-switch.cmd" or "silent !alacritty-theme-switch"
  command = command .. options
  vim.cmd(command)
end

return M
