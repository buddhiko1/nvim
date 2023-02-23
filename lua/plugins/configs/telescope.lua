local load = require("utils").load
local map = require("utils").map

local M = {}

M.setup = function()
  map("n", "<leader>fp", "<cmd> :Telescope projects <CR>")
  map("n", "<leader>ff", "<cmd> :Telescope find_files <CR>")
  map("n", "<leader>fr", "<cmd> :Telescope oldfiles <CR>")

  map("n", "<leader>fg", "<cmd> :Telescope live_grep <CR>")

  map("n", "<leader>ft", "<cmd> :Telescope help_tags <CR>")
  map("n", "<leader>fc", "<cmd> :Telescope commands <CR>")
  map("n", "<leader>fh", "<cmd> :Telescope search_history <CR>")
  map("n", "<leader>fk", "<cmd> :Telescope keymaps <CR>")
  map("n", "<leader>fo", "<cmd> :Telescope vim_options <CR>")
  -- search the word under cursor
  map({ 'n', 'v' }, "<leader>fs", function ()
    load('telescope.builtin').grep_string({search = vim.fn.expand("<cword>")})
  end)
  map({ 'v' }, "<leader>fs", function ()
    load('telescope.builtin').grep_string({search = vim.fn.expand("<cWORD>")})
  end)
end

local telescope = load("telescope")
local actions = load("telescope.actions")
local transform_mod = load("telescope.actions.mt").transform_mod
local action_state = load("telescope.actions.state")

-- doc https://github.com/nvim-telescope/telescope.nvim/issues/1048
local function _multiOpen(prompt_bufnr, method)
    local edit_file_cmd_map = {
        vertical = "vsplit",
        horizontal = "split",
        tab = "tabedit",
        default = "edit",
    }
    local edit_buf_cmd_map = {
        vertical = "vert sbuffer",
        horizontal = "sbuffer",
        tab = "tab sbuffer",
        default = "buffer",
    }
    local picker = action_state.get_current_picker(prompt_bufnr)
    local multi_selection = picker:get_multi_selection()

    if #multi_selection > 1 then
        require("telescope.pickers").on_close_prompt(prompt_bufnr)
        pcall(vim.api.nvim_set_current_win, picker.original_win_id)

        for i, entry in ipairs(multi_selection) do
            local filename, row, col

            if entry.path or entry.filename then
                filename = entry.path or entry.filename

                row = entry.row or entry.lnum
                col = vim.F.if_nil(entry.col, 1)
            elseif not entry.bufnr then
                local value = entry.value
                if not value then
                    return
                end

                if type(value) == "table" then
                    value = entry.display
                end

                local sections = vim.split(value, ":")

                filename = sections[1]
                row = tonumber(sections[2])
                col = tonumber(sections[3])
            end

            local entry_bufnr = entry.bufnr

            if entry_bufnr then
                if not vim.api.nvim_buf_get_option(entry_bufnr, "buflisted") then
                    vim.api.nvim_buf_set_option(entry_bufnr, "buflisted", true)
                end
                local command = i == 1 and "buffer" or edit_buf_cmd_map[method]
                pcall(vim.cmd, string.format("%s %s", command, vim.api.nvim_buf_get_name(entry_bufnr)))
            else
                local command = i == 1 and "edit" or edit_file_cmd_map[method]
                if vim.api.nvim_buf_get_name(0) ~= filename or command ~= "edit" then
                    filename = require("plenary.path"):new(vim.fn.fnameescape(filename)):normalize(vim.loop.cwd())
                    pcall(vim.cmd, string.format("%s %s", command, filename))
                end
            end

            if row and col then
                pcall(vim.api.nvim_win_set_cursor, 0, { row, col-1})
            end
        end
    else
        actions["select_" .. method](prompt_bufnr)
    end
end

local _customActions = transform_mod({
    multi_selection_open_vertical = function(prompt_bufnr)
        _multiOpen(prompt_bufnr, "vertical")
    end,
    multi_selection_open_horizontal = function(prompt_bufnr)
        _multiOpen(prompt_bufnr, "horizontal")
    end,
    multi_selection_open_tab = function(prompt_bufnr)
        _multiOpen(prompt_bufnr, "tab")
    end,
    multi_selection_open = function(prompt_bufnr)
        _multiOpen(prompt_bufnr, "default")
    end,
})

local function _stopInsert(callback)
    return function(prompt_bufnr)
        vim.cmd.stopinsert()
        vim.schedule(function()
            callback(prompt_bufnr)
        end)
    end
end

M.config = function()
  local options = {
    defaults = {
      initial_mode = "normal",

      -- mapping
      mappings = {
        i = {
          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,

          ["<C-u>"] = actions.preview_scrolling_up,
          ["<C-d>"] = actions.preview_scrolling_down,
          ["<C-t>"] = _stopInsert(_customActions.multi_selection_open_tab),
        },
        n = {
          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,

          ["<Esc>"] = actions.close,

          ["h"] = actions.which_key,

          ["t"] = actions.select_tab,
          ["v"] = actions.file_vsplit,
          ["<C-t>"] = _customActions.multi_selection_open_tab,
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
