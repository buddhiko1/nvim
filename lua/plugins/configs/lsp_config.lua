local load = require("utils").load
local map = require("utils").map

local on_attach = function(client, bufnr)
  local opt = { buffer = bufnr }
  map("n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
  map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
  map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
  map("n", "<leader>s", "<cmd>lua vim.diagnostic.setloclist()<CR>", opt)

  map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
  map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
  map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
  map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
  map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
  map("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opt)
  map("n", "<leader>ra", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
  map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
  map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  map("n", "<leader>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
  map("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opt)
  map("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opt)
  map("n", "<leader>wl", "<cmd>lua vim.lsp.buf.list_workspace_folders()<CR>", opt)
end

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
  local servers = { 'cssls','html','tsserver','graphql','jsonls','sqlls','sumneko_lua','dockerls','yamlls','remark_ls' }
  for _, lsp in pairs(servers) do
    lspconfig[lsp].setup {
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
      }
    }
  end
end

return M
