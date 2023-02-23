return {
  {
    "neovim/nvim-lspconfig",

    config = function()
      local lspconfig = require("lspconfig")

      vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>")
      vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>")
      vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
      vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>")
      vim.keymap.set("n", "gI", "<cmd>Telescope lsp_implementations<cr>")
      vim.keymap.set("n", "gf", "<cmd>lua vim.lsp.buf.format()<CR>")
      vim.keymap.set("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")
      vim.keymap.set("n", "rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
      vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
      vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")

      -- will format file before saving based on attached lsp capabilities
      vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format({sync = true})]])

      local border = {
        { "🭽", "FloatBorder" },
        { "▔",  "FloatBorder" },
        { "🭾", "FloatBorder" },
        { "▕",  "FloatBorder" },
        { "🭿", "FloatBorder" },
        { "▁",  "FloatBorder" },
        { "🭼", "FloatBorder" },
        { "▏",  "FloatBorder" },
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

      local on_attach = function()
      end

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

      lspconfig.lua_ls.setup({
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

      -- SQLS execute query only
      lspconfig.sqls.setup({
        on_attach = function(client, bufnr)
          require("sqls").on_attach(client, bufnr)
          client.server_capabilities.execute_command = true
          client.server_capabilities.documentFormattingProvider = false
        end,
      })
      vim.keymap.set("v", "x", "<Plug>(sqls-execute-query)")
      vim.keymap.set("n", "<leader>db", "<Cmd>SqlsSwitchConnection<CR>")

      -- require("lspconfig").omnisharp.setup({
      --   cmd = { "/usr/bin/omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
      -- })
    end
  },

  -- null-ls
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
      local null_ls = require("null-ls")
      local builtins = require("null-ls.builtins")

      null_ls.setup({
        sources = {
          builtins.formatting.black,
          builtins.formatting.buf,
          builtins.formatting.cue_fmt,
          builtins.formatting.shfmt,
          builtins.formatting.prettierd,
          builtins.diagnostics.buf.with({
            args = { "lint", "--disable-symlinks", "--path", "$FILENAME" },
            cwd = function()
              local file_dir = vim.fn.expand("%:p:h") .. ";"
              local buf_yaml = vim.fn.findfile("buf.yaml", file_dir)
              if buf_yaml then
                return vim.fn.fnamemodify(buf_yaml, ":h")
              end
            end,
          }),
          builtins.diagnostics.cue_fmt,
          builtins.diagnostics.golangci_lint,
          builtins.diagnostics.eslint_d,
          builtins.diagnostics.terraform_validate,
          builtins.code_actions.eslint_d,
        },
        debug = true,
      })
    end
  }
}
