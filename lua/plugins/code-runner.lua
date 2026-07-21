return {
  "CRAG666/code_runner.nvim",

  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  config = function()
    require("code_runner").setup({
      mode = "float",
      project = {},
      root_markers = {},

      float = {
        border = "rounded",

        width = 0.8,
        height = 0.8,

        border_hl = "FloatBorder",
        float_hl = "Normal",
      },

      filetype = {
        c = "cd $dir && gcc $fileName -o $fileNameWithoutExt && .\\$fileNameWithoutExt.exe",
        cpp = "cd $dir && g++ $fileName -o $fileNameWithoutExt && .\\$fileNameWithoutExt.exe",
        python = "python -u",
        javascript = "node",
        typescript = "tsx",
      },
    })

    vim.keymap.set(
      "n",
      "<leader>r",
      "<cmd>RunCode<CR>",
      { desc = "Run current file" }
    )
  end,
}
