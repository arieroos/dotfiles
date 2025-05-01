local wezterm = require("wezterm")

local module = {}

local mux = wezterm.mux

function module.open_window(cmd)
	local _, _, window = mux.spawn_window(cmd or {})
	-- Open maximized
	window:gui_window():maximize()
end

return module
