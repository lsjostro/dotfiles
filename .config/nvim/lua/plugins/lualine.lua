local lualine = require("lualine")
lualine.setup({
	options = {
		globalstatus = true,
	},
	sections = {
		lualine_c = {
			{
				"filename",
				path = 1,
				file_status = true,
			},
		},
	},
})
