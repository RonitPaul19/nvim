return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },

    config = function()
      ----------------------------------------------------------
      -- Diagnostics
      ----------------------------------------------------------

      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          border = "rounded",
          source = "if_many",
        },
      })

      ----------------------------------------------------------
      -- Keymaps (set globally so they don't get overwritten)
      ----------------------------------------------------------

      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { silent = true })
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { silent = true })
      vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { silent = true })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local client = vim.lsp.get_client_by_id(event.data.client_id)

          -- Disable LSP formatting (Conform handles formatting)
          if client then
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          end

          local opts = { buffer = event.buf, silent = true }

          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)

          vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        end,
      })

      ----------------------------------------------------------
      -- Blink capabilities
      ----------------------------------------------------------

      local capabilities = vim.lsp.protocol.make_client_capabilities()

      local ok, blink = pcall(require, "blink.cmp")
      if ok then
        capabilities = blink.get_lsp_capabilities(capabilities)
      end

      ----------------------------------------------------------
      -- Server configs (must be before enable)
      ----------------------------------------------------------

      local servers = {
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
      }

      for _, server in ipairs(servers) do
        vim.lsp.config(server, {
          capabilities = capabilities,
        })
      end

      -- vim.lsp.config("vtsls", {
      --   settings = {
      --     typescript = {
      --       tsdk = vim.fn.stdpath("data") .. "/mason/packages/typescript/node_modules/typescript/lib",
      --     },
      --   },
      -- })

      vim.lsp.config("emmet_language_server", {
        capabilities = capabilities,
        filetypes = {
          "html",
          "css",
          "javascriptreact",
          -- "typescriptreact",
          "vue",
        },
      })

      ----------------------------------------------------------
      -- Enable servers (must be after config)
      ----------------------------------------------------------

      vim.lsp.enable(servers)
    end,
  },
}
