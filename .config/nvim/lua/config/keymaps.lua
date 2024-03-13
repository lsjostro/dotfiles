-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- C-/ should be comment instead of lazyterm
vim.api.nvim_del_keymap("n", "<c-_>")
vim.api.nvim_set_keymap("n", "<c-_>", "gcc", {})
vim.api.nvim_set_keymap("v", "<c-_>", "gc", {})
vim.api.nvim_set_keymap("n", "<Leader><c-_>", "gcgc", {})
