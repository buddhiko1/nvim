local present, luasnip = pcall(require, "luasnip")

if not present then
   return
end

local M = {}

M.luasnip = function()
   luasnip.config.set_config {
      history = true,
      updateevents = "TextChanged,TextChangedI",
   }

   require("luasnip.loaders.from_vscode").lazy_load()
end

return M
