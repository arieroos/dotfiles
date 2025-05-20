-- Pull in the wezterm API
local wezterm = require("wezterm")
local window_logic = require("window-logic")
local key_bindings = require("key-bindings")
local windows = require("windows")

wezterm.on("gui-startup", function(cmd)
	window_logic.open_window(cmd)
end)

wezterm.on("update-right-status", function(window, _)
	local name = window:active_key_table()
	if name then
		name = "TABLE: " .. name
	end
	window:set_right_status(name or "")
end)

-- This will hold the configuration.
local config = wezterm.config_builder()

config.color_scheme = "Night Owl (Gogh)"
config.font = wezterm.font("FantasqueSansM Nerd Font Mono")
config.font_size = 11

config.use_fancy_tab_bar = false

config.window_decorations = "RESIZE"

key_bindings.register_keys(config)
windows.setup(config)

return config
