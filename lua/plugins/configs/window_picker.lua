local load = require("utils").load
local map = require("utils").map

local M = {}

M.setup = function()
  map("n", "<leader>ww", "<cmd>lua print(require('window-picker').pick_window())<CR>")
end

M.config = function()
  local picker = load("window-picker")
  local options = {
    autoselect_one = true,
    include_current_win = false,

    filter_func = nil,
    filter_rules = {
      bo = {
        filetype = { "neo-tree", "notify" }, -- if the file type is one of following, the window will be ignored
        buftype = { 'terminal' }, -- if the buffer type is one of following, the window will be ignored
      },
      wo = {}, -- filter using window options
      file_path_contains = {},
      file_name_contains = {}, -- if the file name contains one of following names, the window will be ignored
    },

    fg_color = '#ededed', -- the foreground (text) color of the picker
    current_win_hl_color = '#e35e4f', -- if you have include_current_win == true, then current_win_hl_color will be highlighted using this background color
    other_win_hl_color = '#44cc41', -- all the windows except the curren window will be highlighted using this color
  }
  picker.setup(options)
end

return M
