local load = require("utils").load

local M = {}

M.servers = {
  "cssls",
  "html",
  "tsserver",
  "graphql",
  "jsonls",
  "lua_ls",
  "dockerls",
  "yamlls",
  "jsonls",
  "angularls",
  "tailwindcss",
  "lemminx"
}

M.config = function()
  local mason_lspconfig = load("mason-lspconfig")

  local options = {
    ensure_installed = M.servers,
    automatic_installation = true,
  }

  mason_lspconfig.setup(options)
end

return M
