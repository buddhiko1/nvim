local load = require("utils").load
local map = require("utils").map

local M = {}

M.setup = function()
  map("n", "q", "<cmd> :tabclose <CR>")
  map("n", "L", "<cmd> :tabnext <CR>")
  map("n", "H", "<cmd> :tabprevious <CR>")
end

local render = function(f)
  f.make_tabs(function(info)
    local icon_color = f.icon_color(info.filename)

    if info.current then
      f.set_fg(icon_color)
    end

    f.add(' ' .. info.index .. ' ')

    if info.filename then
      f.add(info.modified and '+')
      f.add(info.filename)
      f.add(' ' .. f.icon(info.filename))
    else
      f.add(info.modified and '+[no name]' or '[no name]')
    end
    f.add ' '
  end)

  f.add_spacer()

  local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  f.add { '  ' .. errors .. '  ', fg = "#e86671" }
end

M.config = function()
  local tabline = load("tabline_framework")
  tabline.setup {
    render = render
  }
end

return M
