return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,

		config = function()
			require("catppuccin").setup({
				flavour = "mocha",

				no_italic = true,
				no_bold = true,
				no_underline = true,

				-- transparent_background = true,
				--
				-- float = {
				-- 	transparent = true,
				-- },
			})

			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
