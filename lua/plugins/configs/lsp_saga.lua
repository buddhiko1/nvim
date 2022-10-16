local load = require("utils").load
local map = require("utils").map

vim.g.diagnostics_virtual_text = false

local _toggle_virtual_text = function()
  if vim.g.diagnostics_virtual_text then
    vim.diagnostic.config({
      virtual_text = false,
    })
  else
    vim.diagnostic.config({
      virtual_text = true,
    })
  end
  vim.g.diagnostics_virtual_text = not vim.g.diagnostics_virtual_text
end

local M = {}

M.setup = function()
  -- viewer
  map("n", "<leader>sf", "<cmd>Lspsaga lsp_finder<CR>")
  map("n", "<leader>sd", "<cmd>Lspsaga peek_definition<CR>")
  map("n", "<leader>sh", "<cmd>Lspsaga hover_doc<CR>")

  -- action
  map("n", "<leader>sm", function()
    vim.lsp.buf.format()
  end)
  map("n", "<leader>st", _toggle_virtual_text)
  map("n", "<leader>sa", "<cmd>Lspsaga code_action<CR>")
  map("n", "<leader>sr", "<cmd>Lspsaga rename<CR>")

  -- diagnostic
  map("n", "<leader>sn", "<cmd>Lspsaga diagnostic_jump_next<CR>")
  map("n", "<leader>sp", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
  map("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")
  map("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
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
      separator = " ",
      show_file = true,
      click_support = false,
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
      def = "  ",
      ref = "諭 ",
      link = "  ",
    },

    -- key
    move_in_saga = { prev = "<C-p>", next = "<C-n>" },
    finder_action_keys = {
      open = "o",
      vsplit = "v",
      tabe = "t",
      quit = "q",
    },
    code_action_keys = {
      quit = "q",
      exec = "<CR>",
    },
    rename_action_quit = "<Esc>",

    -- property
    rename_in_select = true,
    max_preview_lines = 10,
    code_action_num_shortcut = true,
    finder_request_timeout = 2000,
    custom_kind = {},
    server_filetype_map = {},
  }

  saga.init_lsp_saga(options)
end

return M
