return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,

		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				transparent_background = false,
				float = {
					transparent = false, -- enable transparent floating windows
					solid = false, -- use solid styling for floating windows, see |winborder|
				},
			})

			vim.cmd.colorscheme("catppuccin-nvim")
		end,
	},
}
