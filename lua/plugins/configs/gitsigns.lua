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
        map('n', 'gp', gs.preview_hunk,{ buffer=bufnr })
        map({'o', 'x'}, 'gh', ':<C-U>Gitsigns select_hunk<CR>',{ buffer=bufnr })
        map({'n', 'v'}, 'gs', ':Gitsigns stage_hunk<CR>',{ buffer=bufnr })
        map({'n', 'v'}, 'gr', ':Gitsigns reset_hunk<CR>',{ buffer=bufnr })
        map('n', 'gu', gs.undo_stage_hunk,{ buffer=bufnr })
        map('n', 'gss', gs.stage_buffer,{ buffer=bufnr })
        map('n', 'grr', gs.reset_buffer,{ buffer=bufnr })
        map('n', 'gb', function() gs.blame_line{full=true} end,{ buffer=bufnr })
        map('n', 'gbb', gs.toggle_current_line_blame,{ buffer=bufnr })
        map('n', 'gd', gs.diffthis,{ buffer=bufnr })
        map('n', 'gdd', function() gs.diffthis('~') end,{ buffer=bufnr })
        map('n', 'gtd', gs.toggle_deleted,{ buffer=bufnr })
      end
   }

   gitsigns.setup(options)
end

return M
