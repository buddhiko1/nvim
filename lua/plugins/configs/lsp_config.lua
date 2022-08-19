local load = require("utils").load

local ui_amend = function()
  local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end
end

local M = {}

M.config = function()
  ui_amend()
  local lspconfig = load("lspconfig")
  local debounce = 150
  local servers = { 'cssls', 'html', 'tsserver', 'graphql', 'jsonls', 'sqlls', 'sumneko_lua', 'dockerls', 'yamlls', 'marksman' }
  for _, lsp in pairs(servers) do
    lspconfig[lsp].setup {
      -- on_attach = common_opts.on_attach,
      flags = {
        debounce_text_changes = debounce
      },
    }
  end
end

return M
