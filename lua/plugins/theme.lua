return {
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
		-- Enable the theme
		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
