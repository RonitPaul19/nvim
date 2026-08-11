return {
	{
		"tpope/vim-fugitive",
		config = function()
			local opts = { buffer = bufnr, remap = false }
			vim.keymap.set("n", "<leader>gs", "<cmd>Git<cr>")

			vim.keymap.set("n", "<leader>p", function()
				vim.cmd.Git("push")
			end, opts)
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
