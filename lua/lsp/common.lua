local map = require("utils").map

local M = {}

M.on_attach = function(client, bufnr)
  -- keybind
  local opt = { buffer = bufnr }
  map("n", "sp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
  map("n", "sn", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)

  map("n", "sh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
  map("n", "ss", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
  map("n", "sc", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
  map("n", "sd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
  map("n", "srr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  map("n", "st", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opt)

  map("n", "si", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
  map("n", "sr", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
  map("n", "sa", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
  map("n", "sf", "<cmd>lua vim.lsp.buf.format { async = true }<CR>", opt)

  map("n", "wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opt)
  map("n", "wd", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opt)
  map("n", "wf", "<cmd>lua vim.lsp.buf.list_workspace_folders()<CR>", opt)

  -- formatting
  vim.api.nvim_create_autocmd("BufLeave", {
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format { async = true }
    end
  })
end

M.debounce_text_changes = 150

return M
