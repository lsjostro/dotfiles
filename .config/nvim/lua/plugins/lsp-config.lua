local lspconfig = require("lspconfig")
vim.keymap.set("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set("i", "<C-k>", "<Cmd>lua vim.lsp.buf.signature_help()<CR>")
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
vim.keymap.set("n", "1gd", "<Cmd>lua vim.lsp.buf.type_definition()<CR>")
vim.keymap.set("n", "gf", "<Cmd>lua vim.lsp.buf.format()<CR>")
vim.keymap.set("n", "rn", "<Cmd>lua vim.lsp.buf.rename()<CR>")
vim.keymap.set("n", "[d", "<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
vim.keymap.set("n", "]d", "<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
vim.keymap.set("n", "gwa", "<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
vim.keymap.set("n", "gwr", "<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
vim.keymap.set("n", "gwl", "<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")

-- will format file before saving based on attached lsp capabilities
vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format({sync = true})]])

local border = {
	{ "🭽", "FloatBorder" },
	{ "▔", "FloatBorder" },
	{ "🭾", "FloatBorder" },
	{ "▕", "FloatBorder" },
	{ "🭿", "FloatBorder" },
	{ "▁", "FloatBorder" },
	{ "🭼", "FloatBorder" },
	{ "▏", "FloatBorder" },
}
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	update_in_insert = false,
	virtual_text = false,
})

local signs = { Error = "🔥", Warn = "⚠️ ", Hint = "💡", Info = "💡" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local on_attach = function()
	require("folding").on_attach()
	require("lsp_signature").on_attach() -- Note: add in lsp client on-attach
end

-- simple setups --
local servers = {
	"bashls",
	"dockerls",
	"gopls",
	"jsonls",
	"terraformls",
	"yamlls",
	"gdscript",
	"pyright",
	"bufls",
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({ on_attach = on_attach })
end

lspconfig.sqls.setup({
	on_attach = function(client, bufnr)
		require("sqls").on_attach(client, bufnr)
		client.resolved_capabilities.execute_command = true
		client.resolved_capabilities.document_formatting = false
	end,
})
vim.keymap.set("v", "x", "<Plug>(sqls-execute-query)")
vim.keymap.set("n", "<leader>db", "<Cmd>SqlsSwitchConnection<CR>")

lspconfig.sumneko_lua.setup({
	on_attach = function()
		on_attach()
		vim.cmd([[autocmd BufWritePre <buffer> lua require'stylua-nvim'.format_file()]])
	end,
	settings = {
		Lua = {
			completion = { kewordSnippet = "Disable" },
			diagnostics = {
				enable = true,
				globals = { "renoise", "use", "vim" },
			},
			runtime = {
				version = "LuaJIT",
				path = { "?.lua", "?/init.lua", "?/?.lua" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				maxPreload = 2000,
				preloadFileSize = 1000,
				checkThirdParty = false,
			},
		},
	},
})

lspconfig.cssls.setup({
	cmd = { "css-languageserver", "--stdio" },
	filetypes = { "css" },
	settings = {},
})

lspconfig.html.setup({
	cmd = { "vscode-html-language-server", "--stdio" },
	filetypes = { "html" },
	init_options = {
		configurationSection = { "html", "css", "javascript" },
		embeddedLanguages = {
			css = true,
			javascript = true,
		},
	},
	settings = {},
})

lspconfig.yamlls.setup({
	settings = {
		yaml = {
			format = { enable = true, singleQuote = true },
			schemaStore = { enable = true, url = "https://json.schemastore.org" },
			schemas = {
				-- ["https://json.schemastore.org/github-workflow"] = "*.github/workflows/*",
				["https://json.schemastore.org/kustomization.json"] = "kustomization.yaml",
				-- ["https://json.schemastore.org/ansible-role-2.9.json"] = "*/tasks/*.y*ml",
				kubernetes = {
					"clusterrolebinding.yaml",
					"clusterrole-contour.yaml",
					"clusterrole.yaml",
					"configmap.yaml",
					"cronjob.yaml",
					"daemonset.yaml",
					"deployment-*.yaml",
					"deployment.yaml",
					"*-deployment.yaml",
					"hpa.yaml",
					"ingress.yaml",
					"job.yaml",
					"namespace.yaml",
					"pvc.yaml",
					"rbac.yaml",
					"rolebinding.yaml",
					"role.yaml",
					"sa.yaml",
					"secret.yaml",
					"serviceaccounts.yaml",
					"service-account.yaml",
					"serviceaccount.yaml",
					"service-*.yaml",
					"service.yaml",
					"*-service.yaml",
					"statefulset.yaml",
				},
			},

			validate = true,
		},
	},
})

-- npm install -g typescript typescript-language-server
require("lspconfig").tsserver.setup({
	on_attach = function(client, bufnr)
		client.resolved_capabilities.document_formatting = false
		on_attach()

		require("lsp_signature").on_attach({
			bind = false, -- This is mandatory, otherwise border config won't get registered.
			-- If you want to hook lspsaga or other signature handler, pls set to false
			doc_lines = 2, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
			-- set to 0 if you DO NOT want any API comments be shown
			-- This setting only take effect in insert mode, it does not affect signature help in normal
			-- mode, 10 by default

			floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
			fix_pos = false, -- set to true, the floating window will not auto-close until finish all parameters
			hint_enable = false, -- virtual hint enable
			hint_prefix = "🐼 ", -- Panda for parameter
			hint_scheme = "String",
			use_lspsaga = true, -- set to true if you want to use lspsaga popup
			hi_parameter = "Search", -- how your parameter will be highlight
			max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down
			-- to view the hiding contents
			max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
			handler_opts = {
				border = "single", -- double, single, shadow, none
			},
			extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
		})

		local ts_utils = require("nvim-lsp-ts-utils")

		ts_utils.setup({
			debug = false,
			disable_commands = false,
			enable_import_on_completion = false,
			import_all_timeout = 5000, -- ms

			-- eslint
			eslint_enable_code_actions = true,
			eslint_enable_disable_comments = true,
			eslint_bin = "eslint_d",
			eslint_config_fallback = nil,
			eslint_enable_diagnostics = true,

			-- formatting
			enable_formatting = true,
			formatter = "prettier",
			formatter_config_fallback = nil,

			-- parentheses completion
			complete_parens = false,
			signature_help_in_parens = false,

			-- update imports on file move
			update_imports_on_move = true,
			require_confirmation_on_move = true,
			watch_dir = nil,
		})

		ts_utils.setup_client(client)

		vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>co", ":TSLspOrganize<CR>", { silent = true })
		vim.api.nvim_buf_set_keymap(bufnr, "n", "qq", ":TSLspFixCurrent<CR>", { silent = true })
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>cR", ":TSLspRenameFile<CR>", { silent = true })
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>ci", ":TSLspImportAll<CR>", { silent = true })
	end,
})

require("lspconfig").omnisharp.setup({
	cmd = { "/usr/bin/omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
})
