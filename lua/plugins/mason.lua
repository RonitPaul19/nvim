return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },

  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = {
        "clangd",
        "pyright",
        "html",
        "cssls",
        "tailwindcss",
        "jsonls",
        "emmet_language_server",
        "bashls",
        "lua_ls",
      },
    },
  },
}
