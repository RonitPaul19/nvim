return {
  "goolord/alpha-nvim",
  -- dependencies = { 'nvim-mini/mini.icons' },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local alpha = require('alpha')
    local dashboard = require('alpha.themes.dashboard')
    dashboard.section.header.val = vim.split(
      [[
    ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
    ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
    ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
    ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
    ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
    ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
      ]], '\n', { trimempty = true })
    vim.api.nvim_set_hl(0, "AlphaHeader", {
        fg = "#9CCFD8",
        bold = true,
    })

    dashboard.section.header.opts.hl = "AlphaHeader"    dashboard.section.buttons.val = {}
    dashboard.section.footer.val = 'PookieVim v3000'
    dashboard.section.footer.opts.hl = 'Comment'
    alpha.setup(dashboard.opts)
  end,
}
