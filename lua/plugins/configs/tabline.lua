local load = require("utils").load
local map = require("utils").map

local _SHOW = "show"
local _HIDDEN = "hidden"

local _show_render = function(f)
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

local _hidden_render = function(f)
  return f.add ''
end

local _show = function()
  local tabline = load("tabline_framework")
  local palette = require("utils").get_palette()
  tabline.setup {
    render = _show_render,
    -- hl = { fg = palette.fg1, bg = palette.bg1 },
    -- hl_sel = { fg = palette.fg1, bg = palette.green.bright },
    -- hl_fill = { fg = palette.fg0, bg = palette.bg0 }
  }
  vim.fn.setenv("CUSTOME_TABLE_STATUS", _SHOW)
end

local _hide = function()
  local tabline = load("tabline_framework")
  local palette = require("utils").get_palette()
  tabline.setup {
    render = _hidden_render,
    hl_fill = { fg = palette.fg1, bg = palette.bg1 }
  }
  vim.fn.setenv("CUSTOME_TABLE_STATUS", _HIDDEN)
end

local _toggle = function()
  local status = vim.fn.getenv("CUSTOME_TABLE_STATUS")
  if status == _SHOW then
    _hide()
  else
    _show()
  end
end

local M = {}

M.setup = function()
  map("n", "q", "<cmd> :tabclose <CR>")
  map("n", "L", "<cmd> :tabnext <CR>")
  map("n", "H", "<cmd> :tabprevious <CR>")
  map("n", "''", _toggle)
end

M.config = function()
  _hide()
end

M.reload = function()
  local status = vim.fn.getenv("CUSTOME_TABLE_STATUS")
  if status == _SHOW then
    _show()
  else
    _hide()
  end
end

return M
