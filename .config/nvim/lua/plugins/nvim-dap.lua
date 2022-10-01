require("dap")
require("dap.ext.vscode").load_launchjs()
local silent = { silent = true }

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

vim.keymap.set("n", "<F7>", ":lua require'dap'.toggle_breakpoint()<CR>", silent)
vim.keymap.set("n", "<F8>", ":lua require'dap'.continue()<CR>", silent) -- .continue
vim.keymap.set("n", "<F9>", ":lua require'dap'.step_over()<CR>", silent) -- .next
vim.keymap.set("n", "<F10>", ":lua require'dap'.step_into()<CR>", silent) -- .into
vim.keymap.set("n", "<F11>", ":lua require'dap'.step_out()<CR>", silent) -- .out
vim.keymap.set("n", "<F12>", ":lua require'dap.ui.widgets'.hover()<CR>", silent)
vim.keymap.set("n", "<leader>r", ":lua require'dap'.repl.toggle({height = 5})<CR>", silent)

-- TODO explore those functions
--<leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
--<leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
--<leader>i :lua require'dap.ui.widgets'.hover()<CR>
--<leader>dl :lua require'dap'.run_last()<CR>
