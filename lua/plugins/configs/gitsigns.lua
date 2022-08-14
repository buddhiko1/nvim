local load = require("utils").load
local map = require("utils").map

local M = {}

M.config = function()
  local gitsigns = load("gitsigns")

  local options = {
    signs = {
      add = { hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr" },
      change = { hl = "DiffChange", text = "~", numhl = "GitSignsChangeNr" },
      delete = { hl = "DiffDelete", text = "-", numhl = "GitSignsDeleteNr" },
      topdelete = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
      changedelete = { hl = "DiffChangeDelete", text = "~", numhl = "GitSignsChangeNr" },
    },
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns
      map('n', 'gp', gs.prev_hunk, { buffer = bufnr })
      map('n', 'gn', gs.next_hunk, { buffer = bufnr })
      map({ 'n', 'v' }, 'gs', gs.stage_hunk, { buffer = bufnr })
      map('n', 'gu', gs.undo_stage_hunk, { buffer = bufnr })
      map('n', 'gss', gs.stage_buffer, { buffer = bufnr })
      map('n', 'grr', gs.reset_buffer, { buffer = bufnr })
      map({ 'n', 'v' }, 'gr', gs.reset_hunk, { buffer = bufnr })
      map('n', 'gb', function() gs.blame_line { full = true } end, { buffer = bufnr })
      map('n', 'gtb', gs.toggle_current_line_blame, { buffer = bufnr })
      map('n', 'gd', gs.diffthis, { buffer = bufnr })
      map('n', 'gdd', function() gs.diffthis('~') end, { buffer = bufnr })
      map('n', 'gtd', gs.toggle_deleted, { buffer = bufnr })
      map('n', 'gv', gs.preview_hunk, { buffer = bufnr })
    end
  }

  gitsigns.setup(options)
end

return M
