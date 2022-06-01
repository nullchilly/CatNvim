local ls = require "luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require "luasnip.util.types"
local conds = require "luasnip.extras.expand_conditions"

local math = {
	condition = function()
		return vim.fn["vimtex#syntax#in_mathzone"]() == 1 and true or false
	end,
}

ls.add_snippets("tex", {
	s("mk", {
		t "$",
		i(1),
		t "$",
		i(0),
	}),
	s("beg", {
		t "\\begin{",
		i(1, "document"),
		t { "}", "\t" },
		i(2),
		t { "", "\\end{" },
		rep(1),
		t "}",
		i(0),
	}, {
		condition = conds.line_begin,
	}),
	s("def", {
		t "\\begin{",
		i(1, "Def"),
		t "}[",
		i(1),
		t { "]", "", "\t" },
		i(1),
		t { "", "\\end{Def}" },
		i(0),
	}, {
		condition = conds.line_begin,
	}),
	s("//", {
		t "\\cfrac{",
		i(1),
		t "}{",
		i(2),
		t "}",
		i(0),
	}, math),
	s({ trig = "(%d+)/", regTrig = true }, {
		f(function(_, snip)
			return "\\frac{" .. snip.captures[1] .. "}{"
		end, { 1 }),
		i(1),
		i(2),
		t "}",
		i(0),
	}, math),
	s("/", {
		f(function(_, snip)
			local visual = snip.env.TM_SELECTED_TEXT
			if next(visual) == nil then
				return "/"
			end
			return ("\\frac{" .. visual[1] .. "}{") or {}
		end, {}),
		i(1),
		f(function(_, snip)
			local visual = snip.env.TM_SELECTED_TEXT
			if next(visual) == nil then
				return {}
			end
			return "}"
		end, {}),
	}, math),
	s({ trig = "(%a)(%d) ", regTrig = true }, {
		f(function(_, snip)
			return snip.captures[1] .. "_" .. snip.captures[2] .. " "
		end, {}),
	}, math),
	s({ trig = "(%a)(%d+) ", regTrig = true }, {
		f(function(_, snip)
			return snip.captures[1] .. "_{" .. snip.captures[2] .. "} "
		end, {}),
	}, math),
	s("->", {
		t "\\to ",
	}, math),
	s("sr", {
		t "^2",
	}, math),
}, {
	type = "autosnippets",
	key = "tex",
})
