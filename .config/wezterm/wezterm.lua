local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux

local dev_server = "lsjostrom-dev"

wezterm.on('gui-startup', function(cmd)
  local args = {}
  if cmd then
    args = cmd.args
  end

  _, _, _ = mux.spawn_window {
    workspace = 'local',
    args = args,
  }

  _, _, _ = mux.spawn_window {
    workspace = dev_server,
    args = args,
  }

  mux.set_active_workspace 'local'
end)

local function font_with_fallback(name, params)
  local names = { name, "Noto Color Emoji", "Iosevka Nerd Font Mono" }
  return wezterm.font_with_fallback(names, params)
end

local function set_font_size_by_hostname()
  local hostname = wezterm.hostname()
  -- larger font size on my HiDPI laptop
  if hostname == 'kean' then
    return 16.0
  else
    return 11.0
  end
end

return {
  color_scheme_dirs = { wezterm.home_dir .. "/.config/shelman-theme/current/wezterm" },
  color_scheme = "Shelman Theme",
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
  front_end = "WebGpu",
  webgpu_power_preference = 'HighPerformance',
  warn_about_missing_glyphs = false,
  bold_brightens_ansi_colors = false,
  font_size = set_font_size_by_hostname(),
  command_palette_font_size = 14.0,
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
  adjust_window_size_when_changing_font_size = false,
  hide_mouse_cursor_when_typing = false,
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
    { key = "c",         mods = "CTRL|SHIFT", action = act.CopyTo "ClipboardAndPrimarySelection" },
    { key = "v",         mods = "CTRL|SHIFT", action = act.PasteFrom "Clipboard" },
    { key = "0",         mods = "CTRL",       action = "ResetFontSize" },
    { key = "-",         mods = "CTRL",       action = "DecreaseFontSize" },
    { key = "=",         mods = "CTRL",       action = "IncreaseFontSize" },
    { key = "r",         mods = "ALT",        action = act.ReloadConfiguration },
    { key = "o",         mods = "ALT",        action = act.ActivateCommandPalette },
    { key = "Backspace", mods = "ALT",        action = act.SwitchWorkspaceRelative(1) },
  },
}
