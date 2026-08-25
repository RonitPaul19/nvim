return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,

		config = function()
			require("catppuccin").setup({
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
					transparency = false,
				},
			})

			vim.cmd.colorscheme("rose-pine")
		end,
	},
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000,
		config = function()
			require("everforest").setup({})
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
	},
	{
		"dzfrias/noir.nvim",
		priority = 1000,
	},
	{
		"JWW127/theink",
		priority = 1000,
	},
}
