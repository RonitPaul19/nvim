local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {

  s("clog", {
    t("console.log("),
    i(1),
    t(")"),
  }),

  s("clr", {
    t("console.log({ "),
    i(1),
    t(" })"),
  }),

  s("cerr", {
    t("console.error("),
    i(1),
    t(")"),
  }),

  s("cwar", {
    t("console.warn("),
    i(1),
    t(")"),
  }),

  s("iife", {
    t({
      "(function () {",
      "  ",
    }),
    i(1),
    t({
      "",
      "})();",
    }),
  }),

  s("prom", {
    t({
      "new Promise((resolve, reject) => {",
      "  ",
    }),
    i(1),
    t({
      "",
      "})",
    }),
  }),

  s("req", {
    t("const "),
    i(1, "module"),
    t(" = require('"),
    i(2),
    t("');"),
  }),

}
