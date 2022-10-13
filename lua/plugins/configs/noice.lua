local load = require("utils").load
local map = require("utils").map

local M = {}

M.setup = function()
  map("n", "<leader>il", "<cmd> :Notifications <CR>")
  map("n", "<leader>ih", "<cmd> :Noice telescope <CR>")
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

    -- routes = {
    --   -- filter notify message
    --   {
    --     filter = {
    --       event = "msg_show",
    --       ["not"] = {
    --         any = {
    --           { warning = true },
    --           { error = true }
    --         }
    --       }
    --     },
    --     opts = { skip = true },
    --   },
    -- },
  }
  noice.setup(options)
end
return M
