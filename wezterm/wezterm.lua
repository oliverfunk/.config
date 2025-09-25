-- Import the wezterm module
local wezterm = require 'wezterm'
-- Creates a config object which we will be adding our config to
local config = wezterm.config_builder()

-- (This is where our config will go)
-- config.keys = {
--     {key="Enter", mods="SHIFT", action=wezterm.action{SendString="\x1b\r"}},
-- }

config.font = wezterm.font_with_fallback 'FiraMono Nerd Font'
config.font_size = 14

config.default_cursor_style = 'SteadyBar'
config.cursor_thickness = "1pt"

-- Returns our config to be evaluated. We must always do this at the bottom of this file
return config
