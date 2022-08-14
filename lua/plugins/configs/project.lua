local load = require("utils").load

local M = {}

M.config = function()
  local project = load("project_nvim")
  local options = {
    detection_methods = { "pattern" },
    patterns = { ".git", "package.json" },
  }
  project.setup(options)
end

return M
