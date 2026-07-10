require("config.options")
require("config.keymaps")
require("lazy-setup")

local theme = require("config.theme")
theme.load()
theme.watch()
