---@meta lgi

--- # LGI
---
--- Use GObject-based libraries from Lua using GObject Introspection.
---
--- ---
---
---@class lgi
---@field GObject GObject
---@field GLib GLib
---@field Gio Gio
---@field Atk Atk
---@field Gtk Gtk
local lgi = {}

--- # function lgi.require()
---
--- Load a specific verison of a module (as supposed to the
--- highest version available).
---
--- ---
---
---@generic T1
---@param module `T1`
---@param version string
---@return T1
function lgi.require(module, version) end

return lgi

