local config = require("nvim-treesitter.configs")

config.setup({
	ensure_installed = "maintained",
	highlight = {
		enable = true,
		use_languagetree = true,
	},

	indent = {
		enable = false,
	},

	playground = {
		enable = true,
		disable = {},
		updatetime = 25,
		persist_queries = false,
	},

	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "ss",
			node_incremental = "sq",
			scope_incremental = "sd",
			node_decremental = "sa",
		},
	},

	--- nvim-ts-autotag ---
	autotag = {
		enable = true,
		filetypes = { "html", "javascriptreact", "xml" },
	},
})
