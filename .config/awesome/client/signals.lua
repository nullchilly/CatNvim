local awful = require "awful"
local gears = require "gears"
local beautiful = require "beautiful"
local menubar = require "menubar"

-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c)
	-- Focus, raise and activate
	c:emit_signal("request::activate", "mouse_enter", {
		raise = true,
	})
	-- Set the windows at the slave,
	-- i.e. put it at the end of others instead of setting it master.
	if not awesome.startup then
		awful.client.setslave(c)
	end
end)

-- Set gtk icons
client.connect_signal("manage", function(c)
	awful.spawn.easy_async_with_shell("sleep 0.1", function()
		if c.valid then
			if c.instance ~= nil then
				local icon = menubar.utils.lookup_icon(c.instance)
				local lower_icon = menubar.utils.lookup_icon(c.instance:lower())
				if icon ~= nil then
					local new_icon = gears.surface(icon)
					c.icon = new_icon._native
				elseif lower_icon ~= nil then
					local new_icon = gears.surface(lower_icon)
					c.icon = new_icon._native
				elseif c.icon == nil then
					local new_icon = gears.surface(menubar.utils.lookup_icon "application-default-icon")
					c.icon = new_icon._native
				end
			else
				local new_icon = gears.surface(menubar.utils.lookup_icon "application-default-icon")
				c.icon = new_icon._native
			end
		end
	end)
end)

-- Enable sloppy focus, so that focus follows mouse then raises it.
client.connect_signal("mouse::enter", function(c)
	c:emit_signal("request::activate", "mouse_enter", {
		raise = false,
	})
end)

-- All floating clients are queen. If she breath, she's a thot
-- client.connect_signal("property::floating", function(c)
-- 	if c.floating then
-- 		c.ontop = true
-- 	end
-- end)

-- No borders when rearranging only 1 non-floating or maximized client
screen.connect_signal("arrange", function(s)
	local only_one = #s.tiled_clients == 1
	for _, c in pairs(s.clients) do
		if (s.selected_tag.layout.name == "max" or only_one) and not c.floating or c.maximized or c.fullscreen then
			c.border_width = 0
		else
			c.border_width = beautiful.border_width
		end
	end
end)

-- Multi monitor handling
-- Handle screen being removed.
-- We'll look for same tag names and move clients there, but preserve
-- the "desired_screen" so we can move them back when it's connected.
tag.connect_signal("request::screen", function(t)
    local fallback_tag = nil

    -- find tag with same name on any other screen
    for other_screen in screen do
        if other_screen ~= t.screen then
            fallback_tag = awful.tag.find_by_name(other_screen, t.name)
            if fallback_tag ~= nil then
                break
            end
        end
    end

    -- no tag with same name exists, use fallback
    if fallback_tag == nil then
        fallback_tag = awful.tag.find_fallback()
    end

    if not (fallback_tag == nil) then
        local clients = t:clients()
        for _, c in ipairs(clients) do
           c:move_to_tag(fallback_tag)
           -- preserve info about which screen the window was originally on, so
           -- we can restore it if the screen is reconnected.
           c.desired_screen = t.screen.index
        end
    end
end)

