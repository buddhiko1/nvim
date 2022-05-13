local load = require("utils").load

local M = {}

M.config = function()
   local null_ls = load("null-ls")
   local b = null_ls.builtins

   local options = {
      debug = true,
      sources = {

         -- webdev stuff
         b.formatting.deno_fmt,
         b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } },

         -- Lua
         b.formatting.stylua,
         b.diagnostics.luacheck.with { extra_args = { "--global vim" } },

         -- Shell
         b.formatting.shfmt,
         b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

         -- cpp
         b.formatting.clang_format,
      },
   }

   null_ls.setup(options)
end

return M
