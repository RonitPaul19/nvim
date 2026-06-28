return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      view = {
        side = "right",
        width = 30,
      },
      renderer = {
        highlight_git = true,
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "",
              arrow_open = "",
            },
          },
        },
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
      },
    })


    vim.keymap.set('n', '<leader>e', function()
      local api = require("nvim-tree.api")
      local view = require("nvim-tree.view")

      if vim.bo.filetype == "NvimTree" then
        api.tree.close()
        return
      end

      if view.is_visible() then
        api.tree.focus()
        return
      end

      api.tree.open()
    end, { desc = "Smart toggle file explorer" })
  end,
}
