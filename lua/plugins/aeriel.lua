return {
	"stevearc/aerial.nvim",
	name = "aerial",
	config = function()
		require("aerial").setup({})
		vim.keymap.set("n", "<leader>ar", "<cmd>AerialToggle!<CR>")
	end,
}
