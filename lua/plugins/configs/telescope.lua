local load = require("utils").load
local map = require("utils").map

local M = {}

M.setup = function()
  map("n", "<leader>hp", "<cmd> :Telescope projects <CR>")
  map("n", "<leader>hf", "<cmd> :Telescope find_files <CR>")
  map("n", "<leader>hr", "<cmd> :Telescope oldfiles <CR>")

  map("n", "<leader>hs", "<cmd> :Telescope live_grep <CR>")

  map("n", "<leader>ht", "<cmd> :Telescope help_tags <CR>")
  map("n", "<leader>hc", "<cmd> :Telescope commands <CR>")
  map("n", "<leader>hh", "<cmd> :Telescope search_history <CR>")
  map("n", "<leader>hk", "<cmd> :Telescope keymaps <CR>")
  map("n", "<leader>ho", "<cmd> :Telescope vim_options <CR>")
end

M.config = function()
  local telescope = load("telescope")
  local actions = load("telescope.actions")
  local options = {
    defaults = {
      initial_mode = "normal",

      -- mapping
      mappings = {
        i = {
          ["<C-j>"] = "move_selection_next",
          ["<C-k>"] = "move_selection_previous",

          ["<C-n>"] = "cycle_history_next",
          ["<C-p>"] = "cycle_history_prev",

          ["<C-K>"] = "preview_scrolling_up",
          ["<C-J>"] = "preview_scrolling_down",

          [";f"] = "close",
        },
        n = {
          ["<C-n>"] = "cycle_history_next",
          ["<C-p>"] = "cycle_history_prev",

          [";f"] = "close",
          ["q"] = "close",

          ["h"] = "which_key",

          ["t"] = "file_tab",
          ["v"] = "file_vsplit"
        },
      },

      -- display
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
          results_width = 0.8,
        },
        vertical = {
          mirror = false,
        },
        width = 0.87,
        height = 0.80,
        preview_cutoff = 120,
      },
      prompt_prefix = "   ",
      -- selection_caret = "  ",
      -- entry_prefix = "  ",
      border = {},
      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      color_devicons = true,
      path_display = { "truncate" },
      winblend = 0,

      -- search
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
      },
      selection_strategy = "reset",
      sorting_strategy = "ascending",
      file_ignore_patterns = { "node_modules", ".git" },

      -- extensions
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case", -- or "ignore_case" or "respect_case", the default case_mode is "smart_case".
        }
      },
    },
  }

  telescope.setup(options)
  telescope.load_extension('fzf')
  telescope.load_extension("projects")
end

return M
