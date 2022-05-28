local gears = require "gears"
local beautiful = require "beautiful"

local filesystem = gears.filesystem
local dpi = beautiful.xresources.apply_dpi
local gtk_variable = beautiful.gtk.get_theme_variables
local gtk_variable = beautiful.gtk.get_theme_variables

local theme_dir = filesystem.get_configuration_dir() .. "/theme"
local titlebar_theme = "lines"
local titlebar_icon_path = theme_dir .. "/icons/titlebar/" .. titlebar_theme .. "/"
local tip = titlebar_icon_path

-- Create theme table
local theme = {}

-- Colorscheme
theme.system_black_dark = "#3D4C5F"
theme.system_black_light = "#56687E"

theme.system_red_dark = "#EE4F84"
theme.system_red_light = "#F48FB1"

theme.system_green_dark = "#53E2AE"
theme.system_green_light = "#A1EFD3"

theme.system_yellow_dark = "#F1FF52"
theme.system_yellow_light = "#F1FA8C"

theme.system_blue_dark = "#6498EF"
theme.system_blue_light = "#92B6F4"

theme.system_magenta_dark = "#985EFF"
theme.system_magenta_light = "#BD99FF"

theme.system_cyan_dark = "#24D1E7"
theme.system_cyan_light = "#87DFEB"

theme.system_white_dark = "#E5E5E5"
theme.system_white_light = "#F8F8F2"

-- Accent color
theme.accent = theme.system_blue_dark

-- Background color
theme.background = "#000000"

-- Transparent
theme.transparent = "#121622" .. "99"

-- Awesome icon

--// End of linear \\-

-- Font
theme.font = "Inter Regular 10"
theme.font_bold = "Inter Bold 10"

-- Menu icon theme
theme.icon_theme = "candy-icons"

theme.dir = theme_dir
theme.icons = theme_dir .. "/icons/"
theme.awesome_icon = theme.icons .. "awesome.svg"

-- Default wallpaper path
theme.wallpaper = "~/Pictures/wallpapers/black.png"

-- Default font
theme.font = "Inter Regular 10"

-- Foreground
theme.fg_normal = "#ffffffde"
theme.fg_focus = "#e4e4e4"
theme.fg_urgent = "#CC9393"

theme.bg_normal = theme.background
theme.bg_focus = "#5a5a5a"
theme.bg_urgent = "#3F3F3F"

-- System tray
theme.bg_systray = theme.background
theme.systray_icon_spacing = dpi(16)

-- Titlebar
theme.titlebar_size = dpi(34)
theme.titlebar_bg_focus = gtk_variable().bg_color:sub(1, 7) .. "66"
theme.titlebar_bg_normal = gtk_variable().base_color:sub(1, 7) .. "66"
theme.titlebar_fg_focus = gtk_variable().fg_color
theme.titlebar_fg_normal = gtk_variable().fg_color

-- Close Button
theme.titlebar_close_button_normal = tip .. "close_normal.svg"
theme.titlebar_close_button_focus = tip .. "close_focus.svg"

-- Minimize Button
theme.titlebar_minimize_button_normal = tip .. "minimize_normal.svg"
theme.titlebar_minimize_button_focus = tip .. "minimize_focus.svg"

-- Ontop Button
theme.titlebar_ontop_button_normal_inactive = tip .. "ontop_normal_inactive.svg"
theme.titlebar_ontop_button_focus_inactive = tip .. "ontop_focus_inactive.svg"
theme.titlebar_ontop_button_normal_active = tip .. "ontop_normal_active.svg"
theme.titlebar_ontop_button_focus_active = tip .. "ontop_focus_active.svg"

-- Sticky Button
theme.titlebar_sticky_button_normal_inactive = tip .. "sticky_normal_inactive.svg"
theme.titlebar_sticky_button_focus_inactive = tip .. "sticky_focus_inactive.svg"
theme.titlebar_sticky_button_normal_active = tip .. "sticky_normal_active.svg"
theme.titlebar_sticky_button_focus_active = tip .. "sticky_focus_active.svg"

