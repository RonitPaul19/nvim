if vim.g.vscode then
  require("VisualStudioCode.keymap")
  require("VisualStudioCode.options")
else
  require("config.options")
  require("config.keymap")
  require("config.lazy")
  vim.fn.serverstart([[\\.\pipe\theme-switcher]])
  require("config.theme")
  require("config.lsp")
  require("config.diagnostics")
end
