local plugins = {
  ["wbthomason/packer.nvim"] = {
    event = "VimEnter",
    requires = { "nvim-lua/plenary.nvim", "lewis6991/impatient.nvim" },
  },

  ["kyazdani42/nvim-web-devicons"] = {
    config = function()
      require("plugins.configs.icons").config()
    end,
  },

  -- theme
  ["EdenEast/nightfox.nvim"] = {
    setup = function()
      require("plugins.configs.nightfox").setup()
    end,
    config = function()
      require("plugins.configs.nightfox").config()
    end,
  },

  ["lukas-reineke/indent-blankline.nvim"] = {
    event = "BufRead",
    config = function()
      require("plugins.configs.blankline").config()
    end,
  },

  ["numToStr/Comment.nvim"] = {
    setup = function()
      require("plugins.configs.comment").setup()
    end,
    config = function()
      require("plugins.configs.comment").config()
    end,
  },

  ["kylechui/nvim-surround"] = {
    config = function()
      require("plugins.configs.surround").config()
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

  ["buddhiko1/autosave.nvim"] = {
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
    setup = function()
      require("plugins.configs.leap").setup()
    end,
    config = function()
      require("plugins.configs.leap").config()
    end,
  },

  -- color picker
  ["uga-rosa/ccc.nvim"] = {
    setup = function()
      require("plugins.configs.ccc").setup()
    end,
    config = function()
      require("plugins.configs.ccc").config()
    end,
  },

  ["rcarriga/nvim-notify"] = {
    setup = function()
      require("plugins.configs.notify").setup()
    end,
    config = function()
      require("plugins.configs.notify").config()
    end,
  },

  ["folke/noice.nvim"] = {
    requires = { "MunifTanjim/nui.nvim" },
    event = "VimEnter",
    after = "nvim-notify",
    setup = function()
      require("plugins.configs.noice").setup()
    end,
    config = function()
      require("plugins.configs.noice").config()
    end,
  },

  ["iamcco/markdown-preview.nvim"] = {
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
    setup = function()
      require("plugins.configs.previewer").setup()
    end,
    config = function()
      require("plugins.configs.previewer").config()
    end,
  },

  ["ahmedkhalf/project.nvim"] = {
    config = function()
      require("plugins.configs.project").config()
    end,
  },

  -- to significantly improve telescope sorting performance.
  ["nvim-telescope/telescope-fzf-native.nvim"] = {
    run = "make",
  },

  ["nvim-telescope/telescope.nvim"] = {
    tag = "0.1.0",
    setup = function()
      require("plugins.configs.telescope").setup()
    end,
    config = function()
      require("plugins.configs.telescope").config()
    end,
  },

  ["rafcamlet/tabline-framework.nvim"] = {
    event = "VimEnter",
    after = "nvim-web-devicons",
    setup = function()
      require("plugins.configs.tabline").setup()
    end,
    config = function()
      require("plugins.configs.tabline").config()
    end,
  },

  -- homepage
  ["goolord/alpha-nvim"] = {
    after = "tabline-framework.nvim",
    setup = function()
      require("plugins.configs.alpha").setup()
    end,
    config = function()
      require("plugins.configs.alpha").config()
    end,
  },

  -- status line
  ["nvim-lualine/lualine.nvim"] = {
    after = "nvim-web-devicons",
    config = function()
      require("plugins.configs.lualine").config()
    end,
  },

  ["nvim-neo-tree/neo-tree.nvim"] = {
    requires = "MunifTanjim/nui.nvim",
    setup = function()
      require("plugins.configs.neo_tree").setup()
    end,
    config = function()
      require("plugins.configs.neo_tree").config()
    end,
  },

  -- outline.
  ["simrat39/symbols-outline.nvim"] = {
    setup = function()
      require("plugins.configs.outline").setup()
    end,
    config = function()
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
    setup = function()
      require("plugins.configs.fterm").setup()
    end,
    config = function()
      require("plugins.configs.fterm").config()
    end,
  },

  -- debug
  ["mfussenegger/nvim-dap"] = {
    setup = function()
      require("plugins.configs.nvim_dap").setup()
    end,
    config = function()
      require("plugins.configs.nvim_dap").config()
    end,
  },

  ["theHamsta/nvim-dap-virtual-text"] = {
    after = "nvim-dap",
    setup = function()
      require("plugins.configs.nvim_dap_text").setup()
    end,
    config = function()
      require("plugins.configs.nvim_dap_text").config()
    end,
  },

  ["rcarriga/nvim-dap-ui"] = {
    after = "nvim-dap",
    setup = function()
      require("plugins.configs.nvim_dap_ui").setup()
    end,
    config = function()
      require("plugins.configs.nvim_dap_ui").config()
    end,
  },

  -- complements
  ["L3MON4D3/LuaSnip"] = {
    config = function()
      require("plugins.configs.luasnip").config()
    end,
  },

  ["hrsh7th/nvim-cmp"] = {
    after = "LuaSnip",
    config = function()
      require("plugins.configs.cmp").config()
    end,
  },

  ["saadparwaiz1/cmp_luasnip"] = {
    after = "LuaSnip",
  },

  ["windwp/nvim-autopairs"] = {
    after = "nvim-cmp",
    config = function()
      require("plugins.configs.autopairs").config()
    end,
  },

  ["windwp/nvim-ts-autotag"] = {},

  ["hrsh7th/cmp-nvim-lua"] = {
    after = "nvim-cmp",
  },

  ["hrsh7th/cmp-nvim-lsp"] = {
    after = "nvim-cmp",
  },

  ["hrsh7th/cmp-buffer"] = {
    after = "nvim-cmp",
  },

  ["hrsh7th/cmp-path"] = {
    after = "nvim-cmp",
  },

  ["hrsh7th/cmp-cmdline"] = {
    after = "nvim-cmp",
  },

  ["rcarriga/cmp-dap"] = {
    after = "nvim-cmp",
  },

  -- formmater and linter
  ["jose-elias-alvarez/null-ls.nvim"] = {
    setup = function()
      require("plugins.configs.null_ls").setup()
    end,
    config = function()
      require("plugins.configs.null_ls").config()
    end,
  },

  -- lsp
  ["williamboman/mason.nvim"] = {
    setup = function()
      require("plugins.configs.lsp_mason").setup()
    end,
    config = function()
      require("plugins.configs.lsp_mason").config()
    end,
  },

  ["williamboman/mason-lspconfig.nvim"] = {
    after = "mason.nvim",
    config = function()
      require("plugins.configs.lsp_mason_lspconfig").config()
    end,
  },

  ["neovim/nvim-lspconfig"] = {
    after = { "mason-lspconfig.nvim", "cmp-nvim-lsp" },
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

  ["glepnir/lspsaga.nvim"] = {
    branch = "main",
    setup = function()
      require("plugins.configs.lsp_saga").setup()
    end,
    config = function()
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
