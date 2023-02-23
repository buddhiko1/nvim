-- The setup key implies opt = true

local plugins = {
  ["lewis6991/impatient.nvim"] = {},

  ["wbthomason/packer.nvim"] = {},

  ["kyazdani42/nvim-web-devicons"] = {
    config = function()
      require("plugins.configs.icons").config()
    end,
  },

  -- theme
  ["EdenEast/nightfox.nvim"] = {
    config = function()
      require("plugins.configs.nightfox").setup()
      require("plugins.configs.nightfox").config()
    end,
  },

  ["lukas-reineke/indent-blankline.nvim"] = {
    config = function()
      require("plugins.configs.blankline").config()
    end,
  },

  ["numToStr/Comment.nvim"] = {
    config = function()
      require("plugins.configs.comment").setup()
      require("plugins.configs.comment").config()
    end,
  },

  ["folke/twilight.nvim"] = {
    disable = true,
    config = function()
      require("plugins.configs.twilight").setup()
      require("plugins.configs.twilight").config()
    end,
  },

  ["kylechui/nvim-surround"] = {
    config = function()
      require("plugins.configs.surround").config()
    end,
  },

  ["xiyaowong/link-visitor.nvim"] = {
    config = function()
      require("plugins.configs.link_visitor").setup()
      require("plugins.configs.link_visitor").config()
    end,
  },

  ["nvim-treesitter/nvim-treesitter"] = {
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    config = function()
      require("plugins.configs.treesitter").config()
    end,
  },

  ["windwp/nvim-ts-autotag"] = {
    after = "nvim-treesitter",
  },

  ["nullishamy/autosave.nvim"] = {
    config = function()
      require("plugins.configs.autosave").config()
    end,
  },

  ["lewis6991/gitsigns.nvim"] = {
    config = function()
      require("plugins.configs.gitsigns").config()
    end,
  },

  -- motion plugin
  ["ggandor/leap.nvim"] = {
    config = function()
      require("plugins.configs.leap").setup()
      require("plugins.configs.leap").config()
    end,
  },

  -- color picker
  ["uga-rosa/ccc.nvim"] = {
    opt = true,
    config = function()
      require("plugins.configs.ccc").setup()
      require("plugins.configs.ccc").config()
    end,
  },

  -- register
  ["tversteeg/registers.nvim"] = {
    config = function()
      require("plugins.configs.registers").config()
    end,
  },

  ["folke/noice.nvim"] = {
    event = "VimEnter",
    requires = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    config = function()
      require("plugins.configs.notify").setup()
      require("plugins.configs.notify").config()
      require("plugins.configs.noice").setup()
      require("plugins.configs.noice").config()
    end,
  },

  -- command finder
  ["mrjones2014/legendary.nvim"] = {
    opt = true,
    requires = { "stevearc/dressing.nvim" },
    config = function()
      require("plugins.configs.legendary").setup()
      require("plugins.configs.legendary").config()
    end,
  },

  ["iamcco/markdown-preview.nvim"] = {
    opt = true,
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
    config = function()
      require("plugins.configs.previewer").setup()
      require("plugins.configs.previewer").config()
    end,
  },

  ["ahmedkhalf/project.nvim"] = {
    config = function()
      require("plugins.configs.project").config()
    end,
  },

  ["nvim-telescope/telescope.nvim"] = {
    tag = "0.1.1",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("plugins.configs.telescope").setup()
      require("plugins.configs.telescope").config()
    end,
  },

  ["rafcamlet/tabline-framework.nvim"] = {
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("plugins.configs.tabline").setup()
      require("plugins.configs.tabline").config()
    end,
  },

  -- homepage
  ["goolord/alpha-nvim"] = {
    config = function()
      require("plugins.configs.alpha").setup()
      require("plugins.configs.alpha").config()
    end,
  },

  -- status line
  ["nvim-lualine/lualine.nvim"] = {
    requires = { "kyazdani42/nvim-web-devicons", "arkav/lualine-lsp-progress" },
    config = function()
      require("plugins.configs.lualine").config()
    end,
  },

  ["nvim-neo-tree/neo-tree.nvim"] = {
    requires = { "MunifTanjim/nui.nvim" },
    setup = function()
      require("plugins.configs.neo_tree").setup()
    end,
    config = function()
      require("plugins.configs.neo_tree").config()
    end,
  },

  -- outline.
  ["simrat39/symbols-outline.nvim"] = {
    config = function()
      require("plugins.configs.outline").setup()
      require("plugins.configs.outline").config()
    end,
  },

  ["dstein64/nvim-scrollview"] = {
    config = function()
      require("plugins.configs.scrollbar").config()
    end,
  },

  -- terminal
  ["numToStr/FTerm.nvim"] = {
    config = function()
      require("plugins.configs.fterm").setup()
      require("plugins.configs.fterm").config()
    end,
  },

  -- debug
  ["mfussenegger/nvim-dap"] = {
    config = function()
      require("plugins.configs.nvim_dap").setup()
      require("plugins.configs.nvim_dap").config()
    end,
  },

  ["theHamsta/nvim-dap-virtual-text"] = {
    config = function()
      require("plugins.configs.nvim_dap_text").setup()
      require("plugins.configs.nvim_dap_text").config()
    end,
  },

  ["rcarriga/nvim-dap-ui"] = {
    config = function()
      require("plugins.configs.nvim_dap_ui").setup()
      require("plugins.configs.nvim_dap_ui").config()
    end,
  },

  -- complements
  ["L3MON4D3/LuaSnip"] = {
    config = function()
      require("plugins.configs.luasnip").config()
    end,
  },

  ["saadparwaiz1/cmp_luasnip"] = {},

  ["hrsh7th/nvim-cmp"] = {
    requires = {
      "onsails/lspkind.nvim",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-cmdline",
      "rcarriga/cmp-dap",
      "octaltree/cmp-look",
      "hrsh7th/cmp-path",
    },
    config = function()
      require("plugins.configs.cmp").config()
    end,
  },

  ["windwp/nvim-autopairs"] = {
    config = function()
      require("plugins.configs.autopairs").config()
    end,
  },

  ["tzachar/cmp-tabnine"] = {
    requires = { "hrsh7th/nvim-cmp" },
    run = require("constants").tabnine_install_cmd,
    config = function()
      require("plugins.configs.tabnine").config()
    end,
  },

  -- formmater and linter
  ["jose-elias-alvarez/null-ls.nvim"] = {
    config = function()
      require("plugins.configs.null_ls").setup()
      require("plugins.configs.null_ls").config()
    end,
  },

  -- lsp
  ["williamboman/mason.nvim"] = {
    config = function()
      require("plugins.configs.lsp_mason").setup()
      require("plugins.configs.lsp_mason").config()
    end,
  },

  ["williamboman/mason-lspconfig.nvim"] = {
    config = function()
      require("plugins.configs.lsp_mason_lspconfig").config()
    end,
  },

  ["neovim/nvim-lspconfig"] = {
    config = function()
      require("plugins.configs.lsp_config").config()
    end,
  },

  ["ray-x/lsp_signature.nvim"] = {
    config = function()
      require("plugins.configs.lsp_signature").config()
    end,
  },

  ["glepnir/lspsaga.nvim"] = {
    branch = "main",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("plugins.configs.lsp_saga").setup()
      require("plugins.configs.lsp_saga").config()
    end,
  },
}

local to_list = function(pluginMap)
  local result = {}
  for key, _ in pairs(pluginMap) do
    pluginMap[key][1] = key

    result[#result + 1] = pluginMap[key]
  end
  return result
end

return to_list(plugins)
