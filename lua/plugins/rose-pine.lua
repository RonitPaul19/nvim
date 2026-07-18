return {
  "rose-pine/neovim",
  name = "rose-pine",
  lazy = false, -- load at startup
  priority = 1000, -- load before other UI plugins
  config = function()
    require("rose-pine").setup({
      disable_background = true, -- transparent background
      disable_float_background = true, -- transparent floating windows

      styles = {
        transparency = true,
      },
    })

    vim.cmd.colorscheme("rose-pine")
  end,
}
