local load = require("utils").load
local map = require("utils").map

local M = {}

M.setup = function()
  map("n", "<leader>mh", "<cmd> :Noice telescope <CR>")
end

M.config = function()

  local noice = load("noice")
  local options = {
    cmdline = {
      icons = {
        ["/"] = { icon = " ", hl_group = "DiagnosticWarn" },
        ["?"] = { icon = " ", hl_group = "DiagnosticWarn" },
        [":"] = { icon = " ", hl_group = "DiagnosticInfo", firstc = false },
      },
    },
  }
  noice.setup(options)
end
return M
