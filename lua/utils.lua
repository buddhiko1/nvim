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

return M
