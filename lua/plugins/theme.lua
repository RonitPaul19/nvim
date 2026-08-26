local THEME_MAP = {
	catppuccin = "catppuccin-mocha",
	["rose-pine"] = "rose-pine",
	everforest = "everforest",
	noir = "noir",
	theink = "theink",
	tokyonight = "tokyonight-night",
	kanagawa = "kanagawa",
}

local STATE_FILE = vim.fn.stdpath("config") .. "/lua/_theme_state.lua"

local function read_theme_name()
	local f = io.open(STATE_FILE, "r")
	if not f then
		return nil
	end
	local content = f:read("*a")
	f:close()
	local name = content:match("vim%.g%.theme_name%s*=%s*[\"']([^\"']+)[\"']")
	return name
end

local function apply_colorscheme(name)
	local cs = THEME_MAP[name] or name
	local ok, _ = pcall(vim.cmd.colorscheme, cs)
	if not ok then
		vim.notify("Failed to load colorscheme: " .. cs, vim.log.levels.ERROR)
	end
end

local current_theme = read_theme_name() or "rose-pine"

vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	once = true,
	callback = function()
		apply_colorscheme(current_theme)
	end,
})

vim.api.nvim_create_autocmd("FocusGained", {
	callback = function()
		local new_theme = read_theme_name()
		if new_theme and new_theme ~= current_theme then
			current_theme = new_theme
			apply_colorscheme(new_theme)
		end
	end,
})

return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				transparent_background = true,
				float = {
					transparent = true,
					solid = false,
				},
				no_italic = true,
				no_bold = true,
				no_underline = true,
			})
		end,
	},

	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				transparent = true,
				styles = {
					sidebars = "transparent",
					floats = "transparent",
				},
			})
		end,
	},

	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				styles = {
					bold = false,
					italic = false,
					transparency = true,
				},
			})
		end,
	},

	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000,
		config = function()
			require("everforest").setup({
				transparent_background_level = 2,
			})
		end,
	},

	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				transparent = true,
			})
		end,
	},

	-- Noir: no require("noir").setup()
	{
		"dzfrias/noir.nvim",
		priority = 1000,
	},

	-- TheInk: no require("theink").setup()
	{
		"JWW127/theink",
		priority = 1000,
	},
}
