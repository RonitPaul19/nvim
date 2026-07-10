return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },

    opts = {
      formatters_by_ft = {
        c = { "clang_format" },
        cpp = { "clang_format" },

        javascript = { "prettier" },
        javascriptreact = { "prettier" },

        typescript = { "prettier" },
        typescriptreact = { "prettier" },

        vue = { "prettier" },

        html = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },

        json = { "prettier" },
        jsonc = { "prettier" },

        yaml = { "prettier" },
        markdown = { "prettier" },

        lua = { "stylua" },
      },

      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    },

    config = function(_, opts)
      require("conform").setup(opts)

      vim.keymap.set("n", "<leader>fc", function()
        require("conform").format({
          async = true,
        })
      end, { desc = "Format Code" })
    end,
  },
}
