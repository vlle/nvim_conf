return {
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings

	-- Packer can manage itself
	"folke/neodev.nvim",
	"navarasu/onedark.nvim", -- new theme for light color
	"tpope/vim-dadbod",
	"kristijanhusak/vim-dadbod-ui",
	"iamcco/markdown-preview.nvim",
	"m4xshen/autoclose.nvim",
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {
			-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
			-- animation = true,
			-- insert_at_start = true,
			-- …etc.
		},
		version = "^1.0.0", -- optional: only update when a new 1.x version is released
	},
	{ "akinsho/git-conflict.nvim", version = "*", config = true },
	-- Lazy
	{
		"vague2k/huez.nvim",
		-- if you want registry related features, uncomment this
		import = "huez-manager.import",
		branch = "stable",
		event = "UIEnter",
		config = function()
			require("huez").setup({})
		end,
	},
	-- {
	-- 	"folke/which-key.nvim",
	-- 	event = "VeryLazy",
	-- 	opts = {
	-- 		-- your configuration comes here
	-- 		-- or leave it empty to use the default settings
	-- 		-- refer to the configuration section below
	-- 	},
	-- 	keys = {
	-- 		{
	-- 			"<leader>?",
	-- 			function()
	-- 				require("which-key").show({ global = false })
	-- 			end,
	-- 			desc = "Buffer Local Keymaps (which-key)",
	-- 		},
	-- 	},
	-- },
	{
		"tversteeg/registers.nvim",
		name = "registers",
		keys = {
			{ '"', mode = { "n", "v" } },
			{ "<C-R>", mode = "i" },
		},
		cmd = "Registers",
	},

	{ "folke/neoconf.nvim", cmd = "Neoconf" },
	"wbthomason/packer.nvim",
	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.0",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	-- {'Mofiqul/dracula.nvim',
	-- name = 'dracula',
	-- lazy = false,
	-- priority = 1000,
	-- config = function()
	--   vim.cmd('colorscheme dracula')
	-- end,
	--},
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		config = function()
			vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		-- or                              , branch = '0.1.x',
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{ "mhartington/formatter.nvim" },
	"nvim-treesitter/playground",
	"ThePrimeagen/harpoon",
	"mbbill/undotree",
	"tpope/vim-fugitive",
	"lewis6991/gitsigns.nvim",
	"voldikss/vim-floaterm",
	-- "Mofiqul/dracula.nvim",
	{
		{ "VonHeikemen/lsp-zero.nvim", branch = "v4.x" },

		--- Uncomment these if you want to manage LSP servers from neovim
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },

		-- LSP Support
		{
			"neovim/nvim-lspconfig",
			dependencies = {
				{ "hrsh7th/cmp-nvim-lsp" },
			},
		},

		-- Autocompletion
		{
			"hrsh7th/nvim-cmp",
			dependencies = {
				{ "L3MON4D3/LuaSnip" },
			},
		},
	},
	"ethanholz/nvim-lastplace",
	"akinsho/toggleterm.nvim",
	-- 'vold'
	"nvim-lualine/lualine.nvim",
	dependencies = { "kyazdani42/nvim-web-devicons", lazy = true },
}
