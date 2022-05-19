local load = require("utils").load
local map = require("utils").map

local M = {}

M.setup = function()
  -- ctrl + /
  map("n", "<C-_>", "<cmd> :lua require('Comment.api').toggle_current_linewise()<CR>")
  map("v", "<C-_>", "<esc><cmd> :lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>")
end

M.config = function()
  local comment = load("Comment")

  local options = {
    toggler = {
      line = 'tll',
      block = 'tbb',
    },
    opleader = {
      line = 'tl',
      block = 'tb',
    },
    extra = {
      above = 'tO',
      below = 'to',
      eol = 'te', -- Add comment at the end of line
    },
  }

  comment.setup(options)
end

return M
