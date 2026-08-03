return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,

		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				transparent_background = true,
				float = {
					transparent = true, -- enable transparent floating windows
				},
			})

			vim.cmd.colorscheme("catppuccin-nvim")
		end,
	},
}
