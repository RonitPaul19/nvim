local ls = require("luasnip")
local rep = require("luasnip.extras").rep

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {

  s("cmain", {
    t({
      "#include <stdio.h>",
      "",
      "int main(void) {",
      "  ",
    }),
    i(1),
    t({
      "",
      "  return 0;",
      "}",
    }),
  }),

  s("malloc", {
    t("("),
    i(1, "int"),
    t(" *)malloc(sizeof("),
    rep(1),
    t(") * "),
    i(2, "n"),
    t(")"),
  }),

}
