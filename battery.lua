wibox = require("wibox")

batterywidget = wibox.widget.textbox()
batterywidget:set_text("Battery: xx%")
batterywidgettimer = timer({ timeout = 30 })
batterywidgettimer:connect_signal("timeout",
    function()
        fh = assert(io.popen("acpi | cut -d, -f 2,2 -", "r"))
        batterywidget:set_text("Battery:" .. fh:read("*l"))
        fh:close()
    end
)
batterywidgettimer:start()

return batterywidget
