return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local theme = require("config.theme")
    local function setup()
      require("lualine").setup({
        options = {
          theme = theme.get_lualine_theme(),
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
    end
    setup()
    vim.api.nvim_create_autocmd("User", {
      pattern = "ThemeChanged",
      callback = setup,
    })
  end,
}
