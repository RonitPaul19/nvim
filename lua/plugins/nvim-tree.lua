return {
	"nvim-tree/nvim-tree.lua",

	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	keys = {
		{
			"<leader>e",
			function()
				local api = require("nvim-tree.api")

				if api.tree.is_visible() then
					-- Explorer is already focused → close it
					if vim.bo.filetype == "NvimTree" then
						api.tree.close()
					else
						-- Explorer is open but we're elsewhere → focus it
						api.tree.focus()
					end
				else
					-- Explorer is closed → open and focus it
					api.tree.open()
				end
			end,
			desc = "Focus/Toggle File Explorer",
		},
	},

	config = function()
		require("nvim-tree").setup({
			sort = {
				sorter = "case_sensitive",
			},

			view = {
				width = 40,
				side = "right",
			},

			renderer = {
				group_empty = true,
			},

			filters = {
				dotfiles = true,
			},
		})
	end,
}
