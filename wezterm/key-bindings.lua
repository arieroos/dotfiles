local wezterm = require("wezterm")
local actions = wezterm.action

return {
	register_keys = function(config)
		config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

		config.keys = {
			{ key = "L", mods = "CTRL", action = wezterm.action.ShowDebugOverlay },
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
	end,
}
