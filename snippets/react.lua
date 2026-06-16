local ls = require("luasnip")
local rep = require("luasnip.extras").rep

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {

  s("rafce", {
    t("const "),
    i(1, "Component"),
    t({
      " = () => {",
      "  return (",
      "    <div>",
      "      ",
    }),
    i(2),
    t({
      "",
      "    </div>",
      "  )",
      "}",
      "",
      "export default ",
    }),
    rep(1),
  }),

  s("rafc", {
    t("const "),
    i(1, "Component"),
    t({
      " = () => {",
      "  return (",
      "    <div>",
      "      ",
    }),
    i(2),
    t({
      "",
      "    </div>",
      "  )",
      "}",
    }),
  }),

  s("usef", {
    t({
      "useEffect(() => {",
      "  ",
    }),
    i(1),
    t({
      "",
      "}, [])",
    }),
  }),

  s("usest", {
    t("const ["),
    i(1, "state"),
    t(", set"),
    rep(1),
    t("] = useState("),
    i(2),
    t(")"),
  }),

  s("usem", {
    t("const "),
    i(1, "value"),
    t(" = useMemo(() => {"),
    t({ "", "  return " }),
    i(2),
    t({
      "",
      "}, [])",
    }),
  }),

  s("usec", {
    t("const "),
    i(1, "callback"),
    t(" = useCallback(() => {"),
    t({ "", "  " }),
    i(2),
    t({
      "",
      "}, [])",
    }),
  }),

  s("useref", {
    t("const "),
    i(1, "ref"),
    t(" = useRef(null)"),
  }),

}
