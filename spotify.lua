awful = require("awful")
wibox = require("wibox")

spotifywidget = wibox.widget.textbox()
function updateSpotifyWidget(widget)
    local currentsong = awful.util.pread("sp current-oneline")
    currentsong = string.gsub(currentsong, " | ", "::")
    widget:set_text(currentsong)
end
spotifytimer = timer({ timeout = 5 })
spotifytimer:connect_signal("timeout", function () updateSpotifyWidget(spotifywidget) end)
spotifytimer:start()
spotifytimer:emit_signal("timeout")

return spotifywidget
