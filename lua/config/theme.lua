local M = {}
local default_theme = "rose-pine"

local light_themes = { ["e-ink"] = true }

function M.load()
  local ok, theme = pcall(dofile, vim.fn.stdpath("config") .. "/lua/_theme_state.lua")
  if not ok or type(theme) ~= "string" then
    theme = default_theme
  end

  vim.opt.background = light_themes[theme] and "light" or "dark"

  pcall(vim.cmd, "colorscheme " .. theme)

  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
end

M.load()

return M
