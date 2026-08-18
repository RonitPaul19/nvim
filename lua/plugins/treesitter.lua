return {
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
      "vue",

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
}
