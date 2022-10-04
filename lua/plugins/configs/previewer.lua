local load = require("utils").load
local map = require("utils").map

local M = {}

M.setup = function()
  -- processes the document once, and refreshes the view
  map({ "i", "n", "v" }, "<leader>pp",
    function() require("knap").process_once() require("knap").toggle_autopreviewing() end)
  -- closes the viewer application, and allows settings to be reset
  map({ "i", "n", "v" }, "<leader>pq", function() require("knap").close_viewer() end)
  -- toggles the auto-processing on and off
  -- map({ "i", "n", "v" }, "<leader>pa", function() require("knap").toggle_autopreviewing() end)
  -- invokes a SyncTeX forward search, or similar, where appropriate
  map({ "i", "n", "v" }, "<leader>pj", function() require("knap").forward_jump() end)
end

M.config = function()
  local settings = {
    mdoutputext = "pdf",
    mdtohtml = "pandoc --standalone %docroot% -o %outputfile%",
    mdtohtmlviewerlaunch = "falkon %outputfile%",
    mdtohtmlviewerrefresh = "none",
    mdtopdf = "pandoc %docroot% -o %outputfile%",
    mdtopdfviewerlaunch = "sioyek %outputfile%",
    mdtopdfviewerrefresh = "none",

    markdownoutputext = "pdf",
    markdowntohtml = "pandoc --standalone %docroot% -o %outputfile%",
    markdowntohtmlviewerlaunch = "falkon %outputfile%",
    markdowntohtmlviewerrefresh = "none",
    markdowntopdf = "pandoc %docroot% -o %outputfile%",
    markdowntopdfviewerlaunch = "sioyek %outputfile%",
    markdowntopdfviewerrefresh = "none",
    delay = 250
  }
  vim.g.knap_settings = settings
end

return M
