return {
  "nvim-tree/nvim-tree.lua",
  config = function ()
    require("nvim-tree").setup({
      view = {
        width = 40,
        side = "right",
      },
    })

    vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")
  end
}
