local load = require("utils").load
local map = require("utils").map

local M = {}

M.setup = function()
  -- ctrl + /
  map("n", "<C-_>", "<cmd> :lua require('Comment.api').toggle.linewise.current()<CR>")
  map("v", "<C-_>", "<esc><cmd> :lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")
end

M.config = function()
  local comment = load("Comment")

  local options = {
    opleader = {
      line = "tl",
      block = "tb",
    },
    toggler = {
      line = "tll",
      block = "tbb",
    },
    extra = {
      above = "tO",
      below = "to",
      eol = "te", -- Add comment at the end of line
    },
  }

  comment.setup(options)
end

return M
