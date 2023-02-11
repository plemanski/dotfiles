--[[

     Powerarrow Awesome WM theme
     github.com/lcpz

--]]

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi

local math, string, os = math, string, os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility


local theme                                     = {}
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/powerarrow"
theme.dir_wallpapers                            = os.getenv("HOME") .. "/Wallpapers"
theme.wallpaper                                 = theme.dir_wallpapers .. "/Art/The Frontier.jpg"
theme.font                                      = "Iosevka 10"
theme.border_width                              = dpi(2)
theme.border_normal                             = "#3F3F3F"
theme.border_focus                              = "#6F6F6F"
theme.border_marked                             = "#CC9393"
theme.titlebar_bg_focus                         = "#3F3F3F"
theme.titlebar_bg_normal                        = "#3F3F3F"
theme.titlebar_bg_focus                         = theme.bg_focus
theme.titlebar_bg_normal                        = theme.bg_normal
theme.titlebar_fg_focus                         = theme.fg_focus
theme.menu_height                               = dpi(16)
theme.menu_width                                = dpi(140)
theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png"
theme.awesome_icon                              = theme.dir .. "/icons/awesome.png"
theme.taglist_squares_sel                       = theme.dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel                     = theme.dir .. "/icons/square_unsel.png"
theme.layout_tile                               = theme.dir .. "/icons/tile.png"
theme.layout_tileleft                           = theme.dir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.dir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.dir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.dir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.dir .. "/icons/fairh.png"
theme.layout_spiral                             = theme.dir .. "/icons/spiral.png"
theme.layout_dwindle                            = theme.dir .. "/icons/dwindle.png"
theme.layout_max                                = theme.dir .. "/icons/max.png"
theme.layout_fullscreen                         = theme.dir .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme.dir .. "/icons/magnifier.png"
theme.layout_floating                           = theme.dir .. "/icons/floating.png"
theme.useless_gap                               = 5
theme.titlebar_close_button_focus               = theme.dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = theme.dir .. "/icons/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active        = theme.dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = theme.dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = theme.dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"


local markup = lain.util.markup
local separators = lain.util.separators

local function pl(widget, bgcolor, padding)
    return wibox.container.background(wibox.container.margin(widget, dpi(16), dpi(16)), bgcolor, theme.powerline_rl)
end

function theme.at_screen_connect(s)
        -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)


    -- Tags
    for i = 1, 6, 1
    do
        awful.tag.add(tostring(i), {
            --icon = empty_icon,
            --icon = theme.dir .. '/icons/taglist/tag-list-iris.svg',
            icon_only = true,
            layout = awful.layout.layouts[1],
            screen=s,
            selected = i == 1,
        })
    end 
    s.mypromptbox = awful.widget.prompt()
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(my_table.join(
                           awful.button({}, 1, function () awful.layout.inc( 1) end),
                           awful.button({}, 2, function () awful.layout.set( awful.layout.layouts[1] ) end),
                           awful.button({}, 4, function () awful.layout.inc(-1) end),
                           awful.button({}, 4, function () awful.layout.inc( 1) end),
                           awful.button({}, 5, function () awful.layout.inc(-1) end)))

    local batteryarc_widget = require("awesome-wm-widgets.batteryarc-widget.batteryarc")
    local volume_widget = require('awesome-wm-widgets.volume-widget.volume')
    local clock_widget = wibox.widget.textclock
    local spt_widget = require("awesome-wm-widgets.spotify-widget.spotifytui")
    local brightness_widget = require("awesome-wm-widgets.brightness-widget.brightness")
    
    s.mytaglist = require("themes.powerarrow.taglist")(s)
     
    -- Create the wibox
    s.mywibox =awful.wibar({ 
        position = "top",
        screen = s,
        height = dpi(35),
        bg = "#1f1d2e",
        --shape = gears.shape.rounded_bar,
        input_passthrough = true,
    })
    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        expand = "none",
        s.mylayoutbox,
        s.mytaglist,
        {
            {
                {
                    {
                        volume_widget({
                            widget_type = 'arc',
                            arc_thickness = 2,
                            main_color = '#9ccfd8',
                            bg_color = '#31748f',
                            mute_color = '#6e6a86',
                            size = 20,
                        }),
                        brightness_widget({
                            widget_type = 'arc',
                            program = 'xbacklight',
                            font = 'Iosevka 8',
                        }),
                        batteryarc_widget({
                            show_current_level = true,
                            arc_thickness = 2,
                            font = 'Iosevka 8',
                            main_color = '#9ccfd8',
                            bg_color = '#31748f',
                            low_level_color = '#eb6f92',
                            medium_level_color ='#9ccfd8',
                            charging_color = '#9ccfd8';
                            size = 20,
                        }),
                        clock_widget(),
                        layout = wibox.layout.fixed.horizontal,
                        spacing = 10,
                    },
                    top = 3,
                    bottom = 3,
                    left = 6,
                    right = 3,
                    widget = wibox.container.margin,
                },
                fg = '#c4a7e7',
                bg = '#2F2B47',
                shape = gears.shape.rounded_bar,
                widget = wibox.container.background,
            },
            top = 5,
            bottom = 5,
            right = 10,
            widget = wibox.container.margin,
        },
    }       
end

return theme
