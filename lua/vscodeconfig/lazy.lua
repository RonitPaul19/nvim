local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    {
      "nvim-treesitter/nvim-treesitter",
      dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
      },
      branch = "main",

      config = function()
        require("nvim-treesitter-textobjects").setup({
          select = {
            lookahead = true,

            selection_modes = {
              ["@parameter.outer"] = "v",
              ["@function.outer"] = "V",
              ["@class.outer"] = "V",
            },

            include_surrounding_whitespace = false,
          },

          move = {
            set_jumps = true,
          },
        })

        local select = require("nvim-treesitter-textobjects.select")

        -- Function
        vim.keymap.set({ "x", "o" }, "af", function()
          select.select_textobject("@function.outer", "textobjects")
        end, { desc = "Select function" })

        vim.keymap.set({ "x", "o" }, "if", function()
          select.select_textobject("@function.inner", "textobjects")
        end, { desc = "Select inside function" })

        -- Class
        vim.keymap.set({ "x", "o" }, "ac", function()
          select.select_textobject("@class.outer", "textobjects")
        end, { desc = "Select class" })

        vim.keymap.set({ "x", "o" }, "ic", function()
          select.select_textobject("@class.inner", "textobjects")
        end, { desc = "Select inside class" })

        -- Parameter
        vim.keymap.set({ "x", "o" }, "aa", function()
          select.select_textobject("@parameter.outer", "textobjects")
        end, { desc = "Select parameter" })

        vim.keymap.set({ "x", "o" }, "ia", function()
          select.select_textobject("@parameter.inner", "textobjects")
        end, { desc = "Select inside parameter" })

        local move = require("nvim-treesitter-textobjects.move")

        -- Functions
        vim.keymap.set({ "n", "x", "o" }, "]f", function()
          move.goto_next_start("@function.outer", "textobjects")
        end, { desc = "Next function" })

        vim.keymap.set({ "n", "x", "o" }, "[f", function()
          move.goto_previous_start("@function.outer", "textobjects")
        end, { desc = "Previous function" })

        -- Classes
        vim.keymap.set({ "n", "x", "o" }, "]c", function()
          move.goto_next_start("@class.outer", "textobjects")
        end, { desc = "Next class" })

        vim.keymap.set({ "n", "x", "o" }, "[c", function()
          move.goto_previous_start("@class.outer", "textobjects")
        end, { desc = "Previous class" })

        local swap = require("nvim-treesitter-textobjects.swap")

        vim.keymap.set("n", "<leader>sn", function()
          swap.swap_next("@parameter.inner")
        end, { desc = "Swap parameter forward" })

        vim.keymap.set("n", "<leader>sp", function()
          swap.swap_previous("@parameter.inner")
        end, { desc = "Swap parameter backward" })
      end,
    },
  },
  install = { colorscheme = { "habamax" } },
  checker = { enabled = false },
  change_detection = { notify = false },
})
