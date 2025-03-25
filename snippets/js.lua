print("hello from js.lua")

local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

ls.add_snippets("javascript", {
	-- Assign constant variable
	ls.add_snippets("javascript", {
		s("cc", {
			t("const "),
			i(1, "name"),
			t(" ="),
			i(0),
		}, {
			description = "Assign constant variable",
		}),
	}),
})
