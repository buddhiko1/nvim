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
      map({ 'n', 'v' }, 'hs', ':Gitsigns stage_hunk<CR>', { buffer = bufnr })
      map('n', 'hss', gs.stage_buffer, { buffer = bufnr })
      map('n', 'hu', gs.undo_stage_hunk, { buffer = bufnr })
      map({ 'n', 'v' }, 'hr', ':Gitsigns reset_hunk<CR>', { buffer = bufnr })
      map('n', 'hrr', gs.reset_buffer, { buffer = bufnr })
      map('n', 'hb', function() gs.blame_line { full = true } end, { buffer = bufnr })
      map('n', 'htb', gs.toggle_current_line_blame, { buffer = bufnr })
      map('n', 'hd', gs.diffthis, { buffer = bufnr })
      map('n', 'hdd', function() gs.diffthis('~') end, { buffer = bufnr })
      map('n', 'htd', gs.toggle_deleted, { buffer = bufnr })
      map('n', 'hp', gs.preview_hunk, { buffer = bufnr })
      map({ 'o', 'x' }, 'hh', ':<C-U>Gitsigns select_hunk<CR>', { buffer = bufnr })
    end
  }

  gitsigns.setup(options)
end

return M
