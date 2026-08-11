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

	config = function(_, opts)
		require("trouble").setup(opts)

		vim.api.nvim_set_keymap(
			"n",
			"<leader>tn",
			"<cmd>Trouble next skip_groups=true jump=true<CR>",
			{ noremap = true, silent = true, desc = "Next Trouble item" }
		)

		vim.api.nvim_set_keymap(
			"n",
			"<leader>tp",
			"<cmd>Trouble prev skip_groups=true jump=true<CR>",
			{ noremap = true, silent = true, desc = "Previous Trouble item" }
		)
	end,

	keys = {
		{
			"<leader>tr",
			"<cmd>Trouble diagnostics toggle<CR>",
			desc = "Diagnostics",
		},
	},
}
