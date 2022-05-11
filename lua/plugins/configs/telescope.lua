local load = require("utils").load
local map = require("utils").map
local opt = require("utils").opt

local M = {}

M.setup = function ()
  map("n", "<leader>fp", "<cmd> :Telescope projects<CR>", opt(""))
  map("n", "<leader>ff", "<cmd> :Telescope find_files <CR>", opt(""))
  map("n", "<leader>fa", "<cmd> :Telescope find_files follow=true no_ignore=true hidden=true <CR>", opt(""))
  map("n", "<leader>fw", "<cmd> :Telescope live_grep <CR>", opt(""))
  map("n", "<leader>fo", "<cmd> :Telescope oldfiles <CR>", opt(""))
  map("n", "<leader>fm", "<cmd> :Telescope git_commits <CR>", opt(""))
  map("n", "<leader>fs", "<cmd> :Telescope git_status <CR>", opt(""))
  map("n", "<leader>fh", "<cmd> :Telescope help_tags <CR>", opt(""))
  map("n", "<leader>ft", "<cmd> :Telescope themes <CR>", opt(""))
  map("n", "<leader>fk", "<cmd> :Telescope keymaps <CR>", opt(""))
  map("n", "<leader>fb", "<cmd> :Telescope buffers <CR>", opt(""))
end

M.config = function ()
  local telescope = load("telescope")
  local options = {
    defaults = {
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
      },
      prompt_prefix = "   ",
      selection_caret = "  ",
      entry_prefix = "  ",
      initial_mode = "normal",
      selection_strategy = "reset",
      sorting_strategy = "ascending",
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
      file_sorter = require("telescope.sorters").get_fuzzy_file,
      file_ignore_patterns = { "node_modules" },
      generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
      path_display = { "truncate" },
      winblend = 0,
      border = {},
      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      color_devicons = true,
      use_less = true,
      set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
      file_previewer = require("telescope.previewers").vim_buffer_cat.new,
      grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
      qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
      -- Developer configurations: Not meant for general override
      buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
      mappings = {
        n = { ["q"] = require("telescope.actions").close },
      },
    },
  }

  telescope.setup(options)
end

return M
