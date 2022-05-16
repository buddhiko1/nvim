local map = require("utils").map

local M = {}

M.on_attach = function(client, bufnr)
  -- keybind
  local opt = { buffer = bufnr }
  map("n", "<leader>dp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
  map("n", "<leader>dn", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)

  map("n", "<leader>sv", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
  map("n", "<leader>sc", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
  map("n", "<leader>sd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
  map("n", "<leader>sr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  map("n", "<leader>st", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opt)
  map("n", "<leader>sh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)

  map("n", "<leader>ji", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
  map("n", "<leader>jr", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
  map("n", "<leader>ja", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
  map("n", "<leader>jf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)

  map("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opt)
  map("n", "<leader>wd", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opt)
  map("n", "<leader>wl", "<cmd>lua vim.lsp.buf.list_workspace_folders()<CR>", opt)
end

M.debounce_text_changes = 150

return M
