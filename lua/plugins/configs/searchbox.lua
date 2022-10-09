local load = require("utils").load
local map = require("utils").map

local M = {}

M.setup = function()
  map("n", "<leader>wM", ":SearchBoxMatchAll<CR>")
  map("n", "<leader>wm", ":SearchBoxMatchAll -- <C-r>=expand('<cword>')<CR><CR>")
  map("n", "<leader>wR", ":SearchBoxReplace exact=true<CR>")
  map("n", "<leader>wr", ":SearchBoxReplace exact=true -- <C-r>=expand('<cword>')<CR><CR>")
  map("v", "<leader>wr", ":SearchBoxReplace exact=true visual_mode=true -- <C-r>=expand('<cword>')<CR><CR>")

end

M.config = function()
  local searchbox = load("searchbox")
  local optons = {
    defaults = {
      reverse = false,
      exact = false,
      prompt = " ",
      modifier = "disabled",
      confirm = "off",
      clear_matches = true,
      show_matches = false,
    },
    popup = {
      relative = "win",
      position = {
        row = "5%",
        col = "95%",
      },
      size = 30,
      border = {
        style = "single",
        text = {
          top = " Search ",
          top_align = "left",
        },
      },
      win_options = {
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
      },
    },
    hooks = {
      before_mount = function(input)
      end,
      after_mount = function(input)
        map("i", "<C-u>", "<Plug>(searchbox-scroll-up)", { buffer = input.bufnr })
        map("i", "<C-d>", "<Plug>(searchbox-scroll-down)", { buffer = input.bufnr })

        vim.bo.filetype = "search"
      end,
      on_done = function(value, search_type)
      end
    }
  }
  searchbox.setup(optons)
end
return M
