return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local theme = require("config.theme")
    theme.setup_bufferline()
    vim.api.nvim_create_autocmd("User", {
      pattern = "ThemeChanged",
      callback = function()
        theme.setup_bufferline()
      end,
    })
  end,
}
