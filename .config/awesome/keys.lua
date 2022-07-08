local awful = require "awful"

require "awful.autofocus"

local hotkeys_popup = require("awful.hotkeys_popup").widget
local modkey = "Mod4"
local altkey = "Mod1"

-- Key bindings
local global_keys = awful.util.table.join(

	-- Hotkeys
	-- awful.key({ modkey, "Control" }, "h", hotkeys_popup.show_help, { description = "show help", group = "awesome" }),
	awful.key({ modkey, altkey }, "l", function()
		awful.spawn("slock", false)
	end, { description = "lock screen", group = "awesome" }),
	awful.key({ modkey, "Control" }, "-", function()
		awful.spawn("setxkbmap -option caps:swapescape", false)
		awful.spawn("xset r rate 300 50", false)
	end, { description = "reload keyboard", group = "hotkeys" }),
	awful.key({ modkey, "Control" }, "r", awesome.restart, { description = "reload awesome", group = "awesome" }),

	awful.key({ modkey, "Control" }, "q", awesome.quit, { description = "quit awesome", group = "awesome" }),
	awful.key({ modkey }, "b", function()
		Myscreen = awful.screen.focused()
		Myscreen.mywibox.visible = not Myscreen.mywibox.visible
	end, { description = "toggle statusbar", group = "layout" }),
	awful.key({ modkey }, "l", function()
		awful.tag.incmwfact(0.05)
	end, { description = "increase master width factor", group = "layout" }),
	awful.key({ modkey }, "h", function()
		awful.tag.incmwfact(-0.05)
	end, { description = "decrease master width factor", group = "layout" }),
	awful.key({ modkey, "Shift" }, "l", function()
		awful.client.incwfact(0.05)
	end, { description = "increase master width factor", group = "layout" }),
	awful.key({ modkey, "Shift" }, "h", function()
		awful.client.incwfact(-0.05)
	end, { description = "decrease master width factor", group = "layout" }),
	awful.key({ modkey }, "i", function()
		awful.tag.incnmaster(1, nil, true)
	end, { description = "increase the number of master clients", group = "layout" }),
	awful.key({ modkey, "Shift" }, "i", function()
		awful.tag.incnmaster(-1, nil, true)
	end, { description = "decrease the number of master clients", group = "layout" }),
	awful.key({ modkey, "Control" }, "h", function()
		awful.tag.incncol(1, nil, true)
	end, { description = "increase the number of columns", group = "layout" }),
	awful.key({ modkey, "Control" }, "l", function()
		awful.tag.incncol(-1, nil, true)
	end, { description = "decrease the number of columns", group = "layout" }),
	awful.key({ modkey }, "space", function()
		awful.layout.inc(1)
	end, { description = "select next layout", group = "layout" }),
	awful.key({ modkey, "Shift" }, "space", function()
		awful.layout.inc(-1)
	end, { description = "select previous layout", group = "layout" }),
	awful.key({ modkey }, "o", function()
		awful.tag.incgap(1)
	end, { description = "increase gap", group = "layout" }),
	awful.key({ modkey, "Shift" }, "o", function()
		awful.tag.incgap(-1)
	end, { description = "decrease gap", group = "layout" }),
	awful.key({ modkey }, "w", awful.tag.viewprev, { description = "view previous tag", group = "tag" }),
	awful.key({ modkey }, "s", awful.tag.viewnext, { description = "view next tag", group = "tag" }),
	awful.key(
		{ modkey },
		"Tab",
		awful.tag.history.restore,
		{ description = "alternate between current and previous tag", group = "tag" }
	),
	-- awful.key({ modkey }, "Tab", function()
	-- 	awful.spawn("rofi -show windowcd -modi windowcd,window -theme ~/.config/rofi/theme/window.rasi", false)
	-- end, { description = "show windowcd", group = "tag" }),
	awful.key({ modkey }, ",", function()
		awful.screen.focus_relative(-1)
	end, { description = "focus the previous screen", group = "screen" }),
	awful.key({ modkey }, ".", function()
		awful.screen.focus_relative(1)
	end, { description = "focus the next screen", group = "screen" }),
	awful.key({ modkey, "Control" }, "n", function()
		local c = awful.client.restore()
		-- Focus restored client
		if c then
			c:emit_signal "request::activate"
			c:raise()
		end
	end, { description = "restore minimized", group = "screen" }),
	awful.key({}, "XF86KbdBrightnessUp", function()
		awful.spawn("asusctl -n", false)
	end, { description = "increase keyboard brightness", group = "hotkeys" }),
	awful.key({}, "XF86KbdBrightnessDown", function()
		awful.spawn("asusctl -p", false)
	end, { description = "decrease keyboard brightness", group = "hotkeys" }),
	awful.key({}, "XF86MonBrightnessUp", function()
		awful.spawn("light -A 10", false)
		awesome.emit_signal "widget::brightness"
		awesome.emit_signal("module::brightness_osd:show", true)
	end, { description = "increase brightness by 10%", group = "hotkeys" }),
	awful.key({}, "XF86MonBrightnessDown", function()
		awful.spawn("light -U 10", false)
		awesome.emit_signal "widget::brightness"
		awesome.emit_signal("module::brightness_osd:show", true)
	end, { description = "decrease brightness by 10%", group = "hotkeys" }),
	awful.key({ modkey }, "Right", function()
		awful.spawn("light -A 10", false)
		awesome.emit_signal "widget::brightness"
		awesome.emit_signal("module::brightness_osd:show", true)
	end, { description = "increase brightness by 10%", group = "hotkeys" }),
	awful.key({ modkey }, "Left", function()
		awful.spawn("light -U 10", false)
		awesome.emit_signal "widget::brightness"
		awesome.emit_signal("module::brightness_osd:show", true)
	end, { description = "decrease brightness by 10%", group = "hotkeys" }),
	-- ALSA volume control
	awful.key({}, "XF86AudioRaiseVolume", function()
		awful.spawn("pamixer -i 5", false)
		awesome.emit_signal "widget::volume"
		awesome.emit_signal("module::volume_osd:show", true)
	end, { description = "increase volume up by 5%", group = "hotkeys" }),
	awful.key({}, "XF86AudioLowerVolume", function()
		awful.spawn("pamixer -d 5", false)
		awesome.emit_signal "widget::volume"
		awesome.emit_signal("module::volume_osd:show", true)
	end, { description = "decrease volume up by 5%", group = "hotkeys" }),
	awful.key({ modkey }, "Up", function()
		awful.spawn("pamixer -i 5", false)
		awesome.emit_signal "widget::volume"
		awesome.emit_signal("module::volume_osd:show", true)
	end, { description = "increase volume up by 5%", group = "hotkeys" }),
	awful.key({ modkey }, "Down", function()
		awful.spawn("pamixer -d 5", false)
		awesome.emit_signal "widget::volume"
		awesome.emit_signal("module::volume_osd:show", true)
	end, { description = "decrease volume up by 5%", group = "hotkeys" }),
	awful.key(
		{},
		"F20", -- 'MICMUTE',
		function()
			awful.spawn("pamixer --default-source -t", false)
		end,
		{ description = "toggle mic mute", group = "hotkeys" }
	),
	awful.key({}, "XF86AudioMute", function()
		awful.spawn("pamixer --toggle-mute", false)
	end, { description = "toggle mute", group = "hotkeys" }),
	awful.key({}, "XF86AudioNext", function()
		awful.spawn("mpc next", false)
	end, { description = "next music", group = "hotkeys" }),
	awful.key({}, "XF86AudioPrev", function()
		awful.spawn("mpc prev", false)
	end, { description = "previous music", group = "hotkeys" }),
	awful.key({}, "XF86AudioPlay", function()
		awful.spawn("mpc toggle", false)
	end, { description = "play/pause music", group = "hotkeys" }
),
	awful.key({}, "XF86AudioMicMute", function()
		awful.spawn("amixer set Capture toggle", false)
	end, { description = "mute microphone", group = "hotkeys" }),
	awful.key({}, "XF86PowerDown", function()
		--
	end, { description = "shutdown skynet", group = "hotkeys" }),
	awful.key({}, "XF86PowerOff", function()
		awesome.emit_signal "module::exit_screen:show"
	end, { description = "toggle exit screen", group = "hotkeys" }),
	awful.key({}, "XF86Display", function()
		awful.spawn.single_instance("arandr", false)
	end, { description = "arandr", group = "hotkeys" }),
	awful.key({ modkey, "Shift" }, "q", function()
		awesome.emit_signal "module::exit_screen:show"
	end, { description = "toggle exit screen", group = "hotkeys" }),
	awful.key({ modkey }, "`", function()
		awesome.emit_signal "module::quake_terminal:toggle"
	end, { description = "dropdown application", group = "launcher" }),
	awful.key({}, "XF86Launch3", function()
		awful.spawn "asusctl led-mode -n"
	end, { description = "Next keyboad dance", group = "Utility" }),
	awful.key({}, "XF86Launch4", function()
		awful.spawn "asusctl profile -n"
	end, { description = "Next fan mode", group = "Utility" }),
	awful.key({ modkey }, "p", function()
		awful.spawn "flameshot gui"
	end, { description = "Take screenshot", group = "Utility" }),
	awful.key({ "Control" }, "Escape", function()
		if screen.primary.systray then
			if not screen.primary.tray_toggler then
				local systray = screen.primary.systray
				systray.visible = not systray.visible
			else
				awesome.emit_signal "widget::systray:toggle"
			end
		end
	end, { description = "toggle systray visibility", group = "Utility" }),
	awful.key({ modkey }, "Return", function()
		awful.spawn "kitty -1"
	end, { description = "open default terminal", group = "launcher" }),
	awful.key({ modkey }, "e", function()
		awful.spawn "kitty -1 lf"
	end, { description = "open default file manager", group = "launcher" }),
	awful.key({ modkey, "Shift" }, "f", function()
		awful.spawn "firefox"
	end, { description = "open default web browser", group = "launcher" }),
	awful.key({ "Control", "Shift" }, "Escape", function()
		awful.spawn "kitty -1 btop"
	end, { description = "open system monitor", group = "launcher" }),
	awful.key({ modkey }, "d", function()
		awful.spawn("rofi -show drun -theme ~/.config/rofi/theme/launcher.rasi", false)
	end, { description = "open application drawer", group = "launcher" }),
	awful.key({ modkey }, "r", function()
		awful.screen.focused().info_center:toggle()
	end, { description = "open info center", group = "launcher" })
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
	-- Hack to only show tags 1 and 9 in the shortcut window (mod+s)
	local descr_view, descr_toggle, descr_move, descr_toggle_focus
	if i == 1 or i == 9 then
		descr_view = { description = "view tag #", group = "tag" }
		descr_toggle = { description = "toggle tag #", group = "tag" }
		descr_move = { description = "move focused client to tag #", group = "tag" }
		descr_toggle_focus = { description = "toggle focused client on tag #", group = "tag" }
	end
	global_keys = awful.util.table.join(
		global_keys,
		-- View tag only.
		awful.key({ modkey }, "#" .. i + 9, function()
			local focused = awful.screen.focused()
			local tag = focused.tags[i]
			if tag then
				tag:view_only()
			end
		end, descr_view),
		-- Toggle tag display.
		awful.key({ modkey, "Control" }, "#" .. i + 9, function()
			local focused = awful.screen.focused()
			local tag = focused.tags[i]
			if tag then
				awful.tag.viewtoggle(tag)
			end
		end, descr_toggle),
		-- Move client to tag.
		awful.key({ modkey, "Shift" }, "#" .. i + 9, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:move_to_tag(tag)
				end
			end
		end, descr_move),
		-- Toggle tag on focused client.
		awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:toggle_tag(tag)
				end
			end
		end, descr_toggle_focus)
	)
end

root.keys(global_keys)
