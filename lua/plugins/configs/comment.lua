local load = require("utils").load
local map = require("utils").map
local opt = require("utils").opt

local M = {}

M.setup = function()
   -- ctrl + /
   map("n", "<C-_>", "<cmd> :lua require('Comment.api').toggle_current_linewise()<CR>", opt(""))
   map("v", "<C-_>", "<esc><cmd> :lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>", opt(""))
end

M.config = function ()
   local comment = load("Comment")
   comment.setup()
end

return M
