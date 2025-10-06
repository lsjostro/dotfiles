local servers = {
  cssls = {},
  html = {},
  superhtml = {},
  ts_ls = {},
  jsonls = {
    settings = {
      json = {
        format = { enable = true },
        validate = { enable = true },
      },
    },
  },
  yamlls = {
    settings = {
      yaml = {
        keyOrdering = false,
        format = { enable = true },
      },
    },
  },

  gopls = {
    settings = {
      gopls = {
        hints = {
          rangeVariableTypes = true,
          parameterNames = true,
          constantValues = true,
          assignVariableTypes = true,
          compositeLiteralFields = true,
          compositeLiteralTypes = true,
          functionTypeParameters = true,
        },
      },
    },
  },

  -- harper_ls = {
  --   filetypes = {
  --     "asciidoc", "c", "gitcommit", "go", "html", "javascript", "just", "lua", "markdown",
  --     "nix", "python", "ruby", "rust", "text", "toml", "typescript", "zig",
  --   }
  -- },

  lua_ls = {
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
          path = vim.split(package.path, ";"),
        },
        diagnostics = { globals = { "vim", "hs" } },
        hint = { enable = true },
        workspace = {
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
          },
        },
      },
    },
  },

  nixd = {
    cmd = { "nixd" },
    settings = {
      nixd = {
        nixpkgs = { expr = "import <nixpkgs> { }" },
        formatting = { command = { "nixfmt" } },
        options = {},
      },
    },
  },
}

for server, config in pairs(servers) do
  config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
  vim.lsp.enable(server)
  vim.lsp.config(server, config)
end
