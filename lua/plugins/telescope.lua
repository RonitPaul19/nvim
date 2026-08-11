return {
	"nvim-telescope/telescope.nvim",
	version = "0.2.2",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")

		telescope.setup({
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

		vim.keymap.set("n", "<leader>pf", builtin.find_files, {
			desc = "Search Files",
		})

		vim.keymap.set("n", "<leader>pg", builtin.live_grep, {
			desc = "Find in Global",
		})

		vim.keymap.set("n", "<leader>gf", builtin.git_files, {
			desc = "Search Git Files",
		})

		vim.keymap.set("n", "<leader>pws", function()
			local word = vim.fn.expand("<cword>")
			builtin.grep_string({ search = word })
		end)

		vim.keymap.set("n", "<leader>pWs", function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end)

		vim.keymap.set("n", "<leader>pd", builtin.diagnostics, {
			desc = "Search diagnostics",
		})
	end,
}
