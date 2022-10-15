local load = require("utils").load

local M = {}

M.config = function()
  local autopairs = load("nvim-autopairs")
  local cmp = load("cmp")
  local options = {
    fast_wrap = {},
    disable_filetype = { "TelescopePrompt", "vim" },
  }
  autopairs.setup(options)

  local cmp_autopairs = require("nvim-autopairs.completion.cmp")
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

return M
