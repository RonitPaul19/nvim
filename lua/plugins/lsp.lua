return {
  {
    "williamboman/mason.nvim",
    opts = {},
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = { "lua_ls", "clangd", "pyright" },
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config("*", {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
          end

          map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
          map("n", "gr", vim.lsp.buf.references, "Find References")
          map("n", "gi", vim.lsp.buf.implementation, "Go to Implementation")
          map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
        end,
      })

      vim.lsp.config("clangd", {
        cmd = {
          "clangd",
          "--clang-tidy",
          "--header-insertion=never",
        },
      })

      vim.lsp.enable("lua_ls")
      vim.lsp.enable("clangd")
      vim.lsp.enable("pyright")
    end,
  },
}
