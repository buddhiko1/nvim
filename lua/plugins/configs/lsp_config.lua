local load = require("utils").load

local amend = function()
  vim.diagnostic.config({
    virtual_text = {
      prefix = "",
    },
    signs = true,
    update_in_insert = false,
  })
  local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end
end

local M = {}

M.config = function ()
  amend()
  local lspconfig = load("lspconfig")
  local common_opts = load("lsp.common")
  local servers = { 'cssls','html','tsserver','graphql','jsonls','sqlls','sumneko_lua','dockerls','yamlls','remark_ls' }
  for _, lsp in pairs(servers) do
    lspconfig[lsp].setup {
      on_attach = common_opts.on_attach,
      flags = {
        debounce_text_changes = common_opts.debounce_text_changes
      }
    }
  end
end

return M
