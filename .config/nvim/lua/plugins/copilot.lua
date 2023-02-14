local M = {
  "github/copilot.vim",
  event = { "VeryLazy" },
}

function M.config()
  local map = function(type, key, value, opts)
    local options = { noremap = true }
    if opts then
      options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(type, key, value, options)
  end

  map("i", "<C-J>", [[copilot#Accept("<CR>")]], { noremap = true, silent = true, expr = true })

  vim.g.copilot_no_tab_map = true
  vim.g.copilot_assume_mapped = true
  vim.g.copilot_tab_fallback = ""
end

return M
