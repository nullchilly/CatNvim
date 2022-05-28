local awful = require "awful"
local ruled = require "ruled"

ruled.client.connect_signal("request::rules", function()
	-- All clients will match this rule.
	ruled.client.append_rule {
		id = "global",
		rule = {},
		properties = {
			focus = awful.client.focus.filter,
			raise = true,
			-- floating = false,
			maximized = false,
			above = false,
			below = false,
			-- ontop = false,
			sticky = false,
			maximized_horizontal = false,
			maximized_vertical = false,
			keys = require "client.keys",
			buttons = require "client.buttons",
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap + awful.placement.no_offscreen,
		},
	}

	ruled.client.append_rule {
		id = "internet",
		rule_any = {
			class = {
				"discord",
			},
		},
		properties = {
			tag = "9",
		},
	}

	ruled.client.append_rule {
		id = "internet",
		rule_any = {
			class = {
				"firefox",
				"Tor Browser",
				"discord",
				"Chromium",
				"Google-chrome",
				"TelegramDesktop",
			},
		},
		properties = {},
	}

	-- Floating
	ruled.client.append_rule {
		id = "floating",
		rule_any = {
			instance = {
				"file_progress",
				"Popup",
				"nm-connection-editor",
				"blueman-manager",
				"Bluetooth",
				"Nmtui",
				"xfce4-power-manager-settings",
				"QuakeTerminal",
			},
			class = {
				"scrcpy",
				"Mugshot",
				"Pulseeffects",
			},
			role = {
				"AlarmWindow",
				"ConfigManager",
				"pop-up",
			},
		},
		properties = {
			titlebars_enabled = false,
			skip_decoration = true,
			ontop = true,
			floating = true,
			focus = awful.client.focus.filter,
			raise = true,
			keys = client_keys,
			buttons = client_buttons,
			placement = awful.placement.centered,
			width = awful.screen.focused().workarea.width * 0.8,
			height = awful.screen.focused().workarea.height * 0.8,
		},
	}
end)
