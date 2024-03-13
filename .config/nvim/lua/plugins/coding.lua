return {
  {
    "echasnovski/mini.pairs",
    enabled = false,
  },

  {
    "nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },

  {
    "someone-stole-my-name/yaml-companion.nvim",
    dependencies = {
      { "neovim/nvim-lspconfig" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      require("yaml-companion").setup()
      require("telescope").load_extension("yaml_schema")
      local cfg = require("yaml-companion").setup({})
      require("lspconfig")["yamlls"].setup(cfg)
    end,
  },
}
