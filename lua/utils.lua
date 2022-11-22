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

M.get_theme_palette = function()
  local theme = vim.g.colors_name
  local palette = require("nightfox.palette").load(theme)
  return palette
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

M.getFileExtensionFromPath = function(path)
  local str = path
  local temp = ""
  local result = "."

  for i = str:len(), 1, -1 do
    if str:sub(i, i) ~= "." then
      temp = temp .. str:sub(i, i)
    else
      break
    end
  end

  for j = temp:len(), 1, -1 do
    result = result .. temp:sub(j, j)
  end

  return result
end

M.formatting = function(bufnr)
  local name = vim.api.nvim_buf_get_name(bufnr)
  local fileExtension = M.getFileExtensionFromPath(name)
  local nullExtensiones = { ".ts", ".html", ".css", "yaml" }
  local filterClient = ""
  for _, item in pairs(nullExtensiones) do
    if fileExtension == item then
      filterClient = "null-ls"
      break
    end
  end
  vim.lsp.buf.format({
    filter = function(client)
      if filterClient ~= "" then
        return client.name == filterClient
      else
        return true
      end
    end,
    bufnr = bufnr,
    timeout_ms = 5000,
  })
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
