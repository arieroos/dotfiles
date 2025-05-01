-- Pull in the wezterm API
local wezterm = require("wezterm")
local windows = require("windows")

wezterm.on("gui-startup", function(cmd)
	windows.open_window(cmd)
end)

-- This will hold the configuration.
local config = wezterm.config_builder()

config.color_scheme = "Night Owl (Gogh)"
config.font = wezterm.font("ComicShannsMono Nerd Font")

config.use_fancy_tab_bar = false

config.window_decorations = "RESIZE"

config.keys = {
	{ key = "l", mods = "ALT", action = wezterm.action.ShowLauncher },
}

return config
