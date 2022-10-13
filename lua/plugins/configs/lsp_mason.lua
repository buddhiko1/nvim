local load = require("utils").load
local map = require("utils").map

local M = {}

M.setup = function ()
  map("n", "<leader>pl", "<cmd> :Mason <CR>")
end

M.config = function()
  local mason = load("mason")

  local options = {
    ui = {
      icons = {
        package_installed = "﫠",
        package_pending = "",
        package_uninstalled = "",
      },
    },
    keymaps = {
      toggle_package_expand = "<CR>",
      install_package = "i",
      update_package = "u",
      check_package_version = "c",
      update_all_packages = "U",
      check_outdated_packages = "C",
      uninstall_package = "x",
      cancel_installation = "<C-c>",
      apply_language_filter = "<C-f>",
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
  }

  mason.setup(options)
end

return M
