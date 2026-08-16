return {
	"CRAG666/code_runner.nvim",

	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	cmd = { "RunCode", "RunFile", "RunProject", "RunClose", "CloseCodeRunner" },

	keys = {
		{ "<leader>r", "<cmd>RunCode<CR>", desc = "Run current file" },
	},

	config = function()
		require("code_runner").setup({
			mode = "float",
			project = {},
			root_markers = {},

			float = {
				border = "rounded",

				width = 0.8,
				height = 0.8,

				border_hl = "FloatBorder",
				float_hl = "FloatNormal",
			},

			filetype = {
				c = "cd $dir && gcc $fileName -o $fileNameWithoutExt && .\\$fileNameWithoutExt.exe",
				cpp = "cd $dir && g++ $fileName -o $fileNameWithoutExt && .\\$fileNameWithoutExt.exe",
				python = "python -u",
				javascript = "node",
				typescript = "tsx",
			},
		})
	end,
}
