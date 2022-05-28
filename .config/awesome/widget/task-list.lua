local awful = require "awful"
local wibox = require "wibox"
local dpi = require("beautiful").xresources.apply_dpi
local gears = require "gears"

local tasklist_buttons = awful.util.table.join(
	awful.button({}, 1, function(c)
		if c == client.focus then
			c.minimized = true
		else
			c.minimized = false
			if not c:isvisible() and c.first_tag then
				c.first_tag:view_only()
			end
			c:emit_signal "request::activate"
			c:raise()
		end
	end),
	awful.button({}, 2, function(c)
		c:kill()
	end),
	awful.button({}, 4, function()
		awful.client.focus.byidx(1)
	end),
	awful.button({}, 5, function()
		awful.client.focus.byidx(-1)
	end)
)

local task_list = function(s)
	return awful.widget.tasklist {
		screen = s,
		filter = awful.widget.tasklist.filter.currenttags,
		buttons = tasklist_buttons,
		style = {
			shape = gears.shape.rounded_rect,
		},
		layout = {
			spacing = 5,
			layout = wibox.layout.fixed.horizontal,
		},
		widget_template = {
			{
				layout = wibox.layout.fixed.horizontal,
				{
					awful.widget.clienticon,
					margins = dpi(5),
					layout = wibox.container.margin,
				},
				{
					{
						{
							id = "text_role",
							widget = wibox.widget.textbox,
						},
						width = 170,
						widget = wibox.container.constraint,
					},
					left = 2,
					right = 12,
					top = 5,
					bottom = 5,
					widget = wibox.container.margin,
				},
			},
			id = "background_role",
			widget = wibox.container.background,
		},
	}
end

return task_list
