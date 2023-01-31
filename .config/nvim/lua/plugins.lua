local packer = require("packer")
packer.startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use("hashivim/vim-terraform")
	use("ckipp01/stylua-nvim")
	use("nanotee/sqls.nvim")
	use("rafamadriz/friendly-snippets")

	use({
		"numToStr/Comment.nvim",
		requires = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	})

	use({
		"m-demare/hlargs.nvim",
		requires = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("hlargs").setup({
				excluded_argnames = {
					usages = {
						lua = { "self", "use" },
					},
				},
			})
		end,
	})

	use({
		"github/copilot.vim",
		config = function()
			require("plugins/copilot")
		end,
	})

	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins/null-ls")
		end,
	})

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
		"gbprod/yanky.nvim",
		config = function()
			require("plugins/yanky")
		end,
	})

	use({
		"ojroques/nvim-osc52",
		config = function()
			require("plugins/osc52")
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
			"hrsh7th/cmp-emoji",
			"hrsh7th/cmp-nvim-lsp-signature-help",
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

	use({
		"nvim-treesitter/nvim-treesitter-context",
		requires = {
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("plugins/treesitter-context")
		end,
	})

	-- marks
	use({
		"chentoast/marks.nvim",
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

	-- lualine
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
		config = function()
			require("plugins/lualine")
		end,
	})

	-- lsp_lines
	use({
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			require("lsp_lines").setup()
			vim.diagnostic.config({
				virtual_text = false,
			})
		end,
	})

	use({
		"RRethy/vim-illuminate",
		config = function()
			require("illuminate").configure({ delay = 200 })
		end,
	})

	-- noice
	use({
		"folke/noice.nvim",
		requires = {
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("plugins/noice")
		end,
	})
end)
