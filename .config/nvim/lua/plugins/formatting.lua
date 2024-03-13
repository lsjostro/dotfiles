return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["cue"] = { { "cue_fmt" } },
        ["html"] = { { "prettierd", "prettier" } },
        ["sass"] = { { "prettierd", "prettier" } },
        ["proto"] = { { "buf" } },
        ["terraform"] = { { "terraform_fmt" } },
      },
    },
  },
}
