local ls = require 'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require('luasnip.extras').lambda
local rep = require('luasnip.extras').rep
local p = require('luasnip.extras').partial
local m = require('luasnip.extras').match
local n = require('luasnip.extras').nonempty
local dl = require('luasnip.extras').dynamic_lambda
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local types = require 'luasnip.util.types'
local conds = require 'luasnip.extras.expand_conditions'

ls.config.set_config {
	history = true,
	update_events = 'TextChanged,TextChangedI',
	delete_check_events = 'TextChanged',
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { 'choiceNode', 'Comment' } },
			},
		},
	},
	ext_base_prio = 300,
	ext_prio_increase = 1,
	enable_autosnippets = true,
	store_selection_keys = '<Tab>',
	ft_func = function()
		return vim.split(vim.bo.filetype, '.', true)
	end,
}

require('luasnip.loaders.from_lua').lazy_load { paths = './snippets/luasnip' }
require('luasnip.loaders.from_snipmate').lazy_load { paths = './snippets/snipmate' }
