return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",

    config = function()
      -- Windows + MSYS2 UCRT64
      vim.env.CC = "gcc"
      vim.env.CXX = "g++"

      local ts = require("nvim-treesitter")

      ts.setup()

      ts.install({
        -- Core
        "c",
        "cpp",
        "lua",
        "python",

        -- JavaScript / TypeScript
        "javascript",
        "typescript",
        "tsx",

        -- Web
        "html",
        "css",
        "scss",

        -- Data / config
        "json",
        "yaml",
        "toml",

        -- Shell
        "bash",
        "powershell",

        -- Documentation
        "markdown",
        "markdown_inline",
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "c",
          "cpp",
          "lua",
          "python",

          "javascript",
          "javascriptreact",

          "typescript",
          "typescriptreact",

          "html",
          "css",
          "scss",

          "json",

          "yaml",
          "toml",

          "bash",
          "powershell",

          "markdown",
        },

        callback = function(args)
          pcall(vim.treesitter.start, args.buf)
        end,
      })
    end,

    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
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

          local select =
            require("nvim-treesitter-textobjects.select")

          -- Function
          vim.keymap.set({ "x", "o" }, "af", function()
            select.select_textobject(
              "@function.outer",
              "textobjects"
            )
          end, { desc = "Select function" })

          vim.keymap.set({ "x", "o" }, "if", function()
            select.select_textobject(
              "@function.inner",
              "textobjects"
            )
          end, { desc = "Select inside function" })

          -- Class
          vim.keymap.set({ "x", "o" }, "ac", function()
            select.select_textobject(
              "@class.outer",
              "textobjects"
            )
          end, { desc = "Select class" })

          vim.keymap.set({ "x", "o" }, "ic", function()
            select.select_textobject(
              "@class.inner",
              "textobjects"
            )
          end, { desc = "Select inside class" })

          -- Parameter
          vim.keymap.set({ "x", "o" }, "aa", function()
            select.select_textobject(
              "@parameter.outer",
              "textobjects"
            )
          end, { desc = "Select parameter" })

          vim.keymap.set({ "x", "o" }, "ia", function()
            select.select_textobject(
              "@parameter.inner",
              "textobjects"
            )
          end, { desc = "Select inside parameter" })

          local move =
            require("nvim-treesitter-textobjects.move")

          -- Functions
          vim.keymap.set({ "n", "x", "o" }, "]f", function()
            move.goto_next_start(
              "@function.outer",
              "textobjects"
            )
          end, { desc = "Next function" })

          vim.keymap.set({ "n", "x", "o" }, "[f", function()
            move.goto_previous_start(
              "@function.outer",
              "textobjects"
            )
          end, { desc = "Previous function" })

          -- Classes
          vim.keymap.set({ "n", "x", "o" }, "]c", function()
            move.goto_next_start(
              "@class.outer",
              "textobjects"
            )
          end, { desc = "Next class" })

          vim.keymap.set({ "n", "x", "o" }, "[c", function()
            move.goto_previous_start(
              "@class.outer",
              "textobjects"
            )
          end, { desc = "Previous class" })

          local swap =
            require("nvim-treesitter-textobjects.swap")

          vim.keymap.set("n", "<leader>sn", function()
            swap.swap_next("@parameter.inner")
          end, { desc = "Swap parameter forward" })

          vim.keymap.set("n", "<leader>sp", function()
            swap.swap_previous("@parameter.inner")
          end, { desc = "Swap parameter backward" })
        end,
      },
    },
  },
}

