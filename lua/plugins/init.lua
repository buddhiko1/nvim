local present, packer = pcall(require, "plugins.packerInit")

if not present then
   return false
end

local plugins = {
   -- editor plugins
   ["lewis6991/impatient.nvim"] = {}, -- This plugin does several things to speed loading Lua modules and files.

   ["wbthomason/packer.nvim"] = {
      event = "VimEnter",
   },


   -- ui plugins
   ["EdenEast/nightfox.nvim"] = {
      setup = function()
         require("custom.nightfox").setup()
      end
   },
   ["kyazdani42/nvim-web-devicons"] = {
      after = "nightfox",
      config = function()
         require("plugins.configs.icons").config()
      end,
   },


   -- coding plugins
   ["lukas-reineke/indent-blankline.nvim"] = {
      event = "BufRead",
      config = function()
         require("plugins.configs.blankline").config()
      end,
   },

   ["max397574/better-escape.nvim"] = {
      event = "InsertCharPre",
      config = function()
         require("plugins.configs.better_escape").config()
      end,
   },

   ["numToStr/Comment.nvim"] = {
      module = "Comment",
      keys = { "gc", "gb" },

      setup = function()
         require("plugins.configs.comment").setup()
      end,

      config = function()
         require("plugins.configs.comment").config()
      end,
   },

   ["windwp/nvim-autopairs"] = {
      after = "nvim-cmp",
      config = function()
         require("plugins.configs.autopairs").config()
      end,
   },

   ["lewis6991/gitsigns.nvim"] = {
      opt = true,
      setup = function()
         require("core.utils").packer_lazy_load "gitsigns.nvim"
      end,
      config = function()
         require("plugins.configs.gitsings").config()
      end,
   },


   -- components
   ["goolord/alpha-nvim"] = {
      disable = false,
      config = function()
         require("plugins.configs.alpha").config()
      end,
   },

   ["akinsho/bufferline.nvim"] = {
      after = "nvim-web-devicons",

      setup = function()
         require("plugins.configs.bufferline").setup()
      end,

      config = function()
         require("plugins.configs.bufferline").config()
      end,
   },

   ["feline-nvim/feline.nvim"] = {
      after = "nvim-web-devicons",
      config = function()
         require "plugins.configs.statusline"
      end,
   },

   ["kyazdani42/nvim-tree.lua"] = {
      cmd = { "NvimTreeToggle", "NvimTreeFocus" },
      setup = function()
         require("plugins.configs.tree").setup()
      end,

      config = function()
         require("plugins.configs.tree").config()
      end,
   },

   ["nvim-telescope/telescope.nvim"] = {
      cmd = "Telescope",

      setup = function()
         require("plugins.configs.telescope").setup()
      end,

      config = function()
         require("plugins.configs.telescope").config()
      end,
   },

   ["ahmedkhalf/project.nvim"] = {
      after = "telescope.nvim",
      config = function()
         require("plugins.configs.project").config()
      end,
   },


   -- lsp
   ["williamboman/nvim-lsp-installer"] = {
      opt = true,
      setup = function()
         require("plugins.configs.lsp_installer").setup()
      end,
   },

   ["neovim/nvim-lspconfig"] = {
      after = "nvim-lsp-installer",
      module = "lspconfig",
      config = function()
         require("plugins.configs.lsp_config").config()
      end,
   },

   ["ray-x/lsp_signature.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
         require("plugins.configs.lsp_signature").config()
      end,
   },

   ["nvim-treesitter/nvim-treesitter"] = {
      event = { "BufRead", "BufNewFile" },
      run = ":TSUpdate",
      config = function()
         require("plugins.configs.treesitter").config()
      end,
   },


   -- complements
   ["rafamadriz/friendly-snippets"] = {
      module = "cmp_nvim_lsp",
      event = "InsertEnter",
   },

   ["hrsh7th/nvim-cmp"] = {
      after = "friendly-snippets",
      config = function()
         require("plugins.configs.cmp").config()
      end,
   },

   ["L3MON4D3/LuaSnip"] = {
      wants = "friendly-snippets",
      after = "nvim-cmp",
      config = function()
         require("plugins.configs.luasnip").luasnip()
      end,
   },

   ["saadparwaiz1/cmp_luasnip"] = {
      after = "LuaSnip",
   },

   ["hrsh7th/cmp-nvim-lua"] = {
      after = "cmp_luasnip",
   },

   ["hrsh7th/cmp-nvim-lsp"] = {
      after = "cmp-nvim-lua",
   },

   ["hrsh7th/cmp-buffer"] = {
      after = "cmp-nvim-lsp",
   },

   ["hrsh7th/cmp-path"] = {
      after = "cmp-buffer",
   },

   ["hrsh7th/cmp-cmdline"] = {
      after = "cmp-path",
   },


   -- formatting
   ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
         require("plugins.configs.null-ls").config()
      end,
   },
}

return packer.startup(function(use)
   for _, v in pairs(plugins) do
      use(v)
   end
end)
