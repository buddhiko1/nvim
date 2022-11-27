local autocmd = vim.api.nvim_create_autocmd
local log = require("utils").log

autocmd({ "VimEnter" }, {
  callback = function()
    vim.g.log = log
    vim.cmd("set laststatus=0")
    vim.cmd("TSUpdate")
    -- vim.cmd("TwilightEnable")
  end,
})

autocmd({ "VimLeave" }, {
  callback = function()
    vim.cmd("!kill -9 node")
  end,
})

-- Highlight yanked text
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 2500 })
  end,
})

-- alpha plugin
autocmd("User", {
  pattern = "AlphaReady",
  desc = "disable status, tabline and cmdline for alpha",
  callback = function()
    vim.cmd("set showtabline=0")
  end,
})
autocmd("BufUnload", {
  buffer = 0,
  desc = "enable status, tabline and cmdline after alpha",
  callback = function()
    vim.cmd("set showtabline=2")
  end,
})

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
