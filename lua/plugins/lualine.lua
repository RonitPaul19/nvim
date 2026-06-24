return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local rose = require("lualine.themes.rose-pine")

    require("lualine").setup({
      options = {
        theme = rose,
        component_separators = "",
        section_separators = "",
        globalstatus = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "diff", "diagnostics" },
        lualine_c = {},
        lualine_x = { "filetype" },
        lualine_y = {},
        lualine_z = {},
      },
    })
  end,
}
