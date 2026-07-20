return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "ThePrimeagen/harpoon",
  },

  config = function()
    local harpoon = require("harpoon")

    -- Active Harpoon item (Rose Pine Foam)
    vim.api.nvim_set_hl(0, "HarpoonActive", {
      fg = "#191724", -- Base
      bg = "#9ccfd8", -- Foam
      bold = true,
    })

    -- Inactive Harpoon items (transparent)
    vim.api.nvim_set_hl(0, "HarpoonInactive", {
      fg = "#e0def4", -- Text
      bg = "NONE",
    })

    local function harpoon_files()
      local list = harpoon:list()
      local current = vim.api.nvim_buf_get_name(0)
      local result = {}

      for i = 1, list:length() do
        local item = list:get(i)

        if item and item.value then
          local name = vim.fn.fnamemodify(item.value, ":t")

          if item.value == current then
            table.insert(
              result,
              "%#HarpoonActive# " .. i .. ":" .. name .. " %#Normal#"
            )
          else
            table.insert(
              result,
              "%#HarpoonInactive# " .. i .. ":" .. name .. " %#Normal#"
            )
          end
        end
      end

      return table.concat(result, " ")
    end

    require("lualine").setup({
      options = {
        theme = "rose-pine",
        component_separators = "",
        section_separators = "",
        globalstatus = true,
      },

      sections = {
        lualine_a = { harpoon_files },
        lualine_b = {},
        lualine_c = {},
        lualine_x = { "filetype" },
        lualine_y = {},
        lualine_z = { "mode" },
      },
    })
  end,
}
