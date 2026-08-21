return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({})
		end,
	},
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
}
