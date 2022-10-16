local load = require("utils").load
local map = require("utils").map
local disable_mapping_at = require("utils").disable_mapping_at

local M = {}

vim.g.show_lualine = false

M.showLine = function()
  local lualine = require("lualine")
  lualine.hide({ unhide = true })
  vim.g.show_lualine = true
end

M.hideLine = function()
  local lualine = require("lualine")
  lualine.hide()
  vim.g.show_lualine = false
end

M.toggleLine = function()
  if vim.g.show_lualine then
    M.hideLine()
  else
    M.showLine()
  end
end

M.config = function()
  map("n", "<leader>b", function()
    return disable_mapping_at("alpha") and M.toggleLine()
  end)

  local lualine = load("lualine")
  local options = {
    options = {
      icons_enabled = true,
      theme = "auto",
      component_separators = { left = "|", right = "|" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        "packer",
        "neo-tree",
        "tagbar",
        "dapui_scopes",
        "dapui_breakpoints",
        "dapui_stacks",
        "dapui_watches",
        "dap-repl",
        "dapui_console",
      },
      always_divide_middle = false,
      globalstatus = true,
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = {},
      lualine_x = { "encoding" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    extensions = { "neo-tree", "nvim-dap-ui" },
  }

  lualine.setup(options)
  lualine.hide()
end

return M
