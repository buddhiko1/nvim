local load = require("utils").load
local map = require("utils").map
local disable_mapping_at = require("utils").disable_mapping_at

local M = {}

local _toggle = function()
  if vim.opt.laststatus["_value"] > 0 then
    vim.cmd "set laststatus=0"
  else
    vim.cmd "set laststatus=3"
  end
end

M.config = function()
  map("n", "<leader>b", function()
    return disable_mapping_at("alpha") and _toggle()
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
        "dapui_console"
      },
      always_divide_middle = false,
      globalstatus = false,
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = {},
      lualine_x = { "encoding" },
      lualine_y = { "progress" },
      lualine_z = { "location" }
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = { "location" },
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
