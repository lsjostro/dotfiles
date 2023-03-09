return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "andersevenrud/cmp-tmux",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-emoji",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "onsails/lspkind-nvim",
    { "zbirenbaum/copilot-cmp", opts = {} },
  },
  event = "InsertEnter",
  config = function()
    local cmp = require("cmp")

    cmp.setup({
      formatting = {
        format = require("lspkind").cmp_format(),
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
            ["<Up>"] = cmp.mapping.select_prev_item(),
            ["<Down>"] = cmp.mapping.select_next_item(),
            ["<C-d>"] = cmp.mapping.scroll_docs(-2),
            ["<C-u>"] = cmp.mapping.scroll_docs(2),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
            ["<C-Space>"] = cmp.mapping.complete(),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
        { name = "buffer" },
        { name = "copilot" },
        { name = "emoji" },
      }),
    })
  end,
}
