local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi

--debug purposes
local naughty = require("naughty")

local theme_dir = "/home/salty/.config/awesome/themes/powerarrow"
local get_taglist = function(s)

    --Taglist buttons
    local taglist_buttons = gears.table.join(
        awful.button({ }, 1, function(t) t:view_only() end),
        awful.button({ modkey }, 1, function(t)
            if client.focus then client.focus:move_to_tag(t) end
        end),
        awful.button({ }, 3, awful.tag.viewtoggle),
        awful.button({ modkey }, 3, function(t)
            if client.focus then client.focus:toggle_tag(t) end
        end),
        awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
        awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
    )

    local unfocus_color = "" ..
        "path { fill:#E0DEF4 }"
    local focus_color = "" ..
        "path { fill: #E0DEF4 }" --white
    local empty_color = "" ..
        "path { fill: #191724 }" --alacritty bg color

    local taglist_inactive = theme_dir .. "/icons/taglist/tag.svg"
    local taglist_icon = wibox.widget {
        image = taglist_inactive,
        --stylesheet = empty_color,
        resize = false,
        widget = wibox.widget.imagebox
    }

   --Function to update tags. Self is the widget, c3 the tag
    local upate_tags = function(self, c3)
        local tagicon = self:get_children_by_id('icon_role')[1]
        if c3.selected then
            tagicon.image = taglist_inactive
            tagicon.stylesheet = focus_color
        elseif #c3:clients() == 0 then
            tagicon.image = taglist_inactive
            tagicon.stylesheet = empty_color
        else 
            tagicon.image = taglist_inactive
            tagicon.stylesheet = unfocus_color
        end
    end
        
    --Build the taglist
    local icon_taglist = awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        layout = {
            spacing = 5,
            layout = wibox.layout.fixed.horizontal,
            color= "#DDDDDD",
            widget = wibox.widget.seperator,
        },
        widget_template = {
            {
                {
                    {
                        id = 'icon_role',
                        stylesheet=empty_color,
                        widget = wibox.widget.imagebox
                    },
                    margins= dpi(5),
                    widget = wibox.container.margin,
                },
                {
                    id='text_role',
                    widget=wibox.widget.textbox,
                    text="tag",
                    visible= true,
                },
                layout=wibox.layout.fixed.horizontal,
            },
            left = dpi(8),
            right = dpi(8),
            widget =wibox.container.margin,
            create_callback = function(self,c3, index, objects)
                update_tags(self,c3)
            end,

            update_callback = function(self,c3, index, objects)
                update_tags(self, c3)
            end

        },
        buttons = taglist_buttons
    }
    return icon_taglist
end

return get_taglist
