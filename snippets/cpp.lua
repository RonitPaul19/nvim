local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {

  s("cppmain", {
    t({
      "#include <bits/stdc++.h>",
      "using namespace std;",
      "",
      "int main() {",
      "",
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
      "int main() {",
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

  s("foreach", {
    t("for (auto &"),
    i(1, "x"),
    t(" : "),
    i(2, "v"),
    t({ ") {", "  " }),
    i(3),
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

  s("while", {
    t("while ("),
    i(1, "condition"),
    t({ ") {", "  " }),
    i(2),
    t({ "", "}" }),
  }),

  s("cout", {
    t("cout << "),
    i(1),
    t(" << '\\n';"),
  }),

  s("cin", {
    t("cin >> "),
    i(1),
    t(";"),
  }),

  s("vec", {
    t("vector<"),
    i(1, "int"),
    t("> "),
    i(2, "v"),
    t(";"),
  }),

  s("pair", {
    t("pair<"),
    i(1, "int"),
    t(", "),
    i(2, "int"),
    t("> "),
    i(3, "p"),
    t(";"),
  }),

  s("str", {
    t("string "),
    i(1, "s"),
    t(";"),
  }),

  s("sort", {
    t("sort("),
    i(1, "v.begin()"),
    t(", "),
    i(2, "v.end()"),
    t(");"),
  }),

  s("pb", {
    t("push_back("),
    i(1),
    t(");"),
  }),

  s("em", {
    t("emplace_back("),
    i(1),
    t(");"),
  }),

  s("auto", {
    t("auto "),
    i(1, "x"),
    t(" = "),
    i(2),
    t(";"),
  }),

}
