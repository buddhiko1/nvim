local load = require("utils").load

local M = {}

M.config = function()
  local lsp_installer = load("nvim-lsp-installer")

  local options = {
    automatic_installation = true, -- any lsp server setup by lspconfig is going to get installed automatically!

    ui = {
      icons = {
        server_installed = "﫠",
        server_pending = "",
        server_uninstalled = "",
      },
      keymaps = {
        toggle_server_expand = "<CR>",
        install_server = "i",
        update_server = "u",
        check_server_version = "c",
        update_all_servers = "U",
        check_outdated_servers = "C",
        uninstall_server = "X",
      },
    },
    max_concurrent_installers = 20,
  }

  lsp_installer.setup(options)
end

return M
