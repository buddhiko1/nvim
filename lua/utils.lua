local M = {}

M.close_buffer = function(force)
   local fileExists = vim.fn.filereadable(vim.fn.expand "%p")
   local modified = vim.api.nvim_buf_get_option(vim.fn.bufnr(), "modified")

   -- if file doesnt exist & its modified
   if fileExists == 0 and modified then
      print "no file name? add it now!"
      return
   end

   force = force or not vim.bo.buflisted or vim.bo.buftype == "nofile"

   -- if not force, change to prev buf and then close current
   local close_cmd = force and ":bd!" or ":bp | bd" .. vim.fn.bufnr()
   vim.cmd(close_cmd)
end

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

return M
