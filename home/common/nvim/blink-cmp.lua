require("blink-cmp").setup({
	keymap = {
		preset = "enter",
		["<PageDown>"] = { "scroll_documentation_down" },
		["<PageUp>"] = { "scroll_documentation_up" },
	},
	completion = {
		accept = {
			auto_brackets = { enabled = true },
		},

		documentation = {
			auto_show = true,
			auto_show_delay_ms = 800,
			window = { border = "rounded" },
		},

		ghost_text = { enabled = true },

		list = {
			selection = "manual",
		},

		menu = {
			auto_show = true,
		},
	},

	fuzzy = {
		prebuilt_binaries = {
			download = false,
		},
	},

	keymap = {
		preset = "super-tab",
	},

	signature = {
		enabled = true,
		window = { border = "rounded" },
	},

	sources = {
		default = { "lsp", "codeium", "buffer" },
		cmdline = {},
		providers = {
			codeium = {
				name = "codeium",
				module = "blink.compat.source",
				score_offset = -100,
			},
		},
	},
})
