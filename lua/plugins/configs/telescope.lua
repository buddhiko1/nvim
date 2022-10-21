local load = require("utils").load
local map = require("utils").map

local M = {}

M.setup = function()
  map("n", "<leader>fp", "<cmd> :Telescope projects <CR>")
  map("n", "<leader>ff", "<cmd> :Telescope find_files <CR>")
  map("n", "<leader>fr", "<cmd> :Telescope oldfiles <CR>")

  map("n", "<leader>fs", "<cmd> :Telescope live_grep <CR>")

  map("n", "<leader>ft", "<cmd> :Telescope help_tags <CR>")
  map("n", "<leader>fc", "<cmd> :Telescope commands <CR>")
  map("n", "<leader>fh", "<cmd> :Telescope search_history <CR>")
  map("n", "<leader>fk", "<cmd> :Telescope keymaps <CR>")
  map("n", "<leader>fo", "<cmd> :Telescope vim_options <CR>")
end

M.config = function()
  local telescope = load("telescope")
  local options = {
    defaults = {
      initial_mode = "normal",

      -- mapping
      mappings = {
        i = {
          ["<C-n>"] = "cycle_history_next",
          ["<C-p>"] = "cycle_history_prev",

          ["<C-u>"] = "preview_scrolling_up",
          ["<C-d>"] = "preview_scrolling_down",

          ["<Esc>"] = "close",
        },
        n = {
          ["<C-n>"] = "cycle_history_next",
          ["<C-p>"] = "cycle_history_prev",

          ["q"] = "close",

          ["h"] = "which_key",

          ["t"] = "file_tab",
          ["v"] = "file_vsplit",
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
      wrap_results = true, -- wrap lone line

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
    },
  }

  telescope.setup(options)
  telescope.load_extension("projects")
end

return M
