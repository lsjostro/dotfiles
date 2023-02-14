local lspconfig = require("lspconfig")

-- vim.keymap.set("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>")
-- vim.keymap.set("i", "<C-k>", "<Cmd>lua vim.lsp.buf.signature_help()<CR>")
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
vim.keymap.set("n", "1gd", "<Cmd>lua vim.lsp.buf.type_definition()<CR>")
vim.keymap.set("n", "gf", "<Cmd>lua vim.lsp.buf.format()<CR>")
vim.keymap.set("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")
vim.keymap.set("n", "rn", "<Cmd>lua vim.lsp.buf.rename()<CR>")
vim.keymap.set("n", "[d", "<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
vim.keymap.set("n", "]d", "<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
-- vim.keymap.set("n", "gwa", "<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
-- vim.keymap.set("n", "gwr", "<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
-- vim.keymap.set("n", "gwl", "<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")

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

local on_attach = function() end

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
	"tsserver",
	"cssmodules_ls",
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({ on_attach = on_attach })
end

lspconfig.sqls.setup({
	on_attach = function(client, bufnr)
		require("sqls").on_attach(client, bufnr)
		client.server_capabilities.execute_command = true
		client.server_capabilities.documentFormattingProvider = false
	end,
})
vim.keymap.set("v", "x", "<Plug>(sqls-execute-query)")
vim.keymap.set("n", "<leader>db", "<Cmd>SqlsSwitchConnection<CR>")

lspconfig.lua_ls.setup({
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
	cmd = { "vscode-css-languageserver", "--stdio" },
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

require("lspconfig").omnisharp.setup({
	cmd = { "/usr/bin/omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
})
