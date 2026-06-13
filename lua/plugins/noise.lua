return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    require("notify").setup({
      background_colour = "NONE",
    })

    require("noice").setup({
      cmdline = {
        view = "cmdline_popup",
      },
    })
  end,
}
