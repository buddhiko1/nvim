local load = require("utils").load
local map = require("utils").map

local M = {}

M.setup = function()
  map("n", "<leader>um", "<cmd> :Mason <CR>")
end

M.config = function()
  local mason = load("mason")

  local options = {
    ui = {
      border = "single",
      icons = {
        package_installed = "﫠",
        package_pending = "",
        package_uninstalled = "",
      },
    }
  }

  mason.setup(options)
end

return M
