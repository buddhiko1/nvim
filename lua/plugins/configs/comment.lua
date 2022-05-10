local present, comment = pcall(require, "Comment")

if not present then
   return
end

local M = {}

M.setup = function()
   local map = require("core.utils").map
   local opt = require("core.utils").opt
   -- ctrl + /
   map("n", "<C-_>", "<cmd> :lua require('Comment.api').toggle_current_linewise()<CR>", opt(""))
   map("v", "<C-_>", "<esc><cmd> :lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>", opt(""))
end

M.config = function ()
   comment.setup()
end

return M
