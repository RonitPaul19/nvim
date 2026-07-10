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
      "  ",
    }),
    i(1),
    t({
      "",
      "  return 0;",
      "}",
    }),
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

}
