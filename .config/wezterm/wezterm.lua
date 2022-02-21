local wezterm = require("wezterm")

function font_with_fallback(name, params)
	local names = { name, "Noto Color Emoji", "Iosevka Nerd Font Mono" }
	return wezterm.font_with_fallback(names, params)
end

local themeShelmanDark = {
	colors = {
		foreground = "#ded9ce",
		background = "#171a23",
		cursor_bg = "#FB8C00",
		cursor_border = "#FB8C00",
		split = "#444444",
		ansi = {
			"#000000",
			"#ff605a",
			"#b1e869",
			"#ead89c",
			"#5da9f6",
			"#e86aff",
			"#82fff6",
			"#ded9ce",
		},
		brights = {
			"#313131",
			"#f58b7f",
			"#dcf88f",
			"#eee5b2",
			"#a5c7ff",
			"#ddaaff",
			"#b6fff9",
			"#fefffe",
		},
		tab_bar = {
			background = "#000000",
			active_tab = {
				bg_color = "#171a23",
				fg_color = "#c0b070",
				intensity = "Normal",
			},
			inactive_tab = {
				bg_color = "#000000",
				fg_color = "#c0c0c0",
				intensity = "Half",
			},
			inactive_tab_hover = {
				bg_color = "#333333",
				fg_color = "#909090",
				italic = true,
			},
		},
	},

	tab_bar_style = {
		active_tab_left = wezterm.format({
			{ Background = { Color = "#171a23" } },
			{ Foreground = { Color = "#000000" } },
			{ Text = " " },
		}),
		active_tab_right = wezterm.format({
			{ Background = { Color = "#171a23" } },
			{ Foreground = { Color = "#000000" } },
			{ Text = " " },
		}),
		inactive_tab_left = wezterm.format({
			{ Background = { Color = "#000000" } },
			{ Foreground = { Color = "#171a23" } },
			{ Text = " " },
		}),
		inactive_tab_right = wezterm.format({
			{ Background = { Color = "#000000" } },
			{ Foreground = { Color = "#171a23" } },
			{ Text = "▕" },
		}),
		inactive_tab_hover_left = wezterm.format({
			{ Background = { Color = "#333333" } },
			{ Foreground = { Color = "#ffffff" } },
			{ Text = " " },
		}),
		inactive_tab_hover_right = wezterm.format({
			{ Background = { Color = "#333333" } },
			{ Foreground = { Color = "#ffffff" } },
			{ Text = " " },
		}),
	},
}

local themeShelmanLight = {
	colors = {
		foreground = "#000000",
		background = "#fcfcfc",
		cursor_bg = "#ff3300",
		cursor_fg = "#ffffff",
		cursor_border = "#cc0000",
		split = "#444444",
		selection_bg = "#FFCA28",
		ansi = {
			"#212121",
			"#b7141e",
			"#457b23",
			"#f5971d",
			"#134eb2",
			"#550087",
			"#0e707c",
			"#eeeeee",
		},
		brights = {
			"#424242",
			"#e83a3f",
			"#7aba39",
			"#fee92e",
			"#53a4f3",
			"#a94dbb",
			"#26bad1",
			"#d8d8d8",
		},

		tab_bar = {
			background = "#556677",
			active_tab = {
				bg_color = "#f7f7f7",
				fg_color = "#000000",
				intensity = "Normal",
			},
			inactive_tab = {
				bg_color = "#778899",
				fg_color = "#000000",
				intensity = "Half",
			},
			inactive_tab_hover = {
				bg_color = "#333333",
				fg_color = "#909090",
				italic = true,
			},
		},
	},

	tab_bar_style = {
		active_tab_left = wezterm.format({
			{ Background = { Color = "#f7f7f7" } },
			{ Foreground = { Color = "#000000" } },
			{ Text = " " },
		}),
		active_tab_right = wezterm.format({
			{ Background = { Color = "#f7f7f7" } },
			{ Foreground = { Color = "#000000" } },
			{ Text = " " },
		}),
		inactive_tab_left = wezterm.format({
			{ Background = { Color = "#778899" } },
			{ Foreground = { Color = "#f7f7f7" } },
			{ Text = " " },
		}),
		inactive_tab_right = wezterm.format({
			{ Background = { Color = "#778899" } },
			{ Foreground = { Color = "#333333" } },
			{ Text = "▕" },
		}),
		inactive_tab_hover_left = wezterm.format({
			{ Background = { Color = "#333333" } },
			{ Foreground = { Color = "#ffffff" } },
			{ Text = " " },
		}),
		inactive_tab_hover_right = wezterm.format({
			{ Background = { Color = "#333333" } },
			{ Foreground = { Color = "#ffffff" } },
			{ Text = " " },
		}),
	},
}

local theme = themeShelmanLight

return {
	enable_wayland = true,
	colors = theme.colors,
	tab_bar_style = theme.tab_bar_style,
	-- automatically_reload_config = false,
	font = font_with_fallback("Iosevka Term SS09", { weight = "Light" }),
	-- font = wezterm.font("Iosevka Term SS09", {weight="Regular"}),
	font_rules = {
		{
			italic = false,
			intensity = "Half",
			font = font_with_fallback("Iosevka Term SS09", { weight = "Thin" }),
		},
		{
			italic = true,
			intensity = "Normal",
			-- font = font_with_fallback("Iosevka Aile", {weight="Regular", italic=true})
			font = font_with_fallback("Iosevka Term Curly Slab", { weight = "Regular", italic = true }),
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
	-- freetype_load_target = "HorizontalLcd",
	freetype_load_target = "Light",
	-- freetype_interpreter_version = 40,
	-- freetype_load_flags = "FORCE_AUTOHINT",
	warn_about_missing_glyphs = false,

	bold_brightens_ansi_colors = false,

	font_size = 11.0,
	line_height = 1.1,

	initial_cols = 150,
	initial_rows = 54,
	window_padding = { left = 10, right = 10, top = 21, bottom = 0 },

	enable_tab_bar = false,
	tab_bar_at_bottom = true,
	show_tab_index_in_tab_bar = true,
	enable_scroll_bar = false,
	window_decorations = "RESIZE",
	scrollback_lines = 5000,
	alternate_buffer_wheel_scroll_speed = 2,
	check_for_updates = false,
	status_update_interval = 100,

	disable_default_key_bindings = true,

	leader = { key = "o", mods = "CTRL|SHIFT", timeout_milliseconds = 1000 },
	keys = {

		{ key = "c", mods = "CTRL|SHIFT", action = "Copy" },
		{ key = "v", mods = "CTRL|SHIFT", action = "Paste" },
		{
			key = "n",
			mods = "LEADER",
			action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }),
		},
		{
			key = "c",
			mods = "LEADER",
			action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }),
		},
		{
			key = "k",
			mods = "LEADER",
			action = wezterm.action({ CloseCurrentTab = { confirm = true } }),
		},
		{ key = "l", mods = "LEADER", action = "ShowLauncher" },
		{ key = "0", mods = "CTRL", action = "ResetFontSize" },
		{ key = "-", mods = "CTRL", action = "DecreaseFontSize" },
		{ key = "=", mods = "CTRL", action = "IncreaseFontSize" },
	},
}
