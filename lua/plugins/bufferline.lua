return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        numbers = "none",
        diagnostics = "nvim_lsp",
        indicator = { style = "none" },
        show_buffer_close_icons = true,
        show_close_icon = false,
        always_show_bufferline = true,
      },
      highlights = {
        fill = {
          bg = "#26233a",
        },
        background = {
          fg = "#908caa",
          bg = "#26233a",
        },
        buffer_visible = {
          fg = "#908caa",
          bg = "#26233a",
        },
        buffer_selected = {
          fg = "#e0def4",
          bg = "NONE", -- transparent: uses terminal bg
          bold = true,
        },
        indicator_selected = {
          fg = "NONE",
          bg = "NONE",
        },
        close_button = {
          fg = "#908caa",
          bg = "#26233a",
        },
        close_button_visible = {
          fg = "#908caa",
          bg = "#26233a",
        },
        close_button_selected = {
          fg = "#e0def4",
          bg = "NONE", -- transparent
        },
        separator = {
          fg = "#26233a",
          bg = "#26233a",
        },
        separator_visible = {
          fg = "#26233a",
          bg = "#26233a",
        },
        separator_selected = {
          fg = "NONE", -- transparent
          bg = "NONE", -- transparent
        },
        duplicate = {
          fg = "#908caa",
          bg = "#26233a",
        },
        duplicate_visible = {
          fg = "#908caa",
          bg = "#26233a",
        },
        duplicate_selected = {
          fg = "#e0def4",
          bg = "NONE", -- transparent
        },
        modified = {
          fg = "#f6c177",
          bg = "#26233a",
        },
        modified_visible = {
          fg = "#f6c177",
          bg = "#26233a",
        },
        modified_selected = {
          fg = "#f6c177",
          bg = "NONE", -- transparent
        },
        hint = {
          bg = "#26233a",
        },
        hint_visible = {
          bg = "#26233a",
        },
        hint_selected = {
          bg = "NONE", -- transparent
        },
        info = {
          bg = "#26233a",
        },
        info_visible = {
          bg = "#26233a",
        },
        info_selected = {
          bg = "NONE", -- transparent
        },
        warning = {
          bg = "#26233a",
        },
        warning_visible = {
          bg = "#26233a",
        },
        warning_selected = {
          bg = "NONE", -- transparent
        },
        error = {
          bg = "#26233a",
        },
        error_visible = {
          bg = "#26233a",
        },
        error_selected = {
          bg = "NONE", -- transparent
        },
      },
    })
  end,
}
