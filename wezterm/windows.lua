local wezterm = require("wezterm")

return {
	setup = function(config)
		if wezterm.target_triple ~= "x86_64-pc-windows-msvc" then
			-- This is not Windows, let's return
			return
		end

		if os.execute("where pwsh.exe") then
			config.default_prog = { "pwsh.exe" }
		elseif os.execute("where powershell.exe") then
			config.default_prog = { "powershell.exe" }
		end
	end,
}
