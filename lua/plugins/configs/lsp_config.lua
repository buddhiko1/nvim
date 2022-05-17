local load = require("utils").load

local ui_amend = function()
  -- diagnostic
  vim.diagnostic.config({
    underline = true,
    signs = true,
    update_in_insert = false,
    virtual_text = false,
    float = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = 'single',
      source = 'always',
      prefix = ' ',
      scope = 'cursor',
    }
  })
  local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  -- other
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "single",
  })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "single",
  })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

local M = {}

M.config = function()
  ui_amend()
  local lspconfig = load("lspconfig")
  local common_opts = load("lsp.common")
  local servers = { 'cssls', 'html', 'tsserver', 'graphql', 'jsonls', 'sqlls', 'sumneko_lua', 'dockerls', 'yamlls', 'remark_ls' }
  for _, lsp in pairs(servers) do
    lspconfig[lsp].setup {
      capabilities = capabilities,
      on_attach = common_opts.on_attach,
      flags = {
        debounce_text_changes = common_opts.debounce_text_changes
      },
    }
  end
end

return M
