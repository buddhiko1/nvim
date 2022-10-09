local load = require("utils").load
local map = require("utils").map

local M = {}

M.setup = function()
  map("n", "<CR>", "<cmd>FineCmdline<CR>")
  map("n", ":", "<cmd>FineCmdline<CR>")

  map("n", "<leader>m", "<cmd>FineCmdline vertical help <CR>")
end

M.config = function()
  local cmdline = load("fine-cmdline")
  local optons = {
    cmdline = {
      enable_keymaps = true,
      smart_history = true,
      prompt = "> "
    },
    popup = {
      position = {
        row = "20%",
        col = "50%",
      },
      size = {
        width = "40%",
      },
      border = {
        style = "single",
      },
      win_options = {
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
      },
    },
    hooks = {
      before_mount = function(input)
      end,
      after_mount = function(input)
        map("i", "<C-p>", cmdline.fn.up_search_history)
        map("i", "<C-n>", cmdline.fn.down_search_history)
        vim.bo.filetype = "command"
      end,
      set_keymaps = function(imap, feedkeys)
      end
    }
  }
  cmdline.setup(optons)
end
return M
