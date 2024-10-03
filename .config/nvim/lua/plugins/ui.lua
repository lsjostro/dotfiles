return {
  {
    "nvimdev/dashboard-nvim",
    enabled = false,
  },

  {
    "nvimdev/indentmini.nvim",
    opts = { char = "⸽" },
  },

  {
    "echasnovski/mini.indentscope",
    enabled = false,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
  },

  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 1500,
      render = "wrapped-compact",
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    enabled = false,
  },
  {
    "akinsho/bufferline.nvim",
    enabled = false,
  },
  {
    "b0o/incline.nvim",
    config = function()
      require("incline").setup({
        window = {
          margin = {
            horizontal = 0,
            vertical = 0,
          },
          padding = 0,
          placement = {
            horizontal = "right",
            vertical = "bottom",
          },
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if filename == "" then
            filename = "[No Name]"
          end

          local function get_git_diff()
            local icons = { delete = " ", change = " ", add = " " }
            local summary = vim.b.minidiff_summary
            local labels = {}
            if summary == nil then
              return labels
            end
            for name, icon in pairs(icons) do
              if tonumber(summary[name]) and summary[name] > 0 then
                table.insert(labels, { icon .. summary[name] .. " ", group = "MiniDiffSign" .. name })
              end
            end
            if #labels > 0 then
              table.insert(labels, { "╱ " })
            end
            return labels
          end

          local function get_diagnostic_label()
            local icons = { error = " ", warn = "󰀪 ", info = " ", hint = " " }
            local label = {}

            for severity, icon in pairs(icons) do
              local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
              if n > 0 then
                table.insert(label, { icon .. n .. " ", group = "DiagnosticSign" .. severity })
              end
            end
            if #label > 0 then
              table.insert(label, { "╱ " })
            end
            return label
          end

          local filetype_icon, color = require("nvim-web-devicons").get_icon_color(filename)

          return {
            { filetype_icon, guifg = color },
            { " ╱ " },
            { get_diagnostic_label() },
            { get_git_diff() },
            { filename, gui = "italic" },
          }
        end,
      })
    end,
    -- Optional: Lazy load Incline
    event = "VeryLazy",
  },

  {
    "DrKJeff16/project.nvim",
    config = function(_, opts)
      if vim.fn.argv()[1] == nil then
        require("project_nvim").setup(opts) -- Workaround for project.nvim not setting up
        vim.schedule(function()
          vim.cmd("Telescope projects")
        end)
      end
    end,
    opts = {
      exclude_dirs = {
        "~/.cargo/*",
        "~/.config/*",
        "/tmp/*",
      },
      manual_mode = false,
      patterns = { ".git", ".jj" },
    },
  },
}
