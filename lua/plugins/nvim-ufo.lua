return {
	"kevinhwang91/nvim-ufo",
	dependencies = { "kevinhwang91/promise-async" },
	event = "BufReadPre",
	keys = {
		{
			"za",
			function()
				if vim.fn.foldlevel(vim.fn.line(".")) == 0 then
					return
				end
				vim.cmd("normal! za")
			end,
			desc = "Toggle fold under cursor",
		},
	},
	config = function()
		-- Enable fold column and set high fold level
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true

		-- Setup provider (LSP or Treesitter)
		require("ufo").setup({
			provider_selector = function(bufnr, filetype, buftype)
				return { "lsp", "indent" }
			end,
		})
	end,
}
