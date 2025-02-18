require 'blink-cmp'.setup({
  keymap = {
    preset = 'enter',
    ['<Tab>'] = { 'select_next', 'fallback' },
    ['<S-Tab>'] = { 'select_prev', 'fallback' },
    ['<PageDown>'] = { 'scroll_documentation_down', 'fallback' },
    ['<PageUp>'] = { 'scroll_documentation_up', 'fallback' },
  },
  completion = {
    accept = {
      auto_brackets = { enabled = true, },
    },

    documentation = {
      auto_show = true,
      auto_show_delay_ms = 800,
      window = { border = 'rounded', },
    },

    ghost_text = { enabled = false },

    list = {
      selection = {
        preselect = false,
        auto_insert = false
      },
    },

    menu = {
      auto_show = true,
      border = 'rounded',
      direction_priority = { 'n' },
      draw = {
        components = {
          kind_icon = {
            ellipsis = false,
            text = function(ctx)
              local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
              return kind_icon
            end,
            -- Optionally, you may also use the highlights from mini.icons
            highlight = function(ctx)
              local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
              return hl
            end,
          }
        }
      }
    }
  },

  fuzzy = {
    prebuilt_binaries = {
      download = false
    },
  },

  signature = {
    enabled = true,
    window = { border = 'rounded', },
  },

  sources = {
    default = { 'lsp', 'buffer' },
    providers = {},
  },

})
