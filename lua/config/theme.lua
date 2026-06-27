local function apply_theme()
  local ok, theme = pcall(dofile, vim.fn.stdpath("config") .. "/lua/config/selected_theme.lua")
  if ok and theme then
    vim.cmd("colorscheme " .. theme)
  end

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

apply_theme()
