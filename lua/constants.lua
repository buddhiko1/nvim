local _is_windows = function()
  return vim.loop.os_uname().sysname == "Windows_NT"
end

local _HOME = _is_windows() and "C:/Users/adhip" or os.getenv("HOME")
local _CONFIG_DIR = _HOME .. (_is_windows() and "/AppData" or "/.config")
local _ALACRITTY_DIR = _CONFIG_DIR .. (_is_windows() and "/Roaming/alacritty" or "/alacritty")
local _DEBUGGER_DIR = _HOME .. (_is_windows() and "/Documents/Software" or "/Software")

local _get_terminal_theme = function()
  local seleted_theme_file = _ALACRITTY_DIR .. "/themes/.selected_theme"
  local lines = {}
  for line in io.lines(seleted_theme_file) do
    lines[#lines + 1] = line
  end
  local content = lines[1]
  local format = _is_windows() and ".*themes\\(%a+).yml" or ".*themes/(%a+).yml"
  local theme = string.match(content, format)
  return theme
end

local M = {
  terminal_theme = _get_terminal_theme(),
  alacritty_dir = _ALACRITTY_DIR,
  theme_switch_cmd = _is_windows() and "silent !alacritty-theme-switch.cmd" or "silent !alacritty-theme-switch",
  tabnine_install_cmd = _is_windows() and "powershell ./install.ps1" or "./install.sh",
  shell_open_cmd = _is_windows() and "powershell /nologo" or os.getenv("SHELL"),
  debugger_dir = _DEBUGGER_DIR,
}

return M
