local function make_transparent()
  local groups = {
    "Normal",
    "NormalNC",
    "NormalFloat",
    "FloatBorder",
    "FloatTitle",
    "FloatFooter",
    "SignColumn",
    "StatusLine",
    "StatusLineNC",
    "EndOfBuffer",
    "Pmenu",
    "PmenuSel",
    "TabLine",
    "VertSplit",
  }

  for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, {
      bg = "NONE",
      ctermbg = "NONE",
    })
  end
end

make_transparent()
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = make_transparent,
})
