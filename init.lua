if vim.g.vscode then
  require("vscodeconfig.options")
  require("vscodeconfig.keymaps")
else
  require("config.options")
  require("config.keymaps")
  require("lazy-setup")

  local theme = require("config.theme")
  theme.load()
  theme.watch()
end
