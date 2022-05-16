local load = require("utils").load

local diagnostic_amend = function()
  vim.diagnostic.config({
    underline = true,
    severity_sort = false,
    signs = true,
    update_in_insert = false,
    virtual_text = {
      prefix = "",
    },
  })
  local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end
end

local M = {}

M.config = function ()
  diagnostic_amend()
  local lspconfig = load("lspconfig")
  local common_opts = load("lsp.common")
  local servers = { 'cssls','html','tsserver','graphql','jsonls','sqlls','sumneko_lua','dockerls','yamlls','remark_ls' }
  for _, lsp in pairs(servers) do
    lspconfig[lsp].setup {
      on_attach = common_opts.on_attach,
      flags = {
        debounce_text_changes = common_opts.debounce_text_changes
      },
    }
  end
end

return M
