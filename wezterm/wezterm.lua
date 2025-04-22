-- Pull in the wezterm API
local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- Jet brains
-- config.font = wezterm.font("JetBrains Mono")
-- config.font_size = 12.3

-- Meslo
-- config.font = wezterm.font("MesloGS Nerd Font")
-- Commit mono
config.font = wezterm.font("CommitMono")
config.font_size = 12.8
config.line_height = 1.2
-- !==

config.window_background_opacity = 0.96

config.hide_tab_bar_if_only_one_tab = true
-- config.window_decorations = "NONE"
config.window_decorations = "RESIZE"
-- config.disable_default_key_bindings = true
config.default_cursor_style = "SteadyBlock" -- SteadyBlock, BlinkingBlock, SteadyUnderline, BlinkingUnderline, SteadyBar, and BlinkingBar.

config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.color_scheme = "catppuccin-mocha"
-- config.color_scheme = "tokyonight_moon"
-- config.color_scheme = "kanagawabones"

-- and finally, return the configuration to wezterm
return config
