local load = require("utils").load
local map = require("utils").map

local M = {}

M.config = function()
local navigator = load("navigator")

  -- local servers = { 'cssls', 'html', 'tsserver', 'graphql', 'jsonls', 'sqlls', 'sumneko_lua', 'dockerls', 'yamlls', 'marksman' }

local options = {
    -- servers = servers,
    keymaps = {
      { key = ';sp', func = vim.diagnostic.goto_pre, doc = "previous diagnostic" },
      { key = ';sn', func = vim.diagnostic.goto_next, doc = "next diagnostic" },

      { key = ';sh', func = vim.lsp.buf.hover, doc = "hover" },
      { key = ';ss', func = vim.lsp.buf.signature_help, doc = "signature help" },
      { key = ';sc', func = vim.lsp.buf.declaration, doc = 'declaration' },
      { key = ';srr', func = vim.lsp.buf.references, doc = 'references' },
      { key = ';st', func = vim.lsp.buf.type_definition, doc = 'type definition' },
      { key = ';si', func = vim.lsp.buf.implementation, doc = 'implementation' },
      { key = ';sr', func = vim.lsp.buf.rename, doc='rename' },
      { key = ';sa', func = vim.lsp.buf.code_action, doc = 'code_action' },

      { key = ';wa', func = vim.lsp.buf.add_workspace_folder, doc = "add workspace folder" },
      { key = ';wd', func = vim.lsp.buf.remove_workspace_folder, doc = "remove workspace folder" },
      { key = ';wf', func = vim.lsp.buf.list_workspace_folder, doc = "list workspace folder" },
    },
    icons = {
      diagnostic_virtual_text = '',
    },
    lsp_installer = true,
  }

  navigator.setup(options)
end

return M
