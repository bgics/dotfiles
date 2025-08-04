local config = require("base_config")

config.default_prog = { "wsl.exe", "--cd", "~", "-l", "-c", "nu" }
config.font_size = 14

return config
