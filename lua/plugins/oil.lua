return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = { "Oil" },
	keys = {
		{ "<leader>pv", "<cmd>Oil<CR>", desc = "Open parent directory" },
	},
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			show_hidden = true,
			view_options = {
				show_hidden = true,
			},
		})
	end,
}
