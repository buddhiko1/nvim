local load = require("utils").load
local map = require("utils").map
local formatting = require("utils").formatting

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
    formatting(vim.api.nvim_get_current_buf())
  end)
  map("n", "<leader>st", _toggle_virtual_text)
  map("n", "<leader>sa", "<cmd>Lspsaga code_action<CR>")
  map("n", "<leader>sr", "<cmd>Lspsaga rename<CR>")

  -- diagnostic
  map("n", "<leader>sn", "<cmd>Lspsaga diagnostic_jump_next<CR>")
  map("n", "<leader>sp", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
  map("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")
  map("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")

  -- outline
  -- map("n", "<leader>so", "<cmd>Lspsaga outline<CR>")
end

M.config = function()
  local saga = load("lspsaga")

  local options = {
    ui = {
      theme = 'round',
      title = false,
      border = 'rounded',
      winblend = 0,
      expand = '',
      collapse = '',
      preview = ' ',
      code_action = '💡',
      diagnostic = '🐞',
      incoming = ' ',
      outgoing = ' ',
      kind = {},
    },

    -- outline = {
    --   win_position = 'left',
    --   win_with = '',
    --   win_width = 30,
    --   show_detail = true,
    --   auto_preview = true,
    --   auto_refresh = true,
    --   auto_close = true,
    --   custom_sort = nil,
    --   keys = {
    --     jump = 'o',
    --     expand_collapse = 'z',
    --     quit = 'q',
    --   },
    -- },

    lightbulb = {
      enable = false,
    },

    diagnostic = {
      show_code_action = true,
      show_source = true,
      jump_num_shortcut = true,
      keys = {
        exec_action = 'o',
        go_action = 'g',
        quit = 'q',
      },
    },

    code_action = {
      keys = {
        exec = "<CR>",
        quit = "q",
      }
    },

    finder = {
      edit = { 'o', '<CR>' },
      vsplit = 's',
      split = 'i',
      tabe = 't',
      quit = { 'q' },
    },

    rename = {
      mark = 'x',
      confirm = '<CR>',
      in_select = true,
      whole_project = true,
      exec = '<CR>',
      quit = '<Esc>',
    },
  }

  saga.setup(options)
end

return M
