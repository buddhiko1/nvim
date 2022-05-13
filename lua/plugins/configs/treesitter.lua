local load = require("utils").load

local M = {}

M.config = function ()
   local treesitter = load("nvim-treesitter.configs")

   local options = {
      ensure_installed = {
         "vim",
         "html",
         "css",
         "javascript",
         "typescript",
         "json",
         "markdown",
         "bash",
         "lua",
      },
      highlight = {
         enable = true,
         additional_vim_regex_highlighting = false,
         use_languagetree = true,
      },
      incremental_selection = {
         enable = true,
         keymaps = {
            -- init_selection = "<CR>",
            -- node_incremental = "<CR>"
            -- node_decremental = "<BS>",
         },
      },
      indent = {
         enable = true,
      },
   }

   treesitter.setup(options)
end

return M