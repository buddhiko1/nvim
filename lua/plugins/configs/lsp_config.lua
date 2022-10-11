local load = require("utils").load
local map = require("utils").map
local servers = require("plugins.configs.lsp_mason_lspconfig").servers

local _config_diagnostic = function()
  -- ui
  local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  vim.diagnostic.config({
    virtual_text = false,
  })
end


local _lsp_flags = {
  debounce_text_changes = 150,
}

local _on_attach = function(client, bufnr)
  vim.lsp.buf.format({bufnr=bufnr})
end

local M = {}

M.setup = function ()
  vim.g.diagnostics_virtual_text = false
  local _toggle_virtual_text = function()
    if vim.g.diagnostics_virtual_text then
      vim.diagnostic.config({
        virtual_text = false,
      })
      vim.g.diagnostics_virtual_text = false
    else
    vim.diagnostic.config({
        virtual_text = true,
      })
      vim.g.diagnostics_virtual_text = true
    end
  end
  map("n", "<leader>st", _toggle_virtual_text, { silent = true })
end

M.config = function()
  _config_diagnostic()

  local lspconfig = load("lspconfig")

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

  for _, server in pairs(servers) do
    local options = {
      capabilities = capabilities,
      on_attach = _on_attach,
      flags = _lsp_flags
    }

    server = vim.split(server, "@")[1]
	  local require_ok, server_option = pcall(require, "plugins.configs.lsp_servers." .. server)
	  if require_ok then
		  options = vim.tbl_deep_extend("force", server_option, options)
	  end
    lspconfig[server].setup {options}
  end
end

return M
