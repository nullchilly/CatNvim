local awful = require "awful"
local gears = require "gears"
local wibox = require "wibox"
local dpi = require("beautiful").xresources.apply_dpi
local clickable_container = require "widget.clickable-container"
local icons = require "theme.icons"
local beautiful = require "beautiful"

local modkey = "Mod4"

local tag_list = function(s)
	return awful.widget.taglist {
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = awful.util.table.join(
			awful.button({}, 1, function(t)
				t:view_only()
			end),
			awful.button({ modkey }, 1, function(t)
				if _G.client.focus then
					_G.client.focus:move_to_tag(t)
					t:view_only()
				end
			end),
			awful.button({}, 3, awful.tag.viewtoggle),
			awful.button({ modkey }, 3, function(t)
				if _G.client.focus then
					_G.client.focus:toggle_tag(t)
				end
			end),
			awful.button({}, 4, function(t)
				awful.tag.viewprev(t.screen)
			end),
			awful.button({}, 5, function(t)
				awful.tag.viewnext(t.screen)
			end)
		),
		style = {
			squares_sel = gears.surface.load_from_shape(
				dpi(30),
				dpi(3),
				gears.shape.transform(gears.shape.rectangle),
				"#03a9f4"
			),
			squares_sel_empty = gears.surface.load_from_shape(
				dpi(30),
				dpi(3),
				gears.shape.transform(gears.shape.rectangle),
				"#03a9f4"
			),
			squares_unsel = gears.surface.load_from_shape(
				dpi(30),
				dpi(3),
				gears.shape.transform(gears.shape.rectangle),
				"#d2ffcf"
			),
		},
		widget_template = {
			{
				{
					layout = wibox.layout.fixed.vertical,
					{
						{
							id = "text_role",
							widget = wibox.widget.textbox,
						},
						left = 12,
						right = 12,
						top = 10,
						bottom = 5,
						widget = wibox.container.margin,
					},
				},
				left = 0,
				right = 0,
				widget = wibox.container.margin,
			},
			id = "background_role",
			widget = wibox.container.background,
			shape = gears.shape.rectangle,
		},
	}
end

return tag_list
