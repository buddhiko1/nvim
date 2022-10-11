local load = require("utils").load
local map = require("utils").map

local M = {}

M.setup = function()
  -- action
  map("n", "<leader>sm", function() vim.lsp.buf.format() end)
  map("n", "<leader>sa", "<cmd>Lspsaga code_action<CR>")
  map("v", "<leader>saa", "<cmd><C-U>Lspsaga range_code_action<CR>")
  map("n", "<leader>sr", "<cmd>Lspsaga rename<CR>")

  map("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")
  map("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")

  -- motion
  map("n", "<leader>sp", "<cmd>Lspsaga diagnostic_jump_next<CR>")
  map("n", "<leader>sn", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
  map("n", "<leader>[", function() require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR }) end)
  map("n", "<leader>]", function() require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR }) end)

  -- viewer
  map("n", "<leader>sd", "<cmd>Lspsaga peek_definition<CR>")
  map("n", "<leader>sf", "<cmd>Lspsaga lsp_finder<CR>")
  map("n", "<leader>so", "<cmd>LSoutlineToggle<CR>")
  map("n", "<leader>sv", "<cmd>Lspsaga hover_doc<CR>")
  map("n", "<leader>sh", "<Cmd>Lspsaga signature_help<CR>")
  map("n", "<C-f>", function() require("lspsaga.action").smart_scroll_with_saga(1) end)
  map("n", "<C-b>", function() require("lspsaga.action").smart_scroll_with_saga(-1) end)
end

M.config = function()
  local saga = load("lspsaga")

  local options = {
    -- ui
    border_style = "rounded",
    saga_winblend = 0,
    symbol_in_winbar = {
      in_custom = false,
      enable = false,
      separator = ' ',
      show_file = true,
      click_support = false,
    },
    show_outline = {
      win_position = 'right',
      win_with = '',
      win_width = 30,
      auto_enter = true,
      auto_preview = true,
      virt_text = '┃',
      jump_key = 'o',
      auto_refresh = true,
    },
    code_action_lightbulb = {
      enable = true,
      sign = true,
      enable_in_insert = true,
      sign_priority = 20,
      virtual_text = true,
    },

    -- icons
    diagnostic_header = { " ", " ", " ", " " },
    code_action_icon = "💡",
    finder_icons = {
      def = '  ',
      ref = '諭 ',
      link = '  ',
    },

    -- key
    move_in_saga = { prev = '<C-p>', next = '<C-n>' },
    finder_action_keys = {
      open = "o",
      vsplit = "v",
      split = "vv",
      tabe = "t",
      quit = "q",
    },
    code_action_keys = {
      quit = "q",
      exec = "<CR>",
    },
    rename_action_quit = ";;",

    -- property
    rename_in_select = true,
    max_preview_lines = 10,
    code_action_num_shortcut = true,
    finder_request_timeout = 1500,
    custom_kind = {},
    server_filetype_map = {},
  }

  saga.init_lsp_saga(options)
end

return M
