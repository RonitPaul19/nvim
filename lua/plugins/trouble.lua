return {
  "folke/trouble.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  cmd = "Trouble",

  opts = {
    win = {
      border = "rounded",
    },
  },

  keys = {
    {
      "<leader>tr",
      "<cmd>Trouble diagnostics toggle<CR>",
      desc = "Diagnostics",
    },

    {
      "[t",
      "<cmd>Trouble next<CR>",
      desc = "Next Trouble item",
    },

    {
      "]t",
      "<cmd>Trouble prev<CR>",
      desc = "Previous Trouble item",
    },
  },
}
