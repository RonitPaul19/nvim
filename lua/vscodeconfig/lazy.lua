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
              ["@conditional.outer"] = "V",
              ["@loop.outer"] = "V",
              ["@comment.outer"] = "V",
              ["@call.outer"] = "V",
              ["@block.outer"] = "V",
            },

            include_surrounding_whitespace = false,
          },

          move = {
            set_jumps = true,
          },
        })

        local select = require("nvim-treesitter-textobjects.select")
        local move = require("nvim-treesitter-textobjects.move")
        local swap = require("nvim-treesitter-textobjects.swap")

        ----------------------------------------------------------------------
        -- SELECT
        ----------------------------------------------------------------------

        -- Functions
        vim.keymap.set({ "x", "o" }, "af", function()
          select.select_textobject("@function.outer", "textobjects")
        end, { desc = "Select function" })

        vim.keymap.set({ "x", "o" }, "if", function()
          select.select_textobject("@function.inner", "textobjects")
        end, { desc = "Select inside function" })

        -- Classes
        vim.keymap.set({ "x", "o" }, "ac", function()
          select.select_textobject("@class.outer", "textobjects")
        end, { desc = "Select class" })

        vim.keymap.set({ "x", "o" }, "ic", function()
          select.select_textobject("@class.inner", "textobjects")
        end, { desc = "Select inside class" })

        -- Parameters
        vim.keymap.set({ "x", "o" }, "aa", function()
          select.select_textobject("@parameter.outer", "textobjects")
        end, { desc = "Select parameter" })

        vim.keymap.set({ "x", "o" }, "ia", function()
          select.select_textobject("@parameter.inner", "textobjects")
        end, { desc = "Select inside parameter" })

        -- Conditionals: if / else / switch / match
        vim.keymap.set({ "x", "o" }, "ao", function()
          select.select_textobject("@conditional.outer", "textobjects")
        end, { desc = "Select conditional" })

        vim.keymap.set({ "x", "o" }, "io", function()
          select.select_textobject("@conditional.inner", "textobjects")
        end, { desc = "Select inside conditional" })

        -- Loops
        vim.keymap.set({ "x", "o" }, "al", function()
          select.select_textobject("@loop.outer", "textobjects")
        end, { desc = "Select loop" })

        vim.keymap.set({ "x", "o" }, "il", function()
          select.select_textobject("@loop.inner", "textobjects")
        end, { desc = "Select inside loop" })

        -- Comments
        vim.keymap.set({ "x", "o" }, "a/", function()
          select.select_textobject("@comment.outer", "textobjects")
        end, { desc = "Select comment" })

        vim.keymap.set({ "x", "o" }, "i/", function()
          select.select_textobject("@comment.inner", "textobjects")
        end, { desc = "Select inside comment" })

        -- Function calls
        vim.keymap.set({ "x", "o" }, "am", function()
          select.select_textobject("@call.outer", "textobjects")
        end, { desc = "Select function call" })

        vim.keymap.set({ "x", "o" }, "im", function()
          select.select_textobject("@call.inner", "textobjects")
        end, { desc = "Select inside function call" })

        -- Blocks
        vim.keymap.set({ "x", "o" }, "ab", function()
          select.select_textobject("@block.outer", "textobjects")
        end, { desc = "Select block" })

        vim.keymap.set({ "x", "o" }, "ib", function()
          select.select_textobject("@block.inner", "textobjects")
        end, { desc = "Select inside block" })

        ----------------------------------------------------------------------
        -- MOVE
        ----------------------------------------------------------------------

        -- Functions
        vim.keymap.set({ "n", "x", "o" }, "]f", function()
          move.goto_next_start("@function.outer", "textobjects")
        end, { desc = "Next function" })

        vim.keymap.set({ "n", "x", "o" }, "[f", function()
          move.goto_previous_start("@function.outer", "textobjects")
        end, { desc = "Previous function" })

        vim.keymap.set({ "n", "x", "o" }, "]F", function()
          move.goto_next_end("@function.outer", "textobjects")
        end, { desc = "End of next function" })

        vim.keymap.set({ "n", "x", "o" }, "[F", function()
          move.goto_previous_end("@function.outer", "textobjects")
        end, { desc = "End of previous function" })

        -- Classes
        vim.keymap.set({ "n", "x", "o" }, "]c", function()
          move.goto_next_start("@class.outer", "textobjects")
        end, { desc = "Next class" })

        vim.keymap.set({ "n", "x", "o" }, "[c", function()
          move.goto_previous_start("@class.outer", "textobjects")
        end, { desc = "Previous class" })

        -- Conditionals
        vim.keymap.set({ "n", "x", "o" }, "]o", function()
          move.goto_next_start("@conditional.outer", "textobjects")
        end, { desc = "Next conditional" })

        vim.keymap.set({ "n", "x", "o" }, "[o", function()
          move.goto_previous_start("@conditional.outer", "textobjects")
        end, { desc = "Previous conditional" })

        -- Loops
        vim.keymap.set({ "n", "x", "o" }, "]l", function()
          move.goto_next_start("@loop.outer", "textobjects")
        end, { desc = "Next loop" })

        vim.keymap.set({ "n", "x", "o" }, "[l", function()
          move.goto_previous_start("@loop.outer", "textobjects")
        end, { desc = "Previous loop" })

        ----------------------------------------------------------------------
        -- SWAP
        ----------------------------------------------------------------------

        -- Parameters
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
