-- Pull in the wezterm API
local wezterm = require("wezterm")
local actions = wezterm.action

local windows = require("windows")

wezterm.on("gui-startup", function(cmd)
	windows.open_window(cmd)
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
config.font = wezterm.font("ComicShannsMono Nerd Font")
config.font_size = 11

config.use_fancy_tab_bar = false

config.window_decorations = "RESIZE"

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

config.keys = {
	{
		key = "r",
		mods = "LEADER",
		action = actions.ActivateKeyTable({
			name = "resize_pane",
			one_shot = false,
			timeout_milliseconds = 1000 * 60, -- one minute
		}),
	},
}

config.key_tables = {
	resize_pane = {
		{ key = "LeftArrow", action = actions.AdjustPaneSize({ "Left", 1 }) },
		{ key = "h", action = actions.AdjustPaneSize({ "Left", 1 }) },

		{ key = "RightArrow", action = actions.AdjustPaneSize({ "Right", 1 }) },
		{ key = "l", action = actions.AdjustPaneSize({ "Right", 1 }) },

		{ key = "UpArrow", action = actions.AdjustPaneSize({ "Up", 1 }) },
		{ key = "k", action = actions.AdjustPaneSize({ "Up", 1 }) },

		{ key = "DownArrow", action = actions.AdjustPaneSize({ "Down", 1 }) },
		{ key = "j", action = actions.AdjustPaneSize({ "Down", 1 }) },

		-- Cancel the mode by pressing escape
		{ key = "Escape", action = "PopKeyTable" },
	},
}

return config
