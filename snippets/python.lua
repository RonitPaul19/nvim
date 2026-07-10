local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {

  s("py", {
    t({
      "#!/usr/bin/env python3",
      "",
    }),
    i(1),
  }),

  s("ifmain", {
    t({
      'if __name__ == "__main__":',
      "    ",
    }),
    i(1, "main()"),
  }),

  s("intin", {
    t("n = int(input())"),
  }),

  s("listin", {
    t("arr = list(map(int, input().split()))"),
  }),

  s("fstr", {
    t('f"'),
    i(1),
    t('"'),
  }),

}