-- Floating Button
theme.titlebar_floating_button_normal_inactive = tip .. "floating_normal_inactive.svg"
theme.titlebar_floating_button_focus_inactive = tip .. "floating_focus_inactive.svg"
theme.titlebar_floating_button_normal_active = tip .. "floating_normal_active.svg"
theme.titlebar_floating_button_focus_active = tip .. "floating_focus_active.svg"

-- Maximized Button
theme.titlebar_maximized_button_normal_inactive = tip .. "maximized_normal_inactive.svg"
theme.titlebar_maximized_button_focus_inactive = tip .. "maximized_focus_inactive.svg"
theme.titlebar_maximized_button_normal_active = tip .. "maximized_normal_active.svg"
theme.titlebar_maximized_button_focus_active = tip .. "maximized_focus_active.svg"

-- Hovered Close Button
theme.titlebar_close_button_normal_hover = tip .. "close_normal_hover.svg"
theme.titlebar_close_button_focus_hover = tip .. "close_focus_hover.svg"

-- Hovered Minimize Buttin
theme.titlebar_minimize_button_normal_hover = tip .. "minimize_normal_hover.svg"
theme.titlebar_minimize_button_focus_hover = tip .. "minimize_focus_hover.svg"

-- Hovered Ontop Button
theme.titlebar_ontop_button_normal_inactive_hover = tip .. "ontop_normal_inactive_hover.svg"
theme.titlebar_ontop_button_focus_inactive_hover = tip .. "ontop_focus_inactive_hover.svg"
theme.titlebar_ontop_button_normal_active_hover = tip .. "ontop_normal_active_hover.svg"
theme.titlebar_ontop_button_focus_active_hover = tip .. "ontop_focus_active_hover.svg"

-- Hovered Sticky Button
theme.titlebar_sticky_button_normal_inactive_hover = tip .. "sticky_normal_inactive_hover.svg"
theme.titlebar_sticky_button_focus_inactive_hover = tip .. "sticky_focus_inactive_hover.svg"
theme.titlebar_sticky_button_normal_active_hover = tip .. "sticky_normal_active_hover.svg"
theme.titlebar_sticky_button_focus_active_hover = tip .. "sticky_focus_active_hover.svg"

-- Hovered Floating Button
theme.titlebar_floating_button_normal_inactive_hover = tip .. "floating_normal_inactive_hover.svg"
theme.titlebar_floating_button_focus_inactive_hover = tip .. "floating_focus_inactive_hover.svg"
theme.titlebar_floating_button_normal_active_hover = tip .. "floating_normal_active_hover.svg"
theme.titlebar_floating_button_focus_active_hover = tip .. "floating_focus_active_hover.svg"

-- Hovered Maximized Button
theme.titlebar_maximized_button_normal_inactive_hover = tip .. "maximized_normal_inactive_hover.svg"
theme.titlebar_maximized_button_focus_inactive_hover = tip .. "maximized_focus_inactive_hover.svg"
theme.titlebar_maximized_button_normal_active_hover = tip .. "maximized_normal_active_hover.svg"
theme.titlebar_maximized_button_focus_active_hover = tip .. "maximized_focus_active_hover.svg"

-- UI Groups
theme.groups_title_bg = "#ffffff" .. "15"
theme.groups_bg = "#ffffff" .. "10"
theme.groups_radius = dpi(9)

-- UI events
theme.leave_event = transparent
theme.enter_event = "#ffffff" .. "10"
theme.press_event = "#ffffff" .. "15"
theme.release_event = "#ffffff" .. "10"

-- Client Decorations

-- Borders
-- theme.border_focus = gtk_variable().base_color
theme.border_focus = "#87DFEB"
theme.border_normal = gtk_variable().bg_color
theme.border_marked = "#CC9393"
theme.border_width = dpi(1)
theme.border_radius = dpi(9)

-- Decorations
theme.useless_gap = dpi(4)

