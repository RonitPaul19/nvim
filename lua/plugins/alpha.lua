return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Rose Pine colors
    vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#9ccfd8", bold = true })
    vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#e0def4" })
    vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#6e6a86", italic = true })

    dashboard.section.header.val = {
      [[                                                     ]],
      [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
      [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
      [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
      [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
      [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
      [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
      [[                                                     ]],
    }
    dashboard.section.header.opts.hl = "AlphaHeader"

    dashboard.section.buttons.val = {
      -- dashboard.button("f", "  Find File", "<cmd>Telescope find_files<CR>"),
      -- dashboard.button("g", "󰱼  Live Grep", "<cmd>Telescope live_grep<CR>"),
      -- dashboard.button("r", "  Recent Files", "<cmd>Telescope oldfiles<CR>"),
      -- dashboard.button("o", "  Oil Explorer", "<cmd>Oil<CR>"),
      -- dashboard.button("l", "󰒲  Lazy", "<cmd>Lazy<CR>"),
      -- dashboard.button("q", "󰅚  Quit", "<cmd>qa<CR>"),
    }

    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "Keyword"
    end

    dashboard.section.footer.val = {
      "",
      "⚡ I use NeoVim BTW !",
    }

    dashboard.section.footer.opts.hl = "AlphaFooter"

    dashboard.opts.layout = {
      { type = "padding", val = 6 },
      dashboard.section.header,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
      { type = "padding", val = 2 },
      dashboard.section.footer,
    }

    dashboard.opts.opts.noautocmd = true

    alpha.setup(dashboard.opts)
  end,
}
