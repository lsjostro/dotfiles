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
local package_path_str = "/home/lsjostrom/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/lsjostrom/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/lsjostrom/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/lsjostrom/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/lsjostrom/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
    config = { "\27LJ\2\nM\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14lazy_load luasnip/loaders/from_vscode\frequire\0" },
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
    config = { "\27LJ\2\nr\0\0\4\0\a\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0005\2\5\0005\3\4\0=\3\6\2B\0\2\1K\0\1\0\17init_options\1\0\0\1\0\1\23documentFormatting\2\nsetup\befm\14lspconfig\frequire\0" },
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
    config = { "\27LJ\2\n�\4\0\0\5\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\0035\4\a\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\3=\3\15\2B\0\2\1K\0\1\0\nsigns\17changedelete\1\0\4\ahl\19GitSignsChange\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ttext\6~\14topdelete\1\0\4\ahl\19GitSignsDelete\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ttext\b▘\vdelete\1\0\4\ahl\19GitSignsDelete\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ttext\b▖\vchange\1\0\4\ahl\19GitSignsChange\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ttext\b▌\badd\1\0\0\1\0\4\ahl\16GitSignsAdd\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\ttext\b▌\1\0\1\nnumhl\2\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["go.nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\3\0\t\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0'\2\6\0B\0\2\0016\0\4\0009\0\5\0'\2\a\0B\0\2\0016\0\4\0009\0\5\0'\2\b\0B\0\2\1K\0\1\0Yautocmd BufWritePre (InsertLeave?) <buffer> lua vim.lsp.buf.formatting_sync(nil,500)Gautocmd BufWritePre *.go :silent! lua require('go.format').gofmt()Lautocmd FileType go nmap <Leader>c :lua require('go.comment').gen()<cr>\bcmd\bvim\1\0\1\24comment_placeholder\5\nsetup\ago\frequire\0" },
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/go.nvim",
    url = "https://github.com/ray-x/go.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n�\4\0\0\2\0\16\0!6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0005\1\a\0=\1\6\0006\0\0\0009\0\1\0005\1\t\0=\1\b\0006\0\0\0009\0\1\0005\1\v\0=\1\n\0006\0\0\0009\0\1\0+\1\2\0=\1\f\0006\0\0\0009\0\1\0+\1\2\0=\1\r\0006\0\0\0009\0\1\0005\1\15\0=\1\14\0K\0\1\0\1\a\0\0\fIndent1\fIndent2\fIndent3\fIndent4\fIndent5\fIndent6)indent_blankline_char_highlight_list4indent_blankline_show_trailing_blankline_indent-indent_blankline_show_first_indent_level\1\3\0\0\ttext\rmarkdown&indent_blankline_filetype_exclude\1\3\0\0\thelp\rterminal%indent_blankline_buftype_exclude\1\2\0\0\16IndentSpace/indent_blankline_space_char_highlight_list\b⬝ indent_blankline_space_char\b│\26indent_blankline_char\6g\bvim\0" },
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  kommentary = {
    config = { "\27LJ\2\n�\2\0\0\6\0\14\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\t\0'\3\a\0'\4\n\0004\5\0\0B\0\5\0016\0\0\0'\2\1\0B\0\2\0029\0\v\0'\2\f\0005\3\r\0B\0\3\1K\0\1\0\1\0\1 prefer_single_line_comments\2\fdefault\23configure_language$<Plug>kommentary_visual_default\6v\"<Plug>kommentary_line_default\6\31\6n\20nvim_set_keymap\bapi\bvim\26use_extended_mappings\22kommentary.config\frequire\0" },
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
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\tinit\flspkind\frequire\0" },
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/lush.nvim",
    url = "https://github.com/rktjmp/lush.nvim"
  },
  ["marks.nvim"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18plugins/marks\frequire\0" },
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/marks.nvim",
    url = "https://github.com/chentau/marks.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n�\1\0\0\b\0\b\2!6\0\0\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20�6\2\1\0009\2\2\0029\2\4\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\5\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\6\2'\5\a\0B\2\3\2\n\2\0\0X\2\2�+\2\1\0X\3\1�+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\1�\tbody\15lsp_expand�\2\0\1\a\3\f\0+-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1!�-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4�-\1\1\0009\1\3\1B\1\1\1X\1\24�-\1\2\0B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\4\1B\1\1\1X\1\16�6\1\5\0009\1\6\0019\1\a\1B\1\1\2\6\1\b\0X\2\b�6\2\5\0009\2\t\0029\2\n\2\18\4\1\0'\5\v\0+\6\2\0B\2\4\1X\2\2�\18\2\0\0B\2\1\1K\0\1\0\0�\1�\2�\6i\18nvim_feedkeys\bapi\5\19copilot#Accept\afn\bvim\rcomplete\19expand_or_jump\31expand_or_locally_jumpable\21select_next_item\fvisible�\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1\r�-\1\1\0009\1\2\1)\3��B\1\2\2\15\0\1\0X\2\5�-\1\1\0009\1\3\1)\3��B\1\2\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\0�\1�\tjump\rjumpable\21select_prev_item\fvisible�\b\1\0\f\0>\0u6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0023\2\3\0009\3\4\0005\5\f\0005\6\n\0006\a\0\0'\t\5\0B\a\2\0029\a\6\a5\t\a\0005\n\b\0=\n\t\tB\a\2\2=\a\v\6=\6\r\0055\6\14\0=\6\15\0055\6\17\0003\a\16\0=\a\18\6=\6\19\0055\6\23\0009\a\20\0009\t\20\0009\t\21\tB\t\1\0025\n\22\0B\a\3\2=\a\24\0069\a\20\0009\t\20\0009\t\25\tB\t\1\0025\n\26\0B\a\3\2=\a\27\0069\a\20\0009\a\28\a)\t��B\a\2\2=\a\29\0069\a\20\0009\a\28\a)\t\4\0B\a\2\2=\a\30\0069\a\20\0005\t \0009\n\20\0009\n\31\nB\n\1\2=\n!\t9\n\20\0009\n\"\nB\n\1\2=\n#\tB\a\2\2=\a$\0069\a\20\0009\t\20\0009\t%\t5\v&\0B\t\2\0025\n'\0B\a\3\2=\a(\0069\a\20\0009\t\20\0009\t%\t5\v)\0B\t\2\0025\n*\0B\a\3\2=\a+\0069\a\20\0009\t\20\0009\t,\tB\t\1\0025\n-\0B\a\3\2=\a.\0069\a\20\0003\t/\0005\n0\0B\a\3\2=\a1\0069\a\20\0003\t2\0005\n3\0B\a\3\2=\a4\6=\6\20\0059\0065\0009\0066\0064\b\5\0005\t7\0>\t\1\b5\t8\0>\t\2\b5\t9\0005\n:\0004\v\0\0=\v;\n=\n<\t>\t\3\b5\t=\0>\t\4\bB\6\2\2=\0066\5B\3\2\0012\0\0�K\0\1\0\1\0\2\rpriority\3\3\tname\rnvim_lsp\voption\23trigger_characters\1\0\1\14all_panes\2\1\0\2\tname\ttmux\rpriority\3\2\1\0\2\rpriority\3\4\tname\fluasnip\1\0\2\rpriority\3\1\tname\vbuffer\fsources\vconfig\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\14<C-Space>\1\3\0\0\6i\6c\rcomplete\n<C-y>\1\3\0\0\6i\6c\1\0\1\vselect\1\t<CR>\1\3\0\0\6i\6c\1\0\1\vselect\1\fconfirm\n<C-e>\6c\nclose\6i\1\0\0\nabort\n<C-u>\n<C-d>\16scroll_docs\n<C-n>\1\3\0\0\6i\6c\21select_next_item\n<C-p>\1\0\0\1\3\0\0\6i\6c\21select_prev_item\fmapping\fsnippet\vexpand\1\0\0\0\18documentation\1\0\1\vborder\frounded\15formatting\1\0\0\vformat\1\0\0\tmenu\1\0\6\rnvim_lsp\n[LSP]\ttmux\v[Tmux]\tpath\v[Path]\fluasnip\14[LuaSnip]\rnvim_lua\n[Lua]\vbuffer\r[Buffer]\1\0\1\14with_text\2\15cmp_format\flspkind\nsetup\0\fluasnip\bcmp\frequire\0" },
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins/nvim-dap\frequire\0" },
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-go"] = {
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24plugins/nvim-dap-go\frequire\0" },
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/nvim-dap-go",
    url = "https://github.com/leoluz/nvim-dap-go"
  },
  ["nvim-dap-virtual-text"] = {
    config = { "\27LJ\2\nU\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\14commented\2\nsetup\26nvim-dap-virtual-text\frequire\0" },
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text",
    url = "https://github.com/theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-lsp-ts-utils"] = {
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/nvim-lsp-ts-utils",
    url = "https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n�\6\0\0\6\0\28\0D6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0029\0\3\0\18\1\0\0'\3\4\0'\4\5\0'\5\6\0B\1\4\1\18\1\0\0'\3\a\0'\4\b\0'\5\t\0B\1\4\1\18\1\0\0'\3\4\0'\4\n\0'\5\v\0B\1\4\1\18\1\0\0'\3\4\0'\4\f\0'\5\r\0B\1\4\1\18\1\0\0'\3\4\0'\4\14\0'\5\15\0B\1\4\1\18\1\0\0'\3\4\0'\4\16\0'\5\17\0B\1\4\1\18\1\0\0'\3\4\0'\4\18\0'\5\19\0B\1\4\1\18\1\0\0'\3\4\0'\4\20\0'\5\21\0B\1\4\1\18\1\0\0'\3\4\0'\4\22\0'\5\23\0B\1\4\1\18\1\0\0'\3\4\0'\4\24\0'\5\25\0B\1\4\1\18\1\0\0'\3\4\0'\4\26\0'\5\25\0B\1\4\1\18\1\0\0'\3\4\0'\4\27\0'\5\25\0B\1\4\1K\0\1\0\bgwl\bgwr4<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>\bgwa0<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>\a]d0<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>\a[d&<Cmd>lua vim.lsp.buf.rename()<CR>\arn*<Cmd>lua vim.lsp.buf.formatting()<CR>\agf/<Cmd>lua vim.lsp.buf.type_definition()<CR>\b1gd*<cmd>lua vim.lsp.buf.references()<CR>\agr+<cmd>lua vim.lsp.buf.declaration()<CR>\agD.<Cmd>lua vim.lsp.buf.signature_help()<CR>\n<C-k>\6i%<Cmd>lua vim.lsp.buf.hover()<CR>\6K\6n\bmap\20lsjostrom.utils\25lsjostrom.lsp-config\frequire\0" },
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n�\1\0\0\3\0\b\0\f6\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0'\1\5\0=\1\4\0006\0\2\0009\0\3\0'\1\a\0=\1\6\0K\0\1\0\31nvim_treesitter#foldexpr()\rfoldexpr\texpr\15foldmethod\awo\bvim\25lsjostrom.treesitter\frequire\0" },
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
  ["stylua-nvim"] = {
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/stylua-nvim",
    url = "https://github.com/ckipp01/stylua-nvim"
  },
  ["telescope-dap.nvim"] = {
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/telescope-dap.nvim",
    url = "https://github.com/nvim-telescope/telescope-dap.nvim"
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
    config = { "\27LJ\2\n�\14\0\0\6\0/\0v6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0029\0\3\0\18\1\0\0'\3\4\0'\4\5\0'\5\6\0B\1\4\1\18\1\0\0'\3\4\0'\4\a\0'\5\b\0B\1\4\1\18\1\0\0'\3\4\0'\4\t\0'\5\b\0B\1\4\1\18\1\0\0'\3\4\0'\4\n\0'\5\v\0B\1\4\1\18\1\0\0'\3\4\0'\4\f\0'\5\r\0B\1\4\1\18\1\0\0'\3\4\0'\4\14\0'\5\15\0B\1\4\1\18\1\0\0'\3\4\0'\4\16\0'\5\17\0B\1\4\1\18\1\0\0'\3\4\0'\4\18\0'\5\19\0B\1\4\1\18\1\0\0'\3\4\0'\4\20\0'\5\21\0B\1\4\1\18\1\0\0'\3\4\0'\4\22\0'\5\23\0B\1\4\1\18\1\0\0'\3\4\0'\4\24\0'\5\25\0B\1\4\1\18\1\0\0'\3\4\0'\4\26\0'\5\27\0B\1\4\1\18\1\0\0'\3\4\0'\4\28\0'\5\29\0B\1\4\1\18\1\0\0'\3\4\0'\4\30\0'\5\31\0B\1\4\1\18\1\0\0'\3\4\0'\4 \0'\5\19\0B\1\4\1\18\1\0\0'\3\4\0'\4!\0'\5\"\0B\1\4\1\18\1\0\0'\3\4\0'\4#\0'\5$\0B\1\4\1\18\1\0\0'\3\4\0'\4%\0'\5&\0B\1\4\1\18\1\0\0'\3\4\0'\4'\0'\5(\0B\1\4\1\18\1\0\0'\3\4\0'\4)\0'\5*\0B\1\4\1\18\1\0\0'\3\4\0'\4+\0'\5,\0B\1\4\1\18\1\0\0'\3\4\0'\4-\0'\5.\0B\1\4\1K\0\1\0A<cmd>lua require(\"telescope\").extensions.dap.variables()<CR>\aDv\28<cmd>:GoBreakToggle<CR>\aDD><cmd>lua require(\"telescope\").extensions.dap.frames()<CR>\aDf@<cmd>lua require(\"telescope\").extensions.dap.commands()<CR>\aDcH<cmd>lua require(\"telescope\").extensions.dap.list_breakpoints()<CR>\aDbI<cmd>lua require(\"telescope.builtin\").lsp_document_diagnostics()<CR>\ageF<cmd>lua require(\"telescope.builtin\").lsp_workspace_symbols()<CR>\ag?\ag/@<cmd>lua require(\"telescope.builtin\").lsp_definitions()<CR>\agd?<cmd>lua require(\"telescope.builtin\").lsp_references()<CR>\agr:<cmd>lua require(\"telescope.builtin\").registers()<CR>\14<leader>p=<cmd>lua require(\"telescope.builtin\").file_browser()<CR>\14<leader>.:<cmd>lua require(\"telescope.builtin\").live_grep()<CR>\14<leader>/;<cmd>lua require(\"telescope.builtin\").treesitter()<CR>\14<leader>tE<cmd>lua require(\"telescope.builtin\").lsp_document_symbols()<CR>\14<leader>s6<cmd>lua require(\"telescope.builtin\").marks()<CR>\14<leader>mA<cmd>lua require(\"telescope.builtin\").lsp_code_actions()<CR>\14<leader>a;<cmd>lua require(\"telescope.builtin\").git_status()<CR>\14<leader>g:<cmd>lua require(\"telescope.builtin\").git_files()<CR>\14<leader>e\f<space>9<cmd>lua require(\"telescope.builtin\").oldfiles()<CR>\14<leader>f8<cmd>lua require(\"telescope.builtin\").buffers()<CR>\14<leader>b\6n\bmap\20lsjostrom.utils\24lsjostrom.telescope\frequire\0" },
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
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tinit\14yaml_nvim\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/opt/yaml.nvim",
    url = "https://github.com/cuducos/yaml.nvim"
  },
  ["zenbones.nvim"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins/zenbones\frequire\0" },
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/zenbones.nvim",
    url = "https://github.com/mcchrish/zenbones.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: marks.nvim
time([[Config for marks.nvim]], true)
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18plugins/marks\frequire\0", "config", "marks.nvim")
time([[Config for marks.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n�\4\0\0\2\0\16\0!6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0005\1\a\0=\1\6\0006\0\0\0009\0\1\0005\1\t\0=\1\b\0006\0\0\0009\0\1\0005\1\v\0=\1\n\0006\0\0\0009\0\1\0+\1\2\0=\1\f\0006\0\0\0009\0\1\0+\1\2\0=\1\r\0006\0\0\0009\0\1\0005\1\15\0=\1\14\0K\0\1\0\1\a\0\0\fIndent1\fIndent2\fIndent3\fIndent4\fIndent5\fIndent6)indent_blankline_char_highlight_list4indent_blankline_show_trailing_blankline_indent-indent_blankline_show_first_indent_level\1\3\0\0\ttext\rmarkdown&indent_blankline_filetype_exclude\1\3\0\0\thelp\rterminal%indent_blankline_buftype_exclude\1\2\0\0\16IndentSpace/indent_blankline_space_char_highlight_list\b⬝ indent_blankline_space_char\b│\26indent_blankline_char\6g\bvim\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: efm-langserver
time([[Config for efm-langserver]], true)
try_loadstring("\27LJ\2\nr\0\0\4\0\a\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0005\2\5\0005\3\4\0=\3\6\2B\0\2\1K\0\1\0\17init_options\1\0\0\1\0\1\23documentFormatting\2\nsetup\befm\14lspconfig\frequire\0", "config", "efm-langserver")
time([[Config for efm-langserver]], false)
-- Config for: nvim-dap-go
time([[Config for nvim-dap-go]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24plugins/nvim-dap-go\frequire\0", "config", "nvim-dap-go")
time([[Config for nvim-dap-go]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n�\1\0\0\b\0\b\2!6\0\0\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20�6\2\1\0009\2\2\0029\2\4\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\5\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\6\2'\5\a\0B\2\3\2\n\2\0\0X\2\2�+\2\1\0X\3\1�+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\1�\tbody\15lsp_expand�\2\0\1\a\3\f\0+-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1!�-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4�-\1\1\0009\1\3\1B\1\1\1X\1\24�-\1\2\0B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\4\1B\1\1\1X\1\16�6\1\5\0009\1\6\0019\1\a\1B\1\1\2\6\1\b\0X\2\b�6\2\5\0009\2\t\0029\2\n\2\18\4\1\0'\5\v\0+\6\2\0B\2\4\1X\2\2�\18\2\0\0B\2\1\1K\0\1\0\0�\1�\2�\6i\18nvim_feedkeys\bapi\5\19copilot#Accept\afn\bvim\rcomplete\19expand_or_jump\31expand_or_locally_jumpable\21select_next_item\fvisible�\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1\r�-\1\1\0009\1\2\1)\3��B\1\2\2\15\0\1\0X\2\5�-\1\1\0009\1\3\1)\3��B\1\2\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\0�\1�\tjump\rjumpable\21select_prev_item\fvisible�\b\1\0\f\0>\0u6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0023\2\3\0009\3\4\0005\5\f\0005\6\n\0006\a\0\0'\t\5\0B\a\2\0029\a\6\a5\t\a\0005\n\b\0=\n\t\tB\a\2\2=\a\v\6=\6\r\0055\6\14\0=\6\15\0055\6\17\0003\a\16\0=\a\18\6=\6\19\0055\6\23\0009\a\20\0009\t\20\0009\t\21\tB\t\1\0025\n\22\0B\a\3\2=\a\24\0069\a\20\0009\t\20\0009\t\25\tB\t\1\0025\n\26\0B\a\3\2=\a\27\0069\a\20\0009\a\28\a)\t��B\a\2\2=\a\29\0069\a\20\0009\a\28\a)\t\4\0B\a\2\2=\a\30\0069\a\20\0005\t \0009\n\20\0009\n\31\nB\n\1\2=\n!\t9\n\20\0009\n\"\nB\n\1\2=\n#\tB\a\2\2=\a$\0069\a\20\0009\t\20\0009\t%\t5\v&\0B\t\2\0025\n'\0B\a\3\2=\a(\0069\a\20\0009\t\20\0009\t%\t5\v)\0B\t\2\0025\n*\0B\a\3\2=\a+\0069\a\20\0009\t\20\0009\t,\tB\t\1\0025\n-\0B\a\3\2=\a.\0069\a\20\0003\t/\0005\n0\0B\a\3\2=\a1\0069\a\20\0003\t2\0005\n3\0B\a\3\2=\a4\6=\6\20\0059\0065\0009\0066\0064\b\5\0005\t7\0>\t\1\b5\t8\0>\t\2\b5\t9\0005\n:\0004\v\0\0=\v;\n=\n<\t>\t\3\b5\t=\0>\t\4\bB\6\2\2=\0066\5B\3\2\0012\0\0�K\0\1\0\1\0\2\rpriority\3\3\tname\rnvim_lsp\voption\23trigger_characters\1\0\1\14all_panes\2\1\0\2\tname\ttmux\rpriority\3\2\1\0\2\rpriority\3\4\tname\fluasnip\1\0\2\rpriority\3\1\tname\vbuffer\fsources\vconfig\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\14<C-Space>\1\3\0\0\6i\6c\rcomplete\n<C-y>\1\3\0\0\6i\6c\1\0\1\vselect\1\t<CR>\1\3\0\0\6i\6c\1\0\1\vselect\1\fconfirm\n<C-e>\6c\nclose\6i\1\0\0\nabort\n<C-u>\n<C-d>\16scroll_docs\n<C-n>\1\3\0\0\6i\6c\21select_next_item\n<C-p>\1\0\0\1\3\0\0\6i\6c\21select_prev_item\fmapping\fsnippet\vexpand\1\0\0\0\18documentation\1\0\1\vborder\frounded\15formatting\1\0\0\vformat\1\0\0\tmenu\1\0\6\rnvim_lsp\n[LSP]\ttmux\v[Tmux]\tpath\v[Path]\fluasnip\14[LuaSnip]\rnvim_lua\n[Lua]\vbuffer\r[Buffer]\1\0\1\14with_text\2\15cmp_format\flspkind\nsetup\0\fluasnip\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: kommentary
time([[Config for kommentary]], true)
try_loadstring("\27LJ\2\n�\2\0\0\6\0\14\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\t\0'\3\a\0'\4\n\0004\5\0\0B\0\5\0016\0\0\0'\2\1\0B\0\2\0029\0\v\0'\2\f\0005\3\r\0B\0\3\1K\0\1\0\1\0\1 prefer_single_line_comments\2\fdefault\23configure_language$<Plug>kommentary_visual_default\6v\"<Plug>kommentary_line_default\6\31\6n\20nvim_set_keymap\bapi\bvim\26use_extended_mappings\22kommentary.config\frequire\0", "config", "kommentary")
time([[Config for kommentary]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n�\6\0\0\6\0\28\0D6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0029\0\3\0\18\1\0\0'\3\4\0'\4\5\0'\5\6\0B\1\4\1\18\1\0\0'\3\a\0'\4\b\0'\5\t\0B\1\4\1\18\1\0\0'\3\4\0'\4\n\0'\5\v\0B\1\4\1\18\1\0\0'\3\4\0'\4\f\0'\5\r\0B\1\4\1\18\1\0\0'\3\4\0'\4\14\0'\5\15\0B\1\4\1\18\1\0\0'\3\4\0'\4\16\0'\5\17\0B\1\4\1\18\1\0\0'\3\4\0'\4\18\0'\5\19\0B\1\4\1\18\1\0\0'\3\4\0'\4\20\0'\5\21\0B\1\4\1\18\1\0\0'\3\4\0'\4\22\0'\5\23\0B\1\4\1\18\1\0\0'\3\4\0'\4\24\0'\5\25\0B\1\4\1\18\1\0\0'\3\4\0'\4\26\0'\5\25\0B\1\4\1\18\1\0\0'\3\4\0'\4\27\0'\5\25\0B\1\4\1K\0\1\0\bgwl\bgwr4<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>\bgwa0<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>\a]d0<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>\a[d&<Cmd>lua vim.lsp.buf.rename()<CR>\arn*<Cmd>lua vim.lsp.buf.formatting()<CR>\agf/<Cmd>lua vim.lsp.buf.type_definition()<CR>\b1gd*<cmd>lua vim.lsp.buf.references()<CR>\agr+<cmd>lua vim.lsp.buf.declaration()<CR>\agD.<Cmd>lua vim.lsp.buf.signature_help()<CR>\n<C-k>\6i%<Cmd>lua vim.lsp.buf.hover()<CR>\6K\6n\bmap\20lsjostrom.utils\25lsjostrom.lsp-config\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\nM\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14lazy_load luasnip/loaders/from_vscode\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins/nvim-dap\frequire\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n�\14\0\0\6\0/\0v6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0029\0\3\0\18\1\0\0'\3\4\0'\4\5\0'\5\6\0B\1\4\1\18\1\0\0'\3\4\0'\4\a\0'\5\b\0B\1\4\1\18\1\0\0'\3\4\0'\4\t\0'\5\b\0B\1\4\1\18\1\0\0'\3\4\0'\4\n\0'\5\v\0B\1\4\1\18\1\0\0'\3\4\0'\4\f\0'\5\r\0B\1\4\1\18\1\0\0'\3\4\0'\4\14\0'\5\15\0B\1\4\1\18\1\0\0'\3\4\0'\4\16\0'\5\17\0B\1\4\1\18\1\0\0'\3\4\0'\4\18\0'\5\19\0B\1\4\1\18\1\0\0'\3\4\0'\4\20\0'\5\21\0B\1\4\1\18\1\0\0'\3\4\0'\4\22\0'\5\23\0B\1\4\1\18\1\0\0'\3\4\0'\4\24\0'\5\25\0B\1\4\1\18\1\0\0'\3\4\0'\4\26\0'\5\27\0B\1\4\1\18\1\0\0'\3\4\0'\4\28\0'\5\29\0B\1\4\1\18\1\0\0'\3\4\0'\4\30\0'\5\31\0B\1\4\1\18\1\0\0'\3\4\0'\4 \0'\5\19\0B\1\4\1\18\1\0\0'\3\4\0'\4!\0'\5\"\0B\1\4\1\18\1\0\0'\3\4\0'\4#\0'\5$\0B\1\4\1\18\1\0\0'\3\4\0'\4%\0'\5&\0B\1\4\1\18\1\0\0'\3\4\0'\4'\0'\5(\0B\1\4\1\18\1\0\0'\3\4\0'\4)\0'\5*\0B\1\4\1\18\1\0\0'\3\4\0'\4+\0'\5,\0B\1\4\1\18\1\0\0'\3\4\0'\4-\0'\5.\0B\1\4\1K\0\1\0A<cmd>lua require(\"telescope\").extensions.dap.variables()<CR>\aDv\28<cmd>:GoBreakToggle<CR>\aDD><cmd>lua require(\"telescope\").extensions.dap.frames()<CR>\aDf@<cmd>lua require(\"telescope\").extensions.dap.commands()<CR>\aDcH<cmd>lua require(\"telescope\").extensions.dap.list_breakpoints()<CR>\aDbI<cmd>lua require(\"telescope.builtin\").lsp_document_diagnostics()<CR>\ageF<cmd>lua require(\"telescope.builtin\").lsp_workspace_symbols()<CR>\ag?\ag/@<cmd>lua require(\"telescope.builtin\").lsp_definitions()<CR>\agd?<cmd>lua require(\"telescope.builtin\").lsp_references()<CR>\agr:<cmd>lua require(\"telescope.builtin\").registers()<CR>\14<leader>p=<cmd>lua require(\"telescope.builtin\").file_browser()<CR>\14<leader>.:<cmd>lua require(\"telescope.builtin\").live_grep()<CR>\14<leader>/;<cmd>lua require(\"telescope.builtin\").treesitter()<CR>\14<leader>tE<cmd>lua require(\"telescope.builtin\").lsp_document_symbols()<CR>\14<leader>s6<cmd>lua require(\"telescope.builtin\").marks()<CR>\14<leader>mA<cmd>lua require(\"telescope.builtin\").lsp_code_actions()<CR>\14<leader>a;<cmd>lua require(\"telescope.builtin\").git_status()<CR>\14<leader>g:<cmd>lua require(\"telescope.builtin\").git_files()<CR>\14<leader>e\f<space>9<cmd>lua require(\"telescope.builtin\").oldfiles()<CR>\14<leader>f8<cmd>lua require(\"telescope.builtin\").buffers()<CR>\14<leader>b\6n\bmap\20lsjostrom.utils\24lsjostrom.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: zenbones.nvim
time([[Config for zenbones.nvim]], true)
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins/zenbones\frequire\0", "config", "zenbones.nvim")
time([[Config for zenbones.nvim]], false)
-- Config for: nvim-dap-virtual-text
time([[Config for nvim-dap-virtual-text]], true)
try_loadstring("\27LJ\2\nU\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\14commented\2\nsetup\26nvim-dap-virtual-text\frequire\0", "config", "nvim-dap-virtual-text")
time([[Config for nvim-dap-virtual-text]], false)
-- Config for: lspkind-nvim
time([[Config for lspkind-nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\tinit\flspkind\frequire\0", "config", "lspkind-nvim")
time([[Config for lspkind-nvim]], false)
-- Config for: go.nvim
time([[Config for go.nvim]], true)
try_loadstring("\27LJ\2\n�\2\0\0\3\0\t\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0'\2\6\0B\0\2\0016\0\4\0009\0\5\0'\2\a\0B\0\2\0016\0\4\0009\0\5\0'\2\b\0B\0\2\1K\0\1\0Yautocmd BufWritePre (InsertLeave?) <buffer> lua vim.lsp.buf.formatting_sync(nil,500)Gautocmd BufWritePre *.go :silent! lua require('go.format').gofmt()Lautocmd FileType go nmap <Leader>c :lua require('go.comment').gen()<cr>\bcmd\bvim\1\0\1\24comment_placeholder\5\nsetup\ago\frequire\0", "config", "go.nvim")
time([[Config for go.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n�\1\0\0\3\0\b\0\f6\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0'\1\5\0=\1\4\0006\0\2\0009\0\3\0'\1\a\0=\1\6\0K\0\1\0\31nvim_treesitter#foldexpr()\rfoldexpr\texpr\15foldmethod\awo\bvim\25lsjostrom.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n�\4\0\0\5\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\0035\4\a\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\3=\3\15\2B\0\2\1K\0\1\0\nsigns\17changedelete\1\0\4\ahl\19GitSignsChange\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ttext\6~\14topdelete\1\0\4\ahl\19GitSignsDelete\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ttext\b▘\vdelete\1\0\4\ahl\19GitSignsDelete\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ttext\b▖\vchange\1\0\4\ahl\19GitSignsChange\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ttext\b▌\badd\1\0\0\1\0\4\ahl\16GitSignsAdd\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\ttext\b▌\1\0\1\nnumhl\2\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
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
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end