return {
  "stevearc/conform.nvim",

  event = { "BufWritePre" },

  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        c = { "clang-format" },
        cpp = { "clang-format" },

        python = { "black" },

        javascript = { "prettier" },
        javascriptreact = { "prettier" },

        typescript = { "prettier" },
        typescriptreact = { "prettier" },

        vue = { "prettier" },

        json = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        markdown = { "prettier" },
      },

      format_on_save = {
        timeout_ms = 1000,
        lsp_fallback = true,
      },
    })

    vim.keymap.set("n", "<leader>f", function()
      conform.format({
        async = true,
        lsp_fallback = true,
      })
    end, { desc = "Format file" })
  end,
}
