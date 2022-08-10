local plugins = {
  -- editor
  ["nvim-lua/plenary.nvim"] = {},

  ["wbthomason/packer.nvim"] = {
    event = "VimEnter"
  },

  ["lewis6991/impatient.nvim"] = {},


  -- ui
  ["EdenEast/nightfox.nvim"] = {
    setup = function()
      require("plugins.configs.nightfox").setup()
    end,
    config = function()
      require("plugins.configs.nightfox").config()
    end
  },

  ["kyazdani42/nvim-web-devicons"] = {
    after = "nightfox.nvim",
    config = function()
      require("plugins.configs.icons").config()
    end,
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

  ["max397574/better-escape.nvim"] = {
    event = "InsertCharPre",
    config = function()
      require("plugins.configs.better_escape").config()
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

  ["windwp/nvim-autopairs"] = {
    after = "nvim-cmp",
    config = function()
      require("plugins.configs.autopairs").config()
    end,
  },

  ["Pocco81/auto-save.nvim"] = {
    config = function()
      require("plugins.configs.autosave").config()
    end,
  },

  ["lewis6991/gitsigns.nvim"] = {
    config = function()
      require("plugins.configs.gitsigns").config()
    end,
  },

  -- debug
  ["mfussenegger/nvim-dap"] = {
    config = function()
      require("plugins.configs.nvim_dap").config()
    end,
  },


  -- components
  ["nvim-telescope/telescope.nvim"] = {
    setup = function()
      require("plugins.configs.telescope").setup()
    end,
    config = function()
      require("plugins.configs.telescope").config()
    end,
  },

  ["ahmedkhalf/project.nvim"] = {
    config = function()
      require("plugins.configs.project").config()
    end,
  },

  ["goolord/alpha-nvim"] = {
    setup = function()
      require("plugins.configs.alpha").setup()
    end,
    config = function()
      require("plugins.configs.alpha").config()
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

  ["MunifTanjim/nui.nvim"] = {},

  ["nvim-neo-tree/neo-tree.nvim"] = {
    after = "nui.nvim",
    setup = function()
      require("plugins.configs.neo_tree").setup()
    end,
    config = function()
      require("plugins.configs.neo_tree").config()
    end,
  },

  ["nvim-lualine/lualine.nvim"] = {
    after = "nvim-web-devicons",
    config = function()
      require("plugins.configs.lualine").config()
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


  -- lsp
  ["nvim-treesitter/nvim-treesitter"] = {
    event = { "BufRead", "BufNewFile" },
    run = ":TSUpdate",
    config = function()
      require("plugins.configs.treesitter").config()
    end,
  },

  ["williamboman/nvim-lsp-installer"] = {},

  ["neovim/nvim-lspconfig"] = {
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


  -- complements
  ["hrsh7th/nvim-cmp"] = {
    after = "friendly-snippets",
    config = function()
      require("plugins.configs.cmp").config()
    end,
  },

  ["rafamadriz/friendly-snippets"] = {
    module = "cmp_nvim_lsp",
    event = "InsertEnter",
  },

  ["L3MON4D3/LuaSnip"] = {
    wants = "friendly-snippets",
    after = "nvim-cmp",
    config = function()
      require("plugins.configs.luasnip").config()
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
