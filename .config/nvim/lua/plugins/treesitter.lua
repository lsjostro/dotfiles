return {
  { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag",
      "nvim-treesitter/nvim-treesitter-context",
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "c",
          "cmake",
          "cpp",
          "css",
          "cue",
          "diff",
          "dockerfile",
          "gdscript",
          "git_rebase",
          "gitcommit",
          "gitignore",
          "go",
          "gomod",
          "graphql",
          "help",
          "hcl",
          "html",
          "http",
          "java",
          "javascript",
          "jsdoc",
          "json",
          "jsonc",
          "kotlin",
          "latex",
          "lua",
          "make",
          "markdown",
          "markdown_inline",
          "meson",
          "ninja",
          "php",
          "proto",
          "python",
          "query",
          "regex",
          "rego",
          "rust",
          "scss",
          "sql",
          "svelte",
          "teal",
          "terraform",
          "toml",
          "tsx",
          "typescript",
          "vhs",
          "vim",
          "vue",
          "wgsl",
          "yaml",
          "zig",
        },
        highlight = {
          enable = true,
          use_languagetree = true,
        },
        indent = {
          enable = false,
        },
        context_commentstring = { enable = true, enable_autocmd = false },
        playground = {
          enable = true,
          disable = {},
          updatetime = 25,
          persist_queries = false,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "ss",
            node_incremental = "sq",
            scope_incremental = "sd",
            node_decremental = "sa",
          },
        },
        query_linter = {
          enable = true,
          use_virtual_text = true,
          lint_events = { "BufWrite", "CursorHold" },
        },
        textobjects = {
          move = {
            enable = true,
            goto_next_start = {
              ["]]"] = "@function.outer",
              ["]m"] = "@class.outer",
            },
            goto_next_end = {
              ["]["] = "@function.outer",
              ["]M"] = "@class.outer",
            },
            goto_previous_start = {
              ["[["] = "@function.outer",
              ["[m"] = "@class.outer",
            },
            goto_previous_end = {
              ["[]"] = "@function.outer",
              ["[M"] = "@class.outer",
            },
          },
        },
        --- nvim-ts-autotag ---
        autotag = {
          enable = true,
          filetypes = { "html", "javascriptreact", "xml" },
        },
      })

      local context = require("treesitter-context")
      context.setup({
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        patterns = {   -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
          default = {
            "class",
            "function",
            "method",
          },
        },
        exact_patterns = {
        },
        zindex = 20, -- The Z-index of the context window
      })
    end,
  },
}
