local load = require("utils").load

local M = {}

M.config = function()
  local cmp = load("cmp")

  local options = {
    window = {
      completion = {
        border = "single",
      },
      documentation = {
        border = "single",
      },
    },
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
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
      ["<C-,>"] = cmp.mapping.complete(),
      ["<C-.>"] = cmp.mapping.close(),
      ["<C-k>"] = cmp.mapping.select_prev_item(),
      ["<C-j>"] = cmp.mapping.select_next_item(),
      ["<C-h>"] = cmp.mapping.scroll_docs(-4),
      ["<C-l>"] = cmp.mapping.scroll_docs(4),
      ["<CR>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif require("luasnip").expand_or_jumpable() then
          vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif require("luasnip").jumpable(-1) then
          vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
        else
          fallback()
        end
      end, {
        "i",
        "s",
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

  -- disable guihua completion for lsp_navigator
  if vim.o.ft == 'clap_input' and vim.o.ft == 'guihua' and vim.o.ft == 'guihua_rust' then
    cmp.setup.buffer { completion = { enable = false } }
  end
end

return M
