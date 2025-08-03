local wezterm = require("wezterm")
local color_schemes = require("color_schemes")

local config = wezterm.config_builder()

config.default_prog = { "wsl.exe", "--cd", "~", "--", "bash", "-l", "-c", "nu" }

config.color_schemes = color_schemes
config.color_scheme = 'Gruvbox Material Dark'

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.font = wezterm.font("CodeNewRoman Nerd Font")
config.font_size = 14

config.window_padding = {
  left = 8,
  top = 8,
  right = 8,
  bottom = 8,
}

return config
