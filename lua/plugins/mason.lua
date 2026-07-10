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
}
