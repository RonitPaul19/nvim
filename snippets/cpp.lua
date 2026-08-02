local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {

	s("cppmain", {
		t({
			"#include <iostream>",
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
}
