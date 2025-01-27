require('mini.ai').setup()
require('mini.align').setup()
require('mini.bracketed').setup()
require('mini.bufremove').setup()
require('mini.comment').setup()
require('mini.diff').setup()
require('mini.extra').setup()
require('mini.files').setup()
require('mini.icons').setup()
require('mini.jump').setup()
require('mini.surround').setup()
require('mini.splitjoin').setup()
require('mini.trailspace').setup()
require('mini.visits').setup()

require('mini.cursorword').setup({
  delay = 800
})

local hipatterns = require('mini.hipatterns')
hipatterns.setup({
  highlighters = {
    -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
    fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
    hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
    todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
    note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
    hex_color = hipatterns.gen_highlighter.hex_color(),
  }
})

local indentscope = require('mini.indentscope')
indentscope.setup({
  draw = {
    delay = 10,
    animation = indentscope.gen_animation.none(),
  },
  symbol = '│',
})

require('mini.jump2d').setup({
  mappings = { start_jumping = 'gw' }
})

local picker_win_config = function()
  local height = vim.o.lines - 8
  local width = 80
  return {
    border = 'rounded',
    anchor = 'NW',
    height = height,
    width = width,
    row = 2,
    col = 5,
  }
end

require('mini.pick').setup({
  mappings = {
    move_down      = '<tab>',
    move_up        = '<S-tab>',
    toggle_info    = '<C-k>',
    toggle_preview = '<C-p>',
  },
  options = { use_cache = true },
  window = {
    config = picker_win_config,
  },
})

local MiniPick = require('mini.pick')
MiniPick.registry.projects = function(local_opts)
  local root = vim.fn.expand("~/src")

  local command = {
    "fd",
    "--max-depth=8",
    "--one-file-system",
    "--unrestricted",
    "--full-path",
    "/.jj/repo/store/type$|/.git/HEAD$",
    root,
  }

  local postprocess = function(paths)
    local result = {}
    local seen = {}
    for _, path in ipairs(paths) do
      path = path:gsub("%/.jj/repo/store/type$", "")
      path = path:gsub("%/.git/HEAD$", "")
      if not seen[path] then
        local item = {
          path = path,
          text = path:gsub("%" .. root .. "/", " "),
        }
        table.insert(result, item)
        seen[path] = true
      end
    end
    return result
  end

  local choose = function(item)
    local_opts.cwd = item.path
    vim.fn.chdir(item.path)
    vim.schedule(function()
      MiniPick.builtin.files(local_opts, { source = { cwd = item.path, tool = "rg" } })
    end)
  end

  return MiniPick.builtin.cli({ command = command, postprocess = postprocess }, { source = { choose = choose } })
end

MiniPick.registry.files_root = function(local_opts)
  local root_patterns = { ".jj", ".git" }
  local root_dir = vim.fs.dirname(vim.fs.find(root_patterns, { upward = true })[1])
  local_opts.cwd = root_dir
  local_opts.tool = "rg"
  return MiniPick.builtin.files(local_opts, { source = { cwd = root_dir, tool = "rg" } })
end

MiniPick.registry.grep_live_root = function(local_opts)
  local root_patterns = { ".jj", ".git" }
  local root_dir = vim.fs.dirname(vim.fs.find(root_patterns, { upward = true })[1])
  local_opts.cwd = root_dir
  return MiniPick.builtin.grep_live(local_opts, { source = { cwd = root_dir } })
end

