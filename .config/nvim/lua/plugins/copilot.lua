vim.keymap.set("i", "<C-J>", 'copilot#Accept("")', { silent = true, expr = true, desc = "Copilot dummy accept" })

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""
vim.g.copilot_filetypes = {
	["dap-repl"] = false,
}