-- Menu
theme.menu_font = "Inter Regular 11"
theme.menu_submenu = "" -- ➤

theme.menu_height = dpi(34)
theme.menu_width = dpi(200)
theme.menu_border_width = dpi(20)
theme.menu_bg_focus = theme.accent .. "CC"

theme.menu_bg_normal = theme.background:sub(1, 7) .. "33"
theme.menu_fg_normal = "#ffffff"
theme.menu_fg_focus = "#ffffff"
theme.menu_border_color = theme.background:sub(1, 7) .. "5C"

-- Tooltips

theme.tooltip_bg = theme.background
theme.tooltip_border_color = theme.transparent
theme.tooltip_border_width = 0
theme.tooltip_gaps = dpi(5)
-- theme.tooltip_shape = function(cr, w, h)
--   gears.shape.rounded_rect(cr, w, h, dpi(6))
-- end

-- Separators
theme.separator_color = "#f2f2f244"

-- Layoutbox icons
theme.layout_max = theme.icons .. "layouts/max.svg"
theme.layout_tile = theme.icons .. "layouts/tile.svg"
theme.layout_dwindle = theme.icons .. "layouts/dwindle.svg"
theme.layout_floating = theme.icons .. "layouts/floating.svg"

-- Taglist
theme.taglist_bg_empty = theme.background .. "99"
-- theme.taglist_bg_occupied = '#000000' .. '99'
theme.taglist_fg_urgent = "#E91E63" .. "99"
-- theme.taglist_bg_urgent = '#000000' .. '99'
theme.taglist_bg_focus = "00"
theme.taglist_spacing = dpi(0)

theme.tag_preview_widget_border_radius = 0 -- Border radius of the widget (With AA)
theme.tag_preview_client_border_radius = 0 -- Border radius of each client in the widget (With AA)
theme.tag_preview_client_opacity = 1 -- Opacity of each client
theme.tag_preview_client_bg = "#000000" -- The bg color of each client
theme.tag_preview_client_border_color = "#ffffff" -- The border color of each client
theme.tag_preview_client_border_width = 0 -- The border width of each client
theme.tag_preview_widget_bg = "#000000" -- The bg color of the widget
theme.tag_preview_widget_border_color = "#ffffff" -- The border color of the widget
theme.tag_preview_widget_border_width = 0 -- The border width of the widget
theme.tag_preview_widget_margin = 0 -- The margin of the widget

-- Tasklist
theme.tasklist_font = "Inter Regular 10"
theme.tasklist_bg_normal = "#000000" .. "99"
theme.tasklist_bg_focus = "#20252b"
-- theme.tasklist_bg_urgent = '#E91E63' .. '99'
theme.tasklist_fg_focus = "#DDDDDD"
theme.tasklist_fg_urgent = "#ffffff"
theme.tasklist_fg_normal = "#AAAAAA"

theme.task_preview_widget_border_radius = 0 -- Border radius of the widget (With AA)
theme.task_preview_widget_bg = "#10171e" -- The bg color of the widget
theme.task_preview_widget_border_color = "#10171e" -- The border color of the widget
theme.task_preview_widget_border_width = 3 -- The border width of the widget
theme.task_preview_widget_margin = dpi(5) -- The margin of the widget

-- Notification
theme.notification_position = "top_right"
theme.notification_bg = theme.transparent
theme.notification_margin = dpi(5)
theme.notification_border_width = dpi(0)
theme.notification_border_color = theme.transparent
theme.notification_spacing = dpi(5)
theme.notification_icon_resize_strategy = "center"
theme.notification_icon_size = dpi(32)

-- Client Snap Theme
theme.snap_bg = theme.background
theme.snap_shape = gears.shape.rectangle
theme.snap_border_width = dpi(15)

-- Hotkey popup
theme.hotkeys_font = "Inter Bold"
theme.hotkeys_description_font = "Inter Regular Regular"
theme.hotkeys_bg = theme.background
theme.hotkeys_group_margin = dpi(20)

return theme
