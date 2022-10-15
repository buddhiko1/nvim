local load = require("utils").load

local M = {}

M.config = function()
  local cmp = load("cmp")
  local luasnip = load("luasnip")

  local options = {
    enabled = function()
      return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
          or require("cmp_dap").is_dap_buffer()
    end,

    window = {
      -- default
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),

      -- custom
      completion = {
        border = "single",
      },
      documentation = {
        border = "single",
      },
    },

    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },

    formatting = {
      format = function(_, vim_item)
        local icons = require "plugins.configs.cmp_icons"
        vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
        return vim_item
      end,
    },

    mapping = {
      ["<CR>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
        else
          fallback()
        end
      end, {
        "i",
        "s",
        "c"
      }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
        else
          fallback()
        end
      end, {
        "i",
        "s",
        "c"
      }),
    },

    sources = {
      { name = "nvim_lsp" },
      { name = "path" },
      { name = "buffer" },
      { name = "luasnip" },
      { name = "nvim_lua" },
    },
  }

  cmp.setup(options)

  cmp.setup.cmdline(':', {
    sources = {
      { name = 'cmdline' },
    },
  })
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' },
    },
  })
  cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
    sources = {
      { name = "dap" },
    },
  })
end

return M