require("mini.pick").registry.buffers = function(local_opts, opts)
  local_opts = vim.tbl_deep_extend(
    "force",
    { sort_lastused = false, sort_mru = true, include_current = true, include_unlisted = false },
    local_opts or {}
  )
  local buffers_output = vim.api.nvim_exec("buffers" .. (local_opts.include_unlisted and "!" or ""), true)
  local cur_buf_id, include_current = vim.api.nvim_get_current_buf(), local_opts.include_current
  local items = {}
  local default_selection_idx = 1
  for _, l in ipairs(vim.split(buffers_output, "\n")) do
    local buf_str, name = l:match("^%s*%d+"), l:match('"(.*)"')
    local buf_id = tonumber(buf_str)
    local flag = buf_id == vim.fn.bufnr("") and "%" or (buf_id == vim.fn.bufnr("#") and "#" or " ")
    local item = { text = name, bufnr = buf_id, flag = flag }
    if buf_id ~= cur_buf_id or include_current then
      if local_opts.sort_lastused and not local_opts.ignore_current_buffer and flag == "#" then
        default_selection_idx = 2
      end
      if local_opts.sort_lastused and (flag == "#" or flag == "%") then
        local idx = ((items[1] ~= nil and items[1].flag == "%") and 2 or 1)
        table.insert(items, idx, item)
      else
        table.insert(items, item)
      end
    end
  end
  if local_opts.sort_mru then
    table.sort(items, function(a, b)
      return vim.fn.getbufinfo(a.bufnr)[1].lastused > vim.fn.getbufinfo(b.bufnr)[1].lastused
    end)
  end

  local show = function(buf_id, items, query)
    require("mini.pick").default_show(buf_id, items, query, { show_icons = true })
  end
  local default_opts = { source = { name = "Buffers", show = show } }
  opts = vim.tbl_deep_extend("force", default_opts, opts or {}, { source = { items = items } })
  if default_selection_idx > 1 then
    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniPickStart",
      once = true,
      callback = function()
        local mappings = require("mini.pick").get_picker_opts().mappings
        local keys = vim.fn["repeat"](mappings.move_down, default_selection_idx - 1)
        vim.api.nvim_input(vim.api.nvim_replace_termcodes(keys, true, true, true))
      end,
    })
  end
  return require("mini.pick").start(opts)
end

local miniclue = require('mini.clue')
miniclue.setup({ -- cute prompts about bindings
  triggers = {
    { mode = 'n', keys = '<Leader>' },
    { mode = 'x', keys = '<Leader>' },
    { mode = 'n', keys = '<space>' },
    { mode = 'x', keys = '<space>' },

    -- Built-in completion
    { mode = 'i', keys = '<C-x>' },

    -- `g` key
    { mode = 'n', keys = 'g' },
    { mode = 'x', keys = 'g' },

    -- Marks
    { mode = 'n', keys = "'" },
    { mode = 'n', keys = '`' },
    { mode = 'x', keys = "'" },
    { mode = 'x', keys = '`' },

    -- Registers
    { mode = 'n', keys = '"' },
    { mode = 'x', keys = '"' },
    { mode = 'i', keys = '<C-r>' },
    { mode = 'c', keys = '<C-r>' },

    -- Window commands
    { mode = 'n', keys = '<C-w>' },

    -- `z` key
    { mode = 'n', keys = 'z' },
    { mode = 'x', keys = 'z' },

    -- Bracketed
    { mode = 'n', keys = '[' },
    { mode = 'n', keys = ']' },
  },
  clues = {
    miniclue.gen_clues.builtin_completion(),
    miniclue.gen_clues.g(),
    miniclue.gen_clues.marks(),
    miniclue.gen_clues.registers(),
    miniclue.gen_clues.windows(),
    miniclue.gen_clues.z(),
  },
  window = {
    delay = 0,
    config = {
      border = 'rounded',
      width = 'auto',
    },
  }
})

local notify_win_config = function()
  local has_statusline = vim.o.laststatus > 0
  local pad = vim.o.cmdheight + (has_statusline and 1 or 0)
  return { anchor = 'SE', border = 'rounded', col = vim.o.columns, row = vim.o.lines - pad }
end
require('mini.notify').setup({
  window = {
    config = notify_win_config,
    winblend = 0,
  },
})

require('mini.starter').setup({
  header =
  [[
████████▄             ▄▄                      ▒▒
██     ▀██            ██
██     ▄██ ▄██████▄ ██████ ▄██████▄  ▄████▄██ ██ ▄██████▄
████████▀  ▀▀    ██   ██   ▀▀    ██ ██▀   ▀██ ██ ▀▀    ██
██         ▄███████   ██   ▄███████ ██     ██ ██ ▄███████
██         ██    ██   ██   ██    ██ ██▄   ▄██ ██ ██    ██
██         ▀████▀██   ▀███ ▀████▀██  ▀████▀██ ██ ▀████▀██
                                    ▄▄     ██
                                    ▀██████▀ ]]
})
