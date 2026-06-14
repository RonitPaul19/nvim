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
      "  "
    }),
    i(1),
    t({
      "",
      "  return 0;",
      "}",
    }),
  }),

  s("main", {
    t({
      "int main(void) {",
      "  "
    }),
    i(1),
    t({
      "",
      "  return 0;",
      "}",
    }),
  }),

  s("for", {
    t("for (int i = "),
    i(1, "0"),
    t("; i < "),
    i(2, "n"),
    t({ "; i++) {", "  " }),
    i(3),
    t({ "", "}" }),
  }),

  s("rfor", {
    t("for (int i = "),
    i(1, "n - 1"),
    t("; i >= "),
    i(2, "0"),
    t({ "; i--) {", "  " }),
    i(3),
    t({ "", "}" }),
  }),

  s("while", {
    t("while ("),
    i(1, "condition"),
    t({ ") {", "  " }),
    i(2),
    t({ "", "}" }),
  }),

  s("if", {
    t("if ("),
    i(1, "condition"),
    t({ ") {", "  " }),
    i(2),
    t({ "", "}" }),
  }),

  s("elif", {
    t("else if ("),
    i(1, "condition"),
    t({ ") {", "  " }),
    i(2),
    t({ "", "}" }),
  }),

  s("else", {
    t({ "else {", "  " }),
    i(1),
    t({ "", "}" }),
  }),

  s("struct", {
    t("struct "),
    i(1, "Node"),
    t({ " {", "  " }),
    i(2, "int data;"),
    t({ "", "};" }),
  }),

  s("typedef", {
    t("typedef "),
    i(1, "unsigned int"),
    t(" "),
    i(2, "uint"),
    t(";"),
  }),

  s("printf", {
    t('printf("'),
    i(1, "%d"),
    t('\\n", '),
    i(2, "value"),
    t(");"),
  }),

  s("scanf", {
    t('scanf("'),
    i(1, "%d"),
    t('", &'),
    i(2, "x"),
    t(");"),
  }),

  s("arr", {
    t("int "),
    i(1, "arr"),
    t("["),
    i(2, "n"),
    t("];"),
  }),

  s("ptr", {
    t("int *"),
    i(1, "ptr"),
    t(";"),
  }),

  s("malloc", {
    t("("),
    i(1, "int"),
    t(" *)malloc(sizeof("),
    i(2, "int"),
    t(") * "),
    i(3, "n"),
    t(")"),
  }),

  s("enum", {
    t("enum "),
    i(1, "Color"),
    t({ " {", "  " }),
    i(2, "RED, GREEN, BLUE"),
    t({ "", "};" }),
  }),

  s("switch", {
    t("switch ("),
    i(1, "x"),
    t({ ") {", "case " }),
    i(2, "1"),
    t({ ":", "  " }),
    i(3, "break;"),
    t({ "", "", "default:", "  " }),
    i(4, "break;"),
    t({ "", "}" }),
  }),

}
