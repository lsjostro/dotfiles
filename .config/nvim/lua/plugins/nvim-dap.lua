require("dap")
local map = require("lsjostrom.utils").map
local silent = { silent = true }

-- vim.fn.sign_define("DapStopped", { text = "=>", texthl = "", linehl = "debugPC", numhl = "#009688" })
-- vim.fn.sign_define("DapBreakpoint", { text = "🧘", texthl = "", linehl = "", numhl = "#009688" })
vim.highlight.create("DapBreakpoint", { ctermbg = 0, guifg = "#993939", guibg = "#fcfaed" }, false)
vim.highlight.create("DapLogPoint", { ctermbg = 0, guifg = "#61afef", guibg = "#fcfaed" }, false)
vim.highlight.create("DapStopped", { ctermbg = 0, guifg = "#98c379", guibg = "#fcfaed" }, false)

vim.fn.sign_define(
	"DapBreakpoint",
	{ text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
	"DapBreakpointCondition",
	{ text = "ﳁ", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
	"DapBreakpointRejected",
	{ text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
	"DapLogPoint",
	{ text = "", texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "DapLogPoint" }
)
vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" })

map("n", "<F7>", ":lua require'dap'.toggle_breakpoint()<CR>", silent)
map("n", "<F8>", ":lua require'dap'.continue()<CR>", silent) -- .continue
map("n", "<F9>", ":lua require'dap'.step_over()<CR>", silent) -- .next
map("n", "<F10>", ":lua require'dap'.step_into()<CR>", silent) -- .into
map("n", "<F11>", ":lua require'dap'.step_out()<CR>", silent) -- .out
map("n", "<F12>", ":lua require'dap.ui.widgets'.hover()<CR>", silent)
map("n", "<leader>r", ":lua require'dap'.repl.toggle({height = 5})<CR>", silent)

-- TODO explore those functions
--<leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
--<leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
--<leader>i :lua require'dap.ui.widgets'.hover()<CR>
--<leader>dl :lua require'dap'.run_last()<CR>
