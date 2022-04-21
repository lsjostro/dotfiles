vim.g.dashboard_default_executive = "telescope"
vim.keymap.set("n", "<leader>fr", ":DashboardFindHistory<CR>")
vim.keymap.set("n", "<leader>fl", ":SessionLoad<CR>")
vim.keymap.set("n", "<leader>fn", ":DashboardNewFile<CR>")
vim.keymap.set("n", "<leader>fm", ":DashboardJumpMarks<CR>")

vim.g.dashboard_custom_header = {}

vim.g.dashboard_custom_section = {
	last_session = {
		description = { " Load saved session                    SPC f l" },
		command = "SessionLoad",
	},
	find_history = {
		description = { " Recently opened files                 SPC f r" },
		command = "DashboardFindHistory",
	},
	find_file = {
		description = { " Find file                             SPC f f" },
		command = "DashboardFindFile",
	},
	new_file = {
		description = { " New file                              SPC f n" },
		command = "DashboardNewFile",
	},
	find_word = {
		description = { " Find word (grep)                      SPC f g" },
		command = "DashboardFindWord",
	},
	find_bookmarks = {
		description = { " Find marks                            SPC f m" },
		command = "DashboardJumpMarks",
	},
}
