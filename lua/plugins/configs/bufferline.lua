local load = require("utils").load
local map = require("utils").map
local opt = require("utils").opt

local M = {}

M.setup = function()
   map("n", "D", function()
      require("utils").close_buffer()
   end, opt(""))
   map("n", "S", ":w<CR>", opt("Save buffer"))
   map("n", "L", "<cmd> :BufferLineCycleNext <CR>", opt(""))
   map("n", "H", "<cmd> :BufferLineCyclePrev <CR>", opt(""))
end

M.config = function()
   local bufferline = load("bufferline")
   
   local options = {
      options = {
         offsets = {
            {
               filetype = "NvimTree",
               text = " Explorer",
               highlight = "Directory",
               text_align = "left",
            },
         },
         diagnostics = "nvim_lsp",
         diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = " "
            for e, n in pairs(diagnostics_dict) do
               local sym = e == "error" and " " or (e == "warning" and " " or "")
               s = s .. n .. sym
            end
            return s
         end,
         buffer_close_icon = "",
         modified_icon = "",
         close_icon = "",
         left_trunc_marker = "",
         right_trunc_marker = "",
         max_name_length = 14,
         max_prefix_length = 13,
         tab_size = 15,
         diagnostic = false,
         show_tab_indicators = true,
         enforce_regular_tabs = false,
         view = "multiwindow",
         show_buffer_close_icons = false,
         show_close_icon = false,
         separator_style = "thin",
         always_show_bufferline = false,
      }
   }

   bufferline.setup(options)
end

return M
