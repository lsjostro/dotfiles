local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux
local dev_server = "lsjostrom-dev"

local function font_with_fallback(name, params)
  local names = { name, "Noto Color Emoji", "Iosevka Nerd Font Mono" }
  return wezterm.font_with_fallback(names, params)
end

wezterm.on('gui-startup', function(cmd)
  local args = {}
  if cmd then
    args = cmd.args
  end

  local _, _, window = mux.spawn_window {
    workspace = 'local',
    args = args,
  }
  window:spawn_tab {}
  window:spawn_tab {}
  window:spawn_tab {}
  window:spawn_tab {}
  window:spawn_tab {}
  window:spawn_tab {}
  window:spawn_tab {}
  window:spawn_tab {}
  window:spawn_tab {}

  mux.spawn_window {
    workspace = dev_server,
    domain = { DomainName = dev_server }
  }

  mux.set_active_workspace 'local'
end)

wezterm.on('mux-startup', function()
  local _, _, window = mux.spawn_window {
    workspace = dev_server,
  }
  window:spawn_tab {}
  window:spawn_tab {}
  window:spawn_tab {}
  window:spawn_tab {}
  window:spawn_tab {}
  window:spawn_tab {}
  window:spawn_tab {}
  window:spawn_tab {}
  window:spawn_tab {}
end)

local function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'dark'
  else
    return 'light'
  end
end

local function set_font_size_by_hostname()
  local hostname = wezterm.hostname()
  if hostname == 'kean' then
    return 16.0
  else
    return 11.0
  end
end


wezterm.on("user-var-changed", function(window, pane, name, value)
  wezterm.log_info("user-var-changed", name, value)

  if name == "nvim_activate" then
    for _, t in ipairs(window:mux_window():tabs_with_info()) do
      for _, p in ipairs(t.tab:panes()) do
        if p:get_title() == "nvim" then
          window:perform_action(act.ActivateTab(t.index), p)
          if t.index > 0 then
            window:perform_action(act.MoveTab(0), p)
          end
        end
      end
    end
  end
end)

local is_server = wezterm.hostname() == dev_server

return {
  color_scheme_dirs = { wezterm.home_dir .. "/src/github.com/shelmangroup/shelman-colors/wezterm" },
  color_scheme = scheme_for_appearance("Dark"),
  font = font_with_fallback("Iosevka Term SS09", { weight = "Regular" }),
  font_rules = {
    {
      italic = false,
      intensity = "Half",
      font = font_with_fallback("Iosevka Term SS09", { weight = "Thin" }),
    },
    {
      italic = true,
      intensity = "Normal",
      font = font_with_fallback("Iosevka Term Curly Slab", { weight = "Light", italic = true }),
    },
    {
      italic = true,
      intensity = "Bold",
      font = font_with_fallback("Iosevka SS15", { weight = "ExtraLight", italic = true }),
    },
    {
      intensity = "Bold",
      font = font_with_fallback("Iosevka Term SS09", { weight = "DemiBold" }),
    },
  },
  freetype_load_target = "Light",
  freetype_render_target = "HorizontalLcd",
  warn_about_missing_glyphs = false,
  bold_brightens_ansi_colors = false,
  font_size = set_font_size_by_hostname(),
  line_height = 1.1,
  cell_width = 0.95,
  initial_cols = 185,
  initial_rows = 55,
  use_resize_increments = true,
  window_padding = {
    left = 10,
    right = 10,
    top = 21,
    bottom = 0,
  },
  default_cursor_style = "SteadyBlock",
  cursor_thickness = "3px",
  cursor_blink_rate = 0,
  enable_wayland = true,
  enable_tab_bar = false,
  use_fancy_tab_bar = true,
  tab_bar_at_bottom = true,
  show_tab_index_in_tab_bar = true,
  enable_scroll_bar = false,
  window_decorations = "RESIZE",
  scrollback_lines = 5000,
  alternate_buffer_wheel_scroll_speed = 2,
  check_for_updates = false,
  status_update_interval = 100,
  term = "wezterm",
  disable_default_key_bindings = true,
  window_frame = {
    border_left_width = "4px",
    border_right_width = "4px",
    border_bottom_height = "4px",
    border_top_height = "4px",
    border_left_color = "#000000",
    border_right_color = "#000000",
    border_bottom_color = "#000000",
    border_top_color = "#000000",
  },
  keys = {
    { key = "c",     mods = "CTRL|SHIFT", action = act({ CopyTo = "ClipboardAndPrimarySelection" }) },
    { key = "v",     mods = "CTRL|SHIFT", action = "Paste" },
    { key = "0",     mods = "CTRL",       action = "ResetFontSize" },
    { key = "-",     mods = "CTRL",       action = "DecreaseFontSize" },
    { key = "=",     mods = "CTRL",       action = "IncreaseFontSize" },
    -- MUX
    { key = "E",     mods = "CTRL|SHIFT", action = act.DetachDomain { DomainName = dev_server }, },
    { key = "1",     mods = "ALT",        action = act { ActivateTab = 0 } },
    { key = "2",     mods = "ALT",        action = act { ActivateTab = 1 } },
    { key = "3",     mods = "ALT",        action = act { ActivateTab = 2 } },
    { key = "4",     mods = "ALT",        action = act { ActivateTab = 3 } },
    { key = "5",     mods = "ALT",        action = act { ActivateTab = 4 } },
    { key = "6",     mods = "ALT",        action = act { ActivateTab = 5 } },
    { key = "7",     mods = "ALT",        action = act { ActivateTab = 6 } },
    { key = "8",     mods = "ALT",        action = act { ActivateTab = 7 } },
    { key = "9",     mods = "ALT",        action = act { ActivateTab = 8 } },
    { key = "0",     mods = "ALT",        action = act { ActivateTab = 9 } },
    -- ShowLauncher
    { key = "Space", mods = "CTRL",       action = act.ShowLauncher },
  },
  unix_domains = {
    {
      name = dev_server,
      local_echo_threshold_ms = 100,
      proxy_command = is_server == false and { "ssh", dev_server, "wezterm", "cli", "proxy" } or nil,
    },
  },
}
