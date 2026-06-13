return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {},
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function(_, opts)
    require("noice").setup(opts)

    vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NoicePopup", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NoicePopupBorder", { bg = "NONE" })

    vim.api.nvim_set_hl(0, "NotifyBackground", { bg = "NONE" })
  end,
}
