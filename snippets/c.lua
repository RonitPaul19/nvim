local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {

  s("c", {
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

  s("printf", {
    t('printf("'),
    i(1),
    t('\\n");'),
  }),

  s("scanf", {
    t('scanf("'),
    i(1, "%d"),
    t('", &'),
    i(2, "x"),
    t(");"),
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
