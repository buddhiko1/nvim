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

M.printTable = function(data)
  for key, value in pairs(data) do
    print('\t', key, value)
  end
end

return M
