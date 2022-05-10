local present, project = pcall(require, "project_nvim")

if not present then
  return
end

local M = {}

M.config = function ()
  local options = {
    detection_methods = { "pattern" },
    patterns = { ".git", "package.json" },
  }

  project.setup(options)

  require("telescope").load_extension("projects")
end

return M