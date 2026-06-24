return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    ------------------------------------------------------------------
    -- HEADER
    ------------------------------------------------------------------

    dashboard.section.header.val = {
      "     ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗     ",
      "     ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║     ",
      "     ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║     ",
      "     ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║     ",
      "     ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║     ",
      "     ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝     ",
      "                                                            ",
      "      ⚡ Fast • Minimal • Keyboard Driven • Neovim ⚡       ",
      "                                                            ",
      "────────────────────────────────────────────────────────────",
    }

    ------------------------------------------------------------------
    -- BUTTONS
    ------------------------------------------------------------------

    local function button(sc, txt, keybind)
      local b = dashboard.button(sc, txt, keybind)
      b.opts.width = 35
      return b
    end

    dashboard.section.buttons.val = {
      button("e", "󰙅  Explorer", "<cmd>NvimTreeToggle<CR>"),
      button("f", "󰱼  Find File", "<cmd>Telescope find_files<CR>"),
      button("g", "󰍉  Live Grep", "<cmd>Telescope live_grep<CR>"),
      button("r", "󱋡  Recent Files", "<cmd>Telescope oldfiles<CR>"),
      button("q", "󰅚  Quit", "<cmd>qa<CR>"),
    }

    ------------------------------------------------------------------
    -- FOOTER
    ------------------------------------------------------------------

    dashboard.section.footer.val = {
      "",
      "󰌽 I Use Neovim BTW !",
    }

    ------------------------------------------------------------------
    -- LAYOUT
    ------------------------------------------------------------------

    dashboard.config.layout = {
      { type = "padding", val = 3 },
      dashboard.section.header,
      { type = "padding", val = 2 }, -- reduced gap
      dashboard.section.buttons,
      { type = "padding", val = 1 },
      dashboard.section.footer,
    }

    alpha.setup(dashboard.opts)

    vim.cmd([[
      autocmd FileType alpha setlocal nofoldenable
    ]])
  end,
}
