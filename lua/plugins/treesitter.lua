return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
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
    -- Force treesitter to use clang instead of cl.exe
    require("nvim-treesitter.install").compilers = { "gcc", "clang" }

    require("nvim-treesitter").setup(opts)

    vim.filetype.add({
      extension = {
        mdx = "mdx",
      },
    })
    vim.treesitter.language.register("markdown", "mdx")
  end,
}
