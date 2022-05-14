local load = require("utils").load

local M = {}

M.config = function()
   local autosave = load("autosave")
   local options = {
      enabled = true,
      execution_message = function ()
        return ""
      end,
      -- execution_message = "Saved",
      events = {"InsertLeave", "TextChanged"},
      conditions = {
        exists = true,
        filename_is_not = {},
        filetype_is_not = {},
        modifiable = true,
      },
      write_all_buffers = false,
      on_off_commands = false,
      clean_command_line_interval = 0,
      debounce_delay = 135,
      fast_wrap = {},
      disable_filetype = { "TelescopePrompt", "vim" },
   }
   autosave.setup(options)
end

return M
