local telescope = require("telescope")
local actions = require("telescope.actions")
local previewers = require("telescope.previewers")

local map = require("utils").map
map("n", "<leader>b", '<cmd>lua require("telescope.builtin").buffers()<CR>')
map("n", "<leader>f", '<cmd>lua require("telescope.builtin").oldfiles()<CR>')
map("n", "<space>", '<cmd>lua require("telescope.builtin").oldfiles()<CR>')
map("n", "<leader>e", '<cmd>lua require("telescope.builtin").git_files()<CR>')
map("n", "<leader>g", '<cmd>lua require("telescope.builtin").git_status()<CR>')
map("n", "<leader>a", '<cmd>lua require("telescope.builtin").lsp_code_actions()<CR>')
map("n", "<leader>m", '<cmd>lua require("telescope.builtin").marks()<CR>')
map("n", "<leader>s", '<cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>')
map("n", "<leader>t", '<cmd>lua require("telescope.builtin").treesitter()<CR>')
map("n", "<leader>/", '<cmd>lua require("telescope.builtin").live_grep()<CR>')
map("n", "<leader>.", '<cmd>lua require("telescope.builtin").file_browser()<CR>')
map("n", "<leader>p", '<cmd>lua require("telescope.builtin").registers()<CR>')
map("n", "gr", '<cmd>lua require("telescope.builtin").lsp_references()<CR>')
map("n", "gd", '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>')
map("n", "g/", '<cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>')
map("n", "g?", '<cmd>lua require("telescope.builtin").lsp_workspace_symbols()<CR>')
map("n", "ge", '<cmd>lua require("telescope.builtin").lsp_document_diagnostics()<CR>')
map("n", "Db", '<cmd>lua require("telescope").extensions.dap.list_breakpoints()<CR>')
map("n", "Dc", '<cmd>lua require("telescope").extensions.dap.commands()<CR>')
map("n", "Df", '<cmd>lua require("telescope").extensions.dap.frames()<CR>')
map("n", "DD", "<cmd>:GoBreakToggle<CR>")
map("n", "Dv", '<cmd>lua require("telescope").extensions.dap.variables()<CR>')

-- Setup
telescope.setup({
	defaults = {
		layout_strategy = "flex",
		-- layout_defaults = {flip_columns = 160},
		layout_config = {
			preview_cutoff = 10,
		},
		mappings = {
			i = {
				["<CR>"] = actions.select_default + actions.center,
				["<esc>"] = actions.close,
				["<tab>"] = actions.add_selection,
			},
		},
		color_devicons = true,
		file_previewer = previewers.vim_buffer_cat.new,
		grep_previewer = previewers.vim_buffer_vimgrep.new,
		qflist_previewer = previewers.vim_buffer_qflist.new,
	},
})

local layout_strategies = require("telescope.pickers.layout_strategies")
local config = require("telescope.config")

layout_strategies.flex = function(self, max_columns, max_lines)
	local layout_config = self.layout_config or {}

	local flip_columns = layout_config.flip_columns or 160 -- Here's why.
	local flip_lines = layout_config.flip_lines or 20

	if max_columns < flip_columns and max_lines > flip_lines then
		self.layout_config = (config.values.layout_defaults or {})["vertical"]
		return layout_strategies.vertical(self, max_columns, max_lines)
	else
		self.layout_config = (config.values.layout_defaults or {})["horizontal"]
		return layout_strategies.horizontal(self, max_columns, max_lines)
	end
end

-- Extensions
telescope.load_extension("fzy_native")
telescope.load_extension("gh")
-- telescope.load_extension("packer")  -- currently breaking packer

local M = {}

-- Pickers
M.project_files = function()
	require("telescope.builtin").find_files({
		cwd = require("lspconfig.util").root_pattern(".git")(vim.fn.expand("%:p")),
	})
end

return M
