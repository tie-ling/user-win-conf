-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

config.default_prog = { 'powershell' }
config.color_scheme = 'Modus-Operandi'

-- Finally, return the configuration to wezterm:
return config
