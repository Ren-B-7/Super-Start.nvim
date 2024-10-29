local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- custom font for editor
config.font = wezterm.font("Roboto Mono Nerd Font")

-- good text size
config.font_size = 13

-- can resize term - but no titles or unnecessary headers/ icons
config.window_decorations = "RESIZE"

-- setup for transparent background
config.window_background_opacity = 0.9
config.macos_window_background_blur = 10

--custom colour scheme
config.color_scheme = "Blazer"
return config
