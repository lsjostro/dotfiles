local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux

local dev_server = "lsjostrom-dev"

wezterm.on("gui-startup", function(cmd)
	local args = {}
	if cmd then
		args = cmd.args
	end

	_, _, _ = mux.spawn_window({
		workspace = "local",
		args = args,
	})

	_, _, _ = mux.spawn_window({
		workspace = dev_server,
		args = args,
	})

	mux.set_active_workspace("local")
end)

local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Mocha"
	else
		return "Catppuccin Latte"
	end
end

return {
	color_scheme = scheme_for_appearance(wezterm.gui.get_appearance()),
	font = wezterm.font({ family = "IosevkaShelman Nerd Font" }),
	font_rules = {
		{
			italic = false,
			intensity = "Half",
			font = wezterm.font("IosevkaShelman Nerd Font", { weight = "Light" }),
		},
		{
			italic = true,
			intensity = "Normal",
			font = wezterm.font("IosevkaShelman Nerd Font", { weight = "Light", italic = true }),
		},
	},
	warn_about_missing_glyphs = false,
	bold_brightens_ansi_colors = false,
	font_size = 11,
	command_palette_font_size = 14.0,
	unicode_version = 14,
	freetype_load_flags = "NO_HINTING",
	freetype_load_target = "HorizontalLcd",
	use_resize_increments = true,

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
	disable_default_key_bindings = true,
	keys = {
		{ key = "c", mods = "CTRL|SHIFT", action = act.CopyTo("ClipboardAndPrimarySelection") },
		{ key = "v", mods = "CTRL|SHIFT", action = act.PasteFrom("Clipboard") },
		{ key = "0", mods = "CTRL", action = "ResetFontSize" },
		{ key = "-", mods = "CTRL", action = "DecreaseFontSize" },
		{ key = "=", mods = "CTRL", action = "IncreaseFontSize" },
		{ key = "r", mods = "ALT", action = act.ReloadConfiguration },
		{ key = "o", mods = "ALT", action = act.ActivateCommandPalette },
		{ key = "Backspace", mods = "ALT", action = act.SwitchWorkspaceRelative(1) },
	},
}
