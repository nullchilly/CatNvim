local awful = require "awful"
local wibox = require "wibox"
local info_center = require "layout.info-center"

local beautiful = require "beautiful"
local dpi = beautiful.xresources.apply_dpi

-- Create a wibox panel for each screen and add it
screen.connect_signal("request::desktop_decoration", function(s)
	-- Each screen has its own tag table.
	-- Set tags layout
	tag.connect_signal("request::default_layouts", function()
		awful.layout.append_default_layouts {
			awful.layout.suit.tile,
			awful.layout.suit.floating,
			awful.layout.suit.max,
		}
	end)
	for i = 1, 9 do
		awful.tag.add(i, {
			layout = awful.layout.suit.tile,
			gap_single_client = false,
			screen = s,
			selected = i == 1,
		})
	end

	for _, c in ipairs(client.get()) do
	   if not (c.desired_screen == nil) then
		  local tag_name = c.first_tag.name
		  c:move_to_screen(c.desired_screen)
		  tag = awful.tag.find_by_name(c.screen, tag_name)
		  if not (tag == nil) then
			 c:move_to_tag(tag)
		  end
		  -- now clear the "desired_screen"
		  c.desired_screen = nil
	   end
	end


	require "widget.volume-slider"
	require "widget.brightness-slider"

	s.info_center_toggle = require "widget.info-center-toggle"()
	s.tray_toggler = require "widget.tray-toggle"
	s.bluetooth = require "widget.bluetooth"()
	s.network = require "widget.network"(s.index)
	local clock = require "widget.clock"(s)
	s.battery = require "widget.battery"()
	s.info_center_toggle = require "widget.info-center-toggle"()

	s.systray = wibox.widget {
		{
			base_size = dpi(20),
			horizontal = true,
			screen = "primary",
			widget = wibox.widget.systray,
		},
		visible = false,
		top = dpi(0),
		widget = wibox.container.margin,
	}

	s.mywibox = awful.wibar {
		position = "top",
		screen = s,
		visible = true,
		widget = {
			layout = wibox.layout.align.horizontal,
			{
				layout = wibox.layout.fixed.horizontal,
				require "widget.tag-list"(s),
				require "widget.task-list"(s),
			},
			nil,
			{
				layout = wibox.layout.fixed.horizontal,
				{
					wibox.widget.systray(),
					margins = dpi(5),
					widget = wibox.container.margin,
				},
				s.network,
				s.bluetooth,
				s.battery,
				clock,
				s.info_center_toggle,
			},
		},
	}
	s.info_center = info_center(s)
	s.info_center_show_again = false
end)
