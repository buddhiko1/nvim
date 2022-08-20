local load = require("utils").load


local M = {}

M.config = function()
  local lspconfig = load("lspconfig")

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

  local debounce = 150
  local servers = { 'cssls', 'html', 'tsserver', 'graphql', 'jsonls', 'sqlls', 'sumneko_lua', 'dockerls', 'yamlls',
    'marksman' }

  for _, lsp in pairs(servers) do
    lspconfig[lsp].setup {
      capabilities = capabilities, -- advertise nvim-cmp to lsp
      -- on_attach = function() end,
      flags = {
        debounce_text_changes = debounce
      },
    }
  end
end

return M
