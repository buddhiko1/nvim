local load = require("utils").load

local M = {}

M.config = function()
  local autosave = load("auto-save")

  local options = {
    enabled = true,
    execution_message = {
      message = function()
        return (" ")
      end,
      dim = 0.18, -- dim the color of `message`
      cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
    },
    -- execution_message = "Saved",
    events = { "InsertLeave", "TextChanged" },
    conditions = {
      exists = true,
      filename_is_not = {},
      filetype_is_not = {},
      modifiable = true,
    },
    write_all_buffers = false,
    on_off_commands = false,
    clean_command_line_interval = 1000,
    debounce_delay = 135,
    fast_wrap = {},
    disable_filetype = { "TelescopePrompt", "vim" },
  }

  autosave.setup(options)
end

return M
