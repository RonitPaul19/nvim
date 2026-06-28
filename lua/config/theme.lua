local function set_transparency()
  local groups = {
    "Normal", "NormalFloat", "NormalNC",
    "SignColumn", "FoldColumn", "CursorLineNr", "LineNr",
    "StatusLine", "StatusLineNC",
    "TabLine", "TabLineFill", "TabLineSel",
    "WinSeparator", "VertSplit",
    "FloatBorder",
    "Pmenu",
    "NvimTreeNormal", "NvimTreeNormalNC", "NvimTreeEndOfBuffer",
    "TelescopeNormal", "TelescopeBorder", "TelescopePromptBorder",
    "WhichKeyFloat", "WhichKeyBorder",
    "DiagnosticVirtualTextError", "DiagnosticVirtualTextWarn",
    "DiagnosticVirtualTextInfo", "DiagnosticVirtualTextHint",
    "DiagnosticSignError", "DiagnosticSignWarn",
    "DiagnosticSignInfo", "DiagnosticSignHint",
    "LspInlayHint",
  }
  for _, group in ipairs(groups) do
    pcall(vim.api.nvim_set_hl, 0, group, { bg = "none" })
  end
end

local theme_file = vim.fn.stdpath("config") .. "/lua/config/selected_theme.lua"

local function apply_theme()
  local ok, theme = pcall(dofile, theme_file)
  if ok and theme then
    vim.cmd("colorscheme " .. theme)
  end
  set_transparency()
end

apply_theme()

local uv = vim.uv or vim.loop
local watcher = uv.new_fs_event()
local debounce

if watcher then
  watcher:start(
    vim.fn.fnamemodify(theme_file, ":h"),
    {},
    vim.schedule_wrap(function(err, fname)
      if err then return end
      if fname and not fname:find("selected_theme%.lua$") then return end
      if debounce then debounce:close() end
      debounce = vim.defer_fn(function()
        apply_theme()
      end, 100)
    end)
  )
end

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = set_transparency,
  desc = "Reapply transparency after colorscheme change",
})

vim.api.nvim_create_autocmd("UIEnter", {
  callback = set_transparency,
  desc = "Reapply transparency once UI is ready",
})
