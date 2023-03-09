return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzy-native.nvim",
      "nvim-telescope/telescope-github.nvim",
      "nvim-telescope/telescope-dap.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local previewers = require("telescope.previewers")

      vim.keymap.set(
        "n",
        "<leader>b",
        '<cmd>lua require("telescope.builtin").buffers({sort_mru=true, ignore_current_buffer=true})<CR>'
      )
      vim.keymap.set("n", "<leader>f", '<cmd>lua require("telescope.builtin").oldfiles()<CR>')
      vim.keymap.set("n", "<leader><space>", '<cmd>lua require("telescope.builtin").oldfiles()<CR>')
      vim.keymap.set("n", "<space>", '<cmd>lua require("telescope.builtin").oldfiles({cwd_only=true})<CR>')
      vim.keymap.set("n", "<leader>e", '<cmd>lua require("telescope.builtin").git_files()<CR>')
      vim.keymap.set("n", "<leader>g", '<cmd>lua require("telescope.builtin").git_status()<CR>')
      vim.keymap.set("n", "<leader>m", '<cmd>lua require("telescope.builtin").marks()<CR>')
      vim.keymap.set("n", "<leader>t", '<cmd>lua require("telescope.builtin").treesitter()<CR>')
      vim.keymap.set("n", "<leader>/", '<cmd>lua require("telescope.builtin").live_grep()<CR>')
      vim.keymap.set("n", "<leader>p", '<cmd>lua require("telescope.builtin").registers()<CR>')
      vim.keymap.set("n", "<leader>d", '<cmd>lua require("telescope.builtin").diagnostics()<CR>')
      vim.keymap.set(
        "n",
        "g?",
        '<cmd>lua require("telescope.builtin").lsp_workspace_symbols({ query = (vim.bo.filetype == "go" and "\'" or "") })<CR>'
      )

      -- Setup
      telescope.setup({
        defaults = {
          layout_strategy = "flex",
          layout_config = {
            preview_cutoff = 10,
            prompt_position = "bottom",
            mirror = true,
          },
          mappings = {
            i = {
                  ["<CR>"] = actions.select_default + actions.center,
                  ["<esc>"] = actions.close,
                  ["<tab>"] = actions.add_selection,
            },
          },
          color_devicons = true,
          file_previewer = previewers.vim_buffer_cat.new,
          grep_previewer = previewers.vim_buffer_vimgrep.new,
          qflist_previewer = previewers.vim_buffer_qflist.new,
          extensions = {
                ["ui-select"] = {
              require("telescope.themes").get_dropdown({
                -- even more opts
              }),
            },
          },
        },
      })

      local layout_strategies = require("telescope.pickers.layout_strategies")
      local config = require("telescope.config")

      layout_strategies.flex = function(self, max_columns, max_lines)
        local layout_config = self.layout_config or {}

        local flip_columns = layout_config.flip_columns or 160 -- Here's why.
        local flip_lines = layout_config.flip_lines or 20

        if max_columns < flip_columns and max_lines > flip_lines then
          self.layout_config = (config.values.layout_defaults or {})["vertical"]
          return layout_strategies.vertical(self, max_columns, max_lines)
        else
          self.layout_config = (config.values.layout_defaults or {})["horizontal"]
          return layout_strategies.horizontal(self, max_columns, max_lines)
        end
      end

      -- Extensions
      telescope.load_extension("fzy_native")
      telescope.load_extension("gh")
      telescope.load_extension("ui-select")
    end
  }
}
