if vim.g.vscode then
  require("vscodeconfig.options")
  require("vscodeconfig.keymaps")
else
  require("config.options")
  require("config.keymaps")
  require("config.transparent")
  require("lazy-setup")
end
