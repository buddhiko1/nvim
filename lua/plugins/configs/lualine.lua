local load = require("utils").load
local map = require("utils").map

local M = {}

M.config = function()
  map("n", "S", function()
    if vim.opt.laststatus['_value'] > 0 then
      vim.cmd "set laststatus=0"
    else
      vim.cmd "set laststatus=3"
    end
  end)

  local lualine = load("lualine")

  local options = {
    options = {
      icons_enabled = true,
      theme = 'auto',
      component_separators = { left = '|', right = '|' },
      section_separators = { left = '', right = '' },
      disabled_filetypes = { 'packer' },
      always_divide_middle = false,
      globalstatus = false,
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diff', 'diagnostics' },
      lualine_c = {},
      lualine_x = { 'encoding' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' }
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = { 'location' },
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    extensions = {}
  }

  lualine.setup(options)
  vim.cmd("set laststatus=0")
end

return M
