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

M.log = function(text)
  local notify = require("notify")
  notify(text, "error", {
    title = "Debug",
    icon = "",
  })
end

M.get_terminal_theme = function()
  local file = "/home/shun/.config/alacritty/themes/.selected_theme"
  local lines = {}
  for line in io.lines(file) do
    lines[#lines + 1] = line
  end
  local content = lines[1]
  local theme = string.match(content, ".*themes/(%a+).yml")
  return theme
end

M.get_theme_palette = function()
  local theme = vim.g.colors_name
  local palette = require("nightfox.palette").load(theme)
  return palette
end

M.is_windows = function()
  return vim.loop.os_uname().sysname == "Windows_NT"
end

M.is_file_exists = function(name)
  local f = io.open(name, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

M.disable_mapping_at = function(filetype)
  return vim.bo.filetype ~= filetype
end

M.print_table = function(data)
  for k, v in pairs(data) do
    print("data[" .. k .. "]", v)
  end
end
return M
