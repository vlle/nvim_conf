return  {
  -- Packer can manage itself
  "folke/neodev.nvim",
  "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
  end,
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  'wbthomason/packer.nvim',
  {
    'nvim-telescope/telescope.nvim', version = '0.1.0',
    dependencies= { {'nvim-lua/plenary.nvim'} }
  },
  {'Mofiqul/dracula.nvim', 
  name = 'dracula',
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd('colorscheme dracula')
  end,
  },
{'nvim-treesitter/nvim-treesitter',
  build= ':TSUpdate',
},
"nvim-treesitter/playground",
"ThePrimeagen/harpoon",
"mbbill/undotree",
"tpope/vim-fugitive",
"voldikss/vim-floaterm",
{
  'VonHeikemen/lsp-zero.nvim',
  dependencies = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'saadparwaiz1/cmp_luasnip'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-nvim-lua'},

    -- Snippets
    {'L3MON4D3/LuaSnip'},
    {'rafamadriz/friendly-snippets'},
  }
},
-- 'vold'
"nvim-lualine/lualine.nvim",
  dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true }
}
