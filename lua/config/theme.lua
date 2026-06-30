local M = {}
local state_file = vim.fn.stdpath("config") .. "/lua/_theme_state.lua"

local background_map = {
  catppuccin = "dark",
  ["rose-pine"] = "dark",
  everforest = "dark",
  moonfly = "dark",
  ["e-ink"] = "light",
}

function M.load()
  local ok, theme = pcall(dofile, state_file)
  if not ok or type(theme) ~= "string" then
    theme = "rose-pine"
  end

  local bg = background_map[theme] or "dark"
  vim.opt.background = bg

  local success = pcall(vim.cmd, "colorscheme " .. theme)
  if not success then
    vim.opt.background = "dark"
    pcall(vim.cmd, "colorscheme rose-pine")
  end

  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })

  vim.api.nvim_exec_autocmds("User", { pattern = "ThemeChanged" })
end

function M.get_lualine_theme()
  local colorscheme = vim.g.colors_name
  local ok, theme = pcall(require, "lualine.themes." .. colorscheme)
  if ok then
    return theme
  end

  local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
  local cursorline = vim.api.nvim_get_hl(0, { name = "CursorLine" })
  local visual = vim.api.nvim_get_hl(0, { name = "Visual" })
  local comment = vim.api.nvim_get_hl(0, { name = "Comment" })
  local func = vim.api.nvim_get_hl(0, { name = "Function" })
  local err = vim.api.nvim_get_hl(0, { name = "ErrorMsg" })

  local bg = normal.bg or "NONE"
  local fg = normal.fg or "#ffffff"
  local sel_bg = cursorline.bg or bg
  local dim_fg = comment.fg or "#999999"
  local vis_bg = visual.bg or sel_bg
  local vis_fg = visual.fg or fg
  local ins_bg = func.fg or vis_bg
  local rep_bg = err.fg or "#ff0000"

  return {
    normal = {
      a = { bg = sel_bg, fg = fg, gui = "bold" },
      b = { bg = bg, fg = fg },
      c = { bg = bg, fg = fg },
    },
    insert = {
      a = { bg = ins_bg, fg = bg, gui = "bold" },
    },
    visual = {
      a = { bg = vis_bg, fg = vis_fg, gui = "bold" },
    },
    replace = {
      a = { bg = rep_bg, fg = bg, gui = "bold" },
    },
    command = {
      a = { bg = rep_bg, fg = bg, gui = "bold" },
    },
    inactive = {
      a = { bg = bg, fg = dim_fg },
      b = { bg = bg, fg = dim_fg },
      c = { bg = bg, fg = dim_fg },
    },
  }
end

function M.setup_bufferline()
  local ok_buf, bufferline = pcall(require, "bufferline")
  if not ok_buf then
    return
  end

  local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
  local cursorline = vim.api.nvim_get_hl(0, { name = "CursorLine" })
  local comment = vim.api.nvim_get_hl(0, { name = "Comment" })
  local diag_error = vim.api.nvim_get_hl(0, { name = "DiagnosticError" })
  local diag_warn = vim.api.nvim_get_hl(0, { name = "DiagnosticWarn" })
  local diff_add = vim.api.nvim_get_hl(0, { name = "DiffAdd" })
  local diff_change = vim.api.nvim_get_hl(0, { name = "DiffChange" })

  local bg = normal.bg or "NONE"
  local fg = normal.fg or "#ffffff"
  local dim_fg = comment.fg or "#999999"
  local modified_fg = diff_add.fg or diff_change.fg or (diag_warn.fg or "#ffaa00")

  bufferline.setup({
    options = {
      mode = "buffers",
      numbers = "none",
      diagnostics = "nvim_lsp",
      indicator = { style = "none" },
      show_buffer_close_icons = true,
      show_close_icon = false,
      always_show_bufferline = true,
    },
    highlights = {
      fill = { bg = bg },
      background = { fg = dim_fg, bg = bg },
      buffer_visible = { fg = dim_fg, bg = bg },
      buffer_selected = { fg = fg, bg = "NONE", bold = true },
      indicator_selected = { fg = "NONE", bg = "NONE" },
      close_button = { fg = dim_fg, bg = bg },
      close_button_visible = { fg = dim_fg, bg = bg },
      close_button_selected = { fg = fg, bg = "NONE" },
      separator = { fg = bg, bg = bg },
      separator_visible = { fg = bg, bg = bg },
      separator_selected = { fg = "NONE", bg = "NONE" },
      duplicate = { fg = dim_fg, bg = bg },
      duplicate_visible = { fg = dim_fg, bg = bg },
      duplicate_selected = { fg = fg, bg = "NONE" },
      modified = { fg = modified_fg, bg = bg },
      modified_visible = { fg = modified_fg, bg = bg },
      modified_selected = { fg = modified_fg, bg = "NONE" },
      hint = { bg = bg },
      hint_visible = { bg = bg },
      hint_selected = { bg = "NONE" },
      info = { bg = bg },
      info_visible = { bg = bg },
      info_selected = { bg = "NONE" },
      warning = { bg = bg },
      warning_visible = { bg = bg },
      warning_selected = { bg = "NONE" },
      error = { bg = bg },
      error_visible = { bg = bg },
      error_selected = { bg = "NONE" },
    },
  })
end

M.load()

local uv = vim.uv or vim.loop
local watcher = uv.new_fs_event()
if watcher then
  watcher:start(state_file, {}, vim.schedule_wrap(function()
    M.load()
  end))
  _G.__theme_watcher = watcher
end

return M
