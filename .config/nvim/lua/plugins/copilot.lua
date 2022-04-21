vim.keymap.set("i", "<C-J>", [[copilot#Accept("\<CR>")]], { noremap = true, silent = true, expr = true, script = true })

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""
