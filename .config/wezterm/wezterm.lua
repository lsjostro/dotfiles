local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux
local config = {}

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
		return {
			background = "#0d1117",
			-- background = "#000000",
			foreground = "#b2b2b2",
			cursor_bg = "#00d992",
			cursor_fg = "#000000",
			cursor_border = "#000000",
			selection_bg = "#d7d7d7",
			selection_fg = "#000000",
			ansi = { "#000000", "#ff0035", "#85ff00", "#ffc900", "#00a7ff", "#cb01ff", "#00e0ff", "#f0f0f0" },
			brights = { "#000000", "#ff8c88", "#baff94", "#ffe090", "#88ccff", "#e38dff", "#97eeff", "#ffffff" },
		}
	else
		return {
			background = "#fefeff",
			foreground = "#333333",
			cursor_bg = "#aa0000",
			cursor_fg = "#ffffff",
			cursor_border = "#ffffff",
			selection_bg = "#ffe6a4",
			selection_fg = "#483600",
			ansi = { "#000000", "#9e001d", "#306300", "#deae00", "#00669e", "#7d009e", "#008a9e", "#f7f7f7" },
			brights = { "#000000", "#ff0035", "#509e00", "#ffc900", "#00a7ff", "#cb01ff", "#00e0ff", "#ffffff" },
		}
	end
end

config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())
-- config.font = wezterm.font({ family = "IosevkaShelman Nerd Font" })
-- config.font_rules = {
-- 	{
-- 		italic = false,
-- 		intensity = "Half",
-- 		font = wezterm.font("IosevkaShelman Nerd Font", { weight = "Light" }),
-- 	},
-- 	{
-- 		italic = true,
-- 		intensity = "Normal",
-- 		font = wezterm.font("IosevkaShelman Nerd Font", { weight = "Light", italic = true }),
-- 	},
-- }
config.font = wezterm.font({ family = "Berkeley Mono Nerd Font", weight = "Regular" })
config.font_rules = {
	{
		italic = true,
		intensity = "Bold",
		reverse = false,
		-- font = wezterm.font("Iosevka Term SS15 Lt Ex Obl", { weight = "Light", italic = true }),
		-- font = wezterm.font("Iosevka Term Curly Slab Lt Ex", { weight = "Light", italic = true }),
		-- font = wezterm.font("Iosevka Term Curly Slab Ex", { weight = "Light", italic = true }),
		-- font = wezterm.font("Monaspace Radon Var", { weight = "Regular", italic = false }),
		font = wezterm.font({ family = "Berkeley Mono Nerd Font", italic = true }),
	},
}

config.freetype_render_target = "HorizontalLcd"

config.font_size = 10.2

config.unicode_version = 14
config.warn_about_missing_glyphs = false
config.bold_brightens_ansi_colors = false
config.custom_block_glyphs = false
config.allow_square_glyphs_to_overflow_width = "Always"

config.command_palette_font_size = 13.5
config.initial_cols = 116
config.initial_rows = 36

config.underline_position = -7
config.underline_thickness = 2

config.use_resize_increments = true

config.adjust_window_size_when_changing_font_size = false
config.hide_mouse_cursor_when_typing = false
config.default_cursor_style = "SteadyBlock"
config.cursor_thickness = "3px"
config.cursor_blink_rate = 0
config.enable_wayland = true
config.enable_tab_bar = false
config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = true
config.show_tab_index_in_tab_bar = true
config.enable_scroll_bar = false
config.window_decorations = "RESIZE"
config.scrollback_lines = 5000
config.alternate_buffer_wheel_scroll_speed = 2
config.check_for_updates = false
config.status_update_interval = 100
config.disable_default_key_bindings = true
config.keys = {
	{ key = "c", mods = "CTRL|SHIFT", action = act.CopyTo("ClipboardAndPrimarySelection") },
	{ key = "v", mods = "CTRL|SHIFT", action = act.PasteFrom("Clipboard") },
	{ key = "0", mods = "CTRL", action = "ResetFontSize" },
	{ key = "-", mods = "CTRL", action = "DecreaseFontSize" },
	{ key = "=", mods = "CTRL", action = "IncreaseFontSize" },
	{ key = "r", mods = "ALT", action = act.ReloadConfiguration },
	{ key = "o", mods = "ALT", action = act.ActivateCommandPalette },
	{ key = "Backspace", mods = "ALT", action = act.SwitchWorkspaceRelative(1) },
}

return config
