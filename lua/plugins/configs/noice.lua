local load = require("utils").load
local map = require("utils").map

local M = {}

M.setup = function()
  map("n", "<leader>mh", "<cmd> :Noice telescope<CR>")
end

M.config = function()
  local noice = load("noice")
  local options = {
    messages = {
      view_search = false
    },
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      progress = {
        enabled = false,
      },
      signature = {
        enabled = false,
      },
    },
  }
  noice.setup(options)
end
return M
