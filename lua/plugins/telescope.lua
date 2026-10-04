return {
	"nvim-telescope/telescope.nvim",
	version = "0.2.2",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	cmd = "Telescope",
	keys = {
		{
			"<leader>pf",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "Search Files",
		},
		{
			"<leader>pg",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "Find in Global",
		},
		{
			"<leader>gf",
			function()
				require("telescope.builtin").git_files()
			end,
			desc = "Search Git Files",
		},
		{
			"<leader>pws",
			function()
				require("telescope.builtin").grep_string({ search = vim.fn.expand("<cword>") })
			end,
			desc = "Search word under cursor",
		},
		{
			"<leader>pWs",
			function()
				require("telescope.builtin").grep_string({ search = vim.fn.expand("<cWORD>") })
			end,
			desc = "Search WORD under cursor",
		},
		{
			"<leader>pd",
			function()
				require("telescope.builtin").diagnostics()
			end,
			desc = "Search diagnostics",
		},
	},
	config = function()
		require("telescope").setup({
			defaults = {
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--hidden", -- Search hidden files
					"--glob",
					"!**/.git/*", -- Still ignore .git
				},
			},
		})
	end,
}
