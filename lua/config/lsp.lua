local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend(
  "force",
  capabilities,
  require("cmp_nvim_lsp").default_capabilities()
)

vim.lsp.config("*", {
  capabilities = capabilities,
})

vim.lsp.config('clangd', {
  cmd = { 'clangd' },
  filetypes = { 'c', 'cpp' },
  root_markers = { 'compile_commands.json', '.clangd', '.git' },
})

vim.lsp.config('pyright', {
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python' },
  root_markers = { 'pyproject.toml', 'setup.py', '.git' },
})

vim.lsp.enable({
  'clangd',
  'pyright',
  'ts_ls',
  'html',
  'cssls',
  'tailwindcss',
  'jsonls',
  'emmet_language_server',
  'vue_ls',
  'bashls',
  'lua_ls',
})


