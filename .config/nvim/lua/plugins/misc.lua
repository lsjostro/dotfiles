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
      { "gc",    "<Plug>(comment_toggle_linewise_visual)", mode = "v" },
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
  },

  {
    "ojroques/nvim-osc52",
    config = function()
      local osc52 = require("osc52")
      osc52.setup({
        max_length = 0, -- Maximum length of selection (0 for no limit)
        silent = false, -- Disable message on successful copy
        trim = false,   -- Trim text before copy
      })

      vim.keymap.set("n", "<leader>c", require("osc52").copy_operator, { expr = true })
      vim.keymap.set("n", "<leader>cc", "<leader>c_", { remap = true })
      vim.keymap.set("x", "<leader>c", require("osc52").copy_visual)
    end,
  },

  {
    "gbprod/yanky.nvim",
    opts = {
      ring = {
        history_length = 100,
        storage = "memory",
        sync_with_numbered_registers = false,
        cancel_event = "update",
      },
    },
    keys = {
      { "p",     "<Plug>(YankyPutAfter)",     mode = { "n", "x" } },
      { "P",     "<Plug>(YankyPutBefore)",    mode = { "n", "x" } },
      { "gp",    "<Plug>(YankyGPutAfter)",    mode = { "n", "x" } },
      { "gP",    "<Plug>(YankyGPutBefore)",   mode = { "n", "x" } },
      { "<c-p>", "<Plug>(YankyCycleForward)" },
      { "<c-n>", "<Plug>(YankyCycleBackward)" },
    }
  },

  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  }
}
