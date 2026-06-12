return {
  "akinsho/toggleterm.nvim",
  version = "*",

  config = function()
    require("toggleterm").setup({
      size = 15,
      open_mapping = [[<C-\>]],
      hide_numbers = true,
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "horizontal",
      close_on_exit = true,
      shell = vim.o.shell,
    })

    vim.keymap.set(
      "n",
      "<leader>tt",
      "<cmd>ToggleTerm<CR>",
      { desc = "Toggle Terminal" }
    )
  end,
}
