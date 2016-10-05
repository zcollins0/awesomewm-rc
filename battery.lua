wibox = require("wibox")

batterywidget = wibox.widget.textbox()
batterywidget:set_text("Battery: xx%")
batterywidgettimer = timer({ timeout = 30 })
batterywidgettimer:connect_signal("timeout",
    function()
        fh = assert(io.popen("acpi | cut -d, -f 2,2 -", "r"))
        batStr = fh:read("*l")
        batNum = string.match(batStr, "%d..")
        batNum = string.gsub(batNum, "%%", "")
        if (batNum == nil or tonumber(batNum) < 21) then
            batterywidget:set_markup( '<span color="red">Battery:' .. batStr .. '</span>' )
        else
            batterywidget:set_text("Battery:" .. batStr)
        end
        fh:close()
    end
)
batterywidgettimer:start()

return batterywidget
