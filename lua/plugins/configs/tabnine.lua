local load = require("utils").load

local M = {}

M.setup = function() end

M.config = function()
  local tabnine = load("cmp_tabnine.config")

  local options = {
    max_lines = 1000,
    max_num_results = 10,
    sort = true,
    run_on_every_keystroke = true,
    snippet_placeholder = "..",
    ignored_file_types = {
      html = true,
    },
    show_prediction_strength = false,
  }
  tabnine.setup(options)
end
return M
