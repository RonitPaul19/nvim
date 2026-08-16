return {
	"akinsho/toggleterm.nvim",
	version = "*",

	cmd = { "ToggleTerm", "ToggleTermToggleAll", "ToggleTermSendCurrentLine", "ToggleTermSendVisualLines" },

	keys = {
		{ "<leader>tt", "<cmd>ToggleTerm<CR>", desc = "Toggle Terminal" },
	},

	config = function()
		require("toggleterm").setup({
			size = 10,
			open_mapping = [[<C-\>]],
			hide_numbers = true,
			shade_terminals = false,
			start_in_insert = true,
			insert_mappings = true,
			persist_size = true,
			direction = "horizontal",
			close_on_exit = true,
			shell = "pwsh.exe",
		})

		vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal" })
	end,
}
