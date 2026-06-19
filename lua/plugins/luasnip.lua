return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  config = function()
    local snippet_dir = vim.fn.stdpath("config") .. "\\snippets"
    if vim.fn.isdirectory(snippet_dir) == 1 then
      local luasnip = require("luasnip")
      local files = vim.fn.glob(snippet_dir .. "\\*.lua", false, true)
      for _, filepath in ipairs(files) do
        local ft = vim.fn.fnamemodify(filepath, ":t:r")
        local ok, snips = pcall(dofile, filepath)
        if ok and type(snips) == "table" then
          luasnip.add_snippets(ft, snips)
          luasnip.refresh_notify(ft)
        end
      end
    end
  end,
}
