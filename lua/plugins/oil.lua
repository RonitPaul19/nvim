return {
  "stevearc/oil.nvim",
  config = function ()
    require("oil").setup({
      default_file_explorer = true,
      columns = {
        "icon",
      },
      buf_options = {
        buflisted = false,
        bufhidden = "hide",
      },
      win_options = {
        wrap = false,
        signcolumn = "no",
        cursorcolumn = false,
        foldcolumn = "0",
        spell = false,
        list = false,
        conceallevel = 3,
        concealcursor = "nvic",
      },
      view_options = {
        show_hidden = true,
      },
    })

    vim.keymap.set("n", "<leader>pv", "<cmd>Oil<CR>")
  end
}
