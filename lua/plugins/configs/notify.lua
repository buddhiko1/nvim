local load = require("utils").load
local map = require("utils").map

local M = {}

M.setup = function()
  map({ "n", "v" }, "<leader>mc", function()
    require("notify").dismiss({ pending = true, silent = true })
  end)
end

M.config = function()
  local notify = load("notify")
  local options = {
    background_colour = "Normal",
    fps = 30,
    icons = {
      DEBUG = "",
      ERROR = "",
      INFO = "",
      TRACE = "✎",
      WARN = "",
    },
    level = 2, -- warning
    minimum_width = 50,
    render = "default",
    stages = "static",
    timeout = 5000,
    top_down = true,
  }
  notify.setup(options)
end
return M
