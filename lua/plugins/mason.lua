	return {
		{
			"mason-org/mason.nvim",
			cmd = { "Mason", "MasonInstall", "MasonUpdate", "MasonUninstall", "MasonLog" },
			opts = {},
		},

		{
			"mason-org/mason-lspconfig.nvim",
			dependencies = {
				"mason-org/mason.nvim",
				"neovim/nvim-lspconfig",
			},
			event = { "BufReadPre", "BufNewFile" },
			opts = {
				automatic_enable = false,
				ensure_installed = {
					"clangd",
					"vtsls",
					"vue_ls",
					"html",
					"cssls",
					"jsonls",
					"emmet_language_server",
					"pyright",
					"tailwindcss",
					"bashls",
					"lua_ls",
				},
			},
		},

		{
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			dependencies = {
				"mason-org/mason.nvim",
			},
			event = { "BufReadPre", "BufNewFile" },
			opts = {
				ensure_installed = {
					"prettier",
					"stylua",
					"ruff",
				},
			},
		},
	}
