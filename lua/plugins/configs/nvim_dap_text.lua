local load = require("utils").load
local map = require("utils").map

local M = {}

M.setup = function()
  map("n", "<leader>dv", "<cmd> :DapVirtualTextToggle<CR>")
end

M.config = function()
  local dap_text = load("nvim-dap-virtual-text")
  local options = {
    enabled = false,
    commented = false,
  }
  dap_text.setup(options)
end
return M
