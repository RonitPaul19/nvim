return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
    vim.keymap.set("n", "<leader>pv", "<cmd>Oil<CR>")
		require("oil").setup({
			default_file_explorer = true,
			show_hidden = true,
			view_options = {
				show_hidden = true,
			},
		})
	end,
}
