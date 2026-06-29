local errors_only = { min = vim.diagnostic.severity.ERROR, max = vim.diagnostic.severity.ERROR }

vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
    spacing = 5,
    source = "if_many",
    severity = errors_only,
  },
  signs = {
    severity = errors_only,
  },
  underline = {
    severity = errors_only,
  },
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "if_many",
    severity = errors_only,
  },
})

local function set_diagnostic_highlights()
  -- Error (Red)
  vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#ff5555", bg = "#3a1f1f" })
  vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = "#ffb86c", bg = "#3a2f1f" })
  vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = "#62d6e8", bg = "#1f2f3a" })
  vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = "#50fa7b", bg = "#1f3a26" })
end

-- Apply immediately on load
set_diagnostic_highlights()
-- Reapply every time a colorscheme is loaded, so it doesn't get overwritten
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = set_diagnostic_highlights,
})
