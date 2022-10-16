local load = require("utils").load

local M = {}

M.config = function()
  local luasnip = load("luasnip")

  luasnip.config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI",
  })

  require("luasnip.loaders.from_vscode").lazy_load()
end

return M
