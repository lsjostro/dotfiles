require("nvim-treesitter.configs").setup {
	ensure_installed = "maintained",
	highlight = {
		enable = true,
		use_languagetree = true,
	},

	indent = {
		enable = false
	},

	playground = {
		enable = true,
		disable = {},
		updatetime = 25,
		persist_queries = false
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

	textobjects = {
		move = {
			enable = true,
			goto_next_start = {
				["]]"] = "@function.outer",
				["]m"] = "@class.outer"
			},
			goto_next_end = {
				["]["] = "@function.outer",
				["]M"] = "@class.outer"
			},
			goto_previous_start = {
				["[["] = "@function.outer",
				["[m"] = "@class.outer"
			},
			goto_previous_end = {
				["[]"] = "@function.outer",
				["[M"] = "@class.outer"
			}
		},
		select = {
			enable = true,
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
				-- Or you can define your own textobjects like this
				["iF"] = {
					python = "(function_definition) @function",
					cpp = "(function_definition) @function",
					c = "(function_definition) @function",
					java = "(method_declaration) @function"
				}
			}
		},
		swap = {
			enable = true,
			swap_next = {
				["<leader>l"] = "@parameter.inner"
			},
			swap_previous = {
				["<leader>h"] = "@parameter.inner"
			}
		}
	},
	--- nvim-ts-autotag ---
	autotag = {
		enable = true,
		filetypes = {"html", "javascriptreact", "xml"}
	}
}
