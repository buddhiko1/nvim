local load = require("utils").load

local M = {}

M.setup = function ()
   require("utils").packer_lazy_load "nvim-lsp-installer"
   -- reload the current file so lsp actually starts for it
   vim.defer_fn(function()
      vim.cmd 'if &ft == "packer" | echo "" | else | silent! e %'
   end, 0)
end

M.config = function ()
   local lsp_installer = load("nvim-lsp-installer")

   local options = {
      -- ensure_installed is not needed as automatic_installation is enabled
      -- then any lsp server you setup by lspconfig is going to get installed automatically!

      -- ensure_installed = { "lua" },
      automatic_installation = true,

      ui = {
         icons = {
            server_installed = "",
            server_pending = "",
            server_uninstalled = "ﮊ",
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