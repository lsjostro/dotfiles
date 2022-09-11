local lualine = require("lualine")

local function clock()
	return os.date("%H:%M")
end

lualine.setup({
	options = {
		globalstatus = true,
		-- theme = "onelight",
		component_separators = { left = "╲", right = "╱" },
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_c = {
			{
				"filename",
				path = 1,
				file_status = true,
			},
		},
		lualine_x = { "filetype" },
		lualine_y = { "location", "progress" },
		lualine_z = { clock },
	},
})
