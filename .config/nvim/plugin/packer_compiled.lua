-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/lsjostrom/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/lsjostrom/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/lsjostrom/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/lsjostrom/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/lsjostrom/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    config = { "\27LJ\1\2M\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\14lazy_load luasnip/loaders/from_vscode\frequire\0" },
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-tmux"] = {
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/cmp-tmux",
    url = "https://github.com/andersevenrud/cmp-tmux"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["colorbuddy.vim"] = {
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/colorbuddy.vim",
    url = "https://github.com/tjdevries/colorbuddy.vim"
  },
  ["copilot.vim"] = {
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/copilot.vim",
    url = "https://github.com/github/copilot.vim"
  },
  ["efm-langserver"] = {
    config = { "\27LJ\1\2r\0\0\3\0\a\0\n4\0\0\0%\1\1\0>\0\2\0027\0\2\0007\0\3\0003\1\5\0003\2\4\0:\2\6\1>\0\2\1G\0\1\0\17init_options\1\0\0\1\0\1\23documentFormatting\2\nsetup\befm\14lspconfig\frequire\0" },
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/efm-langserver",
    url = "https://github.com/mattn/efm-langserver"
  },
  ["folding-nvim"] = {
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/folding-nvim",
    url = "https://github.com/pierreglaser/folding-nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\1\2œ\4\0\0\4\0\16\0\0194\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\5\0003\3\4\0:\3\6\0023\3\a\0:\3\b\0023\3\t\0:\3\n\0023\3\v\0:\3\f\0023\3\r\0:\3\14\2:\2\15\1>\0\2\1G\0\1\0\nsigns\17changedelete\1\0\4\ttext\6~\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\14topdelete\1\0\4\ttext\bâ–˜\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vdelete\1\0\4\ttext\bâ––\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vchange\1\0\4\ttext\bâ–Œ\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\badd\1\0\0\1\0\4\ttext\bâ–Œ\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\ahl\16GitSignsAdd\1\0\1\nnumhl\2\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["go.nvim"] = {
    config = { "\27LJ\1\2ä\2\0\0\2\0\t\0\0194\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\0014\0\4\0007\0\5\0%\1\6\0>\0\2\0014\0\4\0007\0\5\0%\1\a\0>\0\2\0014\0\4\0007\0\5\0%\1\b\0>\0\2\1G\0\1\0Yautocmd BufWritePre (InsertLeave?) <buffer> lua vim.lsp.buf.formatting_sync(nil,500)Gautocmd BufWritePre *.go :silent! lua require('go.format').gofmt()Lautocmd FileType go nmap <Leader>c :lua require('go.comment').gen()<cr>\bcmd\bvim\1\0\1\24comment_placeholder\5\nsetup\ago\frequire\0" },
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/go.nvim",
    url = "https://github.com/ray-x/go.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\1\2Ÿ\4\0\0\2\0\16\0!4\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\0\0007\0\1\0%\1\5\0:\1\4\0004\0\0\0007\0\1\0003\1\a\0:\1\6\0004\0\0\0007\0\1\0003\1\t\0:\1\b\0004\0\0\0007\0\1\0003\1\v\0:\1\n\0004\0\0\0007\0\1\0)\1\2\0:\1\f\0004\0\0\0007\0\1\0)\1\2\0:\1\r\0004\0\0\0007\0\1\0003\1\15\0:\1\14\0G\0\1\0\1\a\0\0\fIndent1\fIndent2\fIndent3\fIndent4\fIndent5\fIndent6)indent_blankline_char_highlight_list4indent_blankline_show_trailing_blankline_indent-indent_blankline_show_first_indent_level\1\3\0\0\ttext\rmarkdown&indent_blankline_filetype_exclude\1\3\0\0\thelp\rterminal%indent_blankline_buftype_exclude\1\2\0\0\16IndentSpace/indent_blankline_space_char_highlight_list\bâ¬ indent_blankline_space_char\bâ”‚\26indent_blankline_char\6g\bvim\0" },
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  kommentary = {
    config = { '\27LJ\1\2Â\2\0\0\5\0\14\0\0294\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\0014\0\3\0007\0\4\0007\0\5\0%\1\6\0%\2\a\0%\3\b\0002\4\0\0>\0\5\0014\0\3\0007\0\4\0007\0\5\0%\1\t\0%\2\a\0%\3\n\0002\4\0\0>\0\5\0014\0\0\0%\1\1\0>\0\2\0027\0\v\0%\1\f\0003\2\r\0>\0\3\1G\0\1\0\1\0\1 prefer_single_line_comments\2\fdefault\23configure_language$<Plug>kommentary_visual_default\6v"<Plug>kommentary_line_default\6\31\6n\20nvim_set_keymap\bapi\bvim\26use_extended_mappings\22kommentary.config\frequire\0' },
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/kommentary",
    url = "https://github.com/b3nj5m1n/kommentary"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    config = { "\27LJ\1\0028\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\tinit\flspkind\frequire\0" },
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\1\2Ð\1\0\0\a\0\b\2!4\0\0\0004\1\1\0007\1\2\0017\1\3\1'\2\0\0>\1\2\0=\0\0\3\b\1\0\0T\2\20€4\2\1\0007\2\2\0027\2\4\2'\3\0\0\21\4\1\0\16\5\0\0)\6\2\0>\2\5\0028\2\1\2\16\3\2\0007\2\5\2\16\4\1\0\16\5\1\0>\2\4\2\16\3\2\0007\2\6\2%\4\a\0>\2\3\2\n\2\0\0T\2\2€)\2\1\0T\3\1€)\2\2\0H\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2-\0\1\3\1\2\0\5+\1\0\0007\1\0\0017\2\1\0>\1\2\1G\0\1\0\1À\tbody\15lsp_expand°\2\0\1\6\3\f\0++\1\0\0007\1\0\1>\1\1\2\15\0\1\0T\2\4€+\1\0\0007\1\1\1>\1\1\1T\1!€+\1\1\0007\1\2\1>\1\1\2\15\0\1\0T\2\4€+\1\1\0007\1\3\1>\1\1\1T\1\24€+\1\2\0>\1\1\2\15\0\1\0T\2\4€+\1\0\0007\1\4\1>\1\1\1T\1\16€4\1\5\0007\1\6\0017\1\a\1>\1\1\2\6\1\b\0T\2\b€4\2\5\0007\2\t\0027\2\n\2\16\3\1\0%\4\v\0)\5\2\0>\2\4\1T\2\2€\16\2\0\0>\2\1\1G\0\1\0\0À\1À\2À\6i\18nvim_feedkeys\bapi\5\19copilot#Accept\afn\bvim\rcomplete\19expand_or_jump\31expand_or_locally_jumpable\21select_next_item\fvisibleŽ\1\0\1\3\2\4\0\23+\1\0\0007\1\0\1>\1\1\2\15\0\1\0T\2\4€+\1\0\0007\1\1\1>\1\1\1T\1\r€+\1\1\0007\1\2\1'\2ÿÿ>\1\2\2\15\0\1\0T\2\5€+\1\1\0007\1\3\1'\2ÿÿ>\1\2\1T\1\2€\16\1\0\0>\1\1\1G\0\1\0\0À\1À\tjump\rjumpable\21select_prev_item\fvisibleÐ\b\1\0\n\0>\0u4\0\0\0%\1\1\0>\0\2\0024\1\0\0%\2\2\0>\1\2\0021\2\3\0007\3\4\0003\4\f\0003\5\n\0004\6\0\0%\a\5\0>\6\2\0027\6\6\0063\a\a\0003\b\b\0:\b\t\a>\6\2\2:\6\v\5:\5\r\0043\5\14\0:\5\15\0043\5\17\0001\6\16\0:\6\18\5:\5\19\0043\5\23\0007\6\20\0007\a\20\0007\a\21\a>\a\1\0023\b\22\0>\6\3\2:\6\24\0057\6\20\0007\a\20\0007\a\25\a>\a\1\0023\b\26\0>\6\3\2:\6\27\0057\6\20\0007\6\28\6'\aüÿ>\6\2\2:\6\29\0057\6\20\0007\6\28\6'\a\4\0>\6\2\2:\6\30\0057\6\20\0003\a \0007\b\20\0007\b\31\b>\b\1\2:\b!\a7\b\20\0007\b\"\b>\b\1\2:\b#\a>\6\2\2:\6$\0057\6\20\0007\a\20\0007\a%\a3\b&\0>\a\2\0023\b'\0>\6\3\2:\6(\0057\6\20\0007\a\20\0007\a%\a3\b)\0>\a\2\0023\b*\0>\6\3\2:\6+\0057\6\20\0007\a\20\0007\a,\a>\a\1\0023\b-\0>\6\3\2:\6.\0057\6\20\0001\a/\0003\b0\0>\6\3\2:\0061\0057\6\20\0001\a2\0003\b3\0>\6\3\2:\0064\5:\5\20\0047\0055\0007\0056\0052\6\5\0003\a7\0;\a\1\0063\a8\0;\a\2\0063\a9\0003\b:\0002\t\0\0:\t;\b:\b<\a;\a\3\0063\a=\0;\a\4\6>\5\2\2:\0056\4>\3\2\0010\0\0€G\0\1\0\1\0\2\rpriority\3\3\tname\rnvim_lsp\voption\23trigger_characters\1\0\1\14all_panes\2\1\0\2\rpriority\3\2\tname\ttmux\1\0\2\rpriority\3\4\tname\fluasnip\1\0\2\rpriority\3\1\tname\vbuffer\fsources\vconfig\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\14<C-Space>\1\3\0\0\6i\6c\rcomplete\n<C-y>\1\3\0\0\6i\6c\1\0\1\vselect\1\t<CR>\1\3\0\0\6i\6c\1\0\1\vselect\1\fconfirm\n<C-e>\6c\nclose\6i\1\0\0\nabort\n<C-u>\n<C-d>\16scroll_docs\n<C-n>\1\3\0\0\6i\6c\21select_next_item\n<C-p>\1\0\0\1\3\0\0\6i\6c\21select_prev_item\fmapping\fsnippet\vexpand\1\0\0\0\18documentation\1\0\1\vborder\frounded\15formatting\1\0\0\vformat\1\0\0\tmenu\1\0\6\ttmux\v[Tmux]\rnvim_lua\n[Lua]\rnvim_lsp\n[LSP]\vbuffer\r[Buffer]\tpath\v[Path]\fluasnip\14[LuaSnip]\1\0\1\14with_text\2\15cmp_format\flspkind\nsetup\0\fluasnip\bcmp\frequire\0" },
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lsp-ts-utils"] = {
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/nvim-lsp-ts-utils",
    url = "https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\1\2‰\6\0\0\5\0\28\0D4\0\0\0%\1\1\0>\0\2\0014\0\0\0%\1\2\0>\0\2\0027\0\3\0\16\1\0\0%\2\4\0%\3\5\0%\4\6\0>\1\4\1\16\1\0\0%\2\a\0%\3\b\0%\4\t\0>\1\4\1\16\1\0\0%\2\4\0%\3\n\0%\4\v\0>\1\4\1\16\1\0\0%\2\4\0%\3\f\0%\4\r\0>\1\4\1\16\1\0\0%\2\4\0%\3\14\0%\4\15\0>\1\4\1\16\1\0\0%\2\4\0%\3\16\0%\4\17\0>\1\4\1\16\1\0\0%\2\4\0%\3\18\0%\4\19\0>\1\4\1\16\1\0\0%\2\4\0%\3\20\0%\4\21\0>\1\4\1\16\1\0\0%\2\4\0%\3\22\0%\4\23\0>\1\4\1\16\1\0\0%\2\4\0%\3\24\0%\4\25\0>\1\4\1\16\1\0\0%\2\4\0%\3\26\0%\4\25\0>\1\4\1\16\1\0\0%\2\4\0%\3\27\0%\4\25\0>\1\4\1G\0\1\0\bgwl\bgwr4<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>\bgwa0<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>\a]d0<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>\a[d&<Cmd>lua vim.lsp.buf.rename()<CR>\arn*<Cmd>lua vim.lsp.buf.formatting()<CR>\agf/<Cmd>lua vim.lsp.buf.type_definition()<CR>\b1gd*<cmd>lua vim.lsp.buf.references()<CR>\agr+<cmd>lua vim.lsp.buf.declaration()<CR>\agD.<Cmd>lua vim.lsp.buf.signature_help()<CR>\n<C-k>\6i%<Cmd>lua vim.lsp.buf.hover()<CR>\6K\6n\bmap\20lsjostrom.utils\25lsjostrom.lsp-config\frequire\0" },
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-shelman-theme"] = {
    config = { "\27LJ\1\2P\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0>\0\2\1G\0\1\0\18shelman-light\16colorscheme\15colorbuddy\frequire\0" },
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/nvim-shelman-theme",
    url = "https://github.com/shelmangroup/nvim-shelman-theme"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\1\2\1\0\0\2\0\b\0\f4\0\0\0%\1\1\0>\0\2\0014\0\2\0007\0\3\0%\1\5\0:\1\4\0004\0\2\0007\0\3\0%\1\a\0:\1\6\0G\0\1\0\31nvim_treesitter#foldexpr()\rfoldexpr\texpr\15foldmethod\awo\bvim\25lsjostrom.treesitter\frequire\0" },
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzy-native.nvim"
  },
  ["telescope-github.nvim"] = {
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/telescope-github.nvim",
    url = "https://github.com/nvim-telescope/telescope-github.nvim"
  },
  ["telescope.nvim"] = {
    config = { '\27LJ\1\2Â\n\0\0\5\0#\0X4\0\0\0%\1\1\0>\0\2\0014\0\0\0%\1\2\0>\0\2\0027\0\3\0\16\1\0\0%\2\4\0%\3\5\0%\4\6\0>\1\4\1\16\1\0\0%\2\4\0%\3\a\0%\4\b\0>\1\4\1\16\1\0\0%\2\4\0%\3\t\0%\4\b\0>\1\4\1\16\1\0\0%\2\4\0%\3\n\0%\4\v\0>\1\4\1\16\1\0\0%\2\4\0%\3\f\0%\4\r\0>\1\4\1\16\1\0\0%\2\4\0%\3\14\0%\4\15\0>\1\4\1\16\1\0\0%\2\4\0%\3\16\0%\4\17\0>\1\4\1\16\1\0\0%\2\4\0%\3\18\0%\4\19\0>\1\4\1\16\1\0\0%\2\4\0%\3\20\0%\4\21\0>\1\4\1\16\1\0\0%\2\4\0%\3\22\0%\4\23\0>\1\4\1\16\1\0\0%\2\4\0%\3\24\0%\4\25\0>\1\4\1\16\1\0\0%\2\4\0%\3\26\0%\4\27\0>\1\4\1\16\1\0\0%\2\4\0%\3\28\0%\4\29\0>\1\4\1\16\1\0\0%\2\4\0%\3\30\0%\4\17\0>\1\4\1\16\1\0\0%\2\4\0%\3\31\0%\4 \0>\1\4\1\16\1\0\0%\2\4\0%\3!\0%\4"\0>\1\4\1G\0\1\0I<cmd>lua require("telescope.builtin").lsp_document_diagnostics()<CR>\ageF<cmd>lua require("telescope.builtin").lsp_workspace_symbols()<CR>\ag?\ag/@<cmd>lua require("telescope.builtin").lsp_definitions()<CR>\agd?<cmd>lua require("telescope.builtin").lsp_references()<CR>\agr:<cmd>lua require("telescope.builtin").registers()<CR>\14<leader>p=<cmd>lua require("telescope.builtin").file_browser()<CR>\14<leader>.:<cmd>lua require("telescope.builtin").live_grep()<CR>\14<leader>/;<cmd>lua require("telescope.builtin").treesitter()<CR>\14<leader>tE<cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>\14<leader>sA<cmd>lua require("telescope.builtin").lsp_code_actions()<CR>\14<leader>a;<cmd>lua require("telescope.builtin").git_status()<CR>\14<leader>g:<cmd>lua require("telescope.builtin").git_files()<CR>\14<leader>e\f<space>9<cmd>lua require("telescope.builtin").oldfiles()<CR>\14<leader>f8<cmd>lua require("telescope.builtin").buffers()<CR>\14<leader>b\6n\bmap\20lsjostrom.utils\24lsjostrom.telescope\frequire\0' },
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-protobuf"] = {
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/vim-protobuf",
    url = "https://github.com/uarun/vim-protobuf"
  },
  ["vim-terraform"] = {
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/vim-terraform",
    url = "https://github.com/hashivim/vim-terraform"
  },
  ["yaml.nvim"] = {
    config = { "\27LJ\1\0026\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\tinit\14yaml_nvim\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/opt/yaml.nvim",
    url = "https://github.com/cuducos/yaml.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\1\2\1\0\0\2\0\b\0\f4\0\0\0%\1\1\0>\0\2\0014\0\2\0007\0\3\0%\1\5\0:\1\4\0004\0\2\0007\0\3\0%\1\a\0:\1\6\0G\0\1\0\31nvim_treesitter#foldexpr()\rfoldexpr\texpr\15foldmethod\awo\bvim\25lsjostrom.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\1\2Ð\1\0\0\a\0\b\2!4\0\0\0004\1\1\0007\1\2\0017\1\3\1'\2\0\0>\1\2\0=\0\0\3\b\1\0\0T\2\20€4\2\1\0007\2\2\0027\2\4\2'\3\0\0\21\4\1\0\16\5\0\0)\6\2\0>\2\5\0028\2\1\2\16\3\2\0007\2\5\2\16\4\1\0\16\5\1\0>\2\4\2\16\3\2\0007\2\6\2%\4\a\0>\2\3\2\n\2\0\0T\2\2€)\2\1\0T\3\1€)\2\2\0H\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2-\0\1\3\1\2\0\5+\1\0\0007\1\0\0017\2\1\0>\1\2\1G\0\1\0\1À\tbody\15lsp_expand°\2\0\1\6\3\f\0++\1\0\0007\1\0\1>\1\1\2\15\0\1\0T\2\4€+\1\0\0007\1\1\1>\1\1\1T\1!€+\1\1\0007\1\2\1>\1\1\2\15\0\1\0T\2\4€+\1\1\0007\1\3\1>\1\1\1T\1\24€+\1\2\0>\1\1\2\15\0\1\0T\2\4€+\1\0\0007\1\4\1>\1\1\1T\1\16€4\1\5\0007\1\6\0017\1\a\1>\1\1\2\6\1\b\0T\2\b€4\2\5\0007\2\t\0027\2\n\2\16\3\1\0%\4\v\0)\5\2\0>\2\4\1T\2\2€\16\2\0\0>\2\1\1G\0\1\0\0À\1À\2À\6i\18nvim_feedkeys\bapi\5\19copilot#Accept\afn\bvim\rcomplete\19expand_or_jump\31expand_or_locally_jumpable\21select_next_item\fvisibleŽ\1\0\1\3\2\4\0\23+\1\0\0007\1\0\1>\1\1\2\15\0\1\0T\2\4€+\1\0\0007\1\1\1>\1\1\1T\1\r€+\1\1\0007\1\2\1'\2ÿÿ>\1\2\2\15\0\1\0T\2\5€+\1\1\0007\1\3\1'\2ÿÿ>\1\2\1T\1\2€\16\1\0\0>\1\1\1G\0\1\0\0À\1À\tjump\rjumpable\21select_prev_item\fvisibleÐ\b\1\0\n\0>\0u4\0\0\0%\1\1\0>\0\2\0024\1\0\0%\2\2\0>\1\2\0021\2\3\0007\3\4\0003\4\f\0003\5\n\0004\6\0\0%\a\5\0>\6\2\0027\6\6\0063\a\a\0003\b\b\0:\b\t\a>\6\2\2:\6\v\5:\5\r\0043\5\14\0:\5\15\0043\5\17\0001\6\16\0:\6\18\5:\5\19\0043\5\23\0007\6\20\0007\a\20\0007\a\21\a>\a\1\0023\b\22\0>\6\3\2:\6\24\0057\6\20\0007\a\20\0007\a\25\a>\a\1\0023\b\26\0>\6\3\2:\6\27\0057\6\20\0007\6\28\6'\aüÿ>\6\2\2:\6\29\0057\6\20\0007\6\28\6'\a\4\0>\6\2\2:\6\30\0057\6\20\0003\a \0007\b\20\0007\b\31\b>\b\1\2:\b!\a7\b\20\0007\b\"\b>\b\1\2:\b#\a>\6\2\2:\6$\0057\6\20\0007\a\20\0007\a%\a3\b&\0>\a\2\0023\b'\0>\6\3\2:\6(\0057\6\20\0007\a\20\0007\a%\a3\b)\0>\a\2\0023\b*\0>\6\3\2:\6+\0057\6\20\0007\a\20\0007\a,\a>\a\1\0023\b-\0>\6\3\2:\6.\0057\6\20\0001\a/\0003\b0\0>\6\3\2:\0061\0057\6\20\0001\a2\0003\b3\0>\6\3\2:\0064\5:\5\20\0047\0055\0007\0056\0052\6\5\0003\a7\0;\a\1\0063\a8\0;\a\2\0063\a9\0003\b:\0002\t\0\0:\t;\b:\b<\a;\a\3\0063\a=\0;\a\4\6>\5\2\2:\0056\4>\3\2\0010\0\0€G\0\1\0\1\0\2\rpriority\3\3\tname\rnvim_lsp\voption\23trigger_characters\1\0\1\14all_panes\2\1\0\2\rpriority\3\2\tname\ttmux\1\0\2\rpriority\3\4\tname\fluasnip\1\0\2\rpriority\3\1\tname\vbuffer\fsources\vconfig\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\14<C-Space>\1\3\0\0\6i\6c\rcomplete\n<C-y>\1\3\0\0\6i\6c\1\0\1\vselect\1\t<CR>\1\3\0\0\6i\6c\1\0\1\vselect\1\fconfirm\n<C-e>\6c\nclose\6i\1\0\0\nabort\n<C-u>\n<C-d>\16scroll_docs\n<C-n>\1\3\0\0\6i\6c\21select_next_item\n<C-p>\1\0\0\1\3\0\0\6i\6c\21select_prev_item\fmapping\fsnippet\vexpand\1\0\0\0\18documentation\1\0\1\vborder\frounded\15formatting\1\0\0\vformat\1\0\0\tmenu\1\0\6\ttmux\v[Tmux]\rnvim_lua\n[Lua]\rnvim_lsp\n[LSP]\vbuffer\r[Buffer]\tpath\v[Path]\fluasnip\14[LuaSnip]\1\0\1\14with_text\2\15cmp_format\flspkind\nsetup\0\fluasnip\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\1\2Ÿ\4\0\0\2\0\16\0!4\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\0\0007\0\1\0%\1\5\0:\1\4\0004\0\0\0007\0\1\0003\1\a\0:\1\6\0004\0\0\0007\0\1\0003\1\t\0:\1\b\0004\0\0\0007\0\1\0003\1\v\0:\1\n\0004\0\0\0007\0\1\0)\1\2\0:\1\f\0004\0\0\0007\0\1\0)\1\2\0:\1\r\0004\0\0\0007\0\1\0003\1\15\0:\1\14\0G\0\1\0\1\a\0\0\fIndent1\fIndent2\fIndent3\fIndent4\fIndent5\fIndent6)indent_blankline_char_highlight_list4indent_blankline_show_trailing_blankline_indent-indent_blankline_show_first_indent_level\1\3\0\0\ttext\rmarkdown&indent_blankline_filetype_exclude\1\3\0\0\thelp\rterminal%indent_blankline_buftype_exclude\1\2\0\0\16IndentSpace/indent_blankline_space_char_highlight_list\bâ¬ indent_blankline_space_char\bâ”‚\26indent_blankline_char\6g\bvim\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: efm-langserver
time([[Config for efm-langserver]], true)
try_loadstring("\27LJ\1\2r\0\0\3\0\a\0\n4\0\0\0%\1\1\0>\0\2\0027\0\2\0007\0\3\0003\1\5\0003\2\4\0:\2\6\1>\0\2\1G\0\1\0\17init_options\1\0\0\1\0\1\23documentFormatting\2\nsetup\befm\14lspconfig\frequire\0", "config", "efm-langserver")
time([[Config for efm-langserver]], false)
-- Config for: lspkind-nvim
time([[Config for lspkind-nvim]], true)
try_loadstring("\27LJ\1\0028\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\tinit\flspkind\frequire\0", "config", "lspkind-nvim")
time([[Config for lspkind-nvim]], false)
-- Config for: nvim-shelman-theme
time([[Config for nvim-shelman-theme]], true)
try_loadstring("\27LJ\1\2P\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0>\0\2\1G\0\1\0\18shelman-light\16colorscheme\15colorbuddy\frequire\0", "config", "nvim-shelman-theme")
time([[Config for nvim-shelman-theme]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\1\2œ\4\0\0\4\0\16\0\0194\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\5\0003\3\4\0:\3\6\0023\3\a\0:\3\b\0023\3\t\0:\3\n\0023\3\v\0:\3\f\0023\3\r\0:\3\14\2:\2\15\1>\0\2\1G\0\1\0\nsigns\17changedelete\1\0\4\ttext\6~\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\14topdelete\1\0\4\ttext\bâ–˜\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vdelete\1\0\4\ttext\bâ––\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vchange\1\0\4\ttext\bâ–Œ\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\badd\1\0\0\1\0\4\ttext\bâ–Œ\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\ahl\16GitSignsAdd\1\0\1\nnumhl\2\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: go.nvim
time([[Config for go.nvim]], true)
try_loadstring("\27LJ\1\2ä\2\0\0\2\0\t\0\0194\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\0014\0\4\0007\0\5\0%\1\6\0>\0\2\0014\0\4\0007\0\5\0%\1\a\0>\0\2\0014\0\4\0007\0\5\0%\1\b\0>\0\2\1G\0\1\0Yautocmd BufWritePre (InsertLeave?) <buffer> lua vim.lsp.buf.formatting_sync(nil,500)Gautocmd BufWritePre *.go :silent! lua require('go.format').gofmt()Lautocmd FileType go nmap <Leader>c :lua require('go.comment').gen()<cr>\bcmd\bvim\1\0\1\24comment_placeholder\5\nsetup\ago\frequire\0", "config", "go.nvim")
time([[Config for go.nvim]], false)
-- Config for: kommentary
time([[Config for kommentary]], true)
try_loadstring('\27LJ\1\2Â\2\0\0\5\0\14\0\0294\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\0014\0\3\0007\0\4\0007\0\5\0%\1\6\0%\2\a\0%\3\b\0002\4\0\0>\0\5\0014\0\3\0007\0\4\0007\0\5\0%\1\t\0%\2\a\0%\3\n\0002\4\0\0>\0\5\0014\0\0\0%\1\1\0>\0\2\0027\0\v\0%\1\f\0003\2\r\0>\0\3\1G\0\1\0\1\0\1 prefer_single_line_comments\2\fdefault\23configure_language$<Plug>kommentary_visual_default\6v"<Plug>kommentary_line_default\6\31\6n\20nvim_set_keymap\bapi\bvim\26use_extended_mappings\22kommentary.config\frequire\0', "config", "kommentary")
time([[Config for kommentary]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\1\2M\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\14lazy_load luasnip/loaders/from_vscode\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\1\2‰\6\0\0\5\0\28\0D4\0\0\0%\1\1\0>\0\2\0014\0\0\0%\1\2\0>\0\2\0027\0\3\0\16\1\0\0%\2\4\0%\3\5\0%\4\6\0>\1\4\1\16\1\0\0%\2\a\0%\3\b\0%\4\t\0>\1\4\1\16\1\0\0%\2\4\0%\3\n\0%\4\v\0>\1\4\1\16\1\0\0%\2\4\0%\3\f\0%\4\r\0>\1\4\1\16\1\0\0%\2\4\0%\3\14\0%\4\15\0>\1\4\1\16\1\0\0%\2\4\0%\3\16\0%\4\17\0>\1\4\1\16\1\0\0%\2\4\0%\3\18\0%\4\19\0>\1\4\1\16\1\0\0%\2\4\0%\3\20\0%\4\21\0>\1\4\1\16\1\0\0%\2\4\0%\3\22\0%\4\23\0>\1\4\1\16\1\0\0%\2\4\0%\3\24\0%\4\25\0>\1\4\1\16\1\0\0%\2\4\0%\3\26\0%\4\25\0>\1\4\1\16\1\0\0%\2\4\0%\3\27\0%\4\25\0>\1\4\1G\0\1\0\bgwl\bgwr4<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>\bgwa0<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>\a]d0<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>\a[d&<Cmd>lua vim.lsp.buf.rename()<CR>\arn*<Cmd>lua vim.lsp.buf.formatting()<CR>\agf/<Cmd>lua vim.lsp.buf.type_definition()<CR>\b1gd*<cmd>lua vim.lsp.buf.references()<CR>\agr+<cmd>lua vim.lsp.buf.declaration()<CR>\agD.<Cmd>lua vim.lsp.buf.signature_help()<CR>\n<C-k>\6i%<Cmd>lua vim.lsp.buf.hover()<CR>\6K\6n\bmap\20lsjostrom.utils\25lsjostrom.lsp-config\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring('\27LJ\1\2Â\n\0\0\5\0#\0X4\0\0\0%\1\1\0>\0\2\0014\0\0\0%\1\2\0>\0\2\0027\0\3\0\16\1\0\0%\2\4\0%\3\5\0%\4\6\0>\1\4\1\16\1\0\0%\2\4\0%\3\a\0%\4\b\0>\1\4\1\16\1\0\0%\2\4\0%\3\t\0%\4\b\0>\1\4\1\16\1\0\0%\2\4\0%\3\n\0%\4\v\0>\1\4\1\16\1\0\0%\2\4\0%\3\f\0%\4\r\0>\1\4\1\16\1\0\0%\2\4\0%\3\14\0%\4\15\0>\1\4\1\16\1\0\0%\2\4\0%\3\16\0%\4\17\0>\1\4\1\16\1\0\0%\2\4\0%\3\18\0%\4\19\0>\1\4\1\16\1\0\0%\2\4\0%\3\20\0%\4\21\0>\1\4\1\16\1\0\0%\2\4\0%\3\22\0%\4\23\0>\1\4\1\16\1\0\0%\2\4\0%\3\24\0%\4\25\0>\1\4\1\16\1\0\0%\2\4\0%\3\26\0%\4\27\0>\1\4\1\16\1\0\0%\2\4\0%\3\28\0%\4\29\0>\1\4\1\16\1\0\0%\2\4\0%\3\30\0%\4\17\0>\1\4\1\16\1\0\0%\2\4\0%\3\31\0%\4 \0>\1\4\1\16\1\0\0%\2\4\0%\3!\0%\4"\0>\1\4\1G\0\1\0I<cmd>lua require("telescope.builtin").lsp_document_diagnostics()<CR>\ageF<cmd>lua require("telescope.builtin").lsp_workspace_symbols()<CR>\ag?\ag/@<cmd>lua require("telescope.builtin").lsp_definitions()<CR>\agd?<cmd>lua require("telescope.builtin").lsp_references()<CR>\agr:<cmd>lua require("telescope.builtin").registers()<CR>\14<leader>p=<cmd>lua require("telescope.builtin").file_browser()<CR>\14<leader>.:<cmd>lua require("telescope.builtin").live_grep()<CR>\14<leader>/;<cmd>lua require("telescope.builtin").treesitter()<CR>\14<leader>tE<cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>\14<leader>sA<cmd>lua require("telescope.builtin").lsp_code_actions()<CR>\14<leader>a;<cmd>lua require("telescope.builtin").git_status()<CR>\14<leader>g:<cmd>lua require("telescope.builtin").git_files()<CR>\14<leader>e\f<space>9<cmd>lua require("telescope.builtin").oldfiles()<CR>\14<leader>f8<cmd>lua require("telescope.builtin").buffers()<CR>\14<leader>b\6n\bmap\20lsjostrom.utils\24lsjostrom.telescope\frequire\0', "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType yaml ++once lua require("packer.load")({'yaml.nvim'}, { ft = "yaml" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
