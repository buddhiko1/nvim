local load = require("utils").load
local map = require("utils").map

local M = {}

M.setup = function()
  map("n", "fo", "<cmd> :NvimTreeToggle <CR>")
end

local keys = {
  { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },

  { key = "v", action = "vsplit" },
  { key = "b", action = "split" },

  { key = "i", action = "toggle_ignored" }, -- Ignore (node_modules)
  { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)

  { key = "<F5>", action = "refresh" },
  { key = "a", action = "create" },
  { key = "d", action = "remove" },
  { key = "r", action = "rename" },
  { key = "x", action = "cut" },
  { key = "c", action = "copy" },
  { key = "p", action = "paste" },
  { key = "o", action = "system_open" },
  { key = "P", action = "parent_node" },
  { key = "y", action = "copy_name" },
  { key = "Y", action = "copy_path" },
  { key = "F", action = "search_node" },
  { key = "<Tab>", action = "preview" },
}

local options = {
  filters = {
    dotfiles = true,
  },
  ignore_ft_on_setup = { "alpha" },
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  view = {
    width = 25,
    side = 'left',
    hide_root_folder = true,
    mappings = {
      custom_only = true,
      list = keys,
    },
    number = false,
    relativenumber = false,
    signcolumn = 'yes'
  },
  actions = {
    open_file = {
      resize_window = true
    }
  }
}

local vim_setup = function()
  local g = vim.g

  g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
      deleted = "",
      ignored = "◌",
      renamed = "",
      staged = "",
      unmerged = "",
      unstaged = "",
      untracked = "",
    },
    folder = {
      default = "",
      empty = "",
      empty_open = "",
      open = "",
      symlink = "",
      symlink_open = "",
      arrow_open = "",
      arrow_closed = "",
    },
  }
end

M.config = function()
  local nvimtree = load("nvim-tree")
  vim_setup() -- globals must be set prior to requiring nvim-tree to function
  nvimtree.setup(options)
end

return M
