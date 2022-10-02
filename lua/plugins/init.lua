local plugins = {
  -- package
  ["wbthomason/packer.nvim"] = {
    requires = { "nvim-lua/plenary.nvim", "lewis6991/impatient.nvim" },
    event = "VimEnter"
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
    end
  },

  -- coding
  ["norcalli/nvim-colorizer.lua"] = {
    config = function()
      require 'colorizer'.setup {
        'css';
        'javascript';
        html = {
          mode = 'foreground';
        }
      }
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

  ["nvim-treesitter/nvim-treesitter"] = {
    event = { "BufRead", "BufNewFile" },
    run = ":TSUpdate",
    config = function()
      require("plugins.configs.treesitter").config()
    end,
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

  ["ggandor/lightspeed.nvim"] = {},

  -- components
  ["ahmedkhalf/project.nvim"] = {
    config = function()
      require("plugins.configs.project").config()
    end,
  },

  ["nvim-telescope/telescope.nvim"] = {
    setup = function()
      require("plugins.configs.telescope").setup()
    end,
    config = function()
      require("plugins.configs.telescope").config()
    end,
  },

  ["rafcamlet/tabline-framework.nvim"] = {
    after = "nvim-web-devicons",
    setup = function()
      require("plugins.configs.tabline").setup()
    end,
    config = function()
      require("plugins.configs.tabline").config()
    end,
  },

  ["goolord/alpha-nvim"] = {
    after = 'tabline-framework.nvim',
    setup = function()
      require("plugins.configs.alpha").setup()
    end,
    config = function()
      require("plugins.configs.alpha").config()
    end,
  },

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

  ["preservim/tagbar"] = {
    -- tagbar, must install ctags-git first.
    setup = function()
      require("plugins.configs.ctags").setup()
    end,
    config = function()
      require("plugins.configs.ctags").config()
    end,
  },

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
    end
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

  ["windwp/nvim-ts-autotag"] = {
    event = { "BufRead" },
    setup = function()
      require("plugins.configs.autotag").config()
    end,
  },

  ["windwp/nvim-autopairs"] = {
    after = "nvim-cmp",
    config = function()
      require("plugins.configs.autopairs").config()
    end,
  },

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

  -- lsp
  ["neovim/nvim-lspconfig"] = {
    requires = "williamboman/nvim-lsp-installer",
    after = { "nvim-lsp-installer", "cmp-nvim-lsp" },
    config = function()
      require("plugins.configs.lsp_installer").config()
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
