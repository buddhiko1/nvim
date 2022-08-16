local autocmd = vim.api.nvim_create_autocmd

-- fix fullscreen bug of alacritty
autocmd({ "VimEnter" }, {
  callback = function()
    local pid, WINCH = vim.fn.getpid(), vim.loop.constants.SIGWINCH
    vim.defer_fn(function()
      vim.loop.kill(pid, WINCH)
    end, 500)
  end
})

-- hide status bar
autocmd("VimEnter", {
  callback = function()
    vim.cmd("command! -nargs=1 -complete=help H tab help <args>") -- abbr
  end
})

-- hide command after a while
-- autocmd("CmdlineLeave", {
--   callback = function()
--     vim.defer_fn(function() vim.cmd('echo ""') end, 6000)
--   end,
-- })

-- -- Open a file from its last left off position
-- autocmd("BufAdd", {
--   callback = function()
--     if not vim.fn.expand("%:p"):match ".git" and vim.fn.line "'\"" > 1 and vim.fn.line "'\"" <= vim.fn.line "$" then
--       vim.cmd "normal! g'\""
--       vim.cmd "normal zz"
--     end
--   end,
-- })

-- Highlight yanked text
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 2500 }
  end,
})

-- autocmd({ 'SessionLoadPost' }, {
--   callback = function()
--     require('nvim-tree').toggle(false, true)
--   end,
-- })

-- Uncomment this if you want to open nvim with a dir
-- autocmd("BufEnter", {
--    callback = function()
--       if vim.api.nvim_buf_get_option(0, "buftype") ~= "terminal" then
--          vim.cmd "lcd %:p:h"
--       end
--    end,
-- })

-- Use relative & absolute line numbers in 'n' & 'i' modes respectively
-- autocmd("InsertEnter", {
--    callback = function()
--       vim.opt.relativenumber = false
--    end,
-- })
-- autocmd("InsertLeave", {
--    callback = function()
--       vim.opt.relativenumber = true
--    end,
-- })

-- File extension specific tabbing
-- autocmd("Filetype", {
--    pattern = "python",
--    callback = function()
--       vim.opt_local.expandtab = true
--       vim.opt_local.tabstop = 4
--       vim.opt_local.shiftwidth = 4
--       vim.opt_local.softtabstop = 4
--    end,
-- })

-- Enable spellchecking in markdown, text and gitcommit files
-- autocmd("FileType", {
--    pattern = { "gitcommit", "markdown", "text" },
--    callback = function()
--       vim.opt_local.spell = true
--    end,
-- })
