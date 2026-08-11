return {
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gs", "<cmd>Git<cr>")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		name = "gitsigns",

		config = function()
			require("gitsigns").setup({})

			vim.keymap.set("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>")
		end,
	},
}
