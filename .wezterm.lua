-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.
-- Use -NoProfile to speed up powershell startup
config.default_prog = { 'powershell', '-NoProfile' }
config.color_scheme = 'Modus-Operandi'

-- Finally, return the configuration to wezterm:
return config
