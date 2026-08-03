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
					transparent = true,
				},

				integrations = {
					telescope = true,
					treesitter = true,
					lualine = true,
					native_lsp = {
						enabled = true,
					},
				},
			})

			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
