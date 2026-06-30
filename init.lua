if vim.g.vscode then
  require("VisualStudioCode.keymap")
  require("VisualStudioCode.options")
else
  require("config.options")
  require("config.keymap")
  require("config.lazy")
  require("config.theme")
  require("config.lsp")
  require("config.diagnostics")
end
