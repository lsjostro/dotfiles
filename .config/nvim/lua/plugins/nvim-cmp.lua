local cmp = require("cmp")
local luasnip = require("luasnip")

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
	formatting = {
		format = require("lspkind").cmp_format({
			with_text = true,
			menu = {
				buffer = "[Buffer]",
				tmux = "[Tmux]",
				luasnip = "[LuaSnip]",
				nvim_lsp = "[LSP]",
				nvim_lua = "[Lua]",
				path = "[Path]",
			},
		}),
	},

	window = {
		completion = cmp.config.window.bordered({
			winhighlight = "Normal:PMenu,FloatBorder:PMenuBorder,CursorLine:PMenuSel,Search:None",
		}),
		documentation = cmp.config.window.bordered({
			winhighlight = "Normal:PMenu,FloatBorder:PMenu,CursorLine:PMenuSel,Search:None",
		}),
	},

	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},

	mapping = {
		["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
		["<Down>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
		["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
		["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-u>"] = cmp.mapping.scroll_docs(4),
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<CR>"] = cmp.mapping(cmp.mapping.confirm({ select = false }), { "i", "c" }),
		["<C-y>"] = cmp.mapping(cmp.mapping.confirm({ select = false }), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	},

	sources = cmp.config.sources({
		{
			name = "buffer",
			priority = 1,
		},
		{
			name = "luasnip",
			priority = 4,
		},
		{
			name = "tmux",
			priority = 2,
			option = {
				all_panes = true,
				trigger_characters = {},
			},
		},
		{
			name = "nvim_lsp",
			priority = 3,
		},
		{
			name = "nvim_lsp_signature_help",
			priority = 4,
		},
	}),
})
