return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    ensure_installed = {
      "c",
      "cpp",
      "css",
      "go",
      "java",
      "javascript",
      "php",
      "python",
      "rust",
    },
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
  },
  config = function(_, opts)
    -- Force treesitter to use gcc instead of cl.exe (Windows MSVC workaround)
    -- Also set CC env var so tree-sitter CLI uses gcc (not cl.exe)
    vim.env.CC = "gcc"
    require("nvim-treesitter.install").compilers = { "gcc" }

    require("nvim-treesitter").setup(opts)

    vim.filetype.add({
      extension = {
        mdx = "mdx",
      },
    })
    vim.treesitter.language.register("markdown", "mdx")
  end,
}
