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
  local function hl(name)
    return vim.api.nvim_get_hl(0, { name = name })
  end

  local diag_error = hl("DiagnosticError")
  local diag_warn = hl("DiagnosticWarn")
  local diag_info = hl("DiagnosticInfo")
  local diag_hint = hl("DiagnosticHint")

  if diag_error.fg then
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = diag_error.fg })
  end
  if diag_warn.fg then
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = diag_warn.fg })
  end
  if diag_info.fg then
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = diag_info.fg })
  end
  if diag_hint.fg then
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = diag_hint.fg })
  end
end

set_diagnostic_highlights()

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = set_diagnostic_highlights,
})
