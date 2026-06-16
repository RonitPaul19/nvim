local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {

  s("flexc", {
    t({
      "display: flex;",
      "justify-content: center;",
      "align-items: center;",
    }),
  }),

  s("gridc", {
    t({
      "display: grid;",
      "place-items: center;",
    }),
  }),

  s("media", {
    t({
      "@media (",
    }),
    i(1, "max-width: 768px"),
    t({
      ") {",
      "  ",
    }),
    i(2),
    t({
      "",
      "}",
    }),
  }),

  s("keyframes", {
    t({
      "@keyframes ",
    }),
    i(1, "fade"),
    t({
      " {",
      "  0% {",
      "    ",
    }),
    i(2),
    t({
      "",
      "  }",
      "  100% {",
      "    ",
    }),
    i(3),
    t({
      "",
      "  }",
      "}",
    }),
  }),

}
