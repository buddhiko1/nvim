local load = require("utils").load
local map = require("utils").map

local M = {}

M.setup = function()
  map("n", "<leader>g", "<cmd> :Telescope live_grep <CR>")
  map("n", "<leader>f", "<cmd> :Telescope oldfiles <CR>")
  map("n", "<leader>p", "<cmd> :Telescope projects <CR>")
  map("n", "<leader>fk", "<cmd> :Telescope keymaps <CR>")
  map("n", "<leader>fh", "<cmd> :Telescope help_tags <CR>")
  map("n", "<leader>ff", "<cmd> :Telescope find_files <CR>")
  map("n", "<leader>fc", "<cmd> :Telescope git_commits <CR>")
  map("n", "<leader>fs", "<cmd> :Telescope git_status <CR>")
end

M.config = function()
  local telescope = load("telescope")
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

          ["<C-c>"] = "close",

          ["<C-u>"] = "preview_scrolling_up",
          ["<C-d>"] = "preview_scrolling_down",
          [";f"] = "close",
        },
        n = {
          [";f"] = "close",
          ["q"] = "close"
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
      file_ignore_patterns = { "node_modules" },
    },
    -- extensions = {"projects"}
  }

  telescope.setup(options)
  telescope.load_extension("projects")
end

return M
