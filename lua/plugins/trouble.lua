return {
	"folke/trouble.nvim",

	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	cmd = "Trouble",

	opts = {
		win = {
			border = "rounded",
		},
	},

	keys = {
		{
			"<leader>tr",
			"<cmd>Trouble diagnostics toggle<CR>",
			desc = "Diagnostics",
		},
		{
			"<leader>tn",
			"<cmd>Trouble next skip_groups=true jump=true<CR>",
			desc = "Next Trouble item",
		},
		{
			"<leader>tp",
			"<cmd>Trouble prev skip_groups=true jump=true<CR>",
			desc = "Previous Trouble item",
		},
	},
}
