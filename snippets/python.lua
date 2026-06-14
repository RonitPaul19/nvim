local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {

  s("py", {
    t({
      "#!/usr/bin/env python3",
      "",
      ""
    }),
    i(1),
  }),

  s("ifmain", {
    t({
      'if __name__ == "__main__":',
      '    '
    }),
    i(1, "main()"),
  }),

  s("def", {
    t("def "),
    i(1, "func"),
    t({ "(", }),
    i(2),
    t({ "):", "    " }),
    i(3, "pass"),
  }),

  s("class", {
    t("class "),
    i(1, "MyClass"),
    t({ ":", "    def __init__(self" }),
    i(2),
    t({ "):", "        " }),
    i(3, "pass"),
  }),

  s("for", {
    t("for "),
    i(1, "i"),
    t(" in "),
    i(2, "range(n)"),
    t({ ":", "    " }),
    i(3, "pass"),
  }),

  s("while", {
    t("while "),
    i(1, "condition"),
    t({ ":", "    " }),
    i(2, "pass"),
  }),

  s("if", {
    t("if "),
    i(1, "condition"),
    t({ ":", "    " }),
    i(2, "pass"),
  }),

  s("elif", {
    t("elif "),
    i(1, "condition"),
    t({ ":", "    " }),
    i(2, "pass"),
  }),

  s("else", {
    t({ "else:", "    " }),
    i(1, "pass"),
  }),

  s("try", {
    t({
      "try:",
      "    "
    }),
    i(1, "pass"),
    t({
      "",
      "except Exception as e:",
      "    "
    }),
    i(2, "print(e)"),
  }),

  s("imp", {
    t("import "),
    i(1, "module"),
  }),

  s("from", {
    t("from "),
    i(1, "module"),
    t(" import "),
    i(2, "name"),
  }),

  s("print", {
    t("print("),
    i(1),
    t(")"),
  }),

  s("input", {
    t("input()"),
  }),

  s("intin", {
    t("n = int(input())"),
  }),

  s("listin", {
    t("arr = list(map(int, input().split()))"),
  }),

  s("dict", {
    t("{}"),
  }),

  s("set", {
    t("set()"),
  }),

  s("list", {
    t("[]"),
  }),

  s("lambda", {
    t("lambda "),
    i(1, "x"),
    t(": "),
    i(2, "x"),
  }),

  s("comp", {
    t("["),
    i(1, "x"),
    t(" for "),
    i(2, "x"),
    t(" in "),
    i(3, "arr"),
    t("]"),
  }),

  s("fstr", {
    t('f"'),
    i(1),
    t('"'),
  }),

}
