return {
  "saghen/blink.cmp",
  event = "InsertEnter",
  build = function()
    -- build the fuzzy matcher, optionally add a timeout to `pwait(timeout_ms)`
    -- you can use `gb` in `:Lazy` to rebuild the plugin as needed
    require('blink.cmp').build():pwait()
  end,
  dependencies = {
    "saghen/blink.lib",
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
  },
  config = function()
    local luasnip = require("luasnip")
    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_lua").load({
      paths = vim.fn.stdpath("config") .. "/snippets",
    })

    luasnip.filetype_extend("javascript", { "react" })
    luasnip.filetype_extend("typescriptreact", { "react" })
    luasnip.filetype_extend("vue", { "nuxt" })

    require("blink.cmp").setup({
      enabled = function()
        local ft = vim.bo.filetype
        if ft == "DressingInput" or ft == "DressingSelect" then return false end
        if vim.bo.buftype == "prompt" then return false end
        return vim.fn.mode() ~= "c"
      end,
      keymap = {
        ["<C-n>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback" },
        ["<C-d>"] = { "scroll_documentation_down", "fallback" },
        ["<C-f>"] = { "scroll_documentation_up", "fallback" },
        ["<C-Space>"] = { "show", "fallback" },
        ["<C-e>"] = { "hide", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
      },
      sources = {
        default = { "lsp", "snippets", "buffer", "path" },
      },
      completion = {
        menu = {
          draw = {
            columns = { { "label", "label_description", gap = 1 }, { "kind_icon" } },
          },
        },
      },
      appearance = {
        nerd_font_variant = "mono",
      },
      snippets = {
        preset = "luasnip",
      },
    })
  end,
}
