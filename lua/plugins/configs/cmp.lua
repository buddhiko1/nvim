local present, cmp = pcall(require, "cmp")

if not present then
   return
end

local M = {}

local function border(hl_name)
   return {
      { "╭", hl_name },
      { "─", hl_name },
      { "╮", hl_name },
      { "│", hl_name },
      { "╯", hl_name },
      { "─", hl_name },
      { "╰", hl_name },
      { "│", hl_name },
   }
end

local options = {
   window = {
      completion = {
         border = border "CmpBorder",
      },
      documentation = {
         border = border "CmpDocBorder",
      },
   },
   snippet = {
      expand = function(args)
         require("luasnip").lsp_expand(args.body)
      end,
   },
   formatting = {
      format = function(_, vim_item)
         local icons = require "plugins.configs.lsp_icons"
         vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)

         return vim_item
      end,
   },
   mapping = {
      ["<S-k>"] = cmp.mapping.select_prev_item(),
      ["<S-j>"] = cmp.mapping.select_next_item(),
      ["<S-h>"] = cmp.mapping.scroll_docs(-4),
      ["<S-l>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<S-d>"] = cmp.mapping.close(),
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
      { name = "cmdline" },
      { name = "buffer" },
      { name = "luasnip" },
      { name = "nvim_lua" },
   },
}

M.config = function ()
   cmp.setup(options)
end

return M