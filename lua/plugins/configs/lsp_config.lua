local load = require("utils").load
local map = require("utils").map

local M = {}

M.mappings = function()
   map("n", "gD", function()
      vim.lsp.buf.declaration()
   end)

   map("n", "gd", function()
      vim.lsp.buf.definition()
   end)

   map("n", "K", function()
      vim.lsp.buf.hover()
   end)

   map("n", "gi", function()
      vim.lsp.buf.implementation()
   end)

   map("n", "<C-k>", function()
      vim.lsp.buf.signature_help()
   end)

   map("n", "<leader>D", function()
      vim.lsp.buf.type_definition()
   end)

   map("n", "<leader>ra", function()
      vim.lsp.buf.rename()
   end)

   map("n", "<leader>ca", function()
      vim.lsp.buf.code_action()
   end)

   map("n", "gr", function()
      vim.lsp.buf.references()
   end)

   map("n", "<leader>f", function()
      vim.diagnostic.open_float()
   end)

   map("n", "[d", function()
      vim.diagnostic.goto_prev()
   end)

   map("n", "d]", function()
      vim.diagnostic.goto_next()
   end)

   map("n", "<leader>q", function()
      vim.diagnostic.setloclist()
   end)

   map("n", "<leader>fm", function()
      vim.lsp.buf.formatting()
   end)

   map("n", "<leader>wa", function()
      vim.lsp.buf.add_workspace_folder()
   end)

   map("n", "<leader>wr", function()
      vim.lsp.buf.remove_workspace_folder()
   end)

   map("n", "<leader>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
   end)
end

M.handlers = function()
   local function lspSymbol(name, icon)
      local hl = "DiagnosticSign" .. name
      vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
   end

   lspSymbol("Error", "")
   lspSymbol("Info", "")
   lspSymbol("Hint", "")
   lspSymbol("Warn", "")

   vim.diagnostic.config {
      virtual_text = {
         prefix = "",
      },
      signs = true,
      underline = true,
      update_in_insert = false,
   }

   vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "single",
   })
   vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = "single",
   })

   -- suppress error messages from lang servers
   vim.notify = function(msg, log_level)
      if msg:match "exit code" then
         return
      end
      if log_level == vim.log.levels.ERROR then
         vim.api.nvim_err_writeln(msg)
      else
         vim.api.nvim_echo({ { msg } }, true, {})
      end
   end
end

M.on_attach = function(client, _)
   client.resolved_capabilities.document_formatting = false
   client.resolved_capabilities.document_range_formatting = false
   M.mappings()
end

M.config = function ()
   require("plugins.configs.lsp_installer").config()

   M.handlers()

   local capabilities = vim.lsp.protocol.make_client_capabilities()
   capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
   capabilities.textDocument.completion.completionItem.snippetSupport = true
   capabilities.textDocument.completion.completionItem.preselectSupport = true
   capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
   capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
   capabilities.textDocument.completion.completionItem.deprecatedSupport = true
   capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
   capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
   capabilities.textDocument.completion.completionItem.resolveSupport = {
      properties = {
         "documentation",
         "detail",
         "additionalTextEdits",
      },
   }

   local lspconfig = load("lspconfig")
   local options = {
      on_attach = M.on_attach,
      capabilities = capabilities,

      settings = {
         Lua = {
            diagnostics = {
               globals = { "vim" },
            },
            workspace = {
               library = {
                  [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                  [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
               },
               maxPreload = 100000,
               preloadFileSize = 10000,
            },
         },
      },
   }
   lspconfig.sumneko_lua.setup(options)
end

return M
