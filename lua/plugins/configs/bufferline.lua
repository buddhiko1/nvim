local load = require("utils").load
local map = require("utils").map

local M = {}

M.setup = function()
  map("n", "q", "<cmd> :BufferLinePickClose <CR>")
  map("n", "S", "<cmd> :BufferLinePick <CR>")
  map("n", "L", "<cmd> :BufferLineCycleNext <CR>")
  map("n", "H", "<cmd> :BufferLineCyclePrev <CR>")
end

M.config = function()
  local bufferline = load("bufferline")
  local options = {
    options = {
      offsets = {
        {
          filetype = "NvimTree",
          text = " Explorer",
          highlight = "Directory",
          text_align = "left",
        },
      },
      buffer_close_icon = "",
      modified_icon = "",
      close_icon = "",
      color_icons = false,
      left_trunc_marker = "",
      right_trunc_marker = "",
      show_buffer_icons = false,
      show_buffer_close_icons = false,
      show_close_icon = false,
      separator_style = "thin",
      always_show_bufferline = false,
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local icon = level:match("error") and " " or " "
        return "" .. icon .. count
      end
    }
  }

  bufferline.setup(options)
end

return M
