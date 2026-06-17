return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- HEADER
    dashboard.section.header.val = {
      "                                                     ",
      "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "                                                     ",
    }

    -- OPTIONAL: reduce padding between sections (makes UI tighter)
    dashboard.config.layout = {
      { type = "padding", val = 2 },
      dashboard.section.header,
      { type = "padding", val = 1 },
      dashboard.section.buttons,
      { type = "padding", val = 1 },
    }

    -- TIGHT BUTTON STYLE
    local function button(sc, txt, keybind)
      local b = dashboard.button(sc, txt, keybind)
      b.opts.width = 38 -- controls overall compactness
      return b
    end

    -- MENU (compact labels)
    dashboard.section.buttons.val = {
      button("e", " Explorer", "<cmd>NvimTreeToggle<CR>"),
      button("f", "󰱼 Find File", "<cmd>Telescope find_files<CR>"),
      button("g", " Live Grep", "<cmd>Telescope live_grep<CR>"),
      button("q", " Quit", "<cmd>qa<CR>"),
    }

    -- APPLY
    alpha.setup(dashboard.opts)

    -- Disable folding in alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
