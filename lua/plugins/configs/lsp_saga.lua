local load = require("utils").load
local map = require("utils").map

local M = {}

M.setup = function ()
  map("n", "<leader>sf", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

  map("n", "<leader>sa", "<cmd>Lspsaga code_action<CR>", { silent = true })
  map("v", "<leader>saa", "<cmd><C-U>Lspsaga range_code_action<CR>", { silent = true })

  map("n", "<leader>sr", "<cmd>Lspsaga rename<CR>", { silent = true })

  map("n", "<leader>sd", "<cmd>Lspsaga preview_definition<CR>", { silent = true })

  map("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })

  map("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })

  map("n", "<leader>sp", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
  map("n", "<leader>sn", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
  map("n", "<leader>[", function()
    require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
  end, { silent = true })
  map("n", "<leader>]", function()
    require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
  end, { silent = true })

  map("n","<leader>so", "<cmd>LSoutlineToggle<CR>",{ silent = true })
  -- Hover Doc
  map("n", "<leader>sv", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
  -- Signature help
  map("n", "<leader>sh", "<Cmd>Lspsaga signature_help<CR>", { silent = true })
  -- scroll in hover doc or  definition preview window
  map("n", "<C-f>", function()
      require("lspsaga.action").smart_scroll_with_saga(1)
  end, { silent = true })
  -- scroll in hover doc or  definition preview window
  map("n", "<C-b>", function()
      require("lspsaga.action").smart_scroll_with_saga(-1)
  end, { silent = true })
end

M.config = function()
  local saga = load("lspsaga")

  local options = {
    border_style = "single", -- "single" | "double" | "rounded" | "bold" | "plus"
    saga_winblend = 0, -- Values between 0-30 are typically most useful.
    -- move_in_saga = { prev = '<C-p>',next = '<C-n>'}, -- when cursor in saga window you config these to move
    diagnostic_header = { " ", " ", " ", " " },
    show_diagnostic_source = true,
    diagnostic_source_bracket = {}, -- add bracket or something with diagnostic source, just have 2 elements
    max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
    code_action_icon = "💡", -- use emoji lightbulb in default
    code_action_num_shortcut = true, -- if true can press number to execute the codeaction in codeaction window
    -- same as nvim-lightbulb but async
    code_action_lightbulb = {
        enable = true,
        sign = true,
        enable_in_insert = true,
        sign_priority = 20,
        virtual_text = true,
    },
    -- finder icons
    finder_icons = {
      def = '  ',
      ref = '諭 ',
      link = '  ',
    },
    -- finder do lsp request timeout
    -- if your project big enough or your server very slow
    -- you may need to increase this value
    finder_request_timeout = 1500,
    finder_action_keys = {
        open = "o",
        vsplit = "v",
        split = "vv",
        tabe = "t",
        quit = "q",
    },
    code_action_keys = {
        quit = "<leader>x",
        exec = "<CR>",
    },
    rename_action_quit = "<leader>x",
    rename_in_select = true,
    definition_preview_icon = "  ",
    -- show symbols in winbar must nightly
    symbol_in_winbar = {
        in_custom = false,
        enable = false,
        separator = ' ',
        show_file = true,
        click_support = false,
    },
    -- show outline
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
      -- auto refresh when change buffer
      auto_refresh = true,
    },
    -- custom lsp kind
    -- usage { Field = 'color code'} or {Field = {your icon, your color code}}
    custom_kind = {},
    -- if you don't use nvim-lspconfig you must pass your server name and
    -- the related filetypes into this table
    -- like server_filetype_map = { metals = { "sbt", "scala" } }
    server_filetype_map = {},
  }

  saga.init_lsp_saga(options)
end

return M
