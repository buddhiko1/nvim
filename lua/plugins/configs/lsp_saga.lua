local load = require("utils").load

local map = require("utils").map

local M = {}

local _config_diagnostic_ui = function()
  local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end
end

M.setup = function()
  -- action
  map("n", "<leader>sa", "<cmd>Lspsaga code_action<CR>", { silent = true })
  map("v", "<leader>saa", "<cmd><C-U>Lspsaga range_code_action<CR>", { silent = true })
  map("n", "<leader>sr", "<cmd>Lspsaga rename<CR>", { silent = true })

  map("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
  map("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })

  -- motion
  map("n", "<leader>sp", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
  map("n", "<leader>sn", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
  map("n", "<leader>[", function()
    require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
  end, { silent = true })
  map("n", "<leader>]", function()
    require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
  end, { silent = true })

  -- viewer
  map("n", "<leader>sd", "<cmd>Lspsaga preview_definition<CR>", { silent = true })
  map("n", "<leader>sf", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
  map("n", "<leader>so", "<cmd>LSoutlineToggle<CR>", { silent = true })
  map("n", "<leader>sv", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
  map("n", "<leader>sh", "<Cmd>Lspsaga signature_help<CR>", { silent = true })
  map("n", "<C-f>", function()
    require("lspsaga.action").smart_scroll_with_saga(1)
  end, { silent = true })
  map("n", "<C-b>", function()
    require("lspsaga.action").smart_scroll_with_saga(-1)
  end, { silent = true })
end

M.config = function()
  local saga = load("lspsaga")

  local options = {
    -- ui
    border_style = "rounded",
    saga_winblend = 0, -- Values between 0-30 are typically most useful.
    diagnostic_source_bracket = {}, -- add bracket or something with diagnostic source, just have 2 elements
    symbol_in_winbar = { -- show symbols in winbar must nightly
      in_custom = false,
      enable = false,
      separator = ' ',
      show_file = true,
      click_support = false,
    },
    show_outline = {
      win_position = 'right',
      --set special filetype win that outline window split.like NvimTree neotree
      -- defx, db_ui
      win_with = '',
      win_width = 30,
      auto_enter = true,
      auto_preview = true,
      virt_text = '┃',
      jump_key = 'o',
      auto_refresh = true, -- auto refresh when change buffer
    },
    code_action_lightbulb = { -- same as nvim-lightbulb but async
      enable = true,
      sign = true,
      enable_in_insert = true,
      sign_priority = 20,
      virtual_text = true,
    },

    -- icons
    diagnostic_header = { " ", " ", " ", " " },
    code_action_icon = "💡",
    definition_preview_icon = "  ",
    finder_icons = {
      def = '  ',
      ref = '諭 ',
      link = '  ',
    },

    -- key
    move_in_saga = { prev = '<C-p>', next = '<C-n>' }, -- when cursor in saga window you config these to move
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
    show_diagnostic_source = true,
    max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
    code_action_num_shortcut = true, -- if true can press number to execute the codeaction in codeaction window
    finder_request_timeout = 1500,
    custom_kind = {},
    server_filetype_map = {},
  }

  saga.init_lsp_saga(options)
  _config_diagnostic_ui()
end

return M
