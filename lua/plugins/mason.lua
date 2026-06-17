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
        "ts_ls",
        "html",
        "cssls",
        "tailwindcss",
        "jsonls",
        "emmet_language_server",
        "vue_ls",
        "bashls",
        "lua_ls",
      },
    },
  },
}
