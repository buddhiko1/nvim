local load = require("utils").load

local M = {}

M.config = function()
   local null_ls = load("null-ls")
   local formatting = null_ls.builtins.formatting

   local options = {
      debug = false,
      sources = {
         formatting.shfmt,
         formatting.stylua,
         formatting.prettier.with({
            filetypes = {
               "javascript",
               "typescript",
               "css",
               "scss",
               "html",
               "json",
               "yaml",
               "graphql",
               "markdown",
            },
            prefer_local = "node_modules/.bin",
         }),
      },
   }

   null_ls.setup(options)
end

return M
