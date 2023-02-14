return {

  -- sqls (only using for execution of queries, might remove later)
  "nanotee/sqls.nvim",

  {
    "m-demare/hlargs.nvim",
    event = "VeryLazy",
    enabled = true,
    opts = {
      excluded_argnames = {
        usages = {
          lua = { "self", "use" },
        },
      },
    },
  },

  {
    "numToStr/Comment.nvim",
    keys = {
      { "<C-_>", "<Plug>(comment_toggle_linewise_current)" },
      { "<C-_>", "<Plug>(comment_toggle_linewise_visual)", mode = "v" },
    },
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      require("Comment").setup({
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      })
    end,
  },

  {
    "onsails/lspkind-nvim",
    config = function()
      require("lspkind").init({})
    end,
  },

  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
      vim.diagnostic.config({
        virtual_text = false,
      })
    end,
  },

  {
    "RRethy/vim-illuminate",
    config = function()
      require("illuminate").configure({ delay = 200 })
    end,
  }

}
