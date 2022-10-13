local autocmd = vim.api.nvim_create_autocmd
local log = require("utils").log

autocmd({ "VimEnter" }, {
  callback = function()
    vim.g.log = log

    vim.cmd("set laststatus=0")
    -- require("lualine").hide()
    -- fix fullscreen bug of alacritty
    local pid, WINCH = vim.fn.getpid(), vim.loop.constants.SIGWINCH
    vim.defer_fn(function()
      vim.loop.kill(pid, WINCH)
    end, 500)
  end
})

-- autocmd({ "WinEnter" }, {
--   callback = function()
--     vim.cmd("set laststatus=0")
--   end
-- })

autocmd({ "DirChanged" }, {
  callback = function()
    vim.cmd("set laststatus=0")
  end
})

autocmd({ "VimLeave" }, {
  callback = function()
    vim.cmd("!kill -9 node")
    -- require("dap").disconnect()
    -- require("dap").close()
  end
})

-- clear command after a while
autocmd("CmdlineLeave", {
  callback = function()
    vim.defer_fn(function() vim.cmd('echo ""') end, 6000)
  end,
})

-- clear commandline message
autocmd("CursorHold", {
  callback = function()
    vim.cmd("echo ''")
  end,
})

-- Highlight yanked text
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 2500 }
  end,
})

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
