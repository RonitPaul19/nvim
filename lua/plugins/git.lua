return {
	{
		"tpope/vim-fugitive",
		cmd = { "Git", "G" },
		keys = {
			{ "<leader>gs", "<cmd>Git<cr>", desc = "Git status" },
			{
				"<leader>gc",
				function()
					vim.cmd.Git("commit")
				end,
				desc = "Git commit",
			},
			{
				"<leader>gp",
				function()
					vim.cmd.Git("push")
				end,
				desc = "Git push",
			},
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		name = "gitsigns",
		event = { "BufReadPre", "BufNewFile" },
		keys = {
			{ "<leader>gh", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview hunk" },
		},
		opts = {},
	},
}
