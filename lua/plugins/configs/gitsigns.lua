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
    update_debounce = 500,
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns
      map('n', '<leader>gp', gs.prev_hunk, { buffer = bufnr })
      map('n', '<leader>gn', gs.next_hunk, { buffer = bufnr })
      map({ 'n', 'v' }, '<leader>gs', gs.stage_hunk, { buffer = bufnr })
      map({ 'n', 'v' }, '<leader>gr', gs.reset_hunk, { buffer = bufnr })
      map('n', '<leader>gu', gs.undo_stage_hunk, { buffer = bufnr })
      map('n', '<leader>gsb', gs.stage_buffer, { buffer = bufnr })
      map('n', '<leader>grb', gs.reset_buffer, { buffer = bufnr })
      map('n', '<leader>gb', function() gs.blame_line { full = true } end, { buffer = bufnr })
      map('n', '<leader>gtb', gs.toggle_current_line_blame, { buffer = bufnr })
      map('n', '<leader>gd', gs.diffthis, { buffer = bufnr })
      map('n', '<leader>gdt', function() gs.diffthis('~') end, { buffer = bufnr })
      map('n', '<leader>gtd', gs.toggle_deleted, { buffer = bufnr })
      map('n', '<leader>gpv', gs.preview_hunk, { buffer = bufnr })
    end
  }

  gitsigns.setup(options)
end

return M
