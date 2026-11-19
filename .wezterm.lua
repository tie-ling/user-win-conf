-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.
-- Use -NoProfile to speed up powershell startup
config.default_prog = { 'powershell', '-NoProfile' }
config.color_scheme = 'Modus-Operandi'
-- Usage of wezterm ssh with ssh-agent
-- https://github.com/wezterm/wezterm/discussions/5541
config.mux_enable_ssh_agent = false

config.default_cursor_style = 'SteadyUnderline'
-- Finally, return the configuration to wezterm:
return config
