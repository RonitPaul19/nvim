local M = {}

local state_path = vim.fn.stdpath("config") .. "/lua/_theme_state.lua"

local theme_map = {
  ["catppuccin"] = function()
    require("catppuccin").setup({ flavour = "mocha", transparent_background = false })
    vim.cmd.colorscheme("catppuccin-mocha")
  end,
  ["rose-pine"] = function()
    require("rose-pine").setup({ variant = "main" })
    vim.cmd.colorscheme("rose-pine")
  end,
  ["everforest"] = function()
    vim.g.everforest_background = "hard"
    vim.cmd.colorscheme("everforest")
  end,
  ["moonfly"] = function()
    vim.g.moonflyCursor = true
    vim.cmd.colorscheme("moonfly")
  end,
  ["e-ink"] = function()
    require("e-ink").setup()
    vim.cmd.colorscheme("e-ink")
  end,
  ["tokyonight"] = function()
    require("tokyonight").setup({ style = "night" })
    vim.cmd.colorscheme("tokyonight")
  end,
  ["kanagawa"] = function()
    require("kanagawa").setup({ theme = "wave" })
    vim.cmd.colorscheme("kanagawa")
  end,
}

function M.get_theme()
  local f = io.open(state_path, "r")
  if not f then return "catppuccin" end
  local content = f:read("*a")
  f:close()
  local name = content:match('return%s+"([^"]+)"')
  return name or "catppuccin"
end

function M.load()
  local theme = M.get_theme()
  local apply = theme_map[theme]
  if apply then
    vim.schedule(function()
      vim.cmd("hi clear")
      if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end
      vim.g.colors_name = ""
      apply()
    end)
  end
end

function M.watch()
  local state_dir = vim.fn.fnamemodify(state_path, ":h")
  local last_theme = M.get_theme()

  local watcher = vim.uv.new_fs_event()
  if not watcher then return end

  watcher:start(state_dir, { recursive = false }, vim.schedule_wrap(function(err)
    if err then return end
    local current = M.get_theme()
    if current ~= last_theme then
      last_theme = current
      M.load()
    end
  end))
end

return M
