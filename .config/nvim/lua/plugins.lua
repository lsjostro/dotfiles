return require("packer").startup(function()
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use("hashivim/vim-terraform")
	use("pierreglaser/folding-nvim")
	use("ray-x/lsp_signature.nvim")
	use("jose-elias-alvarez/nvim-lsp-ts-utils")
	use("github/copilot.vim")
	use("uarun/vim-protobuf")
	use("ckipp01/stylua-nvim")

	use({
		"mfussenegger/nvim-dap",
		config = function()
			require("plugins/nvim-dap")
		end,
	})

	use({
		"leoluz/nvim-dap-go",
		config = function()
			require("plugins/nvim-dap-go")
		end,
	})

	use({
		"theHamsta/nvim-dap-virtual-text",
		config = function()
			require("nvim-dap-virtual-text").setup({ commented = true })
		end,
	})

	use({
		"b3nj5m1n/kommentary",
		config = function()
			require("plugins/kommentary")
		end,
	})

	use({
		"L3MON4D3/LuaSnip",
		config = function()
			require("luasnip/loaders/from_vscode").lazy_load()
		end,
	})

	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"andersevenrud/cmp-tmux",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			require("plugins/nvim-cmp")
		end,
	})

	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins/gitsigns")
		end,
	})

	use({
		"lukas-reineke/indent-blankline.nvim",
		branch = "master",
		config = function()
			require("plugins/indent-blankline")
		end,
	})

	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins/lsp-config")
		end,
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzy-native.nvim",
			"nvim-telescope/telescope-github.nvim",
			"nvim-telescope/telescope-dap.nvim",
		},
		config = function()
			require("plugins/telescope")
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		requires = {
			"nvim-treesitter/playground",
			"nvim-treesitter/nvim-treesitter-textobjects",
			"windwp/nvim-ts-autotag",
		},
		config = function()
			require("plugins/treesitter")
		end,
	})

	-- marks
	use({
		"chentau/marks.nvim",
		config = function()
			require("plugins/marks")
		end,
	})

	use({
		"onsails/lspkind-nvim",
		config = function()
			require("lspkind").init({})
		end,
	})

	-- zenbones
	use({
		"mcchrish/zenbones.nvim",
		requires = {
			"rktjmp/lush.nvim",
		},
		config = function()
			require("plugins/zenbones")
		end,
	})

	use({
		"cuducos/yaml.nvim",
		ft = { "yaml" },
		requires = {
			"nvim-treesitter/nvim-treesitter",
			-- "nvim-telescope/telescope.nvim" -- optional
		},
		config = function()
			require("yaml_nvim").init()
		end,
	})
end)
