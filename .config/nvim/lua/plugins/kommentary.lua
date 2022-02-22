require("kommentary.config").use_extended_mappings()
vim.api.nvim_set_keymap("n", "", "<Plug>kommentary_line_default", {}) -- C-/
vim.api.nvim_set_keymap("v", "", "<Plug>kommentary_visual_default", {}) -- C-/

require("kommentary.config").configure_language("default", {
	prefer_single_line_comments = true,
})
