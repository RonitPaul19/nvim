return {
  {
    "saghen/blink.cmp",
    version = "*",

    dependencies = {
      "rafamadriz/friendly-snippets",
      "L3MON4D3/LuaSnip",
    },

    opts = {
      keymap = {
        preset = "default",

        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },

        ["<CR>"] = { "accept", "fallback" },

        ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },

        ["<C-e>"] = { "hide", "fallback" },
      },

      appearance = {
        nerd_font_variant = "mono",
      },

      completion = {
        menu = {
          border = "none",
          auto_show = true,
        },

        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },

        ghost_text = {
          enabled = true,
        },

        list = {
          selection = {
            preselect = true,
            auto_insert = false,
          },
        },
      },

      signature = {
        enabled = true,
      },

      snippets = {
        preset = "luasnip",
      },

      sources = {
        default = {
          "lsp",
          "path",
          "snippets",
          "buffer",
        },
      },

      fuzzy = {
        implementation = "prefer_rust_with_warning",
      },
    },

    opts_extend = {
      "sources.default",
    },
  },
}
