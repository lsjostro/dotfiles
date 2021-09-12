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
  local success, result = pcall(loadstring(s))
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
  ["colorbuddy.vim"] = {
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/colorbuddy.vim"
  },
  ["folding-nvim"] = {
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/folding-nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nú\4\0\0\5\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\0035\4\a\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\3=\3\15\2B\0\2\1K\0\1\0\nsigns\17changedelete\1\0\4\ttext\6~\ahl\19GitSignsChange\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\14topdelete\1\0\4\ttext\b‚ñò\ahl\19GitSignsDelete\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\vdelete\1\0\4\ttext\b‚ññ\ahl\19GitSignsDelete\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\vchange\1\0\4\ttext\b‚ñå\ahl\19GitSignsChange\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\badd\1\0\0\1\0\4\ttext\b‚ñå\ahl\16GitSignsAdd\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\1\0\1\nnumhl\2\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["go.nvim"] = {
    config = { "\27LJ\2\n‰\2\0\0\3\0\t\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0'\2\6\0B\0\2\0016\0\4\0009\0\5\0'\2\a\0B\0\2\0016\0\4\0009\0\5\0'\2\b\0B\0\2\1K\0\1\0Yautocmd BufWritePre (InsertLeave?) <buffer> lua vim.lsp.buf.formatting_sync(nil,500)Gautocmd BufWritePre *.go :silent! lua require('go.format').gofmt()Lautocmd FileType go nmap <Leader>c :lua require('go.comment').gen()<cr>\bcmd\bvim\1\0\1\24comment_placeholder\5\nsetup\ago\frequire\0" },
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/go.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nü\4\0\0\2\0\16\0!6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0005\1\a\0=\1\6\0006\0\0\0009\0\1\0005\1\t\0=\1\b\0006\0\0\0009\0\1\0005\1\v\0=\1\n\0006\0\0\0009\0\1\0+\1\2\0=\1\f\0006\0\0\0009\0\1\0+\1\2\0=\1\r\0006\0\0\0009\0\1\0005\1\15\0=\1\14\0K\0\1\0\1\a\0\0\fIndent1\fIndent2\fIndent3\fIndent4\fIndent5\fIndent6)indent_blankline_char_highlight_list4indent_blankline_show_trailing_blankline_indent-indent_blankline_show_first_indent_level\1\3\0\0\ttext\rmarkdown&indent_blankline_filetype_exclude\1\3\0\0\thelp\rterminal%indent_blankline_buftype_exclude\1\2\0\0\16IndentSpace/indent_blankline_space_char_highlight_list\b‚¨ù indent_blankline_space_char\b‚îÇ\26indent_blankline_char\6g\bvim\0" },
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  kommentary = {
    config = { "\27LJ\2\n¬\2\0\0\6\0\14\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\t\0'\3\a\0'\4\n\0004\5\0\0B\0\5\0016\0\0\0'\2\1\0B\0\2\0029\0\v\0'\2\f\0005\3\r\0B\0\3\1K\0\1\0\1\0\1 prefer_single_line_comments\2\fdefault\23configure_language$<Plug>kommentary_visual_default\6v\"<Plug>kommentary_line_default\6\31\6n\20nvim_set_keymap\bapi\bvim\26use_extended_mappings\22kommentary.config\frequire\0" },
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\tinit\flspkind\frequire\0" },
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\2\n}\0\1\6\0\a\0\22)\1\0\0\2\0\1\0X\1\17Ä6\1\0\0009\1\1\0019\1\2\1'\3\3\0B\1\2\2\18\3\1\0009\1\4\1\18\4\0\0\18\5\0\0B\1\4\2\18\3\1\0009\1\5\1'\4\6\0B\1\3\2X\2\3Ä+\1\1\0X\2\1Ä+\1\2\0L\1\2\0\a%s\nmatch\bsub\6.\fgetline\afn\bvimn\1\0\5\0\5\1\0223\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0B\1\2\2\23\1\0\1\18\2\0\0\18\4\1\0B\2\2\2\15\0\2\0X\3\aÄ\18\2\0\0\23\4\0\1B\2\2\2\15\0\2\0X\3\2Ä+\2\2\0X\3\1Ä+\2\1\0002\0\0ÄL\2\2\0\6.\bcol\afn\bvim\0\2ú\1\0\2\5\2\5\1\0256\2\0\0009\2\1\0029\2\2\2B\2\1\2\t\2\0\0X\2\5Ä-\2\0\0009\2\3\2\18\4\0\0D\2\2\0X\2\rÄ-\2\1\0B\2\1\2\15\0\2\0X\3\5Ä-\2\0\0009\2\3\2\18\4\1\0D\2\2\0X\2\4Ä6\2\0\0009\2\1\0029\2\4\2D\2\1\0K\0\1\0\0¿\1¿\19compe#complete\15term_codes\15pumvisible\afn\bvim\2±\3\1\0\a\0\23\0*6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\0016\0\0\0'\2\6\0B\0\2\0023\1\a\0006\2\b\0003\3\n\0=\3\t\0029\2\v\0'\4\f\0'\5\r\0'\6\14\0B\2\4\0019\2\v\0'\4\f\0'\5\15\0'\6\14\0B\2\4\0019\2\v\0'\4\f\0'\5\16\0'\6\17\0B\2\4\0019\2\v\0'\4\18\0'\5\19\0'\6\20\0B\2\4\0019\2\v\0'\4\f\0'\5\21\0'\6\22\0B\2\4\0012\0\0ÄK\0\1\0\25compe#close('<C-e>')\n<C-e>\26compe:#confirm('<CR')\t<CR>\6x%v:lua.complete('<C-p>', '<C-h>')\f<S-Tab>\n<Tab>%v:lua.complete('<C-n>', '<Tab>')\14<C-Space>\ais\tmapx\0\rcomplete\a_G\0\20lsjostrom.utils\vsource\1\0\3\vbuffer\2\rnvim_lua\2\rnvim_lsp\2\1\0\1\15min_length\3\0\nsetup\ncompe\frequire\0" },
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lsp-ts-utils"] = {
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\né\5\0\0\6\0\24\0:6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0029\0\3\0\18\1\0\0'\3\4\0'\4\5\0'\5\6\0B\1\4\1\18\1\0\0'\3\a\0'\4\b\0'\5\t\0B\1\4\1\18\1\0\0'\3\4\0'\4\n\0'\5\v\0B\1\4\1\18\1\0\0'\3\4\0'\4\f\0'\5\r\0B\1\4\1\18\1\0\0'\3\4\0'\4\14\0'\5\15\0B\1\4\1\18\1\0\0'\3\4\0'\4\16\0'\5\17\0B\1\4\1\18\1\0\0'\3\4\0'\4\18\0'\5\19\0B\1\4\1\18\1\0\0'\3\4\0'\4\20\0'\5\21\0B\1\4\1\18\1\0\0'\3\4\0'\4\22\0'\5\21\0B\1\4\1\18\1\0\0'\3\4\0'\4\23\0'\5\21\0B\1\4\1K\0\1\0\bgwl\bgwr4<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>\bgwa0<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>\a]d0<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>\a[d&<Cmd>lua vim.lsp.buf.rename()<CR>\arn*<Cmd>lua vim.lsp.buf.formatting()<CR>\agf/<Cmd>lua vim.lsp.buf.type_definition()<CR>\b1gd.<Cmd>lua vim.lsp.buf.signature_help()<CR>\n<C-k>\6i%<Cmd>lua vim.lsp.buf.hover()<CR>\6K\6n\bmap\20lsjostrom.utils\25lsjostrom.lsp-config\frequire\0" },
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-shelman-theme"] = {
    config = { "\27LJ\2\nP\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\18shelman-light\16colorscheme\15colorbuddy\frequire\0" },
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/nvim-shelman-theme"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nè\1\0\0\3\0\b\0\f6\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0'\1\5\0=\1\4\0006\0\2\0009\0\3\0'\1\a\0=\1\6\0K\0\1\0\31nvim_treesitter#foldexpr()\rfoldexpr\texpr\15foldmethod\awo\bvim\25lsjostrom.treesitter\frequire\0" },
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope-github.nvim"] = {
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/telescope-github.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n¬\n\0\0\6\0#\0X6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0029\0\3\0\18\1\0\0'\3\4\0'\4\5\0'\5\6\0B\1\4\1\18\1\0\0'\3\4\0'\4\a\0'\5\b\0B\1\4\1\18\1\0\0'\3\4\0'\4\t\0'\5\b\0B\1\4\1\18\1\0\0'\3\4\0'\4\n\0'\5\v\0B\1\4\1\18\1\0\0'\3\4\0'\4\f\0'\5\r\0B\1\4\1\18\1\0\0'\3\4\0'\4\14\0'\5\15\0B\1\4\1\18\1\0\0'\3\4\0'\4\16\0'\5\17\0B\1\4\1\18\1\0\0'\3\4\0'\4\18\0'\5\19\0B\1\4\1\18\1\0\0'\3\4\0'\4\20\0'\5\21\0B\1\4\1\18\1\0\0'\3\4\0'\4\22\0'\5\23\0B\1\4\1\18\1\0\0'\3\4\0'\4\24\0'\5\25\0B\1\4\1\18\1\0\0'\3\4\0'\4\26\0'\5\27\0B\1\4\1\18\1\0\0'\3\4\0'\4\28\0'\5\29\0B\1\4\1\18\1\0\0'\3\4\0'\4\30\0'\5\17\0B\1\4\1\18\1\0\0'\3\4\0'\4\31\0'\5 \0B\1\4\1\18\1\0\0'\3\4\0'\4!\0'\5\"\0B\1\4\1K\0\1\0I<cmd>lua require(\"telescope.builtin\").lsp_document_diagnostics()<CR>\ageF<cmd>lua require(\"telescope.builtin\").lsp_workspace_symbols()<CR>\ag?\ag/@<cmd>lua require(\"telescope.builtin\").lsp_definitions()<CR>\agd?<cmd>lua require(\"telescope.builtin\").lsp_references()<CR>\agr:<cmd>lua require(\"telescope.builtin\").registers()<CR>\14<leader>p=<cmd>lua require(\"telescope.builtin\").file_browser()<CR>\14<leader>.:<cmd>lua require(\"telescope.builtin\").live_grep()<CR>\14<leader>/;<cmd>lua require(\"telescope.builtin\").treesitter()<CR>\14<leader>tE<cmd>lua require(\"telescope.builtin\").lsp_document_symbols()<CR>\14<leader>sA<cmd>lua require(\"telescope.builtin\").lsp_code_actions()<CR>\14<leader>a;<cmd>lua require(\"telescope.builtin\").git_status()<CR>\14<leader>g:<cmd>lua require(\"telescope.builtin\").git_files()<CR>\14<leader>e\f<space>9<cmd>lua require(\"telescope.builtin\").oldfiles()<CR>\14<leader>f8<cmd>lua require(\"telescope.builtin\").buffers()<CR>\14<leader>b\6n\bmap\20lsjostrom.utils\24lsjostrom.telescope\frequire\0" },
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-terraform"] = {
    loaded = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/start/vim-terraform"
  },
  ["yaml.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tinit\14yaml_nvim\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/lsjostrom/.local/share/nvim/site/pack/packer/opt/yaml.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nè\1\0\0\3\0\b\0\f6\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0'\1\5\0=\1\4\0006\0\2\0009\0\3\0'\1\a\0=\1\6\0K\0\1\0\31nvim_treesitter#foldexpr()\rfoldexpr\texpr\15foldmethod\awo\bvim\25lsjostrom.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: lspkind-nvim
time([[Config for lspkind-nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\tinit\flspkind\frequire\0", "config", "lspkind-nvim")
time([[Config for lspkind-nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\nú\4\0\0\5\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\0035\4\a\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\3=\3\15\2B\0\2\1K\0\1\0\nsigns\17changedelete\1\0\4\ttext\6~\ahl\19GitSignsChange\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\14topdelete\1\0\4\ttext\b‚ñò\ahl\19GitSignsDelete\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\vdelete\1\0\4\ttext\b‚ññ\ahl\19GitSignsDelete\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\vchange\1\0\4\ttext\b‚ñå\ahl\19GitSignsChange\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\badd\1\0\0\1\0\4\ttext\b‚ñå\ahl\16GitSignsAdd\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\1\0\1\nnumhl\2\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-compe
time([[Config for nvim-compe]], true)
try_loadstring("\27LJ\2\n}\0\1\6\0\a\0\22)\1\0\0\2\0\1\0X\1\17Ä6\1\0\0009\1\1\0019\1\2\1'\3\3\0B\1\2\2\18\3\1\0009\1\4\1\18\4\0\0\18\5\0\0B\1\4\2\18\3\1\0009\1\5\1'\4\6\0B\1\3\2X\2\3Ä+\1\1\0X\2\1Ä+\1\2\0L\1\2\0\a%s\nmatch\bsub\6.\fgetline\afn\bvimn\1\0\5\0\5\1\0223\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0B\1\2\2\23\1\0\1\18\2\0\0\18\4\1\0B\2\2\2\15\0\2\0X\3\aÄ\18\2\0\0\23\4\0\1B\2\2\2\15\0\2\0X\3\2Ä+\2\2\0X\3\1Ä+\2\1\0002\0\0ÄL\2\2\0\6.\bcol\afn\bvim\0\2ú\1\0\2\5\2\5\1\0256\2\0\0009\2\1\0029\2\2\2B\2\1\2\t\2\0\0X\2\5Ä-\2\0\0009\2\3\2\18\4\0\0D\2\2\0X\2\rÄ-\2\1\0B\2\1\2\15\0\2\0X\3\5Ä-\2\0\0009\2\3\2\18\4\1\0D\2\2\0X\2\4Ä6\2\0\0009\2\1\0029\2\4\2D\2\1\0K\0\1\0\0¿\1¿\19compe#complete\15term_codes\15pumvisible\afn\bvim\2±\3\1\0\a\0\23\0*6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\0016\0\0\0'\2\6\0B\0\2\0023\1\a\0006\2\b\0003\3\n\0=\3\t\0029\2\v\0'\4\f\0'\5\r\0'\6\14\0B\2\4\0019\2\v\0'\4\f\0'\5\15\0'\6\14\0B\2\4\0019\2\v\0'\4\f\0'\5\16\0'\6\17\0B\2\4\0019\2\v\0'\4\18\0'\5\19\0'\6\20\0B\2\4\0019\2\v\0'\4\f\0'\5\21\0'\6\22\0B\2\4\0012\0\0ÄK\0\1\0\25compe#close('<C-e>')\n<C-e>\26compe:#confirm('<CR')\t<CR>\6x%v:lua.complete('<C-p>', '<C-h>')\f<S-Tab>\n<Tab>%v:lua.complete('<C-n>', '<Tab>')\14<C-Space>\ais\tmapx\0\rcomplete\a_G\0\20lsjostrom.utils\vsource\1\0\3\vbuffer\2\rnvim_lua\2\rnvim_lsp\2\1\0\1\15min_length\3\0\nsetup\ncompe\frequire\0", "config", "nvim-compe")
time([[Config for nvim-compe]], false)
-- Config for: go.nvim
time([[Config for go.nvim]], true)
try_loadstring("\27LJ\2\n‰\2\0\0\3\0\t\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0'\2\6\0B\0\2\0016\0\4\0009\0\5\0'\2\a\0B\0\2\0016\0\4\0009\0\5\0'\2\b\0B\0\2\1K\0\1\0Yautocmd BufWritePre (InsertLeave?) <buffer> lua vim.lsp.buf.formatting_sync(nil,500)Gautocmd BufWritePre *.go :silent! lua require('go.format').gofmt()Lautocmd FileType go nmap <Leader>c :lua require('go.comment').gen()<cr>\bcmd\bvim\1\0\1\24comment_placeholder\5\nsetup\ago\frequire\0", "config", "go.nvim")
time([[Config for go.nvim]], false)
-- Config for: kommentary
time([[Config for kommentary]], true)
try_loadstring("\27LJ\2\n¬\2\0\0\6\0\14\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0004\5\0\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\t\0'\3\a\0'\4\n\0004\5\0\0B\0\5\0016\0\0\0'\2\1\0B\0\2\0029\0\v\0'\2\f\0005\3\r\0B\0\3\1K\0\1\0\1\0\1 prefer_single_line_comments\2\fdefault\23configure_language$<Plug>kommentary_visual_default\6v\"<Plug>kommentary_line_default\6\31\6n\20nvim_set_keymap\bapi\bvim\26use_extended_mappings\22kommentary.config\frequire\0", "config", "kommentary")
time([[Config for kommentary]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\né\5\0\0\6\0\24\0:6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0029\0\3\0\18\1\0\0'\3\4\0'\4\5\0'\5\6\0B\1\4\1\18\1\0\0'\3\a\0'\4\b\0'\5\t\0B\1\4\1\18\1\0\0'\3\4\0'\4\n\0'\5\v\0B\1\4\1\18\1\0\0'\3\4\0'\4\f\0'\5\r\0B\1\4\1\18\1\0\0'\3\4\0'\4\14\0'\5\15\0B\1\4\1\18\1\0\0'\3\4\0'\4\16\0'\5\17\0B\1\4\1\18\1\0\0'\3\4\0'\4\18\0'\5\19\0B\1\4\1\18\1\0\0'\3\4\0'\4\20\0'\5\21\0B\1\4\1\18\1\0\0'\3\4\0'\4\22\0'\5\21\0B\1\4\1\18\1\0\0'\3\4\0'\4\23\0'\5\21\0B\1\4\1K\0\1\0\bgwl\bgwr4<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>\bgwa0<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>\a]d0<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>\a[d&<Cmd>lua vim.lsp.buf.rename()<CR>\arn*<Cmd>lua vim.lsp.buf.formatting()<CR>\agf/<Cmd>lua vim.lsp.buf.type_definition()<CR>\b1gd.<Cmd>lua vim.lsp.buf.signature_help()<CR>\n<C-k>\6i%<Cmd>lua vim.lsp.buf.hover()<CR>\6K\6n\bmap\20lsjostrom.utils\25lsjostrom.lsp-config\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nü\4\0\0\2\0\16\0!6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0005\1\a\0=\1\6\0006\0\0\0009\0\1\0005\1\t\0=\1\b\0006\0\0\0009\0\1\0005\1\v\0=\1\n\0006\0\0\0009\0\1\0+\1\2\0=\1\f\0006\0\0\0009\0\1\0+\1\2\0=\1\r\0006\0\0\0009\0\1\0005\1\15\0=\1\14\0K\0\1\0\1\a\0\0\fIndent1\fIndent2\fIndent3\fIndent4\fIndent5\fIndent6)indent_blankline_char_highlight_list4indent_blankline_show_trailing_blankline_indent-indent_blankline_show_first_indent_level\1\3\0\0\ttext\rmarkdown&indent_blankline_filetype_exclude\1\3\0\0\thelp\rterminal%indent_blankline_buftype_exclude\1\2\0\0\16IndentSpace/indent_blankline_space_char_highlight_list\b‚¨ù indent_blankline_space_char\b‚îÇ\26indent_blankline_char\6g\bvim\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n¬\n\0\0\6\0#\0X6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0029\0\3\0\18\1\0\0'\3\4\0'\4\5\0'\5\6\0B\1\4\1\18\1\0\0'\3\4\0'\4\a\0'\5\b\0B\1\4\1\18\1\0\0'\3\4\0'\4\t\0'\5\b\0B\1\4\1\18\1\0\0'\3\4\0'\4\n\0'\5\v\0B\1\4\1\18\1\0\0'\3\4\0'\4\f\0'\5\r\0B\1\4\1\18\1\0\0'\3\4\0'\4\14\0'\5\15\0B\1\4\1\18\1\0\0'\3\4\0'\4\16\0'\5\17\0B\1\4\1\18\1\0\0'\3\4\0'\4\18\0'\5\19\0B\1\4\1\18\1\0\0'\3\4\0'\4\20\0'\5\21\0B\1\4\1\18\1\0\0'\3\4\0'\4\22\0'\5\23\0B\1\4\1\18\1\0\0'\3\4\0'\4\24\0'\5\25\0B\1\4\1\18\1\0\0'\3\4\0'\4\26\0'\5\27\0B\1\4\1\18\1\0\0'\3\4\0'\4\28\0'\5\29\0B\1\4\1\18\1\0\0'\3\4\0'\4\30\0'\5\17\0B\1\4\1\18\1\0\0'\3\4\0'\4\31\0'\5 \0B\1\4\1\18\1\0\0'\3\4\0'\4!\0'\5\"\0B\1\4\1K\0\1\0I<cmd>lua require(\"telescope.builtin\").lsp_document_diagnostics()<CR>\ageF<cmd>lua require(\"telescope.builtin\").lsp_workspace_symbols()<CR>\ag?\ag/@<cmd>lua require(\"telescope.builtin\").lsp_definitions()<CR>\agd?<cmd>lua require(\"telescope.builtin\").lsp_references()<CR>\agr:<cmd>lua require(\"telescope.builtin\").registers()<CR>\14<leader>p=<cmd>lua require(\"telescope.builtin\").file_browser()<CR>\14<leader>.:<cmd>lua require(\"telescope.builtin\").live_grep()<CR>\14<leader>/;<cmd>lua require(\"telescope.builtin\").treesitter()<CR>\14<leader>tE<cmd>lua require(\"telescope.builtin\").lsp_document_symbols()<CR>\14<leader>sA<cmd>lua require(\"telescope.builtin\").lsp_code_actions()<CR>\14<leader>a;<cmd>lua require(\"telescope.builtin\").git_status()<CR>\14<leader>g:<cmd>lua require(\"telescope.builtin\").git_files()<CR>\14<leader>e\f<space>9<cmd>lua require(\"telescope.builtin\").oldfiles()<CR>\14<leader>f8<cmd>lua require(\"telescope.builtin\").buffers()<CR>\14<leader>b\6n\bmap\20lsjostrom.utils\24lsjostrom.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-shelman-theme
time([[Config for nvim-shelman-theme]], true)
try_loadstring("\27LJ\2\nP\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\18shelman-light\16colorscheme\15colorbuddy\frequire\0", "config", "nvim-shelman-theme")
time([[Config for nvim-shelman-theme]], false)
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
