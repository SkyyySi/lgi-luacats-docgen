local lgi = require("lgi")
local Gio = lgi.require("Gio", "2.0")

local firefox = Gio.DesktopAppInfo.new("firefox.desktop")

for k, v in pairs(Gio.AppInfo.get_all()) do
	print(k, v)
end

local name = firefox:get_name()

print(name)
