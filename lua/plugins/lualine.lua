return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "ThePrimeagen/harpoon",
  },
  config = function()
    local colors = {
      foam = "#9ccfd8",
      base = "#191724",
      white = "#ffffff",
    }

    -- Build one lualine component per harpoon slot
    local function harpoon_component(index)
      return {
        function()
          local ok, harpoon = pcall(require, "harpoon")
          if not ok then
            return ""
          end
          local item = harpoon:list():get(index)
          if not item then
            return ""
          end
          return " " .. vim.fn.fnamemodify(item.value, ":t") .. " "
        end,
        color = function()
          local ok, harpoon = pcall(require, "harpoon")
          if not ok then
            return { bg = "NONE", fg = colors.white }
          end
          local item = harpoon:list():get(index)
          if not item then
            return { bg = "NONE", fg = colors.white }
          end

          local full_path = vim.fn.fnamemodify(item.value, ":p")
          local current_file = vim.fn.expand("%:p")

          if full_path == current_file then
            return { bg = colors.foam, fg = colors.base, gui = "bold" }
          else
            return { bg = "NONE", fg = colors.white }
          end
        end,
        cond = function()
          local ok, harpoon = pcall(require, "harpoon")
          if not ok then
            return false
          end
          return harpoon:list():get(index) ~= nil
        end,
      }
    end

    local harpoon_slots = {}
    for i = 1, 4 do -- adjust if you keep more than 4 harpoon marks
      table.insert(harpoon_slots, harpoon_component(i))
    end

    require("lualine").setup({
      options = {
        theme = "rose-pine",
        component_separators = "",
        section_separators = "",
        globalstatus = true,
      },
      sections = {
        lualine_a = harpoon_slots,
        lualine_b = {},
        lualine_c = {},
        lualine_x = { "filetype" },
        lualine_y = {},
        lualine_z = { "mode" },
      },
    })
  end,
}
