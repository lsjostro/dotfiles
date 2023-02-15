return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "theHamsta/nvim-dap-virtual-text",
        config = function()
          require("nvim-dap-virtual-text").setup({
            commented = true,
          })
        end,
      },
      {
        "leoluz/nvim-dap-go",
        config = function()
          require("dap-go").setup()
        end,
      },
    },

    keys = {
      { "<F7>",      ":lua require'dap'.toggle_breakpoint()<cr>",       desc = "Toggle Breakpoint" },
      { "<F8>",      ":lua require'dap'.continue()<cr>",                desc = "Continue" },
      { "<F9>",      ":lua require'dap'.step_over()<cr>",               desc = "Step Over" },
      { "<F10>",     ":lua require'dap'.step_into()<cr>",               desc = "Step Into" },
      { "<F11>",     ":lua require'dap'.step_out()<cr>",                desc = "Step Out" },
      { "<F12>",     ":lua require'dap.ui.widgets'.hover()<cr>",        desc = "Hover" },
      { "<leader>r", ":lua require'dap'.repl.toggle({height = 5})<cr>", desc = "Toogle Repl" },
    },
    -- TODO explore those functions
    --<leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
    --<leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
    --<leader>i :lua require'dap.ui.widgets'.hover()<CR>
    --<leader>dl :lua require'dap'.run_last()<CR>

    config = function()
      require("dap")
      require("dap.ext.vscode").load_launchjs()

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
    end
  }
}
