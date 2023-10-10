---@meta Gdk

---@class Gdk
local Gdk = {}

---@alias Gdk.XEvent nil

---@enum Gdk.AnchorHints
Gdk.AnchorHints = {}

--- # class Gdk.AppLaunchContext
---
--- GdkAppLaunchContext is an implementation of `GAppLaunchContext` that
--- handles launching an application in a graphical context. It provides
--- startup notification and allows to launch applications on a specific
--- screen or workspace.
--- 
--- ## Launching an application
--- 
--- ```c
--- GdkAppLaunchContext *context;
--- 
--- context = gdk_display_get_app_launch_context (display);
--- 
--- gdk_app_launch_context_set_screen (screen);
--- gdk_app_launch_context_set_timestamp (event->time);
--- 
--- if (!g_app_info_launch_default_for_uri ("http://www.gtk.org", context, &error))
---   g_warning ("Launching failed: %s\n", error->message);
--- 
--- g_object_unref (context);
--- ```
---
--- ---
---
---@class Gdk.AppLaunchContext : Gio.AppLaunchContext
---@operator call: Gdk.AppLaunchContext
Gdk.AppLaunchContext = {}

--- # method Gdk.AppLaunchContext:set_desktop()
---
--- Sets the workspace on which applications will be launched when
--- using this context when running under a window manager that
--- supports multiple workspaces, as described in the
--- [Extended Window Manager Hints](http://www.freedesktop.org/Standards/wm-spec).
--- 
--- When the workspace is not specified or `desktop` is set to -1,
--- it is up to the window manager to pick one, typically it will
--- be the current workspace.
---
--- ---
---
---@param self Gdk.AppLaunchContext # a `GdkAppLaunchContext`
---@param desktop integer # the number of a workspace, or -1
---@return nil
function Gdk.AppLaunchContext:set_desktop(desktop) end

--- # method Gdk.AppLaunchContext:set_display()
---
--- Sets the display on which applications will be launched when
--- using this context. See also `gdk_app_launch_context_set_screen()`.
---
--- ---
---
---@param self Gdk.AppLaunchContext # a `GdkAppLaunchContext`
---@param display Gdk.Display # a `GdkDisplay`
---@return nil
function Gdk.AppLaunchContext:set_display(display) end

--- # method Gdk.AppLaunchContext:set_icon()
---
--- Sets the icon for applications that are launched with this
--- context.
--- 
--- Window Managers can use this information when displaying startup
--- notification.
--- 
--- See also `gdk_app_launch_context_set_icon_name()`.
---
--- ---
---
---@param self Gdk.AppLaunchContext # a `GdkAppLaunchContext`
---@param icon? Gio.Icon # a `GIcon`, or `nil`
---@return nil
function Gdk.AppLaunchContext:set_icon(icon) end

--- # method Gdk.AppLaunchContext:set_icon_name()
---
--- Sets the icon for applications that are launched with this context.
--- The `icon_name` will be interpreted in the same way as the Icon field
--- in desktop files. See also `gdk_app_launch_context_set_icon()`.
--- 
--- If both `icon` and `icon_name` are set, the `icon_name` takes priority.
--- If neither `icon` or `icon_name` is set, the icon is taken from either
--- the file that is passed to launched application or from the `GAppInfo`
--- for the launched application itself.
---
--- ---
---
---@param self Gdk.AppLaunchContext # a `GdkAppLaunchContext`
---@param icon_name? string # an icon name, or `nil`
---@return nil
function Gdk.AppLaunchContext:set_icon_name(icon_name) end

--- # method Gdk.AppLaunchContext:set_screen()
---
--- Sets the screen on which applications will be launched when
--- using this context. See also `gdk_app_launch_context_set_display()`.
--- 
--- Note that, typically, a `GdkScreen` represents a logical screen,
--- not a physical monitor.
--- 
--- If both `screen` and `display` are set, the `screen` takes priority.
--- If neither `screen` or `display` are set, the default screen and
--- display are used.
---
--- ---
---
---@param self Gdk.AppLaunchContext # a `GdkAppLaunchContext`
---@param screen Gdk.Screen # a `GdkScreen`
---@return nil
function Gdk.AppLaunchContext:set_screen(screen) end

--- # method Gdk.AppLaunchContext:set_timestamp()
---
--- Sets the timestamp of `context`. The timestamp should ideally
--- be taken from the event that triggered the launch.
--- 
--- Window managers can use this information to avoid moving the
--- focus to the newly launched application when the user is busy
--- typing in another window. This is also known as 'focus stealing
--- prevention'.
---
--- ---
---
---@param self Gdk.AppLaunchContext # a `GdkAppLaunchContext`
---@param timestamp integer # a timestamp
---@return nil
function Gdk.AppLaunchContext:set_timestamp(timestamp) end

--- # function Gdk.AppLaunchContext.new()
---
--- Creates a new `GdkAppLaunchContext`.
---
--- ---
---
---@return Gdk.AppLaunchContext # a new `GdkAppLaunchContext`
function Gdk.AppLaunchContext.new() end

--- # record Gdk.Atom
---
--- An opaque type representing a string as an index into a table
--- of strings on the X server.
---
--- ---
---
---@class Gdk.Atom
Gdk.Atom = {}

--- # method Gdk.Atom:name()
---
--- Determines the string corresponding to an atom.
---
--- ---
---
---@param self Gdk.Atom # a `GdkAtom`.
---@return string # a newly-allocated string containing the string corresponding to `atom`. When you are done with the return value, you should free it using `g_free()`.
function Gdk.Atom:name() end

--- # function Gdk.Atom.intern()
---
--- Finds or creates an atom corresponding to a given string.
---
--- ---
---
---@param atom_name string # a string.
---@param only_if_exists (boolean|nil) # if `true`, GDK is allowed to not create a new atom, but just return %GDK_NONE if the requested atom doesn’t already exists. Currently, the flag is ignored, since checking the existance of an atom is as expensive as creating it.
---@return Gdk.Atom # the atom corresponding to `atom_name`.
function Gdk.Atom.intern(atom_name, only_if_exists) end

--- # function Gdk.Atom.intern_static_string()
---
--- Finds or creates an atom corresponding to a given string.
--- 
--- Note that this function is identical to `gdk_atom_intern()` except
--- that if a new `GdkAtom` is created the string itself is used rather
--- than a copy. This saves memory, but can only be used if the string
--- will always exist. It can be used with statically
--- allocated strings in the main program, but not with statically
--- allocated memory in dynamically loaded modules, if you expect to
--- ever unload the module again (e.g. do not use this function in
--- GTK+ theme engines).
---
--- ---
---
---@param atom_name string # a static string
---@return Gdk.Atom # the atom corresponding to `atom_name`
function Gdk.Atom.intern_static_string(atom_name) end

---@enum Gdk.AxisFlags
Gdk.AxisFlags = {}

---@enum Gdk.AxisUse
Gdk.AxisUse = {}

---@enum Gdk.ByteOrder
Gdk.ByteOrder = {}

--- # record Gdk.Color
---
--- A `GdkColor` is used to describe a color,
--- similar to the XColor struct used in the X11 drawing API.
---
--- ---
---
---@class Gdk.Color
---@field pixel integer # For allocated colors, the pixel value used to draw this color on the screen. Not used anymore.
---@field red integer # The red component of the color. This is a value between 0 and 65535, with 65535 indicating full intensity
---@field green integer # The green component of the color
---@field blue integer # The blue component of the color
Gdk.Color = {}

--- # method Gdk.Color:copy()
---
--- Makes a copy of a `GdkColor`.
--- 
--- The result must be freed using `gdk_color_free()`.
---
--- ---
---
---@param self Gdk.Color # a `GdkColor`
---@return Gdk.Color # a copy of `color`
function Gdk.Color:copy() end

--- # method Gdk.Color:equal()
---
--- Compares two colors.
---
--- ---
---
---@param self Gdk.Color # a `GdkColor`
---@param colorb Gdk.Color # another `GdkColor`
---@return (boolean|nil) # `true` if the two colors compare equal
function Gdk.Color:equal(colorb) end

--- # method Gdk.Color:free()
---
--- Frees a `GdkColor` created with `gdk_color_copy()`.
---
--- ---
---
---@param self Gdk.Color # a `GdkColor`
---@return nil
function Gdk.Color:free() end

--- # method Gdk.Color:hash()
---
--- A hash function suitable for using for a hash
--- table that stores `GdkColors`.
---
--- ---
---
---@param self Gdk.Color # a `GdkColor`
---@return integer # The hash function applied to `color`
function Gdk.Color:hash() end

--- # method Gdk.Color:to_string()
---
--- Returns a textual specification of `color` in the hexadecimal
--- form “\`rrrrggggbbbb`” where “r”, “g” and “b” are hex digits
--- representing the red, green and blue components respectively.
--- 
--- The returned string can be parsed by `gdk_color_parse()`.
---
--- ---
---
---@param self Gdk.Color # a `GdkColor`
---@return string # a newly-allocated text string
function Gdk.Color:to_string() end

--- # function Gdk.Color.parse()
---
--- Parses a textual specification of a color and fill in the
--- `red`, `green`, and `blue` fields of a `GdkColor`.
--- 
--- The string can either one of a large set of standard names
--- (taken from the X11 `rgb.txt` file), or it can be a hexadecimal
--- value in the form “\`rgb`” “\`rrggbb`”, “\`rrrgggbbb`” or
--- “\`rrrrggggbbbb`” where “r”, “g” and “b” are hex digits of
--- the red, green, and blue components of the color, respectively.
--- (White in the four forms is “\`fff`”, “\`ffffff`”, “\`fffffffff`”
--- and “\`ffffffffffff`”).
---
--- ---
---
---@param spec string # the string specifying the color
---@param color Gdk.Color # the `GdkColor` to fill in
---@return (boolean|nil) # `true` if the parsing succeeded
function Gdk.Color.parse(spec, color) end

---@enum Gdk.CrossingMode
Gdk.CrossingMode = {}

--- # class Gdk.Cursor
---
--- A `GdkCursor` represents a cursor. Its contents are private.
---
--- ---
---
---@class Gdk.Cursor : GObject.Object
---@operator call: Gdk.Cursor
Gdk.Cursor = {}

--- # method Gdk.Cursor:get_cursor_type()
---
--- Returns the cursor type for this cursor.
---
--- ---
---
---@param self Gdk.Cursor # a `GdkCursor`
---@return Gdk.CursorType # a `GdkCursorType`
function Gdk.Cursor:get_cursor_type() end

--- # method Gdk.Cursor:get_display()
---
--- Returns the display on which the `GdkCursor` is defined.
---
--- ---
---
---@param self Gdk.Cursor # a `GdkCursor`.
---@return Gdk.Display # the `GdkDisplay` associated to `cursor`
function Gdk.Cursor:get_display() end

--- # method Gdk.Cursor:get_image()
---
--- Returns a `GdkPixbuf` with the image used to display the cursor.
--- 
--- Note that depending on the capabilities of the windowing system and
--- on the cursor, GDK may not be able to obtain the image data. In this
--- case, `nil` is returned.
---
--- ---
---
---@param self Gdk.Cursor # a `GdkCursor`
---@return GdkPixbuf.Pixbuf # a `GdkPixbuf` representing `cursor`, or `nil`
function Gdk.Cursor:get_image() end

--- # method Gdk.Cursor:get_surface()
---
--- Returns a cairo image surface with the image used to display the cursor.
--- 
--- Note that depending on the capabilities of the windowing system and
--- on the cursor, GDK may not be able to obtain the image data. In this
--- case, `nil` is returned.
---
--- ---
---
---@param self Gdk.Cursor # a `GdkCursor`
---@param x_hot? number # Location to store the hotspot x position, or `nil`
---@param y_hot? number # Location to store the hotspot y position, or `nil`
---@return cairo.Surface # a `cairo_surface_t` representing `cursor`, or `nil`
function Gdk.Cursor:get_surface(x_hot, y_hot) end

--- # method Gdk.Cursor:ref()
---
--- Adds a reference to `cursor`.
---
--- ---
---
---@param self Gdk.Cursor # a `GdkCursor`
---@return Gdk.Cursor # Same `cursor` that was passed in
function Gdk.Cursor:ref() end

--- # method Gdk.Cursor:unref()
---
--- Removes a reference from `cursor`, deallocating the cursor
--- if no references remain.
---
--- ---
---
---@param self Gdk.Cursor # a `GdkCursor`
---@return nil
function Gdk.Cursor:unref() end

--- # function Gdk.Cursor.new()
---
--- Creates a new cursor from the set of builtin cursors for the default display.
--- See `gdk_cursor_new_for_display()`.
--- 
--- To make the cursor invisible, use %GDK_BLANK_CURSOR.
---
--- ---
---
---@param cursor_type Gdk.CursorType # cursor to create
---@return Gdk.Cursor # a new `GdkCursor`
function Gdk.Cursor.new(cursor_type) end

--- # function Gdk.Cursor.new_for_display()
---
--- Creates a new cursor from the set of builtin cursors.
---
--- ---
---
---@param display Gdk.Display # the `GdkDisplay` for which the cursor will be created
---@param cursor_type Gdk.CursorType # cursor to create
---@return Gdk.Cursor # a new `GdkCursor`, or `nil` on failure
function Gdk.Cursor.new_for_display(display, cursor_type) end

--- # function Gdk.Cursor.new_from_name()
---
--- Creates a new cursor by looking up `name` in the current cursor
--- theme.
--- 
--- A recommended set of cursor names that will work across different
--- platforms can be found in the CSS specification:
--- - "none"
--- - ![](default_cursor.png) "default"
--- - ![](help_cursor.png) "help"
--- - ![](pointer_cursor.png) "pointer"
--- - ![](context_menu_cursor.png) "context-menu"
--- - ![](progress_cursor.png) "progress"
--- - ![](wait_cursor.png) "wait"
--- - ![](cell_cursor.png) "cell"
--- - ![](crosshair_cursor.png) "crosshair"
--- - ![](text_cursor.png) "text"
--- - ![](vertical_text_cursor.png) "vertical-text"
--- - ![](alias_cursor.png) "alias"
--- - ![](copy_cursor.png) "copy"
--- - ![](no_drop_cursor.png) "no-drop"
--- - ![](move_cursor.png) "move"
--- - ![](not_allowed_cursor.png) "not-allowed"
--- - ![](grab_cursor.png) "grab"
--- - ![](grabbing_cursor.png) "grabbing"
--- - ![](all_scroll_cursor.png) "all-scroll"
--- - ![](col_resize_cursor.png) "col-resize"
--- - ![](row_resize_cursor.png) "row-resize"
--- - ![](n_resize_cursor.png) "n-resize"
--- - ![](e_resize_cursor.png) "e-resize"
--- - ![](s_resize_cursor.png) "s-resize"
--- - ![](w_resize_cursor.png) "w-resize"
--- - ![](ne_resize_cursor.png) "ne-resize"
--- - ![](nw_resize_cursor.png) "nw-resize"
--- - ![](sw_resize_cursor.png) "sw-resize"
--- - ![](se_resize_cursor.png) "se-resize"
--- - ![](ew_resize_cursor.png) "ew-resize"
--- - ![](ns_resize_cursor.png) "ns-resize"
--- - ![](nesw_resize_cursor.png) "nesw-resize"
--- - ![](nwse_resize_cursor.png) "nwse-resize"
--- - ![](zoom_in_cursor.png) "zoom-in"
--- - ![](zoom_out_cursor.png) "zoom-out"
---
--- ---
---
---@param display Gdk.Display # the `GdkDisplay` for which the cursor will be created
---@param name string # the name of the cursor
---@return Gdk.Cursor # a new `GdkCursor`, or `nil` if there is no cursor with the given name
function Gdk.Cursor.new_from_name(display, name) end

--- # function Gdk.Cursor.new_from_pixbuf()
---
--- Creates a new cursor from a pixbuf.
--- 
--- Not all GDK backends support RGBA cursors. If they are not
--- supported, a monochrome approximation will be displayed.
--- The functions `gdk_display_supports_cursor_alpha()` and
--- `gdk_display_supports_cursor_color()` can be used to determine
--- whether RGBA cursors are supported;
--- `gdk_display_get_default_cursor_size()` and
--- `gdk_display_get_maximal_cursor_size()` give information about
--- cursor sizes.
--- 
--- If `x` or `y` are `-1`, the pixbuf must have
--- options named “x_hot” and “y_hot”, resp., containing
--- integer values between `0` and the width resp. height of
--- the pixbuf. (Since: 3.0)
--- 
--- On the X backend, support for RGBA cursors requires a
--- sufficently new version of the X Render extension.
---
--- ---
---
---@param display Gdk.Display # the `GdkDisplay` for which the cursor will be created
---@param pixbuf GdkPixbuf.Pixbuf # the `GdkPixbuf` containing the cursor image
---@param x integer # the horizontal offset of the “hotspot” of the cursor.
---@param y integer # the vertical offset of the “hotspot” of the cursor.
---@return Gdk.Cursor # a new `GdkCursor`.
function Gdk.Cursor.new_from_pixbuf(display, pixbuf, x, y) end

--- # function Gdk.Cursor.new_from_surface()
---
--- Creates a new cursor from a cairo image surface.
--- 
--- Not all GDK backends support RGBA cursors. If they are not
--- supported, a monochrome approximation will be displayed.
--- The functions `gdk_display_supports_cursor_alpha()` and
--- `gdk_display_supports_cursor_color()` can be used to determine
--- whether RGBA cursors are supported;
--- `gdk_display_get_default_cursor_size()` and
--- `gdk_display_get_maximal_cursor_size()` give information about
--- cursor sizes.
--- 
--- On the X backend, support for RGBA cursors requires a
--- sufficently new version of the X Render extension.
---
--- ---
---
---@param display Gdk.Display # the `GdkDisplay` for which the cursor will be created
---@param surface cairo.Surface # the cairo image surface containing the cursor pixel data
---@param x number # the horizontal offset of the “hotspot” of the cursor
---@param y number # the vertical offset of the “hotspot” of the cursor
---@return Gdk.Cursor # a new `GdkCursor`.
function Gdk.Cursor.new_from_surface(display, surface, x, y) end

---@enum Gdk.CursorType
Gdk.CursorType = {}

--- # class Gdk.Device
---
--- The `GdkDevice` object represents a single input device, such
--- as a keyboard, a mouse, a touchpad, etc.
--- 
--- See the `GdkDeviceManager` documentation for more information
--- about the various kinds of master and slave devices, and their
--- relationships.
---
--- ---
---
---@class Gdk.Device : GObject.Object
Gdk.Device = {}

--- # method Gdk.Device:get_associated_device()
---
--- Returns the associated device to `device`, if `device` is of type
--- %GDK_DEVICE_TYPE_MASTER, it will return the paired pointer or
--- keyboard.
--- 
--- If `device` is of type %GDK_DEVICE_TYPE_SLAVE, it will return
--- the master device to which `device` is attached to.
--- 
--- If `device` is of type %GDK_DEVICE_TYPE_FLOATING, `nil` will be
--- returned, as there is no associated device.
---
--- ---
---
---@param self Gdk.Device # a `GdkDevice`
---@return Gdk.Device # The associated device, or `nil`
function Gdk.Device:get_associated_device() end

--- # method Gdk.Device:get_axes()
---
--- Returns the axes currently available on the device.
---
--- ---
---
---@param self Gdk.Device # a `GdkDevice`
---@return Gdk.AxisFlags
function Gdk.Device:get_axes() end

--- # method Gdk.Device:get_axis_use()
---
--- Returns the axis use for `index_`.
---
--- ---
---
---@param self Gdk.Device # a pointer `GdkDevice`.
---@param index_ integer # the index of the axis.
---@return Gdk.AxisUse # a `GdkAxisUse` specifying how the axis is used.
function Gdk.Device:get_axis_use(index_) end

--- # method Gdk.Device:get_device_type()
---
--- Returns the device type for `device`.
---
--- ---
---
---@param self Gdk.Device # a `GdkDevice`
---@return Gdk.DeviceType # the `GdkDeviceType` for `device`.
function Gdk.Device:get_device_type() end

--- # method Gdk.Device:get_display()
---
--- Returns the `GdkDisplay` to which `device` pertains.
---
--- ---
---
---@param self Gdk.Device # a `GdkDevice`
---@return Gdk.Display # a `GdkDisplay`. This memory is owned by GTK+, and must not be freed or unreffed.
function Gdk.Device:get_display() end

--- # method Gdk.Device:get_has_cursor()
---
--- Determines whether the pointer follows device motion.
--- This is not meaningful for keyboard devices, which don't have a pointer.
---
--- ---
---
---@param self Gdk.Device # a `GdkDevice`
---@return (boolean|nil) # `true` if the pointer follows device motion
function Gdk.Device:get_has_cursor() end

--- # method Gdk.Device:get_key()
---
--- If `index_` has a valid keyval, this function will return `true`
--- and fill in `keyval` and `modifiers` with the keyval settings.
---
--- ---
---
---@param self Gdk.Device # a `GdkDevice`.
---@param index_ integer # the index of the macro button to get.
---@param keyval integer # return value for the keyval.
---@param modifiers Gdk.ModifierType # return value for modifiers.
---@return (boolean|nil) # `true` if keyval is set for `index`.
function Gdk.Device:get_key(index_, keyval, modifiers) end

--- # method Gdk.Device:get_last_event_window()
---
--- Gets information about which window the given pointer device is in, based on events
--- that have been received so far from the display server. If another application
--- has a pointer grab, or this application has a grab with owner_events = `false`,
--- `nil` may be returned even if the pointer is physically over one of this
--- application's windows.
---
--- ---
---
---@param self Gdk.Device # a `GdkDevice`, with a source other than %GDK_SOURCE_KEYBOARD
---@return Gdk.Window # the last window the device
function Gdk.Device:get_last_event_window() end

--- # method Gdk.Device:get_mode()
---
--- Determines the mode of the device.
---
--- ---
---
---@param self Gdk.Device # a `GdkDevice`
---@return Gdk.InputMode # a `GdkInputSource`
function Gdk.Device:get_mode() end

--- # method Gdk.Device:get_n_axes()
---
--- Returns the number of axes the device currently has.
---
--- ---
---
---@param self Gdk.Device # a pointer `GdkDevice`
---@return integer # the number of axes.
function Gdk.Device:get_n_axes() end

--- # method Gdk.Device:get_n_keys()
---
--- Returns the number of keys the device currently has.
---
--- ---
---
---@param self Gdk.Device # a `GdkDevice`
---@return integer # the number of keys.
function Gdk.Device:get_n_keys() end

--- # method Gdk.Device:get_name()
---
--- Determines the name of the device.
---
--- ---
---
---@param self Gdk.Device # a `GdkDevice`
---@return string # a name
function Gdk.Device:get_name() end

--- # method Gdk.Device:get_position()
---
--- Gets the current location of `device`. As a slave device
--- coordinates are those of its master pointer, This function
--- may not be called on devices of type %GDK_DEVICE_TYPE_SLAVE,
--- unless there is an ongoing grab on them, see `gdk_device_grab()`.
---
--- ---
---
---@param self Gdk.Device # pointer device to query status about.
---@param screen? Gdk.Screen # location to store the `GdkScreen` the `device` is on, or `nil`.
---@param x? integer # location to store root window X coordinate of `device`, or `nil`.
---@param y? integer # location to store root window Y coordinate of `device`, or `nil`.
---@return nil
function Gdk.Device:get_position(screen, x, y) end

--- # method Gdk.Device:get_position_double()
---
--- Gets the current location of `device` in double precision. As a slave device's
--- coordinates are those of its master pointer, this function
--- may not be called on devices of type %GDK_DEVICE_TYPE_SLAVE,
--- unless there is an ongoing grab on them. See `gdk_device_grab()`.
---
--- ---
---
---@param self Gdk.Device # pointer device to query status about.
---@param screen? Gdk.Screen # location to store the `GdkScreen` the `device` is on, or `nil`.
---@param x? number # location to store root window X coordinate of `device`, or `nil`.
---@param y? number # location to store root window Y coordinate of `device`, or `nil`.
---@return nil
function Gdk.Device:get_position_double(screen, x, y) end

--- # method Gdk.Device:get_product_id()
---
--- Returns the product ID of this device, or `nil` if this information couldn't
--- be obtained. This ID is retrieved from the device, and is thus constant for
--- it. See `gdk_device_get_vendor_id()` for more information.
---
--- ---
---
---@param self Gdk.Device # a slave `GdkDevice`
---@return string # the product ID, or `nil`
function Gdk.Device:get_product_id() end

--- # method Gdk.Device:get_seat()
---
--- Returns the `GdkSeat` the device belongs to.
---
--- ---
---
---@param self Gdk.Device # A `GdkDevice`
---@return Gdk.Seat # A `GdkSeat`. This memory is owned by GTK+ and must not be freed.
function Gdk.Device:get_seat() end

--- # method Gdk.Device:get_source()
---
--- Determines the type of the device.
---
--- ---
---
---@param self Gdk.Device # a `GdkDevice`
---@return Gdk.InputSource # a `GdkInputSource`
function Gdk.Device:get_source() end

--- # method Gdk.Device:get_vendor_id()
---
--- Returns the vendor ID of this device, or `nil` if this information couldn't
--- be obtained. This ID is retrieved from the device, and is thus constant for
--- it.
--- 
--- This function, together with `gdk_device_get_product_id()`, can be used to eg.
--- compose `GSettings` paths to store settings for this device.
--- 
--- ```c
---  static GSettings *
---  get_device_settings (GdkDevice *device)
---  {
---    const gchar *vendor, *product;
---    GSettings *settings;
---    GdkDevice *device;
---    gchar *path;
--- 
---    vendor = gdk_device_get_vendor_id (device);
---    product = gdk_device_get_product_id (device);
--- 
---    path = g_strdup_printf ("/org/example/app/devices/%s:%s/", vendor, product);
---    settings = g_settings_new_with_path (DEVICE_SCHEMA, path);
---    g_free (path);
--- 
---    return settings;
---  }
--- ```
---
--- ---
---
---@param self Gdk.Device # a slave `GdkDevice`
---@return string # the vendor ID, or `nil`
function Gdk.Device:get_vendor_id() end

--- # method Gdk.Device:get_window_at_position()
---
--- Obtains the window underneath `device`, returning the location of the device in `win_x` and `win_y`. Returns
--- `nil` if the window tree under `device` is not known to GDK (for example, belongs to another application).
--- 
--- As a slave device coordinates are those of its master pointer, This
--- function may not be called on devices of type %GDK_DEVICE_TYPE_SLAVE,
--- unless there is an ongoing grab on them, see `gdk_device_grab()`.
---
--- ---
---
---@param self Gdk.Device # pointer `GdkDevice` to query info to.
---@param win_x? integer # return location for the X coordinate of the device location, relative to the window origin, or `nil`.
---@param win_y? integer # return location for the Y coordinate of the device location, relative to the window origin, or `nil`.
---@return Gdk.Window # the `GdkWindow` under the device position, or `nil`.
function Gdk.Device:get_window_at_position(win_x, win_y) end

--- # method Gdk.Device:get_window_at_position_double()
---
--- Obtains the window underneath `device`, returning the location of the device in `win_x` and `win_y` in
--- double precision. Returns `nil` if the window tree under `device` is not known to GDK (for example,
--- belongs to another application).
--- 
--- As a slave device coordinates are those of its master pointer, This
--- function may not be called on devices of type %GDK_DEVICE_TYPE_SLAVE,
--- unless there is an ongoing grab on them, see `gdk_device_grab()`.
---
--- ---
---
---@param self Gdk.Device # pointer `GdkDevice` to query info to.
---@param win_x? number # return location for the X coordinate of the device location, relative to the window origin, or `nil`.
---@param win_y? number # return location for the Y coordinate of the device location, relative to the window origin, or `nil`.
---@return Gdk.Window # the `GdkWindow` under the device position, or `nil`.
function Gdk.Device:get_window_at_position_double(win_x, win_y) end

--- # method Gdk.Device:grab()
---
--- Grabs the device so that all events coming from this device are passed to
--- this application until the device is ungrabbed with `gdk_device_ungrab()`,
--- or the window becomes unviewable. This overrides any previous grab on the device
--- by this client.
--- 
--- Note that `device` and `window` need to be on the same display.
--- 
--- Device grabs are used for operations which need complete control over the
--- given device events (either pointer or keyboard). For example in GTK+ this
--- is used for Drag and Drop operations, popup menus and such.
--- 
--- Note that if the event mask of an X window has selected both button press
--- and button release events, then a button press event will cause an automatic
--- pointer grab until the button is released. X does this automatically since
--- most applications expect to receive button press and release events in pairs.
--- It is equivalent to a pointer grab on the window with `owner_events` set to
--- `true`.
--- 
--- If you set up anything at the time you take the grab that needs to be
--- cleaned up when the grab ends, you should handle the `GdkEventGrabBroken`
--- events that are emitted when the grab ends unvoluntarily.
---
--- ---
---
---@param self Gdk.Device # a `GdkDevice`. To get the device you can use `gtk_get_current_event_device()` or `gdk_event_get_device()` if the grab is in reaction to an event. Also, you can use `gdk_device_manager_get_client_pointer()` but only in code that isn’t triggered by a `GdkEvent` and there aren’t other means to get a meaningful `GdkDevice` to operate on.
---@param window Gdk.Window # the `GdkWindow` which will own the grab (the grab window)
---@param grab_ownership Gdk.GrabOwnership # specifies the grab ownership.
---@param owner_events (boolean|nil) # if `false` then all device events are reported with respect to `window` and are only reported if selected by `event_mask`. If `true` then pointer events for this application are reported as normal, but pointer events outside this application are reported with respect to `window` and only if selected by `event_mask`. In either mode, unreported events are discarded.
---@param event_mask Gdk.EventMask # specifies the event mask, which is used in accordance with `owner_events`.
---@param cursor? Gdk.Cursor # the cursor to display while the grab is active if the device is a pointer. If this is `nil` then the normal cursors are used for `window` and its descendants, and the cursor for `window` is used elsewhere.
---@param time_ integer # the timestamp of the event which led to this pointer grab. This usually comes from the `GdkEvent` struct, though %GDK_CURRENT_TIME can be used if the time isn’t known.
---@return Gdk.GrabStatus # %GDK_GRAB_SUCCESS if the grab was successful.
function Gdk.Device:grab(window, grab_ownership, owner_events, event_mask, cursor, time_) end

--- # method Gdk.Device:list_axes()
---
--- Returns a `GList` of `GdkAtoms`, containing the labels for
--- the axes that `device` currently has.
---
--- ---
---
---@param self Gdk.Device # a pointer `GdkDevice`
---@return Gdk.Atom[] # A `GList` of `GdkAtoms`, free with `g_list_free()`.
function Gdk.Device:list_axes() end

--- # method Gdk.Device:list_slave_devices()
---
--- If the device if of type %GDK_DEVICE_TYPE_MASTER, it will return
--- the list of slave devices attached to it, otherwise it will return
--- `nil`
---
--- ---
---
---@param self Gdk.Device # a `GdkDevice`
---@return Gdk.Device[] # the list of slave devices, or `nil`. The list must be freed with `g_list_free()`, the contents of the list are owned by GTK+ and should not be freed.
function Gdk.Device:list_slave_devices() end

--- # method Gdk.Device:set_axis_use()
---
--- Specifies how an axis of a device is used.
---
--- ---
---
---@param self Gdk.Device # a pointer `GdkDevice`
---@param index_ integer # the index of the axis
---@param use Gdk.AxisUse # specifies how the axis is used
---@return nil
function Gdk.Device:set_axis_use(index_, use) end

--- # method Gdk.Device:set_key()
---
--- Specifies the X key event to generate when a macro button of a device
--- is pressed.
---
--- ---
---
---@param self Gdk.Device # a `GdkDevice`
---@param index_ integer # the index of the macro button to set
---@param keyval integer # the keyval to generate
---@param modifiers Gdk.ModifierType # the modifiers to set
---@return nil
function Gdk.Device:set_key(index_, keyval, modifiers) end

--- # method Gdk.Device:set_mode()
---
--- Sets a the mode of an input device. The mode controls if the
--- device is active and whether the device’s range is mapped to the
--- entire screen or to a single window.
--- 
--- Note: This is only meaningful for floating devices, master devices (and
--- slaves connected to these) drive the pointer cursor, which is not limited
--- by the input mode.
---
--- ---
---
---@param self Gdk.Device # a `GdkDevice`.
---@param mode Gdk.InputMode # the input mode.
---@return (boolean|nil) # `true` if the mode was successfully changed.
function Gdk.Device:set_mode(mode) end

--- # method Gdk.Device:ungrab()
---
--- Release any grab on `device`.
---
--- ---
---
---@param self Gdk.Device # a `GdkDevice`
---@param time_ integer # a timestap (e.g. %GDK_CURRENT_TIME).
---@return nil
function Gdk.Device:ungrab(time_) end

--- # method Gdk.Device:warp()
---
--- Warps `device` in `display` to the point `x`,`y` on
--- the screen `screen`, unless the device is confined
--- to a window by a grab, in which case it will be moved
--- as far as allowed by the grab. Warping the pointer
--- creates events as if the user had moved the mouse
--- instantaneously to the destination.
--- 
--- Note that the pointer should normally be under the
--- control of the user. This function was added to cover
--- some rare use cases like keyboard navigation support
--- for the color picker in the `GtkColorSelectionDialog`.
---
--- ---
---
---@param self Gdk.Device # the device to warp.
---@param screen Gdk.Screen # the screen to warp `device` to.
---@param x integer # the X coordinate of the destination.
---@param y integer # the Y coordinate of the destination.
---@return nil
function Gdk.Device:warp(screen, x, y) end

--- # function Gdk.Device.grab_info_libgtk_only()
---
--- Determines information about the current keyboard grab.
--- This is not public API and must not be used by applications.
---
--- ---
---
---@param display Gdk.Display # the display for which to get the grab information
---@param device Gdk.Device # device to get the grab information from
---@param grab_window Gdk.Window # location to store current grab window
---@param owner_events (boolean|nil) # location to store boolean indicating whether the `owner_events` flag to `gdk_keyboard_grab()` or `gdk_pointer_grab()` was `true`.
---@return (boolean|nil) # `true` if this application currently has the keyboard grabbed.
function Gdk.Device.grab_info_libgtk_only(display, device, grab_window, owner_events) end

--- # class Gdk.DeviceManager
---
--- In addition to a single pointer and keyboard for user interface input,
--- GDK contains support for a variety of input devices, including graphics
--- tablets, touchscreens and multiple pointers/keyboards interacting
--- simultaneously with the user interface. Such input devices often have
--- additional features, such as sub-pixel positioning information and
--- additional device-dependent information.
--- 
--- In order to query the device hierarchy and be aware of changes in the
--- device hierarchy (such as virtual devices being created or removed, or
--- physical devices being plugged or unplugged), GDK provides
--- `GdkDeviceManager`.
--- 
--- By default, and if the platform supports it, GDK is aware of multiple
--- keyboard/pointer pairs and multitouch devices. This behavior can be
--- changed by calling `gdk_disable_multidevice()` before `gdk_display_open()`.
--- There should rarely be a need to do that though, since GDK defaults
--- to a compatibility mode in which it will emit just one enter/leave
--- event pair for all devices on a window. To enable per-device
--- enter/leave events and other multi-pointer interaction features,
--- `gdk_window_set_support_multidevice()` must be called on
--- `GdkWindows` (or `gtk_widget_set_support_multidevice()` on widgets).
--- window. See the `gdk_window_set_support_multidevice()` documentation
--- for more information.
--- 
--- On X11, multi-device support is implemented through XInput 2.
--- Unless `gdk_disable_multidevice()` is called, the XInput 2
--- `GdkDeviceManager` implementation will be used as the input source.
--- Otherwise either the core or XInput 1 implementations will be used.
--- 
--- For simple applications that don’t have any special interest in
--- input devices, the so-called “client pointer”
--- provides a reasonable approximation to a simple setup with a single
--- pointer and keyboard. The device that has been set as the client
--- pointer can be accessed via `gdk_device_manager_get_client_pointer()`.
--- 
--- Conceptually, in multidevice mode there are 2 device types. Virtual
--- devices (or master devices) are represented by the pointer cursors
--- and keyboard foci that are seen on the screen. Physical devices (or
--- slave devices) represent the hardware that is controlling the virtual
--- devices, and thus have no visible cursor on the screen.
--- 
--- Virtual devices are always paired, so there is a keyboard device for every
--- pointer device. Associations between devices may be inspected through
--- `gdk_device_get_associated_device()`.
--- 
--- There may be several virtual devices, and several physical devices could
--- be controlling each of these virtual devices. Physical devices may also
--- be “floating”, which means they are not attached to any virtual device.
--- 
--- # Master and slave devices
--- 
--- ```c
--- carlos`sacarino`:~$ xinput list
--- ⎡ Virtual core pointer                          id=2    [master pointer  (3)]
--- ⎜   ↳ Virtual core XTEST pointer                id=4    [slave  pointer  (2)]
--- ⎜   ↳ Wacom ISDv4 E6 Pen stylus                 id=10   [slave  pointer  (2)]
--- ⎜   ↳ Wacom ISDv4 E6 Finger touch               id=11   [slave  pointer  (2)]
--- ⎜   ↳ SynPS/2 Synaptics TouchPad                id=13   [slave  pointer  (2)]
--- ⎜   ↳ TPPS/2 IBM TrackPoint                     id=14   [slave  pointer  (2)]
--- ⎜   ↳ Wacom ISDv4 E6 Pen eraser                 id=16   [slave  pointer  (2)]
--- ⎣ Virtual core keyboard                         id=3    [master keyboard (2)]
---     ↳ Virtual core XTEST keyboard               id=5    [slave  keyboard (3)]
---     ↳ Power Button                              id=6    [slave  keyboard (3)]
---     ↳ Video Bus                                 id=7    [slave  keyboard (3)]
---     ↳ Sleep Button                              id=8    [slave  keyboard (3)]
---     ↳ Integrated Camera                         id=9    [slave  keyboard (3)]
---     ↳ AT Translated Set 2 keyboard              id=12   [slave  keyboard (3)]
---     ↳ ThinkPad Extra Buttons                    id=15   [slave  keyboard (3)]
--- ```
--- 
--- By default, GDK will automatically listen for events coming from all
--- master devices, setting the `GdkDevice` for all events coming from input
--- devices. Events containing device information are `GDK_MOTION_NOTIFY`,
--- `GDK_BUTTON_PRESS`, `GDK_2BUTTON_PRESS`, `GDK_3BUTTON_PRESS`,
--- `GDK_BUTTON_RELEASE`, `GDK_SCROLL`, `GDK_KEY_PRESS`, `GDK_KEY_RELEASE`,
--- `GDK_ENTER_NOTIFY`, `GDK_LEAVE_NOTIFY`, `GDK_FOCUS_CHANGE`,
--- `GDK_PROXIMITY_IN`, `GDK_PROXIMITY_OUT`, `GDK_DRAG_ENTER`, `GDK_DRAG_LEAVE`,
--- `GDK_DRAG_MOTION`, `GDK_DRAG_STATUS`, `GDK_DROP_START`, `GDK_DROP_FINISHED`
--- and `GDK_GRAB_BROKEN`. When dealing with an event on a master device,
--- it is possible to get the source (slave) device that the event originated
--- from via `gdk_event_get_source_device()`.
--- 
--- On a standard session, all physical devices are connected by default to
--- the "Virtual Core Pointer/Keyboard" master devices, hence routing all events
--- through these. This behavior is only modified by device grabs, where the
--- slave device is temporarily detached for as long as the grab is held, and
--- more permanently by user modifications to the device hierarchy.
--- 
--- On certain application specific setups, it may make sense
--- to detach a physical device from its master pointer, and mapping it to
--- an specific window. This can be achieved by the combination of
--- `gdk_device_grab()` and `gdk_device_set_mode()`.
--- 
--- In order to listen for events coming from devices
--- other than a virtual device, `gdk_window_set_device_events()` must be
--- called. Generally, this function can be used to modify the event mask
--- for any given device.
--- 
--- Input devices may also provide additional information besides X/Y.
--- For example, graphics tablets may also provide pressure and X/Y tilt
--- information. This information is device-dependent, and may be
--- queried through `gdk_device_get_axis()`. In multidevice mode, virtual
--- devices will change axes in order to always represent the physical
--- device that is routing events through it. Whenever the physical device
--- changes, the `GdkDevice`:n-axes property will be notified, and
--- `gdk_device_list_axes()` will return the new device axes.
--- 
--- Devices may also have associated “keys” or
--- macro buttons. Such keys can be globally set to map into normal X
--- keyboard events. The mapping is set using `gdk_device_set_key()`.
--- 
--- In GTK+ 3.20, a new `GdkSeat` object has been introduced that
--- supersedes `GdkDeviceManager` and should be preferred in newly
--- written code.
---
--- ---
---
---@class Gdk.DeviceManager : GObject.Object
Gdk.DeviceManager = {}

--- # method Gdk.DeviceManager:get_client_pointer()
---
--- Returns the client pointer, that is, the master pointer that acts as the core pointer
--- for this application. In X11, window managers may change this depending on the interaction
--- pattern under the presence of several pointers.
--- 
--- You should use this function seldomly, only in code that isn’t triggered by a `GdkEvent`
--- and there aren’t other means to get a meaningful `GdkDevice` to operate on.
---
--- ---
---
---@param self Gdk.DeviceManager # a `GdkDeviceManager`
---@return Gdk.Device # The client pointer. This memory is owned by GDK and must not be freed or unreferenced.
function Gdk.DeviceManager:get_client_pointer() end

--- # method Gdk.DeviceManager:get_display()
---
--- Gets the `GdkDisplay` associated to `device_manager`.
---
--- ---
---
---@param self Gdk.DeviceManager # a `GdkDeviceManager`
---@return Gdk.Display # the `GdkDisplay` to which `device_manager` is associated to, or `nil`. This memory is owned by GDK and must not be freed or unreferenced.
function Gdk.DeviceManager:get_display() end

--- # method Gdk.DeviceManager:list_devices()
---
--- Returns the list of devices of type `type` currently attached to
--- `device_manager`.
---
--- ---
---
---@param self Gdk.DeviceManager # a `GdkDeviceManager`
---@param type Gdk.DeviceType # device type to get.
---@return Gdk.Device[] # a list of `GdkDevices`. The returned list must be freed with g_list_free (). The list elements are owned by GTK+ and must not be freed or unreffed.
function Gdk.DeviceManager:list_devices(type) end

--- # interface Gdk.DevicePad
---
--- `GdkDevicePad` is an interface implemented by devices of type
--- %GDK_SOURCE_TABLET_PAD, it allows querying the features provided
--- by the pad device.
--- 
--- Tablet pads may contain one or more groups, each containing a subset
--- of the buttons/rings/strips available. `gdk_device_pad_get_n_groups()`
--- can be used to obtain the number of groups, `gdk_device_pad_get_n_features()`
--- and `gdk_device_pad_get_feature_group()` can be combined to find out the
--- number of buttons/rings/strips the device has, and how are they grouped.
--- 
--- Each of those groups have different modes, which may be used to map
--- each individual pad feature to multiple actions. Only one mode is
--- effective (current) for each given group, different groups may have
--- different current modes. The number of available modes in a group can
--- be found out through `gdk_device_pad_get_group_n_modes()`, and the current
--- mode for a given group will be notified through the `GdkEventPadGroupMode`
--- event.
---
--- ---
---
---@class Gdk.DevicePad
Gdk.DevicePad = {}

--- # method Gdk.DevicePad:get_feature_group()
---
--- Returns the group the given `feature` and `idx` belong to,
--- or -1 if feature/index do not exist in `pad`.
---
--- ---
---
---@param self Gdk.DevicePad # a `GdkDevicePad`
---@param feature Gdk.DevicePadFeature # the feature type to get the group from
---@param feature_idx integer # the index of the feature to get the group from
---@return integer # The group number of the queried pad feature.
function Gdk.DevicePad:get_feature_group(feature, feature_idx) end

--- # method Gdk.DevicePad:get_group_n_modes()
---
--- Returns the number of modes that `group` may have.
---
--- ---
---
---@param self Gdk.DevicePad # a `GdkDevicePad`
---@param group_idx integer # group to get the number of available modes from
---@return integer # The number of modes available in `group`.
function Gdk.DevicePad:get_group_n_modes(group_idx) end

--- # method Gdk.DevicePad:get_n_features()
---
--- Returns the number of features a tablet pad has.
---
--- ---
---
---@param self Gdk.DevicePad # a `GdkDevicePad`
---@param feature Gdk.DevicePadFeature # a pad feature
---@return integer # The amount of elements of type `feature` that this pad has.
function Gdk.DevicePad:get_n_features(feature) end

--- # method Gdk.DevicePad:get_n_groups()
---
--- Returns the number of groups this pad device has. Pads have
--- at least one group. A pad group is a subcollection of
--- buttons/strip/rings that is affected collectively by a same
--- current mode.
---
--- ---
---
---@param self Gdk.DevicePad # a `GdkDevicePad`
---@return integer # The number of button/ring/strip groups in the pad.
function Gdk.DevicePad:get_n_groups() end

---@enum Gdk.DevicePadFeature
Gdk.DevicePadFeature = {}

--- # record Gdk.DevicePadInterface
---
---@class Gdk.DevicePadInterface
Gdk.DevicePadInterface = {}

--- # class Gdk.DeviceTool
---
---@class Gdk.DeviceTool : GObject.Object
Gdk.DeviceTool = {}

--- # method Gdk.DeviceTool:get_hardware_id()
---
--- Gets the hardware ID of this tool, or 0 if it's not known. When
--- non-zero, the identificator is unique for the given tool model,
--- meaning that two identical tools will share the same `hardware_id`,
--- but will have different serial numbers (see `gdk_device_tool_get_serial()`).
--- 
--- This is a more concrete (and device specific) method to identify
--- a `GdkDeviceTool` than `gdk_device_tool_get_tool_type()`, as a tablet
--- may support multiple devices with the same `GdkDeviceToolType`,
--- but having different hardware identificators.
---
--- ---
---
---@param self Gdk.DeviceTool # a `GdkDeviceTool`
---@return integer # The hardware identificator of this tool.
function Gdk.DeviceTool:get_hardware_id() end

--- # method Gdk.DeviceTool:get_serial()
---
--- Gets the serial of this tool, this value can be used to identify a
--- physical tool (eg. a tablet pen) across program executions.
---
--- ---
---
---@param self Gdk.DeviceTool # a `GdkDeviceTool`
---@return integer # The serial ID for this tool
function Gdk.DeviceTool:get_serial() end

--- # method Gdk.DeviceTool:get_tool_type()
---
--- Gets the `GdkDeviceToolType` of the tool.
---
--- ---
---
---@param self Gdk.DeviceTool # a `GdkDeviceTool`
---@return Gdk.DeviceToolType # The physical type for this tool. This can be used to figure out what sort of pen is being used, such as an airbrush or a pencil.
function Gdk.DeviceTool:get_tool_type() end

---@enum Gdk.DeviceToolType
Gdk.DeviceToolType = {}

---@enum Gdk.DeviceType
Gdk.DeviceType = {}

--- # class Gdk.Display
---
--- `GdkDisplay` objects purpose are two fold:
--- 
--- - To manage and provide information about input devices (pointers and keyboards)
--- 
--- - To manage and provide information about the available `GdkScreens`
--- 
--- GdkDisplay objects are the GDK representation of an X Display,
--- which can be described as a workstation consisting of
--- a keyboard, a pointing device (such as a mouse) and one or more
--- screens.
--- It is used to open and keep track of various GdkScreen objects
--- currently instantiated by the application. It is also used to
--- access the keyboard(s) and mouse pointer(s) of the display.
--- 
--- Most of the input device handling has been factored out into
--- the separate `GdkDeviceManager` object. Every display has a
--- device manager, which you can obtain using
--- `gdk_display_get_device_manager()`.
---
--- ---
---
---@class Gdk.Display : GObject.Object
Gdk.Display = {}

--- # method Gdk.Display:beep()
---
--- Emits a short beep on `display`
---
--- ---
---
---@param self Gdk.Display # a `GdkDisplay`
---@return nil
function Gdk.Display:beep() end

--- # method Gdk.Display:close()
---
--- Closes the connection to the windowing system for the given display,
--- and cleans up associated resources.
---
--- ---
---
---@param self Gdk.Display # a `GdkDisplay`
---@return nil
function Gdk.Display:close() end

--- # method Gdk.Display:device_is_grabbed()
---
--- Returns `true` if there is an ongoing grab on `device` for `display`.
---
--- ---
---
---@param self Gdk.Display # a `GdkDisplay`
---@param device Gdk.Device # a `GdkDevice`
---@return (boolean|nil) # `true` if there is a grab in effect for `device`.
function Gdk.Display:device_is_grabbed(device) end

--- # method Gdk.Display:flush()
---
--- Flushes any requests queued for the windowing system; this happens automatically
--- when the main loop blocks waiting for new events, but if your application
--- is drawing without returning control to the main loop, you may need
--- to call this function explicitly. A common case where this function
--- needs to be called is when an application is executing drawing commands
--- from a thread other than the thread where the main loop is running.
--- 
--- This is most useful for X11. On windowing systems where requests are
--- handled synchronously, this function will do nothing.
---
--- ---
---
---@param self Gdk.Display # a `GdkDisplay`
---@return nil
function Gdk.Display:flush() end

--- # method Gdk.Display:get_app_launch_context()
---
--- Returns a `GdkAppLaunchContext` suitable for launching
--- applications on the given display.
---
--- ---
---
---@param self Gdk.Display # a `GdkDisplay`
---@return Gdk.AppLaunchContext # a new `GdkAppLaunchContext` for `display`. Free with `g_object_unref()` when done
function Gdk.Display:get_app_launch_context() end

--- # method Gdk.Display:get_default_cursor_size()
---
--- Returns the default size to use for cursors on `display`.
---
--- ---
---
---@param self Gdk.Display # a `GdkDisplay`
---@return integer # the default cursor size.
function Gdk.Display:get_default_cursor_size() end

--- # method Gdk.Display:get_default_group()
---
--- Returns the default group leader window for all toplevel windows
--- on `display`. This window is implicitly created by GDK.
--- See `gdk_window_set_group()`.
---
--- ---
---
---@param self Gdk.Display # a `GdkDisplay`
---@return Gdk.Window # The default group leader window for `display`
function Gdk.Display:get_default_group() end

--- # method Gdk.Display:get_default_screen()
---
--- Get the default `GdkScreen` for `display`.
---
--- ---
---
---@param self Gdk.Display # a `GdkDisplay`
---@return Gdk.Screen # the default `GdkScreen` object for `display`
function Gdk.Display:get_default_screen() end

--- # method Gdk.Display:get_default_seat()
---
--- Returns the default `GdkSeat` for this display.
---
--- ---
---
---@param self Gdk.Display # a `GdkDisplay`
---@return Gdk.Seat # the default seat.
function Gdk.Display:get_default_seat() end

--- # method Gdk.Display:get_device_manager()
---
--- Returns the `GdkDeviceManager` associated to `display`.
---
--- ---
---
---@param self Gdk.Display # a `GdkDisplay`.
---@return Gdk.DeviceManager # A `GdkDeviceManager`, or `nil`. This memory is owned by GDK and must not be freed or unreferenced.
function Gdk.Display:get_device_manager() end

--- # method Gdk.Display:get_event()
---
--- Gets the next `GdkEvent` to be processed for `display`, fetching events from the
--- windowing system if necessary.
---
--- ---
---
---@param self Gdk.Display # a `GdkDisplay`
---@return Gdk.Event # the next `GdkEvent` to be processed, or `nil` if no events are pending. The returned `GdkEvent` should be freed with `gdk_event_free()`.
function Gdk.Display:get_event() end

--- # method Gdk.Display:get_maximal_cursor_size()
---
--- Gets the maximal size to use for cursors on `display`.
---
--- ---
---
---@param self Gdk.Display # a `GdkDisplay`
---@param width integer # the return location for the maximal cursor width
---@param height integer # the return location for the maximal cursor height
---@return nil
function Gdk.Display:get_maximal_cursor_size(width, height) end

--- # method Gdk.Display:get_monitor()
---
--- Gets a monitor associated with this display.
---
--- ---
---
---@param self Gdk.Display # a `GdkDisplay`
---@param monitor_num integer # number of the monitor
---@return Gdk.Monitor # the `GdkMonitor`, or `nil` if `monitor_num` is not a valid monitor number
function Gdk.Display:get_monitor(monitor_num) end

--- # method Gdk.Display:get_monitor_at_point()
---
--- Gets the monitor in which the point (`x`, `y`) is located,
--- or a nearby monitor if the point is not in any monitor.
---
--- ---
---
---@param self Gdk.Display # a `GdkDisplay`
---@param x integer # the x coordinate of the point
---@param y integer # the y coordinate of the point
---@return Gdk.Monitor # the monitor containing the point
function Gdk.Display:get_monitor_at_point(x, y) end

--- # method Gdk.Display:get_monitor_at_window()
---
--- Gets the monitor in which the largest area of `window`
--- resides, or a monitor close to `window` if it is outside
--- of all monitors.
---
--- ---
---
---@param self Gdk.Display # a `GdkDisplay`
---@param window Gdk.Window # a `GdkWindow`
---@return Gdk.Monitor # the monitor with the largest overlap with `window`
function Gdk.Display:get_monitor_at_window(window) end

--- # method Gdk.Display:get_n_monitors()
---
--- Gets the number of monitors that belong to `display`.
--- 
--- The returned number is valid until the next emission of the
--- `GdkDisplay`::monitor-added or `GdkDisplay`::monitor-removed signal.
---
--- ---
---
---@param self Gdk.Display # a `GdkDisplay`
---@return integer # the number of monitors
function Gdk.Display:get_n_monitors() end

--- # method Gdk.Display:get_n_screens()
---
--- Gets the number of screen managed by the `display`.
---
--- ---
---
---@param self Gdk.Display # a `GdkDisplay`
---@return integer # number of screens.
function Gdk.Display:get_n_screens() end

--- # method Gdk.Display:get_name()
---
--- Gets the name of the display.
---
--- ---
---
---@param self Gdk.Display # a `GdkDisplay`
---@return string # a string representing the display name. This string is owned by GDK and should not be modified or freed.
function Gdk.Display:get_name() end

--- # method Gdk.Display:get_pointer()
---
--- Gets the current location of the pointer and the current modifier
--- mask for a given display.
---
--- ---
---
---@param self Gdk.Display # a `GdkDisplay`
---@param screen? Gdk.Screen # location to store the screen that the cursor is on, or `nil`.
---@param x? integer # location to store root window X coordinate of pointer, or `nil`.
---@param y? integer # location to store root window Y coordinate of pointer, or `nil`.
---@param mask? Gdk.ModifierType # location to store current modifier mask, or `nil`
---@return nil
function Gdk.Display:get_pointer(screen, x, y, mask) end

--- # method Gdk.Display:get_primary_monitor()
---
--- Gets the primary monitor for the display.
--- 
--- The primary monitor is considered the monitor where the “main desktop”
--- lives. While normal application windows typically allow the window
--- manager to place the windows, specialized desktop applications
--- such as panels should place themselves on the primary monitor.
---
--- ---
---
---@param self Gdk.Display # a `GdkDisplay`
---@return Gdk.Monitor # the primary monitor, or `nil` if no primary monitor is configured by the user
function Gdk.Display:get_primary_monitor() end

--- # method Gdk.Display:get_screen()
---
--- Returns a screen object for one of the screens of the display.
---
--- ---
---
---@param self Gdk.Display # a `GdkDisplay`
---@param screen_num integer # the screen number
---@return Gdk.Screen # the `GdkScreen` object
function Gdk.Display:get_screen(screen_num) end

--- # method Gdk.Display:get_window_at_pointer()
---
--- Obtains the window underneath the mouse pointer, returning the location
--- of the pointer in that window in `win_x`, `win_y` for `screen`. Returns `nil`
--- if the window under the mouse pointer is not known to GDK (for example,
--- belongs to another application).
---
--- ---
---
---@param self Gdk.Display # a `GdkDisplay`
---@param win_x? integer # return location for x coordinate of the pointer location relative to the window origin, or `nil`
---@param win_y? integer # return location for y coordinate of the pointer location relative & to the window origin, or `nil`
---@return Gdk.Window # the window under the mouse pointer, or `nil`
function Gdk.Display:get_window_at_pointer(win_x, win_y) end

--- # method Gdk.Display:has_pending()
---
--- Returns whether the display has events that are waiting
--- to be processed.
---
--- ---
---
---@param self Gdk.Display # a `GdkDisplay`
---@return (boolean|nil) # `true` if there are events ready to be processed.
function Gdk.Display:has_pending() end

--- # method Gdk.Display:is_closed()
---
--- Finds out if the display has been closed.
---
--- ---
---
---@param self Gdk.Display # a `GdkDisplay`
---@return (boolean|nil) # `true` if the display is closed.
function Gdk.Display:is_closed() end

--- # method Gdk.Display:keyboard_ungrab()
---
--- Release any keyboard grab
---
--- ---
---
---@param self Gdk.Display # a `GdkDisplay`.
---@param time_ integer # a timestap (e.g `GDK_CURRENT_TIME`).
---@return nil
function Gdk.Display:keyboard_ungrab(time_) end

--- # method Gdk.Display:list_devices()
---
--- Returns the list of available input devices attached to `display`.
--- The list is statically allocated and should not be freed.
---
--- ---
---
---@param self Gdk.Display # a `GdkDisplay`
---@return Gdk.Device[] # a list of `GdkDevice`
function Gdk.Display:list_devices() end

--- # method Gdk.Display:list_seats()
---
--- Returns the list of seats known to `display`.
---
--- ---
---
---@param self Gdk.Display # a `GdkDisplay`
---@return Gdk.Seat[] # the list of seats known to the `GdkDisplay`
function Gdk.Display:list_seats() end

--- # method Gdk.Display:notify_startup_complete()
---
--- Indicates to the GUI environment that the application has
--- finished loading, using a given identifier.
--- 
--- GTK+ will call this function automatically for `GtkWindow`
--- with custom startup-notification identifier unless
--- `gtk_window_set_auto_startup_notification()` is called to
--- disable that feature.
---
--- ---
---
---@param self Gdk.Display # a `GdkDisplay`
---@param startup_id string # a startup-notification identifier, for which notification process should be completed
---@return nil
function Gdk.Display:notify_startup_complete(startup_id) end

--- # method Gdk.Display:peek_event()
---
--- Gets a copy of the first `GdkEvent` in the `display`’s event queue, without
--- removing the event from the queue.  (Note that this function will
--- not get more events from the windowing system.  It only checks the events
--- that have already been moved to the GDK event queue.)
---
--- ---
---
---@param self Gdk.Display # a `GdkDisplay`
---@return Gdk.Event # a copy of the first `GdkEvent` on the event queue, or `nil` if no events are in the queue. The returned `GdkEvent` should be freed with `gdk_event_free()`.
function Gdk.Display:peek_event() end

--- # method Gdk.Display:pointer_is_grabbed()
---
--- Test if the pointer is grabbed.
---
--- ---
---
---@param self Gdk.Display # a `GdkDisplay`
---@return (boolean|nil) # `true` if an active X pointer grab is in effect
function Gdk.Display:pointer_is_grabbed() end

--- # method Gdk.Display:pointer_ungrab()
---
--- Release any pointer grab.
---
--- ---
---
---@param self Gdk.Display # a `GdkDisplay`.
---@param time_ integer # a timestap (e.g. %GDK_CURRENT_TIME).
---@return nil
function Gdk.Display:pointer_ungrab(time_) end

--- # method Gdk.Display:put_event()
---
--- Appends a copy of the given event onto the front of the event
--- queue for `display`.
---
--- ---
---
---@param self Gdk.Display # a `GdkDisplay`
---@param event Gdk.Event # a `GdkEvent`.
---@return nil
function Gdk.Display:put_event(event) end

--- # method Gdk.Display:request_selection_notification()
---
--- Request `GdkEventOwnerChange` events for ownership changes
--- of the selection named by the given atom.
---
--- ---
---
---@param self Gdk.Display # a `GdkDisplay`
---@param selection Gdk.Atom # the `GdkAtom` naming the selection for which ownership change notification is requested
---@return (boolean|nil) # whether `GdkEventOwnerChange` events will be sent.
function Gdk.Display:request_selection_notification(selection) end

--- # method Gdk.Display:set_double_click_distance()
---
--- Sets the double click distance (two clicks within this distance
--- count as a double click and result in a `GDK_2BUTTON_PRESS` event).
--- See also `gdk_display_set_double_click_time()`.
--- Applications should not set this, it is a global
--- user-configured setting.
---
--- ---
---
---@param self Gdk.Display # a `GdkDisplay`
---@param distance integer # distance in pixels
---@return nil
function Gdk.Display:set_double_click_distance(distance) end

--- # method Gdk.Display:set_double_click_time()
---
--- Sets the double click time (two clicks within this time interval
--- count as a double click and result in a `GDK_2BUTTON_PRESS` event).
--- Applications should not set this, it is a global
--- user-configured setting.
---
--- ---
---
---@param self Gdk.Display # a `GdkDisplay`
---@param msec integer # double click time in milliseconds (thousandths of a second)
---@return nil
function Gdk.Display:set_double_click_time(msec) end

--- # method Gdk.Display:store_clipboard()
---
--- Issues a request to the clipboard manager to store the
--- clipboard data. On X11, this is a special program that works
--- according to the
--- [FreeDesktop Clipboard Specification](http://www.freedesktop.org/Standards/clipboard-manager-spec).
---
--- ---
---
---@param self Gdk.Display # a `GdkDisplay`
---@param clipboard_window Gdk.Window # a `GdkWindow` belonging to the clipboard owner
---@param time_ integer # a timestamp
---@param targets? unknown[] # an array of targets that should be saved, or `nil` if all available targets should be saved.
---@param n_targets integer # length of the `targets` array
---@return nil
function Gdk.Display:store_clipboard(clipboard_window, time_, targets, n_targets) end

--- # method Gdk.Display:supports_clipboard_persistence()
---
--- Returns whether the speicifed display supports clipboard
--- persistance; i.e. if it’s possible to store the clipboard data after an
--- application has quit. On X11 this checks if a clipboard daemon is
--- running.
---
--- ---
---
---@param self Gdk.Display # a `GdkDisplay`
---@return (boolean|nil) # `true` if the display supports clipboard persistance.
function Gdk.Display:supports_clipboard_persistence() end

--- # method Gdk.Display:supports_composite()
---
--- Returns `true` if `gdk_window_set_composited()` can be used
--- to redirect drawing on the window using compositing.
--- 
--- Currently this only works on X11 with XComposite and
--- XDamage extensions available.
---
--- ---
---
---@param self Gdk.Display # a `GdkDisplay`
---@return (boolean|nil) # `true` if windows may be composited.
function Gdk.Display:supports_composite() end

--- # method Gdk.Display:supports_cursor_alpha()
---
--- Returns `true` if cursors can use an 8bit alpha channel
--- on `display`. Otherwise, cursors are restricted to bilevel
--- alpha (i.e. a mask).
---
--- ---
---
---@param self Gdk.Display # a `GdkDisplay`
---@return (boolean|nil) # whether cursors can have alpha channels.
function Gdk.Display:supports_cursor_alpha() end

--- # method Gdk.Display:supports_cursor_color()
---
--- Returns `true` if multicolored cursors are supported
--- on `display`. Otherwise, cursors have only a forground
--- and a background color.
---
--- ---
---
---@param self Gdk.Display # a `GdkDisplay`
---@return (boolean|nil) # whether cursors can have multiple colors.
function Gdk.Display:supports_cursor_color() end

--- # method Gdk.Display:supports_input_shapes()
---
--- Returns `true` if `gdk_window_input_shape_combine_mask()` can
--- be used to modify the input shape of windows on `display`.
---
--- ---
---
---@param self Gdk.Display # a `GdkDisplay`
---@return (boolean|nil) # `true` if windows with modified input shape are supported
function Gdk.Display:supports_input_shapes() end

--- # method Gdk.Display:supports_selection_notification()
---
--- Returns whether `GdkEventOwnerChange` events will be
--- sent when the owner of a selection changes.
---
--- ---
---
---@param self Gdk.Display # a `GdkDisplay`
---@return (boolean|nil) # whether `GdkEventOwnerChange` events will be sent.
function Gdk.Display:supports_selection_notification() end

--- # method Gdk.Display:supports_shapes()
---
--- Returns `true` if `gdk_window_shape_combine_mask()` can
--- be used to create shaped windows on `display`.
---
--- ---
---
---@param self Gdk.Display # a `GdkDisplay`
---@return (boolean|nil) # `true` if shaped windows are supported
function Gdk.Display:supports_shapes() end

--- # method Gdk.Display:sync()
---
--- Flushes any requests queued for the windowing system and waits until all
--- requests have been handled. This is often used for making sure that the
--- display is synchronized with the current state of the program. Calling
--- `gdk_display_sync()` before `gdk_error_trap_pop()` makes sure that any errors
--- generated from earlier requests are handled before the error trap is
--- removed.
--- 
--- This is most useful for X11. On windowing systems where requests are
--- handled synchronously, this function will do nothing.
---
--- ---
---
---@param self Gdk.Display # a `GdkDisplay`
---@return nil
function Gdk.Display:sync() end

--- # method Gdk.Display:warp_pointer()
---
--- Warps the pointer of `display` to the point `x`,`y` on
--- the screen `screen`, unless the pointer is confined
--- to a window by a grab, in which case it will be moved
--- as far as allowed by the grab. Warping the pointer
--- creates events as if the user had moved the mouse
--- instantaneously to the destination.
--- 
--- Note that the pointer should normally be under the
--- control of the user. This function was added to cover
--- some rare use cases like keyboard navigation support
--- for the color picker in the `GtkColorSelectionDialog`.
---
--- ---
---
---@param self Gdk.Display # a `GdkDisplay`
---@param screen Gdk.Screen # the screen of `display` to warp the pointer to
---@param x integer # the x coordinate of the destination
---@param y integer # the y coordinate of the destination
---@return nil
function Gdk.Display:warp_pointer(screen, x, y) end

--- # function Gdk.Display.get_default()
---
--- Gets the default `GdkDisplay`. This is a convenience
--- function for:
--- `gdk_display_manager_get_default_display (gdk_display_manager_get ())`.
---
--- ---
---
---@return Gdk.Display # a `GdkDisplay`, or `nil` if there is no default display.
function Gdk.Display.get_default() end

--- # function Gdk.Display.open()
---
--- Opens a display.
---
--- ---
---
---@param display_name string # the name of the display to open
---@return Gdk.Display # a `GdkDisplay`, or `nil` if the display could not be opened
function Gdk.Display.open(display_name) end

--- # function Gdk.Display.open_default_libgtk_only()
---
--- Opens the default display specified by command line arguments or
--- environment variables, sets it as the default display, and returns
--- it. `gdk_parse_args()` must have been called first. If the default
--- display has previously been set, simply returns that. An internal
--- function that should not be used by applications.
---
--- ---
---
---@return Gdk.Display # the default display, if it could be opened, otherwise `nil`.
function Gdk.Display.open_default_libgtk_only() end

--- # class Gdk.DisplayManager
---
--- The purpose of the `GdkDisplayManager` singleton object is to offer
--- notification when displays appear or disappear or the default display
--- changes.
--- 
--- You can use `gdk_display_manager_get()` to obtain the `GdkDisplayManager`
--- singleton, but that should be rarely necessary. Typically, initializing
--- GTK+ opens a display that you can work with without ever accessing the
--- `GdkDisplayManager`.
--- 
--- The GDK library can be built with support for multiple backends.
--- The `GdkDisplayManager` object determines which backend is used
--- at runtime.
--- 
--- When writing backend-specific code that is supposed to work with
--- multiple GDK backends, you have to consider both compile time and
--- runtime. At compile time, use the `GDK_WINDOWING_X11`, `GDK_WINDOWING_WIN32`
--- macros, etc. to find out which backends are present in the GDK library
--- you are building your application against. At runtime, use type-check
--- macros like GDK_IS_X11_DISPLAY() to find out which backend is in use:
--- 
--- ## Backend-specific code ## {`backend`-specific}
--- 
--- ```c
--- `ifdef` GDK_WINDOWING_X11
---   if (GDK_IS_X11_DISPLAY (display))
---     {
---       // make X11-specific calls here
---     }
---   else
--- `endif`
--- `ifdef` GDK_WINDOWING_QUARTZ
---   if (GDK_IS_QUARTZ_DISPLAY (display))
---     {
---       // make Quartz-specific calls here
---     }
---   else
--- `endif`
---   g_error ("Unsupported GDK backend");
--- ```
---
--- ---
---
---@class Gdk.DisplayManager : GObject.Object
Gdk.DisplayManager = {}

--- # method Gdk.DisplayManager:get_default_display()
---
--- Gets the default `GdkDisplay`.
---
--- ---
---
---@param self Gdk.DisplayManager # a `GdkDisplayManager`
---@return Gdk.Display # a `GdkDisplay`, or `nil` if there is no default display.
function Gdk.DisplayManager:get_default_display() end

--- # method Gdk.DisplayManager:list_displays()
---
--- List all currently open displays.
---
--- ---
---
---@param self Gdk.DisplayManager # a `GdkDisplayManager`
---@return Gdk.Display[] # a newly allocated `GSList` of `GdkDisplay` objects. Free with `g_slist_free()` when you are done with it.
function Gdk.DisplayManager:list_displays() end

--- # method Gdk.DisplayManager:open_display()
---
--- Opens a display.
---
--- ---
---
---@param self Gdk.DisplayManager # a `GdkDisplayManager`
---@param name string # the name of the display to open
---@return Gdk.Display # a `GdkDisplay`, or `nil` if the display could not be opened
function Gdk.DisplayManager:open_display(name) end

--- # method Gdk.DisplayManager:set_default_display()
---
--- Sets `display` as the default display.
---
--- ---
---
---@param self Gdk.DisplayManager # a `GdkDisplayManager`
---@param display Gdk.Display # a `GdkDisplay`
---@return nil
function Gdk.DisplayManager:set_default_display(display) end

--- # function Gdk.DisplayManager.get()
---
--- Gets the singleton `GdkDisplayManager` object.
--- 
--- When called for the first time, this function consults the
--- `GDK_BACKEND` environment variable to find out which
--- of the supported GDK backends to use (in case GDK has been compiled
--- with multiple backends). Applications can use `gdk_set_allowed_backends()`
--- to limit what backends can be used.
---
--- ---
---
---@return Gdk.DisplayManager # The global `GdkDisplayManager` singleton; `gdk_parse_args()`, `gdk_init()`, or `gdk_init_check()` must have been called first.
function Gdk.DisplayManager.get() end

---@enum Gdk.DragAction
Gdk.DragAction = {}

---@enum Gdk.DragCancelReason
Gdk.DragCancelReason = {}

--- # class Gdk.DragContext
---
---@class Gdk.DragContext : GObject.Object
Gdk.DragContext = {}

--- # method Gdk.DragContext:get_actions()
---
--- Determines the bitmask of actions proposed by the source if
--- `gdk_drag_context_get_suggested_action()` returns %GDK_ACTION_ASK.
---
--- ---
---
---@param self Gdk.DragContext # a `GdkDragContext`
---@return Gdk.DragAction # the `GdkDragAction` flags
function Gdk.DragContext:get_actions() end

--- # method Gdk.DragContext:get_dest_window()
---
--- Returns the destination window for the DND operation.
---
--- ---
---
---@param self Gdk.DragContext # a `GdkDragContext`
---@return Gdk.Window # a `GdkWindow`
function Gdk.DragContext:get_dest_window() end

--- # method Gdk.DragContext:get_device()
---
--- Returns the `GdkDevice` associated to the drag context.
---
--- ---
---
---@param self Gdk.DragContext # a `GdkDragContext`
---@return Gdk.Device # The `GdkDevice` associated to `context`.
function Gdk.DragContext:get_device() end

--- # method Gdk.DragContext:get_drag_window()
---
--- Returns the window on which the drag icon should be rendered
--- during the drag operation. Note that the window may not be
--- available until the drag operation has begun. GDK will move
--- the window in accordance with the ongoing drag operation.
--- The window is owned by `context` and will be destroyed when
--- the drag operation is over.
---
--- ---
---
---@param self Gdk.DragContext # a `GdkDragContext`
---@return Gdk.Window # the drag window, or `nil`
function Gdk.DragContext:get_drag_window() end

--- # method Gdk.DragContext:get_protocol()
---
--- Returns the drag protocol that is used by this context.
---
--- ---
---
---@param self Gdk.DragContext # a `GdkDragContext`
---@return Gdk.DragProtocol # the drag protocol
function Gdk.DragContext:get_protocol() end

--- # method Gdk.DragContext:get_selected_action()
---
--- Determines the action chosen by the drag destination.
---
--- ---
---
---@param self Gdk.DragContext # a `GdkDragContext`
---@return Gdk.DragAction # a `GdkDragAction` value
function Gdk.DragContext:get_selected_action() end

--- # method Gdk.DragContext:get_source_window()
---
--- Returns the `GdkWindow` where the DND operation started.
---
--- ---
---
---@param self Gdk.DragContext # a `GdkDragContext`
---@return Gdk.Window # a `GdkWindow`
function Gdk.DragContext:get_source_window() end

--- # method Gdk.DragContext:get_suggested_action()
---
--- Determines the suggested drag action of the context.
---
--- ---
---
---@param self Gdk.DragContext # a `GdkDragContext`
---@return Gdk.DragAction # a `GdkDragAction` value
function Gdk.DragContext:get_suggested_action() end

--- # method Gdk.DragContext:list_targets()
---
--- Retrieves the list of targets of the context.
---
--- ---
---
---@param self Gdk.DragContext # a `GdkDragContext`
---@return Gdk.Atom[] # a `GList` of targets
function Gdk.DragContext:list_targets() end

--- # method Gdk.DragContext:manage_dnd()
---
--- Requests the drag and drop operation to be managed by `context`.
--- When a drag and drop operation becomes managed, the `GdkDragContext`
--- will internally handle all input and source-side `GdkEventDND` events
--- as required by the windowing system.
--- 
--- Once the drag and drop operation is managed, the drag context will
--- emit the following signals:
--- - The `GdkDragContext`::action-changed signal whenever the final action
---   to be performed by the drag and drop operation changes.
--- - The `GdkDragContext`::drop-performed signal after the user performs
---   the drag and drop gesture (typically by releasing the mouse button).
--- - The `GdkDragContext`::dnd-finished signal after the drag and drop
---   operation concludes (after all `GdkSelection` transfers happen).
--- - The `GdkDragContext`::cancel signal if the drag and drop operation is
---   finished but doesn't happen over an accepting destination, or is
---   cancelled through other means.
---
--- ---
---
---@param self Gdk.DragContext # a `GdkDragContext`
---@param ipc_window Gdk.Window # Window to use for IPC messaging/events
---@param actions Gdk.DragAction # the actions supported by the drag source
---@return (boolean|nil) # `TRUE` if the drag and drop operation is managed.
function Gdk.DragContext:manage_dnd(ipc_window, actions) end

--- # method Gdk.DragContext:set_device()
---
--- Associates a `GdkDevice` to `context`, so all Drag and Drop events
--- for `context` are emitted as if they came from this device.
---
--- ---
---
---@param self Gdk.DragContext # a `GdkDragContext`
---@param device Gdk.Device # a `GdkDevice`
---@return nil
function Gdk.DragContext:set_device(device) end

--- # method Gdk.DragContext:set_hotspot()
---
--- Sets the position of the drag window that will be kept
--- under the cursor hotspot. Initially, the hotspot is at the
--- top left corner of the drag window.
---
--- ---
---
---@param self Gdk.DragContext # a `GdkDragContext`
---@param hot_x integer # x coordinate of the drag window hotspot
---@param hot_y integer # y coordinate of the drag window hotspot
---@return nil
function Gdk.DragContext:set_hotspot(hot_x, hot_y) end

---@enum Gdk.DragProtocol
Gdk.DragProtocol = {}

--- # class Gdk.DrawingContext
---
--- `GdkDrawingContext` is an object that represents the current drawing
--- state of a `GdkWindow`.
--- 
--- It's possible to use a `GdkDrawingContext` to draw on a `GdkWindow`
--- via rendering API like Cairo or OpenGL.
--- 
--- A `GdkDrawingContext` can only be created by calling `gdk_window_begin_draw_frame()`
--- and will be valid until a call to `gdk_window_end_draw_frame()`.
--- 
--- `GdkDrawingContext` is available since GDK 3.22
---
--- ---
---
---@class Gdk.DrawingContext : GObject.Object
Gdk.DrawingContext = {}

--- # method Gdk.DrawingContext:get_cairo_context()
---
--- Retrieves a Cairo context to be used to draw on the `GdkWindow`
--- that created the `GdkDrawingContext`.
--- 
--- The returned context is guaranteed to be valid as long as the
--- `GdkDrawingContext` is valid, that is between a call to
--- `gdk_window_begin_draw_frame()` and `gdk_window_end_draw_frame()`.
---
--- ---
---
---@param self Gdk.DrawingContext
---@return cairo.Context # a Cairo context to be used to draw the contents of the `GdkWindow`. The context is owned by the `GdkDrawingContext` and should not be destroyed
function Gdk.DrawingContext:get_cairo_context() end

--- # method Gdk.DrawingContext:get_clip()
---
--- Retrieves a copy of the clip region used when creating the `context`.
---
--- ---
---
---@param self Gdk.DrawingContext # a `GdkDrawingContext`
---@return cairo.Region # a Cairo region
function Gdk.DrawingContext:get_clip() end

--- # method Gdk.DrawingContext:get_window()
---
--- Retrieves the window that created the drawing `context`.
---
--- ---
---
---@param self Gdk.DrawingContext # a `GdkDrawingContext`
---@return Gdk.Window # a `GdkWindow`
function Gdk.DrawingContext:get_window() end

--- # method Gdk.DrawingContext:is_valid()
---
--- Checks whether the given `GdkDrawingContext` is valid.
---
--- ---
---
---@param self Gdk.DrawingContext # a `GdkDrawingContext`
---@return (boolean|nil) # `true` if the context is valid
function Gdk.DrawingContext:is_valid() end

--- # record Gdk.DrawingContextClass
---
---@class Gdk.DrawingContextClass
Gdk.DrawingContextClass = {}

--- # union Gdk.Event
---
--- A `GdkEvent` contains a union of all of the event types,
--- and allows access to the data fields in a number of ways.
--- 
--- The event type is always the first field in all of the event types, and
--- can always be accessed with the following code, no matter what type of
--- event it is:
--- ```c
---   GdkEvent *event;
---   GdkEventType type;
--- 
---   type = event->type;
--- ```
--- 
--- To access other fields of the event, the pointer to the event
--- can be cast to the appropriate event type, or the union member
--- name can be used. For example if the event type is %GDK_BUTTON_PRESS
--- then the x coordinate of the button press can be accessed with:
--- ```c
---   GdkEvent *event;
---   gdouble x;
--- 
---   x = ((GdkEventButton*)event)->x;
--- ```
--- or:
--- ```c
---   GdkEvent *event;
---   gdouble x;
--- 
---   x = event->button.x;
--- ```
---
--- ---
---
---@class Gdk.Event
---@field type Gdk.EventType # the `GdkEventType`
---@field any Gdk.EventAny # a `GdkEventAny`
---@field expose Gdk.EventExpose # a `GdkEventExpose`
---@field visibility Gdk.EventVisibility # a `GdkEventVisibility`
---@field motion Gdk.EventMotion # a `GdkEventMotion`
---@field button Gdk.EventButton # a `GdkEventButton`
---@field touch Gdk.EventTouch # a `GdkEventTouch`
---@field scroll Gdk.EventScroll # a `GdkEventScroll`
---@field key Gdk.EventKey # a `GdkEventKey`
---@field crossing Gdk.EventCrossing # a `GdkEventCrossing`
---@field focus_change Gdk.EventFocus # a `GdkEventFocus`
---@field configure Gdk.EventConfigure # a `GdkEventConfigure`
---@field property Gdk.EventProperty # a `GdkEventProperty`
---@field selection Gdk.EventSelection # a `GdkEventSelection`
---@field owner_change Gdk.EventOwnerChange # a `GdkEventOwnerChange`
---@field proximity Gdk.EventProximity # a `GdkEventProximity`
---@field dnd Gdk.EventDND # a `GdkEventDND`
---@field window_state Gdk.EventWindowState # a `GdkEventWindowState`
---@field setting Gdk.EventSetting # a `GdkEventSetting`
---@field grab_broken Gdk.EventGrabBroken # a `GdkEventGrabBroken`
---@field touchpad_swipe Gdk.EventTouchpadSwipe # a `GdkEventTouchpadSwipe`
---@field touchpad_pinch Gdk.EventTouchpadPinch # a `GdkEventTouchpadPinch`
---@field pad_button Gdk.EventPadButton # a `GdkEventPadButton`
---@field pad_axis Gdk.EventPadAxis # a `GdkEventPadAxis`
---@field pad_group_mode Gdk.EventPadGroupMode # a `GdkEventPadGroupMode`
---@operator call: Gdk.Event
Gdk.Event = {}

--- # method Gdk.Event:_get_angle()
---
--- If both events contain X/Y information, this function will return `true`
--- and return in `angle` the relative angle from `event1` to `event2`. The rotation
--- direction for positive angles is from the positive X axis towards the positive
--- Y axis.
---
--- ---
---
---@param self Gdk.Event # first `GdkEvent`
---@param event2 Gdk.Event # second `GdkEvent`
---@param angle number # return location for the relative angle between both events
---@return (boolean|nil) # `true` if the angle could be calculated.
function Gdk.Event:_get_angle(event2, angle) end

--- # method Gdk.Event:_get_center()
---
--- If both events contain X/Y information, the center of both coordinates
--- will be returned in `x` and `y`.
---
--- ---
---
---@param self Gdk.Event # first `GdkEvent`
---@param event2 Gdk.Event # second `GdkEvent`
---@param x number # return location for the X coordinate of the center
---@param y number # return location for the Y coordinate of the center
---@return (boolean|nil) # `true` if the center could be calculated.
function Gdk.Event:_get_center(event2, x, y) end

--- # method Gdk.Event:_get_distance()
---
--- If both events have X/Y information, the distance between both coordinates
--- (as in a straight line going from `event1` to `event2`) will be returned.
---
--- ---
---
---@param self Gdk.Event # first `GdkEvent`
---@param event2 Gdk.Event # second `GdkEvent`
---@param distance number # return location for the distance
---@return (boolean|nil) # `true` if the distance could be calculated.
function Gdk.Event:_get_distance(event2, distance) end

--- # method Gdk.Event:copy()
---
--- Copies a `GdkEvent`, copying or incrementing the reference count of the
--- resources associated with it (e.g. `GdkWindow`’s and strings).
---
--- ---
---
---@param self Gdk.Event # a `GdkEvent`
---@return Gdk.Event # a copy of `event`. The returned `GdkEvent` should be freed with `gdk_event_free()`.
function Gdk.Event:copy() end

--- # method Gdk.Event:free()
---
--- Frees a `GdkEvent`, freeing or decrementing any resources associated with it.
--- Note that this function should only be called with events returned from
--- functions such as `gdk_event_peek()`, `gdk_event_get()`, `gdk_event_copy()`
--- and `gdk_event_new()`.
---
--- ---
---
---@param self Gdk.Event # a `GdkEvent`.
---@return nil
function Gdk.Event:free() end

--- # method Gdk.Event:get_axis()
---
--- Extract the axis value for a particular axis use from
--- an event structure.
---
--- ---
---
---@param self Gdk.Event # a `GdkEvent`
---@param axis_use Gdk.AxisUse # the axis use to look for
---@param value number # location to store the value found
---@return (boolean|nil) # `true` if the specified axis was found, otherwise `false`
function Gdk.Event:get_axis(axis_use, value) end

--- # method Gdk.Event:get_button()
---
--- Extract the button number from an event.
---
--- ---
---
---@param self Gdk.Event # a `GdkEvent`
---@param button integer # location to store mouse button number
---@return (boolean|nil) # `true` if the event delivered a button number
function Gdk.Event:get_button(button) end

--- # method Gdk.Event:get_click_count()
---
--- Extracts the click count from an event.
---
--- ---
---
---@param self Gdk.Event # a `GdkEvent`
---@param click_count integer # location to store click count
---@return (boolean|nil) # `true` if the event delivered a click count
function Gdk.Event:get_click_count(click_count) end

--- # method Gdk.Event:get_coords()
---
--- Extract the event window relative x/y coordinates from an event.
---
--- ---
---
---@param self Gdk.Event # a `GdkEvent`
---@param x_win? number # location to put event window x coordinate
---@param y_win? number # location to put event window y coordinate
---@return (boolean|nil) # `true` if the event delivered event window coordinates
function Gdk.Event:get_coords(x_win, y_win) end

--- # method Gdk.Event:get_device()
---
--- If the event contains a “device” field, this function will return
--- it, else it will return `nil`.
---
--- ---
---
---@param self Gdk.Event # a `GdkEvent`.
---@return Gdk.Device # a `GdkDevice`, or `nil`.
function Gdk.Event:get_device() end

--- # method Gdk.Event:get_device_tool()
---
--- If the event was generated by a device that supports
--- different tools (eg. a tablet), this function will
--- return a `GdkDeviceTool` representing the tool that
--- caused the event. Otherwise, `nil` will be returned.
--- 
--- Note: the `GdkDeviceTool`<!-- -->s will be constant during
--- the application lifetime, if settings must be stored
--- persistently across runs, see `gdk_device_tool_get_serial()`
---
--- ---
---
---@param self Gdk.Event # a `GdkEvent`
---@return Gdk.DeviceTool # The current device tool, or `nil`
function Gdk.Event:get_device_tool() end

--- # method Gdk.Event:get_event_sequence()
---
--- If `event` if of type %GDK_TOUCH_BEGIN, %GDK_TOUCH_UPDATE,
--- %GDK_TOUCH_END or %GDK_TOUCH_CANCEL, returns the `GdkEventSequence`
--- to which the event belongs. Otherwise, return `nil`.
---
--- ---
---
---@param self Gdk.Event # a `GdkEvent`
---@return Gdk.EventSequence # the event sequence that the event belongs to
function Gdk.Event:get_event_sequence() end

--- # method Gdk.Event:get_event_type()
---
--- Retrieves the type of the event.
---
--- ---
---
---@param self Gdk.Event # a `GdkEvent`
---@return Gdk.EventType # a `GdkEventType`
function Gdk.Event:get_event_type() end

--- # method Gdk.Event:get_keycode()
---
--- Extracts the hardware keycode from an event.
--- 
--- Also see `gdk_event_get_scancode()`.
---
--- ---
---
---@param self Gdk.Event # a `GdkEvent`
---@param keycode integer # location to store the keycode
---@return (boolean|nil) # `true` if the event delivered a hardware keycode
function Gdk.Event:get_keycode(keycode) end

--- # method Gdk.Event:get_keyval()
---
--- Extracts the keyval from an event.
---
--- ---
---
---@param self Gdk.Event # a `GdkEvent`
---@param keyval integer # location to store the keyval
---@return (boolean|nil) # `true` if the event delivered a key symbol
function Gdk.Event:get_keyval(keyval) end

--- # method Gdk.Event:get_pointer_emulated()
---
--- `event`: a `GdkEvent`
--- Returns whether this event is an 'emulated' pointer event (typically
--- from a touch event), as opposed to a real one.
---
--- ---
---
---@param self Gdk.Event
---@return (boolean|nil) # `true` if this event is emulated
function Gdk.Event:get_pointer_emulated() end

--- # method Gdk.Event:get_root_coords()
---
--- Extract the root window relative x/y coordinates from an event.
---
--- ---
---
---@param self Gdk.Event # a `GdkEvent`
---@param x_root? number # location to put root window x coordinate
---@param y_root? number # location to put root window y coordinate
---@return (boolean|nil) # `true` if the event delivered root window coordinates
function Gdk.Event:get_root_coords(x_root, y_root) end

--- # method Gdk.Event:get_scancode()
---
--- Gets the keyboard low-level scancode of a key event.
--- 
--- This is usually hardware_keycode. On Windows this is the high
--- word of WM_KEY{DOWN,UP} lParam which contains the scancode and
--- some extended flags.
---
--- ---
---
---@param self Gdk.Event # a `GdkEvent`
---@return integer # The associated keyboard scancode or 0
function Gdk.Event:get_scancode() end

--- # method Gdk.Event:get_screen()
---
--- Returns the screen for the event. The screen is
--- typically the screen for `event->any.window`, but
--- for events such as mouse events, it is the screen
--- where the pointer was when the event occurs -
--- that is, the screen which has the root window
--- to which `event->motion.x_root` and
--- `event->motion.y_root` are relative.
---
--- ---
---
---@param self Gdk.Event # a `GdkEvent`
---@return Gdk.Screen # the screen for the event
function Gdk.Event:get_screen() end

--- # method Gdk.Event:get_scroll_deltas()
---
--- Retrieves the scroll deltas from a `GdkEvent`
--- 
--- See also: `gdk_event_get_scroll_direction()`
---
--- ---
---
---@param self Gdk.Event # a `GdkEvent`
---@param delta_x number # return location for X delta
---@param delta_y number # return location for Y delta
---@return (boolean|nil) # `true` if the event contains smooth scroll information and `false` otherwise
function Gdk.Event:get_scroll_deltas(delta_x, delta_y) end

--- # method Gdk.Event:get_scroll_direction()
---
--- Extracts the scroll direction from an event.
--- 
--- If `event` is not of type %GDK_SCROLL, the contents of `direction`
--- are undefined.
--- 
--- If you wish to handle both discrete and smooth scrolling, you
--- should check the return value of this function, or of
--- `gdk_event_get_scroll_deltas()`; for instance:
--- 
--- ```c
---   GdkScrollDirection direction;
---   double vscroll_factor = 0.0;
---   double x_scroll, y_scroll;
--- 
---   if (gdk_event_get_scroll_direction (event, &direction))
---     {
---       // Handle discrete scrolling with a known constant delta;
---       const double delta = 12.0;
--- 
---       switch (direction)
---         {
---         case GDK_SCROLL_UP:
---           vscroll_factor = -delta;
---           break;
---         case GDK_SCROLL_DOWN:
---           vscroll_factor = delta;
---           break;
---         default:
---           // no scrolling
---           break;
---         }
---     }
---   else if (gdk_event_get_scroll_deltas (event, &x_scroll, &y_scroll))
---     {
---       // Handle smooth scrolling directly
---       vscroll_factor = y_scroll;
---     }
--- ```
---
--- ---
---
---@param self Gdk.Event # a `GdkEvent`
---@param direction Gdk.ScrollDirection # location to store the scroll direction
---@return (boolean|nil) # `true` if the event delivered a scroll direction and `false` otherwise
function Gdk.Event:get_scroll_direction(direction) end

--- # method Gdk.Event:get_seat()
---
--- Returns the `GdkSeat` this event was generated for.
---
--- ---
---
---@param self Gdk.Event # a `GdkEvent`
---@return Gdk.Seat # The `GdkSeat` of this event
function Gdk.Event:get_seat() end

--- # method Gdk.Event:get_source_device()
---
--- This function returns the hardware (slave) `GdkDevice` that has
--- triggered the event, falling back to the virtual (master) device
--- (as in `gdk_event_get_device()`) if the event wasn’t caused by
--- interaction with a hardware device. This may happen for example
--- in synthesized crossing events after a `GdkWindow` updates its
--- geometry or a grab is acquired/released.
--- 
--- If the event does not contain a device field, this function will
--- return `nil`.
---
--- ---
---
---@param self Gdk.Event # a `GdkEvent`
---@return Gdk.Device # a `GdkDevice`, or `nil`.
function Gdk.Event:get_source_device() end

--- # method Gdk.Event:get_state()
---
--- If the event contains a “state” field, puts that field in `state`. Otherwise
--- stores an empty state (0). Returns `true` if there was a state field
--- in the event. `event` may be `nil`, in which case it’s treated
--- as if the event had no state field.
---
--- ---
---
---@param self? Gdk.Event # a `GdkEvent` or `nil`
---@param state Gdk.ModifierType # return location for state
---@return (boolean|nil) # `true` if there was a state field in the event
function Gdk.Event:get_state(state) end

--- # method Gdk.Event:get_time()
---
--- Returns the time stamp from `event`, if there is one; otherwise
--- returns `GDK_CURRENT_TIME`. If `event` is `nil`, returns `GDK_CURRENT_TIME`.
---
--- ---
---
---@param self Gdk.Event # a `GdkEvent`
---@return integer # time stamp field from `event`
function Gdk.Event:get_time() end

--- # method Gdk.Event:get_window()
---
--- Extracts the `GdkWindow` associated with an event.
---
--- ---
---
---@param self Gdk.Event # a `GdkEvent`
---@return Gdk.Window # The `GdkWindow` associated with the event
function Gdk.Event:get_window() end

--- # method Gdk.Event:is_scroll_stop_event()
---
--- Check whether a scroll event is a stop scroll event. Scroll sequences
--- with smooth scroll information may provide a stop scroll event once the
--- interaction with the device finishes, e.g. by lifting a finger. This
--- stop scroll event is the signal that a widget may trigger kinetic
--- scrolling based on the current velocity.
--- 
--- Stop scroll events always have a a delta of 0/0.
---
--- ---
---
---@param self Gdk.Event # a `GdkEvent`
---@return (boolean|nil) # `true` if the event is a scroll stop event
function Gdk.Event:is_scroll_stop_event() end

--- # method Gdk.Event:put()
---
--- Appends a copy of the given event onto the front of the event
--- queue for event->any.window’s display, or the default event
--- queue if event->any.window is `nil`. See `gdk_display_put_event()`.
---
--- ---
---
---@param self Gdk.Event # a `GdkEvent`.
---@return nil
function Gdk.Event:put() end

--- # method Gdk.Event:set_device()
---
--- Sets the device for `event` to `device`. The event must
--- have been allocated by GTK+, for instance, by
--- `gdk_event_copy()`.
---
--- ---
---
---@param self Gdk.Event # a `GdkEvent`
---@param device Gdk.Device # a `GdkDevice`
---@return nil
function Gdk.Event:set_device(device) end

--- # method Gdk.Event:set_device_tool()
---
--- Sets the device tool for this event, should be rarely used.
---
--- ---
---
---@param self Gdk.Event # a `GdkEvent`
---@param tool? Gdk.DeviceTool # tool to set on the event, or `nil`
---@return nil
function Gdk.Event:set_device_tool(tool) end

--- # method Gdk.Event:set_screen()
---
--- Sets the screen for `event` to `screen`. The event must
--- have been allocated by GTK+, for instance, by
--- `gdk_event_copy()`.
---
--- ---
---
---@param self Gdk.Event # a `GdkEvent`
---@param screen Gdk.Screen # a `GdkScreen`
---@return nil
function Gdk.Event:set_screen(screen) end

--- # method Gdk.Event:set_source_device()
---
--- Sets the slave device for `event` to `device`.
--- 
--- The event must have been allocated by GTK+,
--- for instance by `gdk_event_copy()`.
---
--- ---
---
---@param self Gdk.Event # a `GdkEvent`
---@param device Gdk.Device # a `GdkDevice`
---@return nil
function Gdk.Event:set_source_device(device) end

--- # method Gdk.Event:triggers_context_menu()
---
--- This function returns whether a `GdkEventButton` should trigger a
--- context menu, according to platform conventions. The right mouse
--- button always triggers context menus. Additionally, if
--- `gdk_keymap_get_modifier_mask()` returns a non-0 mask for
--- %GDK_MODIFIER_INTENT_CONTEXT_MENU, then the left mouse button will
--- also trigger a context menu if this modifier is pressed.
--- 
--- This function should always be used instead of simply checking for
--- event->button == %GDK_BUTTON_SECONDARY.
---
--- ---
---
---@param self Gdk.Event # a `GdkEvent`, currently only button events are meaningful values
---@return (boolean|nil) # `true` if the event should trigger a context menu.
function Gdk.Event:triggers_context_menu() end

--- # function Gdk.Event.get()
---
--- Checks all open displays for a `GdkEvent` to process,to be processed
--- on, fetching events from the windowing system if necessary.
--- See `gdk_display_get_event()`.
---
--- ---
---
---@return Gdk.Event # the next `GdkEvent` to be processed, or `nil` if no events are pending. The returned `GdkEvent` should be freed with `gdk_event_free()`.
function Gdk.Event.get() end

--- # function Gdk.Event.handler_set()
---
--- Sets the function to call to handle all events from GDK.
--- 
--- Note that GTK+ uses this to install its own event handler, so it is
--- usually not useful for GTK+ applications. (Although an application
--- can call this function then call `gtk_main_do_event()` to pass
--- events to GTK+.)
---
--- ---
---
---@param func Gdk.EventFunc # the function to call to handle events from GDK.
---@param data? userdata # user data to pass to the function.
---@param notify GLib.DestroyNotify # the function to call when the handler function is removed, i.e. when `gdk_event_handler_set()` is called with another event handler.
---@return nil
function Gdk.Event.handler_set(func, data, notify) end

--- # function Gdk.Event.peek()
---
--- If there is an event waiting in the event queue of some open
--- display, returns a copy of it. See `gdk_display_peek_event()`.
---
--- ---
---
---@return Gdk.Event # a copy of the first `GdkEvent` on some event queue, or `nil` if no events are in any queues. The returned `GdkEvent` should be freed with `gdk_event_free()`.
function Gdk.Event.peek() end

--- # function Gdk.Event.request_motions()
---
--- Request more motion notifies if `event` is a motion notify hint event.
--- 
--- This function should be used instead of `gdk_window_get_pointer()` to
--- request further motion notifies, because it also works for extension
--- events where motion notifies are provided for devices other than the
--- core pointer. Coordinate extraction, processing and requesting more
--- motion events from a %GDK_MOTION_NOTIFY event usually works like this:
--- 
--- ```c
--- {
---   // motion_event handler
---   x = motion_event->x;
---   y = motion_event->y;
---   // handle (x,y) motion
---   gdk_event_request_motions (motion_event); // handles is_hint events
--- }
--- ```
---
--- ---
---
---@param event Gdk.EventMotion # a valid `GdkEvent`
---@return nil
function Gdk.Event.request_motions(event) end

--- # function Gdk.Event.new()
---
--- Creates a new event of the given type. All fields are set to 0.
---
--- ---
---
---@param type Gdk.EventType # a `GdkEventType`
---@return Gdk.Event # a newly-allocated `GdkEvent`. The returned `GdkEvent` should be freed with `gdk_event_free()`.
function Gdk.Event.new(type) end

--- # record Gdk.EventAny
---
--- Contains the fields which are common to all event structs.
--- Any event pointer can safely be cast to a pointer to a `GdkEventAny` to
--- access these fields.
---
--- ---
---
---@class Gdk.EventAny
---@field type Gdk.EventType # the type of the event.
---@field window Gdk.Window # the window which received the event.
---@field send_event integer # `true` if the event was sent explicitly.
Gdk.EventAny = {}

--- # record Gdk.EventButton
---
--- Used for button press and button release events. The
--- `type` field will be one of %GDK_BUTTON_PRESS,
--- %GDK_2BUTTON_PRESS, %GDK_3BUTTON_PRESS or %GDK_BUTTON_RELEASE,
--- 
--- Double and triple-clicks result in a sequence of events being received.
--- For double-clicks the order of events will be:
--- 
--- - %GDK_BUTTON_PRESS
--- - %GDK_BUTTON_RELEASE
--- - %GDK_BUTTON_PRESS
--- - %GDK_2BUTTON_PRESS
--- - %GDK_BUTTON_RELEASE
--- 
--- Note that the first click is received just like a normal
--- button press, while the second click results in a %GDK_2BUTTON_PRESS
--- being received just after the %GDK_BUTTON_PRESS.
--- 
--- Triple-clicks are very similar to double-clicks, except that
--- %GDK_3BUTTON_PRESS is inserted after the third click. The order of the
--- events is:
--- 
--- - %GDK_BUTTON_PRESS
--- - %GDK_BUTTON_RELEASE
--- - %GDK_BUTTON_PRESS
--- - %GDK_2BUTTON_PRESS
--- - %GDK_BUTTON_RELEASE
--- - %GDK_BUTTON_PRESS
--- - %GDK_3BUTTON_PRESS
--- - %GDK_BUTTON_RELEASE
--- 
--- For a double click to occur, the second button press must occur within
--- 1/4 of a second of the first. For a triple click to occur, the third
--- button press must also occur within 1/2 second of the first button press.
---
--- ---
---
---@class Gdk.EventButton
---@field type Gdk.EventType # the type of the event (%GDK_BUTTON_PRESS, %GDK_2BUTTON_PRESS, %GDK_3BUTTON_PRESS or %GDK_BUTTON_RELEASE).
---@field window Gdk.Window # the window which received the event.
---@field send_event integer # `true` if the event was sent explicitly.
---@field time integer # the time of the event in milliseconds.
---@field x number # the x coordinate of the pointer relative to the window.
---@field y number # the y coordinate of the pointer relative to the window.
---@field axes number # `x`, `y` translated to the axes of `device`, or `nil` if `device` is the mouse.
---@field state Gdk.ModifierType # a bit-mask representing the state of the modifier keys (e.g. Control, Shift and Alt) and the pointer buttons. See `GdkModifierType`.
---@field button integer # the button which was pressed or released, numbered from 1 to 5. Normally button 1 is the left mouse button, 2 is the middle button, and 3 is the right button. On 2-button mice, the middle button can often be simulated by pressing both mouse buttons together.
---@field device Gdk.Device # the master device that the event originated from. Use `gdk_event_get_source_device()` to get the slave device.
---@field x_root number # the x coordinate of the pointer relative to the root of the screen.
---@field y_root number # the y coordinate of the pointer relative to the root of the screen.
Gdk.EventButton = {}

--- # record Gdk.EventConfigure
---
--- Generated when a window size or position has changed.
---
--- ---
---
---@class Gdk.EventConfigure
---@field type Gdk.EventType # the type of the event (%GDK_CONFIGURE).
---@field window Gdk.Window # the window which received the event.
---@field send_event integer # `true` if the event was sent explicitly.
---@field x integer # the new x coordinate of the window, relative to its parent.
---@field y integer # the new y coordinate of the window, relative to its parent.
---@field width integer # the new width of the window.
---@field height integer # the new height of the window.
Gdk.EventConfigure = {}

--- # record Gdk.EventCrossing
---
--- Generated when the pointer enters or leaves a window.
---
--- ---
---
---@class Gdk.EventCrossing
---@field type Gdk.EventType # the type of the event (%GDK_ENTER_NOTIFY or %GDK_LEAVE_NOTIFY).
---@field window Gdk.Window # the window which received the event.
---@field send_event integer # `true` if the event was sent explicitly.
---@field subwindow Gdk.Window # the window that was entered or left.
---@field time integer # the time of the event in milliseconds.
---@field x number # the x coordinate of the pointer relative to the window.
---@field y number # the y coordinate of the pointer relative to the window.
---@field x_root number # the x coordinate of the pointer relative to the root of the screen.
---@field y_root number # the y coordinate of the pointer relative to the root of the screen.
---@field mode Gdk.CrossingMode # the crossing mode (%GDK_CROSSING_NORMAL, %GDK_CROSSING_GRAB, %GDK_CROSSING_UNGRAB, %GDK_CROSSING_GTK_GRAB, %GDK_CROSSING_GTK_UNGRAB or %GDK_CROSSING_STATE_CHANGED). %GDK_CROSSING_GTK_GRAB, %GDK_CROSSING_GTK_UNGRAB, and %GDK_CROSSING_STATE_CHANGED were added in 2.14 and are always synthesized, never native.
---@field detail Gdk.NotifyType # the kind of crossing that happened (%GDK_NOTIFY_INFERIOR, %GDK_NOTIFY_ANCESTOR, %GDK_NOTIFY_VIRTUAL, %GDK_NOTIFY_NONLINEAR or %GDK_NOTIFY_NONLINEAR_VIRTUAL).
---@field focus (boolean|nil) # `true` if `window` is the focus window or an inferior.
---@field state Gdk.ModifierType # a bit-mask representing the state of the modifier keys (e.g. Control, Shift and Alt) and the pointer buttons. See `GdkModifierType`.
Gdk.EventCrossing = {}

--- # record Gdk.EventDND
---
--- Generated during DND operations.
---
--- ---
---
---@class Gdk.EventDND
---@field type Gdk.EventType # the type of the event (%GDK_DRAG_ENTER, %GDK_DRAG_LEAVE, %GDK_DRAG_MOTION, %GDK_DRAG_STATUS, %GDK_DROP_START or %GDK_DROP_FINISHED).
---@field window Gdk.Window # the window which received the event.
---@field send_event integer # `true` if the event was sent explicitly.
---@field context Gdk.DragContext # the `GdkDragContext` for the current DND operation.
---@field time integer # the time of the event in milliseconds.
---@field x_root integer # the x coordinate of the pointer relative to the root of the screen, only set for %GDK_DRAG_MOTION and %GDK_DROP_START.
---@field y_root integer # the y coordinate of the pointer relative to the root of the screen, only set for %GDK_DRAG_MOTION and %GDK_DROP_START.
Gdk.EventDND = {}

--- # record Gdk.EventExpose
---
--- Generated when all or part of a window becomes visible and needs to be
--- redrawn.
---
--- ---
---
---@class Gdk.EventExpose
---@field type Gdk.EventType # the type of the event (%GDK_EXPOSE or %GDK_DAMAGE).
---@field window Gdk.Window # the window which received the event.
---@field send_event integer # `true` if the event was sent explicitly.
---@field area Gdk.Rectangle # bounding box of `region`.
---@field region cairo.Region # the region that needs to be redrawn.
---@field count integer # the number of contiguous %GDK_EXPOSE events following this one. The only use for this is “exposure compression”, i.e. handling all contiguous %GDK_EXPOSE events in one go, though GDK performs some exposure compression so this is not normally needed.
Gdk.EventExpose = {}

--- # record Gdk.EventFocus
---
--- Describes a change of keyboard focus.
---
--- ---
---
---@class Gdk.EventFocus
---@field type Gdk.EventType # the type of the event (%GDK_FOCUS_CHANGE).
---@field window Gdk.Window # the window which received the event.
---@field send_event integer # `true` if the event was sent explicitly.
---@field in__ integer # `true` if the window has gained the keyboard focus, `false` if it has lost the focus.
Gdk.EventFocus = {}

---@alias Gdk.EventFunc fun(event: Gdk.Event, data: userdata): nil

--- # record Gdk.EventGrabBroken
---
--- Generated when a pointer or keyboard grab is broken. On X11, this happens
--- when the grab window becomes unviewable (i.e. it or one of its ancestors
--- is unmapped), or if the same application grabs the pointer or keyboard
--- again. Note that implicit grabs (which are initiated by button presses)
--- can also cause `GdkEventGrabBroken` events.
---
--- ---
---
---@class Gdk.EventGrabBroken
---@field type Gdk.EventType # the type of the event (%GDK_GRAB_BROKEN)
---@field window Gdk.Window # the window which received the event, i.e. the window that previously owned the grab
---@field send_event integer # `true` if the event was sent explicitly.
---@field keyboard (boolean|nil) # `true` if a keyboard grab was broken, `false` if a pointer grab was broken
---@field implicit (boolean|nil) # `true` if the broken grab was implicit
---@field grab_window Gdk.Window # If this event is caused by another grab in the same application, `grab_window` contains the new grab window. Otherwise `grab_window` is `nil`.
Gdk.EventGrabBroken = {}

--- # record Gdk.EventKey
---
--- Describes a key press or key release event.
---
--- ---
---
---@class Gdk.EventKey
---@field type Gdk.EventType # the type of the event (%GDK_KEY_PRESS or %GDK_KEY_RELEASE).
---@field window Gdk.Window # the window which received the event.
---@field send_event integer # `true` if the event was sent explicitly.
---@field time integer # the time of the event in milliseconds.
---@field state Gdk.ModifierType # a bit-mask representing the state of the modifier keys (e.g. Control, Shift and Alt) and the pointer buttons. See `GdkModifierType`.
---@field keyval integer # the key that was pressed or released. See the `gdk/gdkkeysyms.h` header file for a complete list of GDK key codes.
---@field length integer # the length of `string`.
---@field string string # a string containing an approximation of the text that would result from this keypress. The only correct way to handle text input of text is using input methods (see `GtkIMContext`), so this field is deprecated and should never be used. (`gdk_unicode_to_keyval()` provides a non-deprecated way of getting an approximate translation for a key.) The string is encoded in the encoding of the current locale (Note: this for backwards compatibility: strings in GTK+ and GDK are typically in UTF-8.) and NUL-terminated. In some cases, the translation of the key code will be a single NUL byte, in which case looking at `length` is necessary to distinguish it from the an empty translation.
---@field hardware_keycode integer # the raw code of the key that was pressed or released.
---@field group integer # the keyboard group.
---@field is_modifier integer # a flag that indicates if `hardware_keycode` is mapped to a modifier. Since 2.10
Gdk.EventKey = {}

---@enum Gdk.EventMask
Gdk.EventMask = {}

--- # record Gdk.EventMotion
---
--- Generated when the pointer moves.
---
--- ---
---
---@class Gdk.EventMotion
---@field type Gdk.EventType # the type of the event.
---@field window Gdk.Window # the window which received the event.
---@field send_event integer # `true` if the event was sent explicitly.
---@field time integer # the time of the event in milliseconds.
---@field x number # the x coordinate of the pointer relative to the window.
---@field y number # the y coordinate of the pointer relative to the window.
---@field axes number # `x`, `y` translated to the axes of `device`, or `nil` if `device` is the mouse.
---@field state Gdk.ModifierType # a bit-mask representing the state of the modifier keys (e.g. Control, Shift and Alt) and the pointer buttons. See `GdkModifierType`.
---@field is_hint integer # set to 1 if this event is just a hint, see the %GDK_POINTER_MOTION_HINT_MASK value of `GdkEventMask`.
---@field device Gdk.Device # the master device that the event originated from. Use `gdk_event_get_source_device()` to get the slave device.
---@field x_root number # the x coordinate of the pointer relative to the root of the screen.
---@field y_root number # the y coordinate of the pointer relative to the root of the screen.
Gdk.EventMotion = {}

--- # record Gdk.EventOwnerChange
---
--- Generated when the owner of a selection changes. On X11, this
--- information is only available if the X server supports the XFIXES
--- extension.
---
--- ---
---
---@class Gdk.EventOwnerChange
---@field type Gdk.EventType # the type of the event (%GDK_OWNER_CHANGE).
---@field window Gdk.Window # the window which received the event
---@field send_event integer # `true` if the event was sent explicitly.
---@field owner Gdk.Window # the new owner of the selection, or `nil` if there is none
---@field reason Gdk.OwnerChange # the reason for the ownership change as a `GdkOwnerChange` value
---@field selection Gdk.Atom # the atom identifying the selection
---@field time integer # the timestamp of the event
---@field selection_time integer # the time at which the selection ownership was taken over
Gdk.EventOwnerChange = {}

--- # record Gdk.EventPadAxis
---
--- Generated during %GDK_SOURCE_TABLET_PAD interaction with tactile sensors.
---
--- ---
---
---@class Gdk.EventPadAxis
---@field type Gdk.EventType # the type of the event (%GDK_PAD_RING or %GDK_PAD_STRIP).
---@field window Gdk.Window # the window which received the event.
---@field send_event integer # `true` if the event was sent explicitly.
---@field time integer # the time of the event in milliseconds.
---@field group integer # the pad group the ring/strip belongs to. A %GDK_SOURCE_TABLET_PAD device may have one or more groups containing a set of buttons/rings/strips each.
---@field index integer # number of strip/ring that was interacted. This number is 0-indexed.
---@field mode integer # The current mode of `group`. Different groups in a %GDK_SOURCE_TABLET_PAD device may have different current modes.
---@field value number # The current value for the given axis.
Gdk.EventPadAxis = {}

--- # record Gdk.EventPadButton
---
--- Generated during %GDK_SOURCE_TABLET_PAD button presses and releases.
---
--- ---
---
---@class Gdk.EventPadButton
---@field type Gdk.EventType # the type of the event (%GDK_PAD_BUTTON_PRESS or %GDK_PAD_BUTTON_RELEASE).
---@field window Gdk.Window # the window which received the event.
---@field send_event integer # `true` if the event was sent explicitly.
---@field time integer # the time of the event in milliseconds.
---@field group integer # the pad group the button belongs to. A %GDK_SOURCE_TABLET_PAD device may have one or more groups containing a set of buttons/rings/strips each.
---@field button integer # The pad button that was pressed.
---@field mode integer # The current mode of `group`. Different groups in a %GDK_SOURCE_TABLET_PAD device may have different current modes.
Gdk.EventPadButton = {}

--- # record Gdk.EventPadGroupMode
---
--- Generated during %GDK_SOURCE_TABLET_PAD mode switches in a group.
---
--- ---
---
---@class Gdk.EventPadGroupMode
---@field type Gdk.EventType # the type of the event (%GDK_PAD_GROUP_MODE).
---@field window Gdk.Window # the window which received the event.
---@field send_event integer # `true` if the event was sent explicitly.
---@field time integer # the time of the event in milliseconds.
---@field group integer # the pad group that is switching mode. A %GDK_SOURCE_TABLET_PAD device may have one or more groups containing a set of buttons/rings/strips each.
---@field mode integer # The new mode of `group`. Different groups in a %GDK_SOURCE_TABLET_PAD device may have different current modes.
Gdk.EventPadGroupMode = {}

--- # record Gdk.EventProperty
---
--- Describes a property change on a window.
---
--- ---
---
---@class Gdk.EventProperty
---@field type Gdk.EventType # the type of the event (%GDK_PROPERTY_NOTIFY).
---@field window Gdk.Window # the window which received the event.
---@field send_event integer # `true` if the event was sent explicitly.
---@field atom Gdk.Atom # the property that was changed.
---@field time integer # the time of the event in milliseconds.
---@field state Gdk.PropertyState # whether the property was changed (%GDK_PROPERTY_NEW_VALUE) or deleted (%GDK_PROPERTY_DELETE).
Gdk.EventProperty = {}

--- # record Gdk.EventProximity
---
--- Proximity events are generated when using GDK’s wrapper for the
--- XInput extension. The XInput extension is an add-on for standard X
--- that allows you to use nonstandard devices such as graphics tablets.
--- A proximity event indicates that the stylus has moved in or out of
--- contact with the tablet, or perhaps that the user’s finger has moved
--- in or out of contact with a touch screen.
--- 
--- This event type will be used pretty rarely. It only is important for
--- XInput aware programs that are drawing their own cursor.
---
--- ---
---
---@class Gdk.EventProximity
---@field type Gdk.EventType # the type of the event (%GDK_PROXIMITY_IN or %GDK_PROXIMITY_OUT).
---@field window Gdk.Window # the window which received the event.
---@field send_event integer # `true` if the event was sent explicitly.
---@field time integer # the time of the event in milliseconds.
---@field device Gdk.Device # the master device that the event originated from. Use `gdk_event_get_source_device()` to get the slave device.
Gdk.EventProximity = {}

--- # record Gdk.EventScroll
---
--- Generated from button presses for the buttons 4 to 7. Wheel mice are
--- usually configured to generate button press events for buttons 4 and 5
--- when the wheel is turned.
--- 
--- Some GDK backends can also generate “smooth” scroll events, which
--- can be recognized by the %GDK_SCROLL_SMOOTH scroll direction. For
--- these, the scroll deltas can be obtained with
--- `gdk_event_get_scroll_deltas()`.
---
--- ---
---
---@class Gdk.EventScroll
---@field type Gdk.EventType # the type of the event (%GDK_SCROLL).
---@field window Gdk.Window # the window which received the event.
---@field send_event integer # `true` if the event was sent explicitly.
---@field time integer # the time of the event in milliseconds.
---@field x number # the x coordinate of the pointer relative to the window.
---@field y number # the y coordinate of the pointer relative to the window.
---@field state Gdk.ModifierType # a bit-mask representing the state of the modifier keys (e.g. Control, Shift and Alt) and the pointer buttons. See `GdkModifierType`.
---@field direction Gdk.ScrollDirection # the direction to scroll to (one of %GDK_SCROLL_UP, %GDK_SCROLL_DOWN, %GDK_SCROLL_LEFT, %GDK_SCROLL_RIGHT or %GDK_SCROLL_SMOOTH).
---@field device Gdk.Device # the master device that the event originated from. Use `gdk_event_get_source_device()` to get the slave device.
---@field x_root number # the x coordinate of the pointer relative to the root of the screen.
---@field y_root number # the y coordinate of the pointer relative to the root of the screen.
---@field delta_x number # the x coordinate of the scroll delta
---@field delta_y number # the y coordinate of the scroll delta
---@field is_stop integer
Gdk.EventScroll = {}

--- # record Gdk.EventSelection
---
--- Generated when a selection is requested or ownership of a selection
--- is taken over by another client application.
---
--- ---
---
---@class Gdk.EventSelection
---@field type Gdk.EventType # the type of the event (%GDK_SELECTION_CLEAR, %GDK_SELECTION_NOTIFY or %GDK_SELECTION_REQUEST).
---@field window Gdk.Window # the window which received the event.
---@field send_event integer # `true` if the event was sent explicitly.
---@field selection Gdk.Atom # the selection.
---@field target Gdk.Atom # the target to which the selection should be converted.
---@field property Gdk.Atom # the property in which to place the result of the conversion.
---@field time integer # the time of the event in milliseconds.
---@field requestor Gdk.Window # the window on which to place `property` or `nil` if none.
Gdk.EventSelection = {}

--- # record Gdk.EventSequence
---
---@class Gdk.EventSequence
Gdk.EventSequence = {}

--- # record Gdk.EventSetting
---
--- Generated when a setting is modified.
---
--- ---
---
---@class Gdk.EventSetting
---@field type Gdk.EventType # the type of the event (%GDK_SETTING).
---@field window Gdk.Window # the window which received the event.
---@field send_event integer # `true` if the event was sent explicitly.
---@field action Gdk.SettingAction # what happened to the setting (%GDK_SETTING_ACTION_NEW, %GDK_SETTING_ACTION_CHANGED or %GDK_SETTING_ACTION_DELETED).
---@field name string # the name of the setting.
Gdk.EventSetting = {}

--- # record Gdk.EventTouch
---
--- Used for touch events.
--- `type` field will be one of %GDK_TOUCH_BEGIN, %GDK_TOUCH_UPDATE,
--- %GDK_TOUCH_END or %GDK_TOUCH_CANCEL.
--- 
--- Touch events are grouped into sequences by means of the `sequence`
--- field, which can also be obtained with `gdk_event_get_event_sequence()`.
--- Each sequence begins with a %GDK_TOUCH_BEGIN event, followed by
--- any number of %GDK_TOUCH_UPDATE events, and ends with a %GDK_TOUCH_END
--- (or %GDK_TOUCH_CANCEL) event. With multitouch devices, there may be
--- several active sequences at the same time.
---
--- ---
---
---@class Gdk.EventTouch
---@field type Gdk.EventType # the type of the event (%GDK_TOUCH_BEGIN, %GDK_TOUCH_UPDATE, %GDK_TOUCH_END, %GDK_TOUCH_CANCEL)
---@field window Gdk.Window # the window which received the event
---@field send_event integer # `true` if the event was sent explicitly.
---@field time integer # the time of the event in milliseconds.
---@field x number # the x coordinate of the pointer relative to the window
---@field y number # the y coordinate of the pointer relative to the window
---@field axes number # `x`, `y` translated to the axes of `device`, or `nil` if `device` is the mouse
---@field state Gdk.ModifierType # a bit-mask representing the state of the modifier keys (e.g. Control, Shift and Alt) and the pointer buttons. See `GdkModifierType`
---@field sequence Gdk.EventSequence # the event sequence that the event belongs to
---@field emulating_pointer (boolean|nil) # whether the event should be used for emulating pointer event
---@field device Gdk.Device # the master device that the event originated from. Use `gdk_event_get_source_device()` to get the slave device.
---@field x_root number # the x coordinate of the pointer relative to the root of the screen
---@field y_root number # the y coordinate of the pointer relative to the root of the screen
Gdk.EventTouch = {}

--- # record Gdk.EventTouchpadPinch
---
--- Generated during touchpad swipe gestures.
---
--- ---
---
---@class Gdk.EventTouchpadPinch
---@field type Gdk.EventType # the type of the event (%GDK_TOUCHPAD_PINCH)
---@field window Gdk.Window # the window which received the event
---@field send_event integer # `true` if the event was sent explicitly
---@field phase integer # the current phase of the gesture
---@field n_fingers integer # The number of fingers triggering the pinch
---@field time integer # the time of the event in milliseconds
---@field x number # The X coordinate of the pointer
---@field y number # The Y coordinate of the pointer
---@field dx number # Movement delta in the X axis of the swipe focal point
---@field dy number # Movement delta in the Y axis of the swipe focal point
---@field angle_delta number # The angle change in radians, negative angles denote counter-clockwise movements
---@field scale number # The current scale, relative to that at the time of the corresponding %GDK_TOUCHPAD_GESTURE_PHASE_BEGIN event
---@field x_root number # The X coordinate of the pointer, relative to the root of the screen.
---@field y_root number # The Y coordinate of the pointer, relative to the root of the screen.
---@field state Gdk.ModifierType # a bit-mask representing the state of the modifier keys (e.g. Control, Shift and Alt) and the pointer buttons. See `GdkModifierType`.
Gdk.EventTouchpadPinch = {}

--- # record Gdk.EventTouchpadSwipe
---
--- Generated during touchpad swipe gestures.
---
--- ---
---
---@class Gdk.EventTouchpadSwipe
---@field type Gdk.EventType # the type of the event (%GDK_TOUCHPAD_SWIPE)
---@field window Gdk.Window # the window which received the event
---@field send_event integer # `true` if the event was sent explicitly
---@field phase integer # the current phase of the gesture
---@field n_fingers integer # The number of fingers triggering the swipe
---@field time integer # the time of the event in milliseconds
---@field x number # The X coordinate of the pointer
---@field y number # The Y coordinate of the pointer
---@field dx number # Movement delta in the X axis of the swipe focal point
---@field dy number # Movement delta in the Y axis of the swipe focal point
---@field x_root number # The X coordinate of the pointer, relative to the root of the screen.
---@field y_root number # The Y coordinate of the pointer, relative to the root of the screen.
---@field state Gdk.ModifierType # a bit-mask representing the state of the modifier keys (e.g. Control, Shift and Alt) and the pointer buttons. See `GdkModifierType`.
Gdk.EventTouchpadSwipe = {}

---@enum Gdk.EventType
Gdk.EventType = {}

--- # record Gdk.EventVisibility
---
--- Generated when the window visibility status has changed.
---
--- ---
---
---@class Gdk.EventVisibility
---@field type Gdk.EventType # the type of the event (%GDK_VISIBILITY_NOTIFY).
---@field window Gdk.Window # the window which received the event.
---@field send_event integer # `true` if the event was sent explicitly.
---@field state Gdk.VisibilityState # the new visibility state (%GDK_VISIBILITY_FULLY_OBSCURED, %GDK_VISIBILITY_PARTIAL or %GDK_VISIBILITY_UNOBSCURED).
Gdk.EventVisibility = {}

--- # record Gdk.EventWindowState
---
--- Generated when the state of a toplevel window changes.
---
--- ---
---
---@class Gdk.EventWindowState
---@field type Gdk.EventType # the type of the event (%GDK_WINDOW_STATE).
---@field window Gdk.Window # the window which received the event.
---@field send_event integer # `true` if the event was sent explicitly.
---@field changed_mask Gdk.WindowState # mask specifying what flags have changed.
---@field new_window_state Gdk.WindowState # the new window state, a combination of `GdkWindowState` bits.
Gdk.EventWindowState = {}

---@alias Gdk.FilterFunc fun(xevent: Gdk.XEvent, event: Gdk.Event, data: userdata): Gdk.FilterReturn

---@enum Gdk.FilterReturn
Gdk.FilterReturn = {}

--- # class Gdk.FrameClock
---
--- A `GdkFrameClock` tells the application when to update and repaint a
--- window. This may be synced to the vertical refresh rate of the
--- monitor, for example. Even when the frame clock uses a simple timer
--- rather than a hardware-based vertical sync, the frame clock helps
--- because it ensures everything paints at the same time (reducing the
--- total number of frames). The frame clock can also automatically
--- stop painting when it knows the frames will not be visible, or
--- scale back animation framerates.
--- 
--- `GdkFrameClock` is designed to be compatible with an OpenGL-based
--- implementation or with mozRequestAnimationFrame in Firefox,
--- for example.
--- 
--- A frame clock is idle until someone requests a frame with
--- `gdk_frame_clock_request_phase()`. At some later point that makes
--- sense for the synchronization being implemented, the clock will
--- process a frame and emit signals for each phase that has been
--- requested. (See the signals of the `GdkFrameClock` class for
--- documentation of the phases. %GDK_FRAME_CLOCK_PHASE_UPDATE and the
--- `GdkFrameClock`::update signal are most interesting for application
--- writers, and are used to update the animations, using the frame time
--- given by `gdk_frame_clock_get_frame_time()`.
--- 
--- The frame time is reported in microseconds and generally in the same
--- timescale as `g_get_monotonic_time()`, however, it is not the same
--- as `g_get_monotonic_time()`. The frame time does not advance during
--- the time a frame is being painted, and outside of a frame, an attempt
--- is made so that all calls to `gdk_frame_clock_get_frame_time()` that
--- are called at a “similar” time get the same value. This means that
--- if different animations are timed by looking at the difference in
--- time between an initial value from `gdk_frame_clock_get_frame_time()`
--- and the value inside the `GdkFrameClock`::update signal of the clock,
--- they will stay exactly synchronized.
---
--- ---
---
---@class Gdk.FrameClock : GObject.Object
Gdk.FrameClock = {}

--- # method Gdk.FrameClock:begin_updating()
---
--- Starts updates for an animation. Until a matching call to
--- `gdk_frame_clock_end_updating()` is made, the frame clock will continually
--- request a new frame with the %GDK_FRAME_CLOCK_PHASE_UPDATE phase.
--- This function may be called multiple times and frames will be
--- requested until `gdk_frame_clock_end_updating()` is called the same
--- number of times.
---
--- ---
---
---@param self Gdk.FrameClock # a `GdkFrameClock`
---@return nil
function Gdk.FrameClock:begin_updating() end

--- # method Gdk.FrameClock:end_updating()
---
--- Stops updates for an animation. See the documentation for
--- `gdk_frame_clock_begin_updating()`.
---
--- ---
---
---@param self Gdk.FrameClock # a `GdkFrameClock`
---@return nil
function Gdk.FrameClock:end_updating() end

--- # method Gdk.FrameClock:get_current_timings()
---
--- Gets the frame timings for the current frame.
---
--- ---
---
---@param self Gdk.FrameClock # a `GdkFrameClock`
---@return Gdk.FrameTimings # the `GdkFrameTimings` for the frame currently being processed, or even no frame is being processed, for the previous frame. Before any frames have been processed, returns `nil`.
function Gdk.FrameClock:get_current_timings() end

--- # method Gdk.FrameClock:get_frame_counter()
---
--- A `GdkFrameClock` maintains a 64-bit counter that increments for
--- each frame drawn.
---
--- ---
---
---@param self Gdk.FrameClock # a `GdkFrameClock`
---@return integer # inside frame processing, the value of the frame counter for the current frame. Outside of frame processing, the frame counter for the last frame.
function Gdk.FrameClock:get_frame_counter() end

--- # method Gdk.FrameClock:get_frame_time()
---
--- Gets the time that should currently be used for animations.  Inside
--- the processing of a frame, it’s the time used to compute the
--- animation position of everything in a frame. Outside of a frame, it's
--- the time of the conceptual “previous frame,” which may be either
--- the actual previous frame time, or if that’s too old, an updated
--- time.
---
--- ---
---
---@param self Gdk.FrameClock # a `GdkFrameClock`
---@return integer # a timestamp in microseconds, in the timescale of of `g_get_monotonic_time()`.
function Gdk.FrameClock:get_frame_time() end

--- # method Gdk.FrameClock:get_history_start()
---
--- `GdkFrameClock` internally keeps a history of `GdkFrameTimings`
--- objects for recent frames that can be retrieved with
--- `gdk_frame_clock_get_timings()`. The set of stored frames
--- is the set from the counter values given by
--- `gdk_frame_clock_get_history_start()` and
--- `gdk_frame_clock_get_frame_counter()`, inclusive.
---
--- ---
---
---@param self Gdk.FrameClock # a `GdkFrameClock`
---@return integer # the frame counter value for the oldest frame that is available in the internal frame history of the `GdkFrameClock`.
function Gdk.FrameClock:get_history_start() end

--- # method Gdk.FrameClock:get_refresh_info()
---
--- Using the frame history stored in the frame clock, finds the last
--- known presentation time and refresh interval, and assuming that
--- presentation times are separated by the refresh interval,
--- predicts a presentation time that is a multiple of the refresh
--- interval after the last presentation time, and later than `base_time`.
---
--- ---
---
---@param self Gdk.FrameClock # a `GdkFrameClock`
---@param base_time integer # base time for determining a presentaton time
---@param refresh_interval_return? integer # a location to store the determined refresh interval, or `nil`. A default refresh interval of 1/60th of a second will be stored if no history is present.
---@param presentation_time_return integer # a location to store the next candidate presentation time after the given base time. 0 will be will be stored if no history is present.
---@return nil
function Gdk.FrameClock:get_refresh_info(base_time, refresh_interval_return, presentation_time_return) end

--- # method Gdk.FrameClock:get_timings()
---
--- Retrieves a `GdkFrameTimings` object holding timing information
--- for the current frame or a recent frame. The `GdkFrameTimings`
--- object may not yet be complete: see `gdk_frame_timings_get_complete()`.
---
--- ---
---
---@param self Gdk.FrameClock # a `GdkFrameClock`
---@param frame_counter integer # the frame counter value identifying the frame to be received.
---@return Gdk.FrameTimings # the `GdkFrameTimings` object for the specified frame, or `nil` if it is not available. See `gdk_frame_clock_get_history_start()`.
function Gdk.FrameClock:get_timings(frame_counter) end

--- # method Gdk.FrameClock:request_phase()
---
--- Asks the frame clock to run a particular phase. The signal
--- corresponding the requested phase will be emitted the next
--- time the frame clock processes. Multiple calls to
--- `gdk_frame_clock_request_phase()` will be combined together
--- and only one frame processed. If you are displaying animated
--- content and want to continually request the
--- %GDK_FRAME_CLOCK_PHASE_UPDATE phase for a period of time,
--- you should use `gdk_frame_clock_begin_updating()` instead, since
--- this allows GTK+ to adjust system parameters to get maximally
--- smooth animations.
---
--- ---
---
---@param self Gdk.FrameClock # a `GdkFrameClock`
---@param phase Gdk.FrameClockPhase # the phase that is requested
---@return nil
function Gdk.FrameClock:request_phase(phase) end

--- # record Gdk.FrameClockClass
---
---@class Gdk.FrameClockClass
Gdk.FrameClockClass = {}

---@enum Gdk.FrameClockPhase
Gdk.FrameClockPhase = {}

--- # record Gdk.FrameClockPrivate
---
---@class Gdk.FrameClockPrivate
Gdk.FrameClockPrivate = {}

--- # record Gdk.FrameTimings
---
--- A `GdkFrameTimings` object holds timing information for a single frame
--- of the application’s displays. To retrieve `GdkFrameTimings` objects,
--- use `gdk_frame_clock_get_timings()` or `gdk_frame_clock_get_current_timings()`.
--- The information in `GdkFrameTimings` is useful for precise synchronization
--- of video with the event or audio streams, and for measuring
--- quality metrics for the application’s display, such as latency and jitter.
---
--- ---
---
---@class Gdk.FrameTimings
Gdk.FrameTimings = {}

--- # method Gdk.FrameTimings:get_complete()
---
--- The timing information in a `GdkFrameTimings` is filled in
--- incrementally as the frame as drawn and passed off to the
--- window system for processing and display to the user. The
--- accessor functions for `GdkFrameTimings` can return 0 to
--- indicate an unavailable value for two reasons: either because
--- the information is not yet available, or because it isn't
--- available at all. Once `gdk_frame_timings_get_complete()` returns
--- `true` for a frame, you can be certain that no further values
--- will become available and be stored in the `GdkFrameTimings`.
---
--- ---
---
---@param self Gdk.FrameTimings # a `GdkFrameTimings`
---@return (boolean|nil) # `true` if all information that will be available for the frame has been filled in.
function Gdk.FrameTimings:get_complete() end

--- # method Gdk.FrameTimings:get_frame_counter()
---
--- Gets the frame counter value of the `GdkFrameClock` when this
--- this frame was drawn.
---
--- ---
---
---@param self Gdk.FrameTimings # a `GdkFrameTimings`
---@return integer # the frame counter value for this frame
function Gdk.FrameTimings:get_frame_counter() end

--- # method Gdk.FrameTimings:get_frame_time()
---
--- Returns the frame time for the frame. This is the time value
--- that is typically used to time animations for the frame. See
--- `gdk_frame_clock_get_frame_time()`.
---
--- ---
---
---@param self Gdk.FrameTimings # A `GdkFrameTimings`
---@return integer # the frame time for the frame, in the timescale of `g_get_monotonic_time()`
function Gdk.FrameTimings:get_frame_time() end

--- # method Gdk.FrameTimings:get_predicted_presentation_time()
---
--- Gets the predicted time at which this frame will be displayed. Although
--- no predicted time may be available, if one is available, it will
--- be available while the frame is being generated, in contrast to
--- `gdk_frame_timings_get_presentation_time()`, which is only available
--- after the frame has been presented. In general, if you are simply
--- animating, you should use `gdk_frame_clock_get_frame_time()` rather
--- than this function, but this function is useful for applications
--- that want exact control over latency. For example, a movie player
--- may want this information for Audio/Video synchronization.
---
--- ---
---
---@param self Gdk.FrameTimings # a `GdkFrameTimings`
---@return integer # The predicted time at which the frame will be presented, in the timescale of `g_get_monotonic_time()`, or 0 if no predicted presentation time is available.
function Gdk.FrameTimings:get_predicted_presentation_time() end

--- # method Gdk.FrameTimings:get_presentation_time()
---
--- Reurns the presentation time. This is the time at which the frame
--- became visible to the user.
---
--- ---
---
---@param self Gdk.FrameTimings # a `GdkFrameTimings`
---@return integer # the time the frame was displayed to the user, in the timescale of `g_get_monotonic_time()`, or 0 if no presentation time is available. See `gdk_frame_timings_get_complete()`
function Gdk.FrameTimings:get_presentation_time() end

--- # method Gdk.FrameTimings:get_refresh_interval()
---
--- Gets the natural interval between presentation times for
--- the display that this frame was displayed on. Frame presentation
--- usually happens during the “vertical blanking interval”.
---
--- ---
---
---@param self Gdk.FrameTimings # a `GdkFrameTimings`
---@return integer # the refresh interval of the display, in microseconds, or 0 if the refresh interval is not available. See `gdk_frame_timings_get_complete()`.
function Gdk.FrameTimings:get_refresh_interval() end

--- # method Gdk.FrameTimings:ref()
---
--- Increases the reference count of `timings`.
---
--- ---
---
---@param self Gdk.FrameTimings # a `GdkFrameTimings`
---@return Gdk.FrameTimings # `timings`
function Gdk.FrameTimings:ref() end

--- # method Gdk.FrameTimings:unref()
---
--- Decreases the reference count of `timings`. If `timings`
--- is no longer referenced, it will be freed.
---
--- ---
---
---@param self Gdk.FrameTimings # a `GdkFrameTimings`
---@return nil
function Gdk.FrameTimings:unref() end

---@enum Gdk.FullscreenMode
Gdk.FullscreenMode = {}

--- # class Gdk.GLContext
---
--- `GdkGLContext` is an object representing the platform-specific
--- OpenGL drawing context.
--- 
--- `GdkGLContexts` are created for a `GdkWindow` using
--- `gdk_window_create_gl_context()`, and the context will match
--- the `GdkVisual` of the window.
--- 
--- A `GdkGLContext` is not tied to any particular normal framebuffer.
--- For instance, it cannot draw to the `GdkWindow` back buffer. The GDK
--- repaint system is in full control of the painting to that. Instead,
--- you can create render buffers or textures and use `gdk_cairo_draw_from_gl()`
--- in the draw function of your widget to draw them. Then GDK will handle
--- the integration of your rendering with that of other widgets.
--- 
--- Support for `GdkGLContext` is platform-specific, context creation
--- can fail, returning `nil` context.
--- 
--- A `GdkGLContext` has to be made "current" in order to start using
--- it, otherwise any OpenGL call will be ignored.
--- 
--- ## Creating a new OpenGL context ##
--- 
--- In order to create a new `GdkGLContext` instance you need a
--- `GdkWindow`, which you typically get during the realize call
--- of a widget.
--- 
--- A `GdkGLContext` is not realized until either `gdk_gl_context_make_current()`,
--- or until it is realized using `gdk_gl_context_realize()`. It is possible to
--- specify details of the GL context like the OpenGL version to be used, or
--- whether the GL context should have extra state validation enabled after
--- calling `gdk_window_create_gl_context()` by calling `gdk_gl_context_realize()`.
--- If the realization fails you have the option to change the settings of the
--- `GdkGLContext` and try again.
--- 
--- ## Using a GdkGLContext ##
--- 
--- You will need to make the `GdkGLContext` the current context
--- before issuing OpenGL calls; the system sends OpenGL commands to
--- whichever context is current. It is possible to have multiple
--- contexts, so you always need to ensure that the one which you
--- want to draw with is the current one before issuing commands:
--- 
--- ```c
---   gdk_gl_context_make_current (context);
--- ```
--- 
--- You can now perform your drawing using OpenGL commands.
--- 
--- You can check which `GdkGLContext` is the current one by using
--- `gdk_gl_context_get_current()`; you can also unset any `GdkGLContext`
--- that is currently set by calling `gdk_gl_context_clear_current()`.
---
--- ---
---
---@class Gdk.GLContext : GObject.Object
Gdk.GLContext = {}

--- # method Gdk.GLContext:get_debug_enabled()
---
--- Retrieves the value set using `gdk_gl_context_set_debug_enabled()`.
---
--- ---
---
---@param self Gdk.GLContext # a `GdkGLContext`
---@return (boolean|nil) # `true` if debugging is enabled
function Gdk.GLContext:get_debug_enabled() end

--- # method Gdk.GLContext:get_display()
---
--- Retrieves the `GdkDisplay` the `context` is created for
---
--- ---
---
---@param self Gdk.GLContext # a `GdkGLContext`
---@return Gdk.Display # a `GdkDisplay` or `nil`
function Gdk.GLContext:get_display() end

--- # method Gdk.GLContext:get_forward_compatible()
---
--- Retrieves the value set using `gdk_gl_context_set_forward_compatible()`.
---
--- ---
---
---@param self Gdk.GLContext # a `GdkGLContext`
---@return (boolean|nil) # `true` if the context should be forward compatible
function Gdk.GLContext:get_forward_compatible() end

--- # method Gdk.GLContext:get_required_version()
---
--- Retrieves the major and minor version requested by calling
--- `gdk_gl_context_set_required_version()`.
---
--- ---
---
---@param self Gdk.GLContext # a `GdkGLContext`
---@param major? integer # return location for the major version to request
---@param minor? integer # return location for the minor version to request
---@return nil
function Gdk.GLContext:get_required_version(major, minor) end

--- # method Gdk.GLContext:get_shared_context()
---
--- Retrieves the `GdkGLContext` that this `context` share data with.
---
--- ---
---
---@param self Gdk.GLContext # a `GdkGLContext`
---@return Gdk.GLContext # a `GdkGLContext` or `nil`
function Gdk.GLContext:get_shared_context() end

--- # method Gdk.GLContext:get_use_es()
---
--- Checks whether the `context` is using an OpenGL or OpenGL ES profile.
---
--- ---
---
---@param self Gdk.GLContext # a `GdkGLContext`
---@return (boolean|nil) # `true` if the `GdkGLContext` is using an OpenGL ES profile
function Gdk.GLContext:get_use_es() end

--- # method Gdk.GLContext:get_version()
---
--- Retrieves the OpenGL version of the `context`.
--- 
--- The `context` must be realized prior to calling this function.
---
--- ---
---
---@param self Gdk.GLContext # a `GdkGLContext`
---@param major integer # return location for the major version
---@param minor integer # return location for the minor version
---@return nil
function Gdk.GLContext:get_version(major, minor) end

--- # method Gdk.GLContext:get_window()
---
--- Retrieves the `GdkWindow` used by the `context`.
---
--- ---
---
---@param self Gdk.GLContext # a `GdkGLContext`
---@return Gdk.Window # a `GdkWindow` or `nil`
function Gdk.GLContext:get_window() end

--- # method Gdk.GLContext:is_legacy()
---
--- Whether the `GdkGLContext` is in legacy mode or not.
--- 
--- The `GdkGLContext` must be realized before calling this function.
--- 
--- When realizing a GL context, GDK will try to use the OpenGL 3.2 core
--- profile; this profile removes all the OpenGL API that was deprecated
--- prior to the 3.2 version of the specification. If the realization is
--- successful, this function will return `false`.
--- 
--- If the underlying OpenGL implementation does not support core profiles,
--- GDK will fall back to a pre-3.2 compatibility profile, and this function
--- will return `true`.
--- 
--- You can use the value returned by this function to decide which kind
--- of OpenGL API to use, or whether to do extension discovery, or what
--- kind of shader programs to load.
---
--- ---
---
---@param self Gdk.GLContext # a `GdkGLContext`
---@return (boolean|nil) # `true` if the GL context is in legacy mode
function Gdk.GLContext:is_legacy() end

--- # method Gdk.GLContext:make_current()
---
--- Makes the `context` the current one.
---
--- ---
---
---@param self Gdk.GLContext # a `GdkGLContext`
---@return nil
function Gdk.GLContext:make_current() end

--- # method Gdk.GLContext:realize()
---
--- Realizes the given `GdkGLContext`.
--- 
--- It is safe to call this function on a realized `GdkGLContext`.
---
--- ---
---
---@param self Gdk.GLContext # a `GdkGLContext`
---@return (boolean|nil) # `true` if the context is realized
function Gdk.GLContext:realize() end

--- # method Gdk.GLContext:set_debug_enabled()
---
--- Sets whether the `GdkGLContext` should perform extra validations and
--- run time checking. This is useful during development, but has
--- additional overhead.
--- 
--- The `GdkGLContext` must not be realized or made current prior to
--- calling this function.
---
--- ---
---
---@param self Gdk.GLContext # a `GdkGLContext`
---@param enabled (boolean|nil) # whether to enable debugging in the context
---@return nil
function Gdk.GLContext:set_debug_enabled(enabled) end

--- # method Gdk.GLContext:set_forward_compatible()
---
--- Sets whether the `GdkGLContext` should be forward compatible.
--- 
--- Forward compatibile contexts must not support OpenGL functionality that
--- has been marked as deprecated in the requested version; non-forward
--- compatible contexts, on the other hand, must support both deprecated and
--- non deprecated functionality.
--- 
--- The `GdkGLContext` must not be realized or made current prior to calling
--- this function.
---
--- ---
---
---@param self Gdk.GLContext # a `GdkGLContext`
---@param compatible (boolean|nil) # whether the context should be forward compatible
---@return nil
function Gdk.GLContext:set_forward_compatible(compatible) end

--- # method Gdk.GLContext:set_required_version()
---
--- Sets the major and minor version of OpenGL to request.
--- 
--- Setting `major` and `minor` to zero will use the default values.
--- 
--- The `GdkGLContext` must not be realized or made current prior to calling
--- this function.
---
--- ---
---
---@param self Gdk.GLContext # a `GdkGLContext`
---@param major integer # the major version to request
---@param minor integer # the minor version to request
---@return nil
function Gdk.GLContext:set_required_version(major, minor) end

--- # method Gdk.GLContext:set_use_es()
---
--- Requests that GDK create a OpenGL ES context instead of an OpenGL one,
--- if the platform and windowing system allows it.
--- 
--- The `context` must not have been realized.
--- 
--- By default, GDK will attempt to automatically detect whether the
--- underlying GL implementation is OpenGL or OpenGL ES once the `context`
--- is realized.
--- 
--- You should check the return value of `gdk_gl_context_get_use_es()` after
--- calling `gdk_gl_context_realize()` to decide whether to use the OpenGL or
--- OpenGL ES API, extensions, or shaders.
---
--- ---
---
---@param self Gdk.GLContext # a `GdkGLContext`:
---@param use_es integer # whether the context should use OpenGL ES instead of OpenGL, or -1 to allow auto-detection
---@return nil
function Gdk.GLContext:set_use_es(use_es) end

--- # function Gdk.GLContext.clear_current()
---
--- Clears the current `GdkGLContext`.
--- 
--- Any OpenGL call after this function returns will be ignored
--- until `gdk_gl_context_make_current()` is called.
---
--- ---
---
---@return nil
function Gdk.GLContext.clear_current() end

--- # function Gdk.GLContext.get_current()
---
--- Retrieves the current `GdkGLContext`.
---
--- ---
---
---@return Gdk.GLContext # the current `GdkGLContext`, or `nil`
function Gdk.GLContext.get_current() end

---@enum Gdk.GLError
Gdk.GLError = {}

--- # record Gdk.Geometry
---
--- The `GdkGeometry` struct gives the window manager information about
--- a window’s geometry constraints. Normally you would set these on
--- the GTK+ level using `gtk_window_set_geometry_hints()`. `GtkWindow`
--- then sets the hints on the `GdkWindow` it creates.
--- 
--- `gdk_window_set_geometry_hints()` expects the hints to be fully valid already
--- and simply passes them to the window manager; in contrast,
--- `gtk_window_set_geometry_hints()` performs some interpretation. For example,
--- `GtkWindow` will apply the hints to the geometry widget instead of the
--- toplevel window, if you set a geometry widget. Also, the
--- `min_width`/`min_height`/`max_width`/`max_height` fields may be set to -1, and
--- `GtkWindow` will substitute the size request of the window or geometry widget.
--- If the minimum size hint is not provided, `GtkWindow` will use its requisition
--- as the minimum size. If the minimum size is provided and a geometry widget is
--- set, `GtkWindow` will take the minimum size as the minimum size of the
--- geometry widget rather than the entire window. The base size is treated
--- similarly.
--- 
--- The canonical use-case for `gtk_window_set_geometry_hints()` is to get a
--- terminal widget to resize properly. Here, the terminal text area should be
--- the geometry widget; `GtkWindow` will then automatically set the base size to
--- the size of other widgets in the terminal window, such as the menubar and
--- scrollbar. Then, the `width_inc` and `height_inc` fields should be set to the
--- size of one character in the terminal. Finally, the base size should be set
--- to the size of one character. The net effect is that the minimum size of the
--- terminal will have a 1x1 character terminal area, and only terminal sizes on
--- the “character grid” will be allowed.
--- 
--- Here’s an example of how the terminal example would be implemented, assuming
--- a terminal area widget called “terminal” and a toplevel window “toplevel”:
--- 
--- ```c
--- 	GdkGeometry hints;
--- 
--- 	hints.base_width = terminal->char_width;
---         hints.base_height = terminal->char_height;
---         hints.min_width = terminal->char_width;
---         hints.min_height = terminal->char_height;
---         hints.width_inc = terminal->char_width;
---         hints.height_inc = terminal->char_height;
--- 
---  gtk_window_set_geometry_hints (GTK_WINDOW (toplevel),
---                                 GTK_WIDGET (terminal),
---                                 &hints,
---                                 GDK_HINT_RESIZE_INC |
---                                 GDK_HINT_MIN_SIZE |
---                                 GDK_HINT_BASE_SIZE);
--- ```
--- 
--- The other useful fields are the `min_aspect` and `max_aspect` fields; these
--- contain a width/height ratio as a floating point number. If a geometry widget
--- is set, the aspect applies to the geometry widget rather than the entire
--- window. The most common use of these hints is probably to set `min_aspect` and
--- `max_aspect` to the same value, thus forcing the window to keep a constant
--- aspect ratio.
---
--- ---
---
---@class Gdk.Geometry
---@field min_width integer # minimum width of window (or -1 to use requisition, with `GtkWindow` only)
---@field min_height integer # minimum height of window (or -1 to use requisition, with `GtkWindow` only)
---@field max_width integer # maximum width of window (or -1 to use requisition, with `GtkWindow` only)
---@field max_height integer # maximum height of window (or -1 to use requisition, with `GtkWindow` only)
---@field base_width integer # allowed window widths are `base_width` + `width_inc` * N where N is any integer (-1 allowed with `GtkWindow`)
---@field base_height integer # allowed window widths are `base_height` + `height_inc` * N where N is any integer (-1 allowed with `GtkWindow`)
---@field width_inc integer # width resize increment
---@field height_inc integer # height resize increment
---@field min_aspect number # minimum width/height ratio
---@field max_aspect number # maximum width/height ratio
---@field win_gravity Gdk.Gravity # window gravity, see `gtk_window_set_gravity()`
Gdk.Geometry = {}

---@enum Gdk.GrabOwnership
Gdk.GrabOwnership = {}

---@enum Gdk.GrabStatus
Gdk.GrabStatus = {}

---@enum Gdk.Gravity
Gdk.Gravity = {}

---@enum Gdk.InputMode
Gdk.InputMode = {}

---@enum Gdk.InputSource
Gdk.InputSource = {}

--- # class Gdk.Keymap
---
--- A `GdkKeymap` defines the translation from keyboard state
--- (including a hardware key, a modifier mask, and active keyboard group)
--- to a keyval. This translation has two phases. The first phase is
--- to determine the effective keyboard group and level for the keyboard
--- state; the second phase is to look up the keycode/group/level triplet
--- in the keymap and see what keyval it corresponds to.
---
--- ---
---
---@class Gdk.Keymap : GObject.Object
Gdk.Keymap = {}

--- # method Gdk.Keymap:add_virtual_modifiers()
---
--- Maps the non-virtual modifiers (i.e Mod2, Mod3, ...) which are set
--- in `state` to the virtual modifiers (i.e. Super, Hyper and Meta) and
--- set the corresponding bits in `state`.
--- 
--- GDK already does this before delivering key events, but for
--- compatibility reasons, it only sets the first virtual modifier
--- it finds, whereas this function sets all matching virtual modifiers.
--- 
--- This function is useful when matching key events against
--- accelerators.
---
--- ---
---
---@param self Gdk.Keymap # a `GdkKeymap`
---@param state Gdk.ModifierType # pointer to the modifier mask to change
---@return nil
function Gdk.Keymap:add_virtual_modifiers(state) end

--- # method Gdk.Keymap:get_caps_lock_state()
---
--- Returns whether the Caps Lock modifer is locked.
---
--- ---
---
---@param self Gdk.Keymap # a `GdkKeymap`
---@return (boolean|nil) # `true` if Caps Lock is on
function Gdk.Keymap:get_caps_lock_state() end

--- # method Gdk.Keymap:get_direction()
---
--- Returns the direction of effective layout of the keymap.
---
--- ---
---
---@param self Gdk.Keymap # a `GdkKeymap`
---@return Pango.Direction # %PANGO_DIRECTION_LTR or %PANGO_DIRECTION_RTL if it can determine the direction. %PANGO_DIRECTION_NEUTRAL otherwise.
function Gdk.Keymap:get_direction() end

--- # method Gdk.Keymap:get_entries_for_keycode()
---
--- Returns the keyvals bound to `hardware_keycode`.
--- The Nth `GdkKeymapKey` in `keys` is bound to the Nth
--- keyval in `keyvals`. Free the returned arrays with `g_free()`.
--- When a keycode is pressed by the user, the keyval from
--- this list of entries is selected by considering the effective
--- keyboard group and level. See `gdk_keymap_translate_keyboard_state()`.
---
--- ---
---
---@param self Gdk.Keymap # a `GdkKeymap`
---@param hardware_keycode integer # a keycode
---@param keys? unknown[] # return location for array of `GdkKeymapKey`, or `nil`
---@param keyvals? unknown[] # return location for array of keyvals, or `nil`
---@param n_entries integer # length of `keys` and `keyvals`
---@return (boolean|nil) # `true` if there were any entries
function Gdk.Keymap:get_entries_for_keycode(hardware_keycode, keys, keyvals, n_entries) end

--- # method Gdk.Keymap:get_entries_for_keyval()
---
--- Obtains a list of keycode/group/level combinations that will
--- generate `keyval`. Groups and levels are two kinds of keyboard mode;
--- in general, the level determines whether the top or bottom symbol
--- on a key is used, and the group determines whether the left or
--- right symbol is used. On US keyboards, the shift key changes the
--- keyboard level, and there are no groups. A group switch key might
--- convert a keyboard between Hebrew to English modes, for example.
--- `GdkEventKey` contains a %group field that indicates the active
--- keyboard group. The level is computed from the modifier mask.
--- The returned array should be freed
--- with `g_free()`.
---
--- ---
---
---@param self Gdk.Keymap # a `GdkKeymap`
---@param keyval integer # a keyval, such as %GDK_KEY_a, %GDK_KEY_Up, %GDK_KEY_Return, etc.
---@param keys unknown[] # return location for an array of `GdkKeymapKey`
---@param n_keys integer # return location for number of elements in returned array
---@return (boolean|nil) # `true` if keys were found and returned
function Gdk.Keymap:get_entries_for_keyval(keyval, keys, n_keys) end

--- # method Gdk.Keymap:get_modifier_mask()
---
--- Returns the modifier mask the `keymap`’s windowing system backend
--- uses for a particular purpose.
--- 
--- Note that this function always returns real hardware modifiers, not
--- virtual ones (e.g. it will return `GDK_MOD1_MASK` rather than
--- `GDK_META_MASK` if the backend maps MOD1 to META), so there are use
--- cases where the return value of this function has to be transformed
--- by `gdk_keymap_add_virtual_modifiers()` in order to contain the
--- expected result.
---
--- ---
---
---@param self Gdk.Keymap # a `GdkKeymap`
---@param intent Gdk.ModifierIntent # the use case for the modifier mask
---@return Gdk.ModifierType # the modifier mask used for `intent`.
function Gdk.Keymap:get_modifier_mask(intent) end

--- # method Gdk.Keymap:get_modifier_state()
---
--- Returns the current modifier state.
---
--- ---
---
---@param self Gdk.Keymap # a `GdkKeymap`
---@return integer # the current modifier state.
function Gdk.Keymap:get_modifier_state() end

--- # method Gdk.Keymap:get_num_lock_state()
---
--- Returns whether the Num Lock modifer is locked.
---
--- ---
---
---@param self Gdk.Keymap # a `GdkKeymap`
---@return (boolean|nil) # `true` if Num Lock is on
function Gdk.Keymap:get_num_lock_state() end

--- # method Gdk.Keymap:get_scroll_lock_state()
---
--- Returns whether the Scroll Lock modifer is locked.
---
--- ---
---
---@param self Gdk.Keymap # a `GdkKeymap`
---@return (boolean|nil) # `true` if Scroll Lock is on
function Gdk.Keymap:get_scroll_lock_state() end

--- # method Gdk.Keymap:have_bidi_layouts()
---
--- Determines if keyboard layouts for both right-to-left and left-to-right
--- languages are in use.
---
--- ---
---
---@param self Gdk.Keymap # a `GdkKeymap`
---@return (boolean|nil) # `true` if there are layouts in both directions, `false` otherwise
function Gdk.Keymap:have_bidi_layouts() end

--- # method Gdk.Keymap:lookup_key()
---
--- Looks up the keyval mapped to a keycode/group/level triplet.
--- If no keyval is bound to `key`, returns 0. For normal user input,
--- you want to use `gdk_keymap_translate_keyboard_state()` instead of
--- this function, since the effective group/level may not be
--- the same as the current keyboard state.
---
--- ---
---
---@param self Gdk.Keymap # a `GdkKeymap`
---@param key Gdk.KeymapKey # a `GdkKeymapKey` with keycode, group, and level initialized
---@return integer # a keyval, or 0 if none was mapped to the given `key`
function Gdk.Keymap:lookup_key(key) end

--- # method Gdk.Keymap:map_virtual_modifiers()
---
--- Maps the virtual modifiers (i.e. Super, Hyper and Meta) which
--- are set in `state` to their non-virtual counterparts (i.e. Mod2,
--- Mod3,...) and set the corresponding bits in `state`.
--- 
--- This function is useful when matching key events against
--- accelerators.
---
--- ---
---
---@param self Gdk.Keymap # a `GdkKeymap`
---@param state Gdk.ModifierType # pointer to the modifier state to map
---@return (boolean|nil) # `false` if two virtual modifiers were mapped to the same non-virtual modifier. Note that `false` is also returned if a virtual modifier is mapped to a non-virtual modifier that was already set in `state`.
function Gdk.Keymap:map_virtual_modifiers(state) end

--- # method Gdk.Keymap:translate_keyboard_state()
---
--- Translates the contents of a `GdkEventKey` into a keyval, effective
--- group, and level. Modifiers that affected the translation and
--- are thus unavailable for application use are returned in
--- `consumed_modifiers`.
--- See [Groups][key-group-explanation] for an explanation of
--- groups and levels. The `effective_group` is the group that was
--- actually used for the translation; some keys such as Enter are not
--- affected by the active keyboard group. The `level` is derived from
--- `state`. For convenience, `GdkEventKey` already contains the translated
--- keyval, so this function isn’t as useful as you might think.
--- 
--- `consumed_modifiers` gives modifiers that should be masked outfrom `state`
--- when comparing this key press to a hot key. For instance, on a US keyboard,
--- the `plus` symbol is shifted, so when comparing a key press to a
--- `<Control>plus` accelerator `<Shift>` should be masked out.
--- 
--- ```c
--- // We want to ignore irrelevant modifiers like ScrollLock
--- `define` ALL_ACCELS_MASK (GDK_CONTROL_MASK | GDK_SHIFT_MASK | GDK_MOD1_MASK)
--- gdk_keymap_translate_keyboard_state (keymap, event->hardware_keycode,
---                                      event->state, event->group,
---                                      &keyval, NULL, NULL, &consumed);
--- if (keyval == GDK_PLUS &&
---     (event->state & ~consumed & ALL_ACCELS_MASK) == GDK_CONTROL_MASK)
---   // Control was pressed
--- ```
--- 
--- An older interpretation `consumed_modifiers` was that it contained
--- all modifiers that might affect the translation of the key;
--- this allowed accelerators to be stored with irrelevant consumed
--- modifiers, by doing:
--- ```c
--- // XXX Don’t do this XXX
--- if (keyval == accel_keyval &&
---     (event->state & ~consumed & ALL_ACCELS_MASK) == (accel_mods & ~consumed))
---   // Accelerator was pressed
--- ```
--- 
--- However, this did not work if multi-modifier combinations were
--- used in the keymap, since, for instance, `<Control>` would be
--- masked out even if only `<Control><Alt>` was used in the keymap.
--- To support this usage as well as well as possible, all single
--- modifier combinations that could affect the key for any combination
--- of modifiers will be returned in `consumed_modifiers`; multi-modifier
--- combinations are returned only when actually found in `state`. When
--- you store accelerators, you should always store them with consumed
--- modifiers removed. Store `<Control>plus`, not `<Control><Shift>plus`,
---
--- ---
---
---@param self Gdk.Keymap # a `GdkKeymap`
---@param hardware_keycode integer # a keycode
---@param state Gdk.ModifierType # a modifier state
---@param group integer # active keyboard group
---@param keyval? integer # return location for keyval, or `nil`
---@param effective_group? integer # return location for effective group, or `nil`
---@param level? integer # return location for level, or `nil`
---@param consumed_modifiers? Gdk.ModifierType # return location for modifiers that were used to determine the group or level, or `nil`
---@return (boolean|nil) # `true` if there was a keyval bound to the keycode/state/group
function Gdk.Keymap:translate_keyboard_state(hardware_keycode, state, group, keyval, effective_group, level, consumed_modifiers) end

--- # function Gdk.Keymap.get_default()
---
--- Returns the `GdkKeymap` attached to the default display.
---
--- ---
---
---@return Gdk.Keymap # the `GdkKeymap` attached to the default display.
function Gdk.Keymap.get_default() end

--- # function Gdk.Keymap.get_for_display()
---
--- Returns the `GdkKeymap` attached to `display`.
---
--- ---
---
---@param display Gdk.Display # the `GdkDisplay`.
---@return Gdk.Keymap # the `GdkKeymap` attached to `display`.
function Gdk.Keymap.get_for_display(display) end

--- # record Gdk.KeymapKey
---
--- A `GdkKeymapKey` is a hardware key that can be mapped to a keyval.
---
--- ---
---
---@class Gdk.KeymapKey
---@field keycode integer # the hardware keycode. This is an identifying number for a physical key.
---@field group integer # indicates movement in a horizontal direction. Usually groups are used for two different languages. In group 0, a key might have two English characters, and in group 1 it might have two Hebrew characters. The Hebrew characters will be printed on the key next to the English characters.
---@field level integer # indicates which symbol on the key will be used, in a vertical direction. So on a standard US keyboard, the key with the number “1” on it also has the exclamation point ("!") character on it. The level indicates whether to use the “1” or the “!” symbol. The letter keys are considered to have a lowercase letter at level 0, and an uppercase letter at level 1, though only the uppercase letter is printed.
Gdk.KeymapKey = {}

---@enum Gdk.ModifierIntent
Gdk.ModifierIntent = {}

---@enum Gdk.ModifierType
Gdk.ModifierType = {}

--- # class Gdk.Monitor
---
--- GdkMonitor objects represent the individual outputs that are
--- associated with a `GdkDisplay`. GdkDisplay has APIs to enumerate
--- monitors with `gdk_display_get_n_monitors()` and `gdk_display_get_monitor()`, and
--- to find particular monitors with `gdk_display_get_primary_monitor()` or
--- `gdk_display_get_monitor_at_window()`.
--- 
--- GdkMonitor was introduced in GTK+ 3.22 and supersedes earlier
--- APIs in GdkScreen to obtain monitor-related information.
---
--- ---
---
---@class Gdk.Monitor : GObject.Object
Gdk.Monitor = {}

--- # method Gdk.Monitor:get_display()
---
--- Gets the display that this monitor belongs to.
---
--- ---
---
---@param self Gdk.Monitor # a `GdkMonitor`
---@return Gdk.Display # the display
function Gdk.Monitor:get_display() end

--- # method Gdk.Monitor:get_geometry()
---
--- Retrieves the size and position of an individual monitor within the
--- display coordinate space. The returned geometry is in  ”application pixels”,
--- not in ”device pixels” (see `gdk_monitor_get_scale_factor()`).
---
--- ---
---
---@param self Gdk.Monitor # a `GdkMonitor`
---@param geometry Gdk.Rectangle # a `GdkRectangle` to be filled with the monitor geometry
---@return nil
function Gdk.Monitor:get_geometry(geometry) end

--- # method Gdk.Monitor:get_height_mm()
---
--- Gets the height in millimeters of the monitor.
---
--- ---
---
---@param self Gdk.Monitor # a `GdkMonitor`
---@return integer # the physical height of the monitor
function Gdk.Monitor:get_height_mm() end

--- # method Gdk.Monitor:get_manufacturer()
---
--- Gets the name or PNP ID of the monitor's manufacturer, if available.
--- 
--- Note that this value might also vary depending on actual
--- display backend.
--- 
--- PNP ID registry is located at https://uefi.org/pnp_id_list
---
--- ---
---
---@param self Gdk.Monitor # a `GdkMonitor`
---@return string # the name of the manufacturer, or `nil`
function Gdk.Monitor:get_manufacturer() end

--- # method Gdk.Monitor:get_model()
---
--- Gets the a string identifying the monitor model, if available.
---
--- ---
---
---@param self Gdk.Monitor # a `GdkMonitor`
---@return string # the monitor model, or `nil`
function Gdk.Monitor:get_model() end

--- # method Gdk.Monitor:get_refresh_rate()
---
--- Gets the refresh rate of the monitor, if available.
--- 
--- The value is in milli-Hertz, so a refresh rate of 60Hz
--- is returned as 60000.
---
--- ---
---
---@param self Gdk.Monitor # a `GdkMonitor`
---@return integer # the refresh rate in milli-Hertz, or 0
function Gdk.Monitor:get_refresh_rate() end

--- # method Gdk.Monitor:get_scale_factor()
---
--- Gets the internal scale factor that maps from monitor coordinates
--- to the actual device pixels. On traditional systems this is 1, but
--- on very high density outputs this can be a higher value (often 2).
--- 
--- This can be used if you want to create pixel based data for a
--- particular monitor, but most of the time you’re drawing to a window
--- where it is better to use `gdk_window_get_scale_factor()` instead.
---
--- ---
---
---@param self Gdk.Monitor # a `GdkMonitor`
---@return integer # the scale factor
function Gdk.Monitor:get_scale_factor() end

--- # method Gdk.Monitor:get_subpixel_layout()
---
--- Gets information about the layout of red, green and blue
--- primaries for each pixel in this monitor, if available.
---
--- ---
---
---@param self Gdk.Monitor # a `GdkMonitor`
---@return Gdk.SubpixelLayout # the subpixel layout
function Gdk.Monitor:get_subpixel_layout() end

--- # method Gdk.Monitor:get_width_mm()
---
--- Gets the width in millimeters of the monitor.
---
--- ---
---
---@param self Gdk.Monitor # a `GdkMonitor`
---@return integer # the physical width of the monitor
function Gdk.Monitor:get_width_mm() end

--- # method Gdk.Monitor:get_workarea()
---
--- Retrieves the size and position of the “work area” on a monitor
--- within the display coordinate space. The returned geometry is in
--- ”application pixels”, not in ”device pixels” (see
--- `gdk_monitor_get_scale_factor()`).
--- 
--- The work area should be considered when positioning menus and
--- similar popups, to avoid placing them below panels, docks or other
--- desktop components.
--- 
--- Note that not all backends may have a concept of workarea. This
--- function will return the monitor geometry if a workarea is not
--- available, or does not apply.
---
--- ---
---
---@param self Gdk.Monitor # a `GdkMonitor`
---@param workarea Gdk.Rectangle # a `GdkRectangle` to be filled with the monitor workarea
---@return nil
function Gdk.Monitor:get_workarea(workarea) end

--- # method Gdk.Monitor:is_primary()
---
--- Gets whether this monitor should be considered primary
--- (see `gdk_display_get_primary_monitor()`).
---
--- ---
---
---@param self Gdk.Monitor # a `GdkMonitor`
---@return (boolean|nil) # `true` if `monitor` is primary
function Gdk.Monitor:is_primary() end

--- # record Gdk.MonitorClass
---
---@class Gdk.MonitorClass
Gdk.MonitorClass = {}

---@enum Gdk.NotifyType
Gdk.NotifyType = {}

---@enum Gdk.OwnerChange
Gdk.OwnerChange = {}

--- # record Gdk.Point
---
--- Defines the x and y coordinates of a point.
---
--- ---
---
---@class Gdk.Point
---@field x integer # the x coordinate of the point.
---@field y integer # the y coordinate of the point.
Gdk.Point = {}

---@enum Gdk.PropMode
Gdk.PropMode = {}

---@enum Gdk.PropertyState
Gdk.PropertyState = {}

--- # record Gdk.RGBA
---
--- A `GdkRGBA` is used to represent a (possibly translucent)
--- color, in a way that is compatible with cairo’s notion of color.
---
--- ---
---
---@class Gdk.RGBA
---@field red number # The intensity of the red channel from 0.0 to 1.0 inclusive
---@field green number # The intensity of the green channel from 0.0 to 1.0 inclusive
---@field blue number # The intensity of the blue channel from 0.0 to 1.0 inclusive
---@field alpha number # The opacity of the color from 0.0 for completely translucent to 1.0 for opaque
Gdk.RGBA = {}

--- # method Gdk.RGBA:copy()
---
--- Makes a copy of a `GdkRGBA`.
--- 
--- The result must be freed through `gdk_rgba_free()`.
---
--- ---
---
---@param self Gdk.RGBA # a `GdkRGBA`
---@return Gdk.RGBA # A newly allocated `GdkRGBA`, with the same contents as `rgba`
function Gdk.RGBA:copy() end

--- # method Gdk.RGBA:equal()
---
--- Compares two RGBA colors.
---
--- ---
---
---@param self Gdk.RGBA # a `GdkRGBA` pointer
---@param p2 Gdk.RGBA # another `GdkRGBA` pointer
---@return (boolean|nil) # `true` if the two colors compare equal
function Gdk.RGBA:equal(p2) end

--- # method Gdk.RGBA:free()
---
--- Frees a `GdkRGBA` created with `gdk_rgba_copy()`
---
--- ---
---
---@param self Gdk.RGBA # a `GdkRGBA`
---@return nil
function Gdk.RGBA:free() end

--- # method Gdk.RGBA:hash()
---
--- A hash function suitable for using for a hash
--- table that stores `GdkRGBAs`.
---
--- ---
---
---@param self Gdk.RGBA # a `GdkRGBA` pointer
---@return integer # The hash value for `p`
function Gdk.RGBA:hash() end

--- # method Gdk.RGBA:parse()
---
--- Parses a textual representation of a color, filling in
--- the `red`, `green`, `blue` and `alpha` fields of the `rgba` `GdkRGBA`.
--- 
--- The string can be either one of:
--- - A standard name (Taken from the X11 rgb.txt file).
--- - A hexadecimal value in the form “\`rgb`”, “\`rrggbb`”,
---   “\`rrrgggbbb`” or ”\`rrrrggggbbbb`”
--- - A RGB color in the form “rgb(r,g,b)” (In this case the color will
---   have full opacity)
--- - A RGBA color in the form “rgba(r,g,b,a)”
--- 
--- Where “r”, “g”, “b” and “a” are respectively the red, green, blue and
--- alpha color values. In the last two cases, “r”, “g”, and “b” are either integers
--- in the range 0 to 255 or percentage values in the range 0% to 100%, and
--- a is a floating point value in the range 0 to 1.
---
--- ---
---
---@param self Gdk.RGBA # the `GdkRGBA` to fill in
---@param spec string # the string specifying the color
---@return (boolean|nil) # `true` if the parsing succeeded
function Gdk.RGBA:parse(spec) end

--- # method Gdk.RGBA:to_string()
---
--- Returns a textual specification of `rgba` in the form
--- `rgb(r,g,b)` or
--- `rgba(r g,b,a)`,
--- where “r”, “g”, “b” and “a” represent the red, green,
--- blue and alpha values respectively. “r”, “g”, and “b” are
--- represented as integers in the range 0 to 255, and “a”
--- is represented as a floating point value in the range 0 to 1.
--- 
--- These string forms are string forms that are supported by
--- the CSS3 colors module, and can be parsed by `gdk_rgba_parse()`.
--- 
--- Note that this string representation may lose some
--- precision, since “r”, “g” and “b” are represented as 8-bit
--- integers. If this is a concern, you should use a
--- different representation.
---
--- ---
---
---@param self Gdk.RGBA # a `GdkRGBA`
---@return string # A newly allocated text string
function Gdk.RGBA:to_string() end

--- # record Gdk.Rectangle
---
--- Defines the position and size of a rectangle. It is identical to
--- `cairo_rectangle_int_t`.
---
--- ---
---
---@class Gdk.Rectangle
---@field x integer
---@field y integer
---@field width integer
---@field height integer
Gdk.Rectangle = {}

--- # method Gdk.Rectangle:equal()
---
--- Checks if the two given rectangles are equal.
---
--- ---
---
---@param self Gdk.Rectangle # a `GdkRectangle`
---@param rect2 Gdk.Rectangle # a `GdkRectangle`
---@return (boolean|nil) # `true` if the rectangles are equal.
function Gdk.Rectangle:equal(rect2) end

--- # method Gdk.Rectangle:intersect()
---
--- Calculates the intersection of two rectangles. It is allowed for
--- `dest` to be the same as either `src1` or `src2`. If the rectangles
--- do not intersect, `dest`’s width and height is set to 0 and its x
--- and y values are undefined. If you are only interested in whether
--- the rectangles intersect, but not in the intersecting area itself,
--- pass `nil` for `dest`.
---
--- ---
---
---@param self Gdk.Rectangle # a `GdkRectangle`
---@param src2 Gdk.Rectangle # a `GdkRectangle`
---@param dest? Gdk.Rectangle # return location for the intersection of `src1` and `src2`, or `nil`
---@return (boolean|nil) # `true` if the rectangles intersect.
function Gdk.Rectangle:intersect(src2, dest) end

--- # method Gdk.Rectangle:union()
---
--- Calculates the union of two rectangles.
--- The union of rectangles `src1` and `src2` is the smallest rectangle which
--- includes both `src1` and `src2` within it.
--- It is allowed for `dest` to be the same as either `src1` or `src2`.
--- 
--- Note that this function does not ignore 'empty' rectangles (ie. with
--- zero width or height).
---
--- ---
---
---@param self Gdk.Rectangle # a `GdkRectangle`
---@param src2 Gdk.Rectangle # a `GdkRectangle`
---@param dest Gdk.Rectangle # return location for the union of `src1` and `src2`
---@return nil
function Gdk.Rectangle:union(src2, dest) end

--- # class Gdk.Screen
---
--- `GdkScreen` objects are the GDK representation of the screen on
--- which windows can be displayed and on which the pointer moves.
--- X originally identified screens with physical screens, but
--- nowadays it is more common to have a single `GdkScreen` which
--- combines several physical monitors (see `gdk_screen_get_n_monitors()`).
--- 
--- GdkScreen is used throughout GDK and GTK+ to specify which screen
--- the top level windows are to be displayed on. it is also used to
--- query the screen specification and default settings such as
--- the default visual (`gdk_screen_get_system_visual()`), the dimensions
--- of the physical monitors (`gdk_screen_get_monitor_geometry()`), etc.
---
--- ---
---
---@class Gdk.Screen : GObject.Object
Gdk.Screen = {}

--- # method Gdk.Screen:get_active_window()
---
--- Returns the screen’s currently active window.
--- 
--- On X11, this is done by inspecting the _NET_ACTIVE_WINDOW property
--- on the root window, as described in the
--- [Extended Window Manager Hints](http://www.freedesktop.org/Standards/wm-spec).
--- If there is no currently currently active
--- window, or the window manager does not support the
--- _NET_ACTIVE_WINDOW hint, this function returns `nil`.
--- 
--- On other platforms, this function may return `nil`, depending on whether
--- it is implementable on that platform.
--- 
--- The returned window should be unrefed using `g_object_unref()` when
--- no longer needed.
---
--- ---
---
---@param self Gdk.Screen # a `GdkScreen`
---@return Gdk.Window # the currently active window, or `nil`.
function Gdk.Screen:get_active_window() end

--- # method Gdk.Screen:get_display()
---
--- Gets the display to which the `screen` belongs.
---
--- ---
---
---@param self Gdk.Screen # a `GdkScreen`
---@return Gdk.Display # the display to which `screen` belongs
function Gdk.Screen:get_display() end

--- # method Gdk.Screen:get_font_options()
---
--- Gets any options previously set with `gdk_screen_set_font_options()`.
---
--- ---
---
---@param self Gdk.Screen # a `GdkScreen`
---@return cairo.FontOptions # the current font options, or `nil` if no default font options have been set.
function Gdk.Screen:get_font_options() end

--- # method Gdk.Screen:get_height()
---
--- Gets the height of `screen` in pixels. The returned size is in
--- ”application pixels”, not in ”device pixels” (see
--- `gdk_screen_get_monitor_scale_factor()`).
---
--- ---
---
---@param self Gdk.Screen # a `GdkScreen`
---@return integer # the height of `screen` in pixels.
function Gdk.Screen:get_height() end

--- # method Gdk.Screen:get_height_mm()
---
--- Returns the height of `screen` in millimeters.
--- 
--- Note that this value is somewhat ill-defined when the screen
--- has multiple monitors of different resolution. It is recommended
--- to use the monitor dimensions instead.
---
--- ---
---
---@param self Gdk.Screen # a `GdkScreen`
---@return integer # the heigth of `screen` in millimeters.
function Gdk.Screen:get_height_mm() end

--- # method Gdk.Screen:get_monitor_at_point()
---
--- Returns the monitor number in which the point (`x`,`y`) is located.
---
--- ---
---
---@param self Gdk.Screen # a `GdkScreen`.
---@param x integer # the x coordinate in the virtual screen.
---@param y integer # the y coordinate in the virtual screen.
---@return integer # the monitor number in which the point (`x`,`y`) lies, or a monitor close to (`x`,`y`) if the point is not in any monitor.
function Gdk.Screen:get_monitor_at_point(x, y) end

--- # method Gdk.Screen:get_monitor_at_window()
---
--- Returns the number of the monitor in which the largest area of the
--- bounding rectangle of `window` resides.
---
--- ---
---
---@param self Gdk.Screen # a `GdkScreen`.
---@param window Gdk.Window # a `GdkWindow`
---@return integer # the monitor number in which most of `window` is located, or if `window` does not intersect any monitors, a monitor, close to `window`.
function Gdk.Screen:get_monitor_at_window(window) end

--- # method Gdk.Screen:get_monitor_geometry()
---
--- Retrieves the `GdkRectangle` representing the size and position of
--- the individual monitor within the entire screen area. The returned
--- geometry is in ”application pixels”, not in ”device pixels” (see
--- `gdk_screen_get_monitor_scale_factor()`).
--- 
--- Monitor numbers start at 0. To obtain the number of monitors of
--- `screen`, use `gdk_screen_get_n_monitors()`.
--- 
--- Note that the size of the entire screen area can be retrieved via
--- `gdk_screen_get_width()` and `gdk_screen_get_height()`.
---
--- ---
---
---@param self Gdk.Screen # a `GdkScreen`
---@param monitor_num integer # the monitor number
---@param dest? Gdk.Rectangle # a `GdkRectangle` to be filled with the monitor geometry
---@return nil
function Gdk.Screen:get_monitor_geometry(monitor_num, dest) end

--- # method Gdk.Screen:get_monitor_height_mm()
---
--- Gets the height in millimeters of the specified monitor.
---
--- ---
---
---@param self Gdk.Screen # a `GdkScreen`
---@param monitor_num integer # number of the monitor, between 0 and gdk_screen_get_n_monitors (screen)
---@return integer # the height of the monitor, or -1 if not available
function Gdk.Screen:get_monitor_height_mm(monitor_num) end

--- # method Gdk.Screen:get_monitor_plug_name()
---
--- Returns the output name of the specified monitor.
--- Usually something like VGA, DVI, or TV, not the actual
--- product name of the display device.
---
--- ---
---
---@param self Gdk.Screen # a `GdkScreen`
---@param monitor_num integer # number of the monitor, between 0 and gdk_screen_get_n_monitors (screen)
---@return string # a newly-allocated string containing the name of the monitor, or `nil` if the name cannot be determined
function Gdk.Screen:get_monitor_plug_name(monitor_num) end

--- # method Gdk.Screen:get_monitor_scale_factor()
---
--- Returns the internal scale factor that maps from monitor coordinates
--- to the actual device pixels. On traditional systems this is 1, but
--- on very high density outputs this can be a higher value (often 2).
--- 
--- This can be used if you want to create pixel based data for a
--- particular monitor, but most of the time you’re drawing to a window
--- where it is better to use `gdk_window_get_scale_factor()` instead.
---
--- ---
---
---@param self Gdk.Screen # screen to get scale factor for
---@param monitor_num integer # number of the monitor, between 0 and gdk_screen_get_n_monitors (screen)
---@return integer # the scale factor
function Gdk.Screen:get_monitor_scale_factor(monitor_num) end

--- # method Gdk.Screen:get_monitor_width_mm()
---
--- Gets the width in millimeters of the specified monitor, if available.
---
--- ---
---
---@param self Gdk.Screen # a `GdkScreen`
---@param monitor_num integer # number of the monitor, between 0 and gdk_screen_get_n_monitors (screen)
---@return integer # the width of the monitor, or -1 if not available
function Gdk.Screen:get_monitor_width_mm(monitor_num) end

--- # method Gdk.Screen:get_monitor_workarea()
---
--- Retrieves the `GdkRectangle` representing the size and position of
--- the “work area” on a monitor within the entire screen area. The returned
--- geometry is in ”application pixels”, not in ”device pixels” (see
--- `gdk_screen_get_monitor_scale_factor()`).
--- 
--- The work area should be considered when positioning menus and
--- similar popups, to avoid placing them below panels, docks or other
--- desktop components.
--- 
--- Note that not all backends may have a concept of workarea. This
--- function will return the monitor geometry if a workarea is not
--- available, or does not apply.
--- 
--- Monitor numbers start at 0. To obtain the number of monitors of
--- `screen`, use `gdk_screen_get_n_monitors()`.
---
--- ---
---
---@param self Gdk.Screen # a `GdkScreen`
---@param monitor_num integer # the monitor number
---@param dest? Gdk.Rectangle # a `GdkRectangle` to be filled with the monitor workarea
---@return nil
function Gdk.Screen:get_monitor_workarea(monitor_num, dest) end

--- # method Gdk.Screen:get_n_monitors()
---
--- Returns the number of monitors which `screen` consists of.
---
--- ---
---
---@param self Gdk.Screen # a `GdkScreen`
---@return integer # number of monitors which `screen` consists of
function Gdk.Screen:get_n_monitors() end

--- # method Gdk.Screen:get_number()
---
--- Gets the index of `screen` among the screens in the display
--- to which it belongs. (See `gdk_screen_get_display()`)
---
--- ---
---
---@param self Gdk.Screen # a `GdkScreen`
---@return integer # the index
function Gdk.Screen:get_number() end

--- # method Gdk.Screen:get_primary_monitor()
---
--- Gets the primary monitor for `screen`.  The primary monitor
--- is considered the monitor where the “main desktop” lives.
--- While normal application windows typically allow the window
--- manager to place the windows, specialized desktop applications
--- such as panels should place themselves on the primary monitor.
--- 
--- If no primary monitor is configured by the user, the return value
--- will be 0, defaulting to the first monitor.
---
--- ---
---
---@param self Gdk.Screen # a `GdkScreen`.
---@return integer # An integer index for the primary monitor, or 0 if none is configured.
function Gdk.Screen:get_primary_monitor() end

--- # method Gdk.Screen:get_resolution()
---
--- Gets the resolution for font handling on the screen; see
--- `gdk_screen_set_resolution()` for full details.
---
--- ---
---
---@param self Gdk.Screen # a `GdkScreen`
---@return number # the current resolution, or -1 if no resolution has been set.
function Gdk.Screen:get_resolution() end

--- # method Gdk.Screen:get_rgba_visual()
---
--- Gets a visual to use for creating windows with an alpha channel.
--- The windowing system on which GTK+ is running
--- may not support this capability, in which case `nil` will
--- be returned. Even if a non-`nil` value is returned, its
--- possible that the window’s alpha channel won’t be honored
--- when displaying the window on the screen: in particular, for
--- X an appropriate windowing manager and compositing manager
--- must be running to provide appropriate display.
--- 
--- This functionality is not implemented in the Windows backend.
--- 
--- For setting an overall opacity for a top-level window, see
--- `gdk_window_set_opacity()`.
---
--- ---
---
---@param self Gdk.Screen # a `GdkScreen`
---@return Gdk.Visual # a visual to use for windows with an alpha channel or `nil` if the capability is not available.
function Gdk.Screen:get_rgba_visual() end

--- # method Gdk.Screen:get_root_window()
---
--- Gets the root window of `screen`.
---
--- ---
---
---@param self Gdk.Screen # a `GdkScreen`
---@return Gdk.Window # the root window
function Gdk.Screen:get_root_window() end

--- # method Gdk.Screen:get_setting()
---
--- Retrieves a desktop-wide setting such as double-click time
--- for the `GdkScreen` `screen`.
--- 
--- FIXME needs a list of valid settings here, or a link to
--- more information.
---
--- ---
---
---@param self Gdk.Screen # the `GdkScreen` where the setting is located
---@param name string # the name of the setting
---@param value GObject.Value # location to store the value of the setting
---@return (boolean|nil) # `true` if the setting existed and a value was stored in `value`, `false` otherwise.
function Gdk.Screen:get_setting(name, value) end

--- # method Gdk.Screen:get_system_visual()
---
--- Get the system’s default visual for `screen`.
--- This is the visual for the root window of the display.
--- The return value should not be freed.
---
--- ---
---
---@param self Gdk.Screen # a `GdkScreen`.
---@return Gdk.Visual # the system visual
function Gdk.Screen:get_system_visual() end

--- # method Gdk.Screen:get_toplevel_windows()
---
--- Obtains a list of all toplevel windows known to GDK on the screen `screen`.
--- A toplevel window is a child of the root window (see
--- `gdk_get_default_root_window()`).
--- 
--- The returned list should be freed with `g_list_free()`, but
--- its elements need not be freed.
---
--- ---
---
---@param self Gdk.Screen # The `GdkScreen` where the toplevels are located.
---@return Gdk.Window[] # list of toplevel windows, free with `g_list_free()`
function Gdk.Screen:get_toplevel_windows() end

--- # method Gdk.Screen:get_width()
---
--- Gets the width of `screen` in pixels. The returned size is in
--- ”application pixels”, not in ”device pixels” (see
--- `gdk_screen_get_monitor_scale_factor()`).
---
--- ---
---
---@param self Gdk.Screen # a `GdkScreen`
---@return integer # the width of `screen` in pixels.
function Gdk.Screen:get_width() end

--- # method Gdk.Screen:get_width_mm()
---
--- Gets the width of `screen` in millimeters.
--- 
--- Note that this value is somewhat ill-defined when the screen
--- has multiple monitors of different resolution. It is recommended
--- to use the monitor dimensions instead.
---
--- ---
---
---@param self Gdk.Screen # a `GdkScreen`
---@return integer # the width of `screen` in millimeters.
function Gdk.Screen:get_width_mm() end

--- # method Gdk.Screen:get_window_stack()
---
--- Returns a `GList` of `GdkWindows` representing the current
--- window stack.
--- 
--- On X11, this is done by inspecting the _NET_CLIENT_LIST_STACKING
--- property on the root window, as described in the
--- [Extended Window Manager Hints](http://www.freedesktop.org/Standards/wm-spec).
--- If the window manager does not support the
--- _NET_CLIENT_LIST_STACKING hint, this function returns `nil`.
--- 
--- On other platforms, this function may return `nil`, depending on whether
--- it is implementable on that platform.
--- 
--- The returned list is newly allocated and owns references to the
--- windows it contains, so it should be freed using `g_list_free()` and
--- its windows unrefed using `g_object_unref()` when no longer needed.
---
--- ---
---
---@param self Gdk.Screen # a `GdkScreen`
---@return Gdk.Window[] # a list of `GdkWindows` for the current window stack, or `nil`.
function Gdk.Screen:get_window_stack() end

--- # method Gdk.Screen:is_composited()
---
--- Returns whether windows with an RGBA visual can reasonably
--- be expected to have their alpha channel drawn correctly on
--- the screen.
--- 
--- On X11 this function returns whether a compositing manager is
--- compositing `screen`.
---
--- ---
---
---@param self Gdk.Screen # a `GdkScreen`
---@return (boolean|nil) # Whether windows with RGBA visuals can reasonably be expected to have their alpha channels drawn correctly on the screen.
function Gdk.Screen:is_composited() end

--- # method Gdk.Screen:list_visuals()
---
--- Lists the available visuals for the specified `screen`.
--- A visual describes a hardware image data format.
--- For example, a visual might support 24-bit color, or 8-bit color,
--- and might expect pixels to be in a certain format.
--- 
--- Call `g_list_free()` on the return value when you’re finished with it.
---
--- ---
---
---@param self Gdk.Screen # the relevant `GdkScreen`.
---@return Gdk.Visual[] # a list of visuals; the list must be freed, but not its contents
function Gdk.Screen:list_visuals() end

--- # method Gdk.Screen:make_display_name()
---
--- Determines the name to pass to `gdk_display_open()` to get
--- a `GdkDisplay` with this screen as the default screen.
---
--- ---
---
---@param self Gdk.Screen # a `GdkScreen`
---@return string # a newly allocated string, free with `g_free()`
function Gdk.Screen:make_display_name() end

--- # method Gdk.Screen:set_font_options()
---
--- Sets the default font options for the screen. These
--- options will be set on any `PangoContext`’s newly created
--- with `gdk_pango_context_get_for_screen()`. Changing the
--- default set of font options does not affect contexts that
--- have already been created.
---
--- ---
---
---@param self Gdk.Screen # a `GdkScreen`
---@param options? cairo.FontOptions # a `cairo_font_options_t`, or `nil` to unset any previously set default font options.
---@return nil
function Gdk.Screen:set_font_options(options) end

--- # method Gdk.Screen:set_resolution()
---
--- Sets the resolution for font handling on the screen. This is a
--- scale factor between points specified in a `PangoFontDescription`
--- and cairo units. The default value is 96, meaning that a 10 point
--- font will be 13 units high. (10 * 96. / 72. = 13.3).
---
--- ---
---
---@param self Gdk.Screen # a `GdkScreen`
---@param dpi number # the resolution in “dots per inch”. (Physical inches aren’t actually involved; the terminology is conventional.)
---@return nil
function Gdk.Screen:set_resolution(dpi) end

--- # function Gdk.Screen.get_default()
---
--- Gets the default screen for the default display. (See
--- gdk_display_get_default ()).
---
--- ---
---
---@return Gdk.Screen # a `GdkScreen`, or `nil` if there is no default display.
function Gdk.Screen.get_default() end

--- # function Gdk.Screen.height()
---
--- Gets the height of the default screen in pixels. The returned
--- size is in ”application pixels”, not in ”device pixels” (see
--- `gdk_screen_get_monitor_scale_factor()`).
---
--- ---
---
---@return integer # the height of the default screen in pixels.
function Gdk.Screen.height() end

--- # function Gdk.Screen.height_mm()
---
--- Returns the height of the default screen in millimeters.
--- Note that on many X servers this value will not be correct.
---
--- ---
---
---@return integer # the height of the default screen in millimeters, though it is not always correct.
function Gdk.Screen.height_mm() end

--- # function Gdk.Screen.width()
---
--- Gets the width of the default screen in pixels. The returned
--- size is in ”application pixels”, not in ”device pixels” (see
--- `gdk_screen_get_monitor_scale_factor()`).
---
--- ---
---
---@return integer # the width of the default screen in pixels.
function Gdk.Screen.width() end

--- # function Gdk.Screen.width_mm()
---
--- Returns the width of the default screen in millimeters.
--- Note that on many X servers this value will not be correct.
---
--- ---
---
---@return integer # the width of the default screen in millimeters, though it is not always correct.
function Gdk.Screen.width_mm() end

---@enum Gdk.ScrollDirection
Gdk.ScrollDirection = {}

--- # class Gdk.Seat
---
--- The `GdkSeat` object represents a collection of input devices
--- that belong to a user.
---
--- ---
---
---@class Gdk.Seat : GObject.Object
---@field parent_instance GObject.Object
Gdk.Seat = {}

--- # method Gdk.Seat:get_capabilities()
---
--- Returns the capabilities this `GdkSeat` currently has.
---
--- ---
---
---@param self Gdk.Seat # a `GdkSeat`
---@return Gdk.SeatCapabilities # the seat capabilities
function Gdk.Seat:get_capabilities() end

--- # method Gdk.Seat:get_display()
---
--- Returns the `GdkDisplay` this seat belongs to.
---
--- ---
---
---@param self Gdk.Seat # a `GdkSeat`
---@return Gdk.Display # a `GdkDisplay`. This object is owned by GTK+ and must not be freed.
function Gdk.Seat:get_display() end

--- # method Gdk.Seat:get_keyboard()
---
--- Returns the master device that routes keyboard events.
---
--- ---
---
---@param self Gdk.Seat # a `GdkSeat`
---@return Gdk.Device # a master `GdkDevice` with keyboard capabilities. This object is owned by GTK+ and must not be freed.
function Gdk.Seat:get_keyboard() end

--- # method Gdk.Seat:get_pointer()
---
--- Returns the master device that routes pointer events.
---
--- ---
---
---@param self Gdk.Seat # a `GdkSeat`
---@return Gdk.Device # a master `GdkDevice` with pointer capabilities. This object is owned by GTK+ and must not be freed.
function Gdk.Seat:get_pointer() end

--- # method Gdk.Seat:get_slaves()
---
--- Returns the slave devices that match the given capabilities.
---
--- ---
---
---@param self Gdk.Seat # a `GdkSeat`
---@param capabilities Gdk.SeatCapabilities # capabilities to get devices for
---@return Gdk.Device[] # A list of `GdkDevices`. The list must be freed with `g_list_free()`, the elements are owned by GDK and must not be freed.
function Gdk.Seat:get_slaves(capabilities) end

--- # method Gdk.Seat:grab()
---
--- Grabs the seat so that all events corresponding to the given `capabilities`
--- are passed to this application until the seat is ungrabbed with `gdk_seat_ungrab()`,
--- or the window becomes hidden. This overrides any previous grab on the
--- seat by this client.
--- 
--- As a rule of thumb, if a grab is desired over %GDK_SEAT_CAPABILITY_POINTER,
--- all other "pointing" capabilities (eg. %GDK_SEAT_CAPABILITY_TOUCH) should
--- be grabbed too, so the user is able to interact with all of those while
--- the grab holds, you should thus use %GDK_SEAT_CAPABILITY_ALL_POINTING most
--- commonly.
--- 
--- Grabs are used for operations which need complete control over the
--- events corresponding to the given capabilities. For example in GTK+ this
--- is used for Drag and Drop operations, popup menus and such.
--- 
--- Note that if the event mask of a `GdkWindow` has selected both button press
--- and button release events, or touch begin and touch end, then a press event
--- will cause an automatic grab until the button is released, equivalent to a
--- grab on the window with `owner_events` set to `true`. This is done because most
--- applications expect to receive paired press and release events.
--- 
--- If you set up anything at the time you take the grab that needs to be
--- cleaned up when the grab ends, you should handle the `GdkEventGrabBroken`
--- events that are emitted when the grab ends unvoluntarily.
---
--- ---
---
---@param self Gdk.Seat # a `GdkSeat`
---@param window Gdk.Window # the `GdkWindow` which will own the grab
---@param capabilities Gdk.SeatCapabilities # capabilities that will be grabbed
---@param owner_events (boolean|nil) # if `false` then all device events are reported with respect to `window` and are only reported if selected by `event_mask`. If `true` then pointer events for this application are reported as normal, but pointer events outside this application are reported with respect to `window` and only if selected by `event_mask`. In either mode, unreported events are discarded.
---@param cursor? Gdk.Cursor # the cursor to display while the grab is active. If this is `nil` then the normal cursors are used for `window` and its descendants, and the cursor for `window` is used elsewhere.
---@param event? Gdk.Event # the event that is triggering the grab, or `nil` if none is available.
---@param prepare_func? Gdk.SeatGrabPrepareFunc # function to prepare the window to be grabbed, it can be `nil` if `window` is visible before this call.
---@param prepare_func_data? userdata # user data to pass to `prepare_func`
---@return Gdk.GrabStatus # %GDK_GRAB_SUCCESS if the grab was successful.
function Gdk.Seat:grab(window, capabilities, owner_events, cursor, event, prepare_func, prepare_func_data) end

--- # method Gdk.Seat:ungrab()
---
--- Releases a grab added through `gdk_seat_grab()`.
---
--- ---
---
---@param self Gdk.Seat # a `GdkSeat`
---@return nil
function Gdk.Seat:ungrab() end

---@enum Gdk.SeatCapabilities
Gdk.SeatCapabilities = {}

---@alias Gdk.SeatGrabPrepareFunc fun(seat: Gdk.Seat, window: Gdk.Window, user_data: userdata): nil

---@enum Gdk.SettingAction
Gdk.SettingAction = {}

---@enum Gdk.Status
Gdk.Status = {}

---@enum Gdk.SubpixelLayout
Gdk.SubpixelLayout = {}

--- # record Gdk.TimeCoord
---
--- A `GdkTimeCoord` stores a single event in a motion history.
---
--- ---
---
---@class Gdk.TimeCoord
---@field time integer # The timestamp for this event.
---@field axes unknown[] # the values of the device’s axes.
Gdk.TimeCoord = {}

---@enum Gdk.TouchpadGesturePhase
Gdk.TouchpadGesturePhase = {}

---@enum Gdk.VisibilityState
Gdk.VisibilityState = {}

--- # class Gdk.Visual
---
--- A `GdkVisual` contains information about
--- a particular visual.
---
--- ---
---
---@class Gdk.Visual : GObject.Object
Gdk.Visual = {}

--- # method Gdk.Visual:get_bits_per_rgb()
---
--- Returns the number of significant bits per red, green and blue value.
--- 
--- Not all GDK backend provide a meaningful value for this function.
---
--- ---
---
---@param self Gdk.Visual # a `GdkVisual`
---@return integer # The number of significant bits per color value for `visual`.
function Gdk.Visual:get_bits_per_rgb() end

--- # method Gdk.Visual:get_blue_pixel_details()
---
--- Obtains values that are needed to calculate blue pixel values in TrueColor
--- and DirectColor. The “mask” is the significant bits within the pixel.
--- The “shift” is the number of bits left we must shift a primary for it
--- to be in position (according to the "mask"). Finally, "precision" refers
--- to how much precision the pixel value contains for a particular primary.
---
--- ---
---
---@param self Gdk.Visual # a `GdkVisual`
---@param mask? integer # A pointer to a `guint32` to be filled in, or `nil`
---@param shift? integer # A pointer to a `gint` to be filled in, or `nil`
---@param precision? integer # A pointer to a `gint` to be filled in, or `nil`
---@return nil
function Gdk.Visual:get_blue_pixel_details(mask, shift, precision) end

--- # method Gdk.Visual:get_byte_order()
---
--- Returns the byte order of this visual.
--- 
--- The information returned by this function is only relevant
--- when working with XImages, and not all backends return
--- meaningful information for this.
---
--- ---
---
---@param self Gdk.Visual # A `GdkVisual`.
---@return Gdk.ByteOrder # A `GdkByteOrder` stating the byte order of `visual`.
function Gdk.Visual:get_byte_order() end

--- # method Gdk.Visual:get_colormap_size()
---
--- Returns the size of a colormap for this visual.
--- 
--- You have to use platform-specific APIs to manipulate colormaps.
---
--- ---
---
---@param self Gdk.Visual # A `GdkVisual`.
---@return integer # The size of a colormap that is suitable for `visual`.
function Gdk.Visual:get_colormap_size() end

--- # method Gdk.Visual:get_depth()
---
--- Returns the bit depth of this visual.
---
--- ---
---
---@param self Gdk.Visual # A `GdkVisual`.
---@return integer # The bit depth of this visual.
function Gdk.Visual:get_depth() end

--- # method Gdk.Visual:get_green_pixel_details()
---
--- Obtains values that are needed to calculate green pixel values in TrueColor
--- and DirectColor. The “mask” is the significant bits within the pixel.
--- The “shift” is the number of bits left we must shift a primary for it
--- to be in position (according to the "mask"). Finally, "precision" refers
--- to how much precision the pixel value contains for a particular primary.
---
--- ---
---
---@param self Gdk.Visual # a `GdkVisual`
---@param mask? integer # A pointer to a `guint32` to be filled in, or `nil`
---@param shift? integer # A pointer to a `gint` to be filled in, or `nil`
---@param precision? integer # A pointer to a `gint` to be filled in, or `nil`
---@return nil
function Gdk.Visual:get_green_pixel_details(mask, shift, precision) end

--- # method Gdk.Visual:get_red_pixel_details()
---
--- Obtains values that are needed to calculate red pixel values in TrueColor
--- and DirectColor. The “mask” is the significant bits within the pixel.
--- The “shift” is the number of bits left we must shift a primary for it
--- to be in position (according to the "mask"). Finally, "precision" refers
--- to how much precision the pixel value contains for a particular primary.
---
--- ---
---
---@param self Gdk.Visual # A `GdkVisual`
---@param mask? integer # A pointer to a `guint32` to be filled in, or `nil`
---@param shift? integer # A pointer to a `gint` to be filled in, or `nil`
---@param precision? integer # A pointer to a `gint` to be filled in, or `nil`
---@return nil
function Gdk.Visual:get_red_pixel_details(mask, shift, precision) end

--- # method Gdk.Visual:get_screen()
---
--- Gets the screen to which this visual belongs
---
--- ---
---
---@param self Gdk.Visual # a `GdkVisual`
---@return Gdk.Screen # the screen to which this visual belongs.
function Gdk.Visual:get_screen() end

--- # method Gdk.Visual:get_visual_type()
---
--- Returns the type of visual this is (PseudoColor, TrueColor, etc).
---
--- ---
---
---@param self Gdk.Visual # A `GdkVisual`.
---@return Gdk.VisualType # A `GdkVisualType` stating the type of `visual`.
function Gdk.Visual:get_visual_type() end

--- # function Gdk.Visual.get_best()
---
--- Get the visual with the most available colors for the default
--- GDK screen. The return value should not be freed.
---
--- ---
---
---@return Gdk.Visual # best visual
function Gdk.Visual.get_best() end

--- # function Gdk.Visual.get_best_depth()
---
--- Get the best available depth for the default GDK screen.  “Best”
--- means “largest,” i.e. 32 preferred over 24 preferred over 8 bits
--- per pixel.
---
--- ---
---
---@return integer # best available depth
function Gdk.Visual.get_best_depth() end

--- # function Gdk.Visual.get_best_type()
---
--- Return the best available visual type for the default GDK screen.
---
--- ---
---
---@return Gdk.VisualType # best visual type
function Gdk.Visual.get_best_type() end

--- # function Gdk.Visual.get_best_with_both()
---
--- Combines `gdk_visual_get_best_with_depth()` and
--- `gdk_visual_get_best_with_type()`.
---
--- ---
---
---@param depth integer # a bit depth
---@param visual_type Gdk.VisualType # a visual type
---@return Gdk.Visual # best visual with both `depth` and `visual_type`, or `nil` if none
function Gdk.Visual.get_best_with_both(depth, visual_type) end

--- # function Gdk.Visual.get_best_with_depth()
---
--- Get the best visual with depth `depth` for the default GDK screen.
--- Color visuals and visuals with mutable colormaps are preferred
--- over grayscale or fixed-colormap visuals. The return value should
--- not be freed. `nil` may be returned if no visual supports `depth`.
---
--- ---
---
---@param depth integer # a bit depth
---@return Gdk.Visual # best visual for the given depth
function Gdk.Visual.get_best_with_depth(depth) end

--- # function Gdk.Visual.get_best_with_type()
---
--- Get the best visual of the given `visual_type` for the default GDK screen.
--- Visuals with higher color depths are considered better. The return value
--- should not be freed. `nil` may be returned if no visual has type
--- `visual_type`.
---
--- ---
---
---@param visual_type Gdk.VisualType # a visual type
---@return Gdk.Visual # best visual of the given type
function Gdk.Visual.get_best_with_type(visual_type) end

--- # function Gdk.Visual.get_system()
---
--- Get the system’s default visual for the default GDK screen.
--- This is the visual for the root window of the display.
--- The return value should not be freed.
---
--- ---
---
---@return Gdk.Visual # system visual
function Gdk.Visual.get_system() end

---@enum Gdk.VisualType
Gdk.VisualType = {}

---@enum Gdk.WMDecoration
Gdk.WMDecoration = {}

---@enum Gdk.WMFunction
Gdk.WMFunction = {}

--- # class Gdk.Window
---
---@class Gdk.Window : GObject.Object
---@operator call: Gdk.Window
Gdk.Window = {}

--- # method Gdk.Window:beep()
---
--- Emits a short beep associated to `window` in the appropriate
--- display, if supported. Otherwise, emits a short beep on
--- the display just as `gdk_display_beep()`.
---
--- ---
---
---@param self Gdk.Window # a toplevel `GdkWindow`
---@return nil
function Gdk.Window:beep() end

--- # method Gdk.Window:begin_draw_frame()
---
--- Indicates that you are beginning the process of redrawing `region`
--- on `window`, and provides you with a `GdkDrawingContext`.
--- 
--- If `window` is a top level `GdkWindow`, backed by a native window
--- implementation, a backing store (offscreen buffer) large enough to
--- contain `region` will be created. The backing store will be initialized
--- with the background color or background surface for `window`. Then, all
--- drawing operations performed on `window` will be diverted to the
--- backing store. When you call `gdk_window_end_frame()`, the contents of
--- the backing store will be copied to `window`, making it visible
--- on screen. Only the part of `window` contained in `region` will be
--- modified; that is, drawing operations are clipped to `region`.
--- 
--- The net result of all this is to remove flicker, because the user
--- sees the finished product appear all at once when you call
--- `gdk_window_end_draw_frame()`. If you draw to `window` directly without
--- calling `gdk_window_begin_draw_frame()`, the user may see flicker
--- as individual drawing operations are performed in sequence.
--- 
--- When using GTK+, the widget system automatically places calls to
--- `gdk_window_begin_draw_frame()` and `gdk_window_end_draw_frame()` around
--- emissions of the `GtkWidget::draw` signal. That is, if you’re
--- drawing the contents of the widget yourself, you can assume that the
--- widget has a cleared background, is already set as the clip region,
--- and already has a backing store. Therefore in most cases, application
--- code in GTK does not need to call `gdk_window_begin_draw_frame()`
--- explicitly.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@param region cairo.Region # a Cairo region
---@return Gdk.DrawingContext # a `GdkDrawingContext` context that should be used to draw the contents of the window; the returned context is owned by GDK.
function Gdk.Window:begin_draw_frame(region) end

--- # method Gdk.Window:begin_move_drag()
---
--- Begins a window move operation (for a toplevel window).
--- 
--- This function assumes that the drag is controlled by the
--- client pointer device, use `gdk_window_begin_move_drag_for_device()`
--- to begin a drag with a different device.
---
--- ---
---
---@param self Gdk.Window # a toplevel `GdkWindow`
---@param button integer # the button being used to drag, or 0 for a keyboard-initiated drag
---@param root_x integer # root window X coordinate of mouse click that began the drag
---@param root_y integer # root window Y coordinate of mouse click that began the drag
---@param timestamp integer # timestamp of mouse click that began the drag
---@return nil
function Gdk.Window:begin_move_drag(button, root_x, root_y, timestamp) end

--- # method Gdk.Window:begin_move_drag_for_device()
---
--- Begins a window move operation (for a toplevel window).
--- You might use this function to implement a “window move grip,” for
--- example. The function works best with window managers that support the
--- [Extended Window Manager Hints](http://www.freedesktop.org/Standards/wm-spec)
--- but has a fallback implementation for other window managers.
---
--- ---
---
---@param self Gdk.Window # a toplevel `GdkWindow`
---@param device Gdk.Device # the device used for the operation
---@param button integer # the button being used to drag, or 0 for a keyboard-initiated drag
---@param root_x integer # root window X coordinate of mouse click that began the drag
---@param root_y integer # root window Y coordinate of mouse click that began the drag
---@param timestamp integer # timestamp of mouse click that began the drag
---@return nil
function Gdk.Window:begin_move_drag_for_device(device, button, root_x, root_y, timestamp) end

--- # method Gdk.Window:begin_paint_rect()
---
--- A convenience wrapper around `gdk_window_begin_paint_region()` which
--- creates a rectangular region for you. See
--- `gdk_window_begin_paint_region()` for details.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@param rectangle Gdk.Rectangle # rectangle you intend to draw to
---@return nil
function Gdk.Window:begin_paint_rect(rectangle) end

--- # method Gdk.Window:begin_paint_region()
---
--- Indicates that you are beginning the process of redrawing `region`.
--- A backing store (offscreen buffer) large enough to contain `region`
--- will be created. The backing store will be initialized with the
--- background color or background surface for `window`. Then, all
--- drawing operations performed on `window` will be diverted to the
--- backing store.  When you call `gdk_window_end_paint()`, the backing
--- store will be copied to `window`, making it visible onscreen. Only
--- the part of `window` contained in `region` will be modified; that is,
--- drawing operations are clipped to `region`.
--- 
--- The net result of all this is to remove flicker, because the user
--- sees the finished product appear all at once when you call
--- `gdk_window_end_paint()`. If you draw to `window` directly without
--- calling `gdk_window_begin_paint_region()`, the user may see flicker
--- as individual drawing operations are performed in sequence.  The
--- clipping and background-initializing features of
--- `gdk_window_begin_paint_region()` are conveniences for the
--- programmer, so you can avoid doing that work yourself.
--- 
--- When using GTK+, the widget system automatically places calls to
--- `gdk_window_begin_paint_region()` and `gdk_window_end_paint()` around
--- emissions of the expose_event signal. That is, if you’re writing an
--- expose event handler, you can assume that the exposed area in
--- `GdkEventExpose` has already been cleared to the window background,
--- is already set as the clip region, and already has a backing store.
--- Therefore in most cases, application code need not call
--- `gdk_window_begin_paint_region()`. (You can disable the automatic
--- calls around expose events on a widget-by-widget basis by calling
--- `gtk_widget_set_double_buffered()`.)
--- 
--- If you call this function multiple times before calling the
--- matching `gdk_window_end_paint()`, the backing stores are pushed onto
--- a stack. `gdk_window_end_paint()` copies the topmost backing store
--- onscreen, subtracts the topmost region from all other regions in
--- the stack, and pops the stack. All drawing operations affect only
--- the topmost backing store in the stack. One matching call to
--- `gdk_window_end_paint()` is required for each call to
--- `gdk_window_begin_paint_region()`.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@param region cairo.Region # region you intend to draw to
---@return nil
function Gdk.Window:begin_paint_region(region) end

--- # method Gdk.Window:begin_resize_drag()
---
--- Begins a window resize operation (for a toplevel window).
--- 
--- This function assumes that the drag is controlled by the
--- client pointer device, use `gdk_window_begin_resize_drag_for_device()`
--- to begin a drag with a different device.
---
--- ---
---
---@param self Gdk.Window # a toplevel `GdkWindow`
---@param edge Gdk.WindowEdge # the edge or corner from which the drag is started
---@param button integer # the button being used to drag, or 0 for a keyboard-initiated drag
---@param root_x integer # root window X coordinate of mouse click that began the drag
---@param root_y integer # root window Y coordinate of mouse click that began the drag
---@param timestamp integer # timestamp of mouse click that began the drag (use `gdk_event_get_time()`)
---@return nil
function Gdk.Window:begin_resize_drag(edge, button, root_x, root_y, timestamp) end

--- # method Gdk.Window:begin_resize_drag_for_device()
---
--- Begins a window resize operation (for a toplevel window).
--- You might use this function to implement a “window resize grip,” for
--- example; in fact `GtkStatusbar` uses it. The function works best
--- with window managers that support the
--- [Extended Window Manager Hints](http://www.freedesktop.org/Standards/wm-spec)
--- but has a fallback implementation for other window managers.
---
--- ---
---
---@param self Gdk.Window # a toplevel `GdkWindow`
---@param edge Gdk.WindowEdge # the edge or corner from which the drag is started
---@param device Gdk.Device # the device used for the operation
---@param button integer # the button being used to drag, or 0 for a keyboard-initiated drag
---@param root_x integer # root window X coordinate of mouse click that began the drag
---@param root_y integer # root window Y coordinate of mouse click that began the drag
---@param timestamp integer # timestamp of mouse click that began the drag (use `gdk_event_get_time()`)
---@return nil
function Gdk.Window:begin_resize_drag_for_device(edge, device, button, root_x, root_y, timestamp) end

--- # method Gdk.Window:configure_finished()
---
--- Does nothing, present only for compatiblity.
---
--- ---
---
---@param self Gdk.Window # a toplevel `GdkWindow`
---@return nil
function Gdk.Window:configure_finished() end

--- # method Gdk.Window:coords_from_parent()
---
--- Transforms window coordinates from a parent window to a child
--- window, where the parent window is the normal parent as returned by
--- `gdk_window_get_parent()` for normal windows, and the window's
--- embedder as returned by `gdk_offscreen_window_get_embedder()` for
--- offscreen windows.
--- 
--- For normal windows, calling this function is equivalent to subtracting
--- the return values of `gdk_window_get_position()` from the parent coordinates.
--- For offscreen windows however (which can be arbitrarily transformed),
--- this function calls the GdkWindow::from-embedder: signal to translate
--- the coordinates.
--- 
--- You should always use this function when writing generic code that
--- walks down a window hierarchy.
--- 
--- See also: `gdk_window_coords_to_parent()`
---
--- ---
---
---@param self Gdk.Window # a child window
---@param parent_x number # X coordinate in parent’s coordinate system
---@param parent_y number # Y coordinate in parent’s coordinate system
---@param x? number # return location for X coordinate in child’s coordinate system
---@param y? number # return location for Y coordinate in child’s coordinate system
---@return nil
function Gdk.Window:coords_from_parent(parent_x, parent_y, x, y) end

--- # method Gdk.Window:coords_to_parent()
---
--- Transforms window coordinates from a child window to its parent
--- window, where the parent window is the normal parent as returned by
--- `gdk_window_get_parent()` for normal windows, and the window's
--- embedder as returned by `gdk_offscreen_window_get_embedder()` for
--- offscreen windows.
--- 
--- For normal windows, calling this function is equivalent to adding
--- the return values of `gdk_window_get_position()` to the child coordinates.
--- For offscreen windows however (which can be arbitrarily transformed),
--- this function calls the GdkWindow::to-embedder: signal to translate
--- the coordinates.
--- 
--- You should always use this function when writing generic code that
--- walks up a window hierarchy.
--- 
--- See also: `gdk_window_coords_from_parent()`
---
--- ---
---
---@param self Gdk.Window # a child window
---@param x number # X coordinate in child’s coordinate system
---@param y number # Y coordinate in child’s coordinate system
---@param parent_x? number # return location for X coordinate in parent’s coordinate system, or `nil`
---@param parent_y? number # return location for Y coordinate in parent’s coordinate system, or `nil`
---@return nil
function Gdk.Window:coords_to_parent(x, y, parent_x, parent_y) end

--- # method Gdk.Window:create_gl_context()
---
--- Creates a new `GdkGLContext` matching the
--- framebuffer format to the visual of the `GdkWindow`. The context
--- is disconnected from any particular window or surface.
--- 
--- If the creation of the `GdkGLContext` failed, `error` will be set.
--- 
--- Before using the returned `GdkGLContext`, you will need to
--- call `gdk_gl_context_make_current()` or `gdk_gl_context_realize()`.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@return Gdk.GLContext # the newly created `GdkGLContext`, or `nil` on error
function Gdk.Window:create_gl_context() end

--- # method Gdk.Window:create_similar_image_surface()
---
--- Create a new image surface that is efficient to draw on the
--- given `window`.
--- 
--- Initially the surface contents are all 0 (transparent if contents
--- have transparency, black otherwise.)
--- 
--- The `width` and `height` of the new surface are not affected by
--- the scaling factor of the `window`, or by the `scale` argument; they
--- are the size of the surface in device pixels. If you wish to create
--- an image surface capable of holding the contents of `window` you can
--- use:
--- 
--- ```c
---   int scale = gdk_window_get_scale_factor (window);
---   int width = gdk_window_get_width (window) * scale;
---   int height = gdk_window_get_height (window) * scale;
--- 
---   // format is set elsewhere
---   cairo_surface_t *surface =
---     gdk_window_create_similar_image_surface (window,
---                                              format,
---                                              width, height,
---                                              scale);
--- ```
--- 
--- Note that unlike `cairo_surface_create_similar_image()`, the new
--- surface's device scale is set to `scale`, or to the scale factor of
--- `window` if `scale` is 0.
---
--- ---
---
---@param self? Gdk.Window # window to make new surface similar to, or `nil` if none
---@param format cairo.Format # the format for the new surface
---@param width integer # width of the new surface
---@param height integer # height of the new surface
---@param scale integer # the scale of the new surface, or 0 to use same as `window`
---@return cairo.Surface # a pointer to the newly allocated surface. The caller owns the surface and should call `cairo_surface_destroy()` when done with it. This function always returns a valid pointer, but it will return a pointer to a “nil” surface if `other` is already in an error state or any other error occurs.
function Gdk.Window:create_similar_image_surface(format, width, height, scale) end

--- # method Gdk.Window:create_similar_surface()
---
--- Create a new surface that is as compatible as possible with the
--- given `window`. For example the new surface will have the same
--- fallback resolution and font options as `window`. Generally, the new
--- surface will also use the same backend as `window`, unless that is
--- not possible for some reason. The type of the returned surface may
--- be examined with `cairo_surface_get_type()`.
--- 
--- Initially the surface contents are all 0 (transparent if contents
--- have transparency, black otherwise.)
---
--- ---
---
---@param self Gdk.Window # window to make new surface similar to
---@param content cairo.Content # the content for the new surface
---@param width integer # width of the new surface
---@param height integer # height of the new surface
---@return cairo.Surface # a pointer to the newly allocated surface. The caller owns the surface and should call `cairo_surface_destroy()` when done with it. This function always returns a valid pointer, but it will return a pointer to a “nil” surface if `other` is already in an error state or any other error occurs.
function Gdk.Window:create_similar_surface(content, width, height) end

--- # method Gdk.Window:deiconify()
---
--- Attempt to deiconify (unminimize) `window`. On X11 the window manager may
--- choose to ignore the request to deiconify. When using GTK+,
--- use `gtk_window_deiconify()` instead of the `GdkWindow` variant. Or better yet,
--- you probably want to use `gtk_window_present_with_time()`, which raises the window, focuses it,
--- unminimizes it, and puts it on the current desktop.
---
--- ---
---
---@param self Gdk.Window # a toplevel `GdkWindow`
---@return nil
function Gdk.Window:deiconify() end

--- # method Gdk.Window:destroy()
---
--- Destroys the window system resources associated with `window` and decrements `window`'s
--- reference count. The window system resources for all children of `window` are also
--- destroyed, but the children’s reference counts are not decremented.
--- 
--- Note that a window will not be destroyed automatically when its reference count
--- reaches zero. You must call this function yourself before that happens.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@return nil
function Gdk.Window:destroy() end

--- # method Gdk.Window:destroy_notify()
---
---@param self Gdk.Window
---@return nil
function Gdk.Window:destroy_notify() end

--- # method Gdk.Window:enable_synchronized_configure()
---
--- Does nothing, present only for compatiblity.
---
--- ---
---
---@param self Gdk.Window # a toplevel `GdkWindow`
---@return nil
function Gdk.Window:enable_synchronized_configure() end

--- # method Gdk.Window:end_draw_frame()
---
--- Indicates that the drawing of the contents of `window` started with
--- `gdk_window_begin_frame()` has been completed.
--- 
--- This function will take care of destroying the `GdkDrawingContext`.
--- 
--- It is an error to call this function without a matching
--- `gdk_window_begin_frame()` first.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@param context Gdk.DrawingContext # the `GdkDrawingContext` created by `gdk_window_begin_draw_frame()`
---@return nil
function Gdk.Window:end_draw_frame(context) end

--- # method Gdk.Window:end_paint()
---
--- Indicates that the backing store created by the most recent call
--- to `gdk_window_begin_paint_region()` should be copied onscreen and
--- deleted, leaving the next-most-recent backing store or no backing
--- store at all as the active paint region. See
--- `gdk_window_begin_paint_region()` for full details.
--- 
--- It is an error to call this function without a matching
--- `gdk_window_begin_paint_region()` first.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@return nil
function Gdk.Window:end_paint() end

--- # method Gdk.Window:ensure_native()
---
--- Tries to ensure that there is a window-system native window for this
--- GdkWindow. This may fail in some situations, returning `false`.
--- 
--- Offscreen window and children of them can never have native windows.
--- 
--- Some backends may not support native child windows.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@return (boolean|nil) # `true` if the window has a native window, `false` otherwise
function Gdk.Window:ensure_native() end

--- # method Gdk.Window:flush()
---
--- This function does nothing.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@return nil
function Gdk.Window:flush() end

--- # method Gdk.Window:focus()
---
--- Sets keyboard focus to `window`. In most cases, `gtk_window_present_with_time()`
--- should be used on a `GtkWindow`, rather than calling this function.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@param timestamp integer # timestamp of the event triggering the window focus
---@return nil
function Gdk.Window:focus(timestamp) end

--- # method Gdk.Window:freeze_toplevel_updates_libgtk_only()
---
--- Temporarily freezes a window and all its descendants such that it won't
--- receive expose events.  The window will begin receiving expose events
--- again when `gdk_window_thaw_toplevel_updates_libgtk_only()` is called. If
--- `gdk_window_freeze_toplevel_updates_libgtk_only()`
--- has been called more than once,
--- `gdk_window_thaw_toplevel_updates_libgtk_only()` must be called
--- an equal number of times to begin processing exposes.
--- 
--- This function is not part of the GDK public API and is only
--- for use by GTK+.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@return nil
function Gdk.Window:freeze_toplevel_updates_libgtk_only() end

--- # method Gdk.Window:freeze_updates()
---
--- Temporarily freezes a window such that it won’t receive expose
--- events.  The window will begin receiving expose events again when
--- `gdk_window_thaw_updates()` is called. If `gdk_window_freeze_updates()`
--- has been called more than once, `gdk_window_thaw_updates()` must be called
--- an equal number of times to begin processing exposes.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@return nil
function Gdk.Window:freeze_updates() end

--- # method Gdk.Window:fullscreen()
---
--- Moves the window into fullscreen mode. This means the
--- window covers the entire screen and is above any panels
--- or task bars.
--- 
--- If the window was already fullscreen, then this function does nothing.
--- 
--- On X11, asks the window manager to put `window` in a fullscreen
--- state, if the window manager supports this operation. Not all
--- window managers support this, and some deliberately ignore it or
--- don’t have a concept of “fullscreen”; so you can’t rely on the
--- fullscreenification actually happening. But it will happen with
--- most standard window managers, and GDK makes a best effort to get
--- it to happen.
---
--- ---
---
---@param self Gdk.Window # a toplevel `GdkWindow`
---@return nil
function Gdk.Window:fullscreen() end

--- # method Gdk.Window:fullscreen_on_monitor()
---
--- Moves the window into fullscreen mode on the given monitor. This means
--- the window covers the entire screen and is above any panels or task bars.
--- 
--- If the window was already fullscreen, then this function does nothing.
---
--- ---
---
---@param self Gdk.Window # a toplevel `GdkWindow`
---@param monitor integer # Which monitor to display fullscreen on.
---@return nil
function Gdk.Window:fullscreen_on_monitor(monitor) end

--- # method Gdk.Window:geometry_changed()
---
--- This function informs GDK that the geometry of an embedded
--- offscreen window has changed. This is necessary for GDK to keep
--- track of which offscreen window the pointer is in.
---
--- ---
---
---@param self Gdk.Window # an embedded offscreen `GdkWindow`
---@return nil
function Gdk.Window:geometry_changed() end

--- # method Gdk.Window:get_accept_focus()
---
--- Determines whether or not the desktop environment shuld be hinted that
--- the window does not want to receive input focus.
---
--- ---
---
---@param self Gdk.Window # a toplevel `GdkWindow`.
---@return (boolean|nil) # whether or not the window should receive input focus.
function Gdk.Window:get_accept_focus() end

--- # method Gdk.Window:get_background_pattern()
---
--- Gets the pattern used to clear the background on `window`.
---
--- ---
---
---@param self Gdk.Window # a window
---@return cairo.Pattern # The pattern to use for the background or `nil` if there is no background.
function Gdk.Window:get_background_pattern() end

--- # method Gdk.Window:get_children()
---
--- Gets the list of children of `window` known to GDK.
--- This function only returns children created via GDK,
--- so for example it’s useless when used with the root window;
--- it only returns windows an application created itself.
--- 
--- The returned list must be freed, but the elements in the
--- list need not be.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@return Gdk.Window[] # list of child windows inside `window`
function Gdk.Window:get_children() end

--- # method Gdk.Window:get_children_with_user_data()
---
--- Gets the list of children of `window` known to GDK with a
--- particular `user_data` set on it.
--- 
--- The returned list must be freed, but the elements in the
--- list need not be.
--- 
--- The list is returned in (relative) stacking order, i.e. the
--- lowest window is first.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@param user_data? userdata # user data to look for
---@return Gdk.Window[] # list of child windows inside `window`
function Gdk.Window:get_children_with_user_data(user_data) end

--- # method Gdk.Window:get_clip_region()
---
--- Computes the region of a window that potentially can be written
--- to by drawing primitives. This region may not take into account
--- other factors such as if the window is obscured by other windows,
--- but no area outside of this region will be affected by drawing
--- primitives.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@return cairo.Region # a `cairo_region_t`. This must be freed with `cairo_region_destroy()` when you are done.
function Gdk.Window:get_clip_region() end

--- # method Gdk.Window:get_composited()
---
--- Determines whether `window` is composited.
--- 
--- See `gdk_window_set_composited()`.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@return (boolean|nil) # `true` if the window is composited.
function Gdk.Window:get_composited() end

--- # method Gdk.Window:get_cursor()
---
--- Retrieves a `GdkCursor` pointer for the cursor currently set on the
--- specified `GdkWindow`, or `nil`.  If the return value is `nil` then
--- there is no custom cursor set on the specified window, and it is
--- using the cursor for its parent window.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@return Gdk.Cursor # a `GdkCursor`, or `nil`. The returned object is owned by the `GdkWindow` and should not be unreferenced directly. Use `gdk_window_set_cursor()` to unset the cursor of the window
function Gdk.Window:get_cursor() end

--- # method Gdk.Window:get_decorations()
---
--- Returns the decorations set on the GdkWindow with
--- `gdk_window_set_decorations()`.
---
--- ---
---
---@param self Gdk.Window # The toplevel `GdkWindow` to get the decorations from
---@param decorations Gdk.WMDecoration # The window decorations will be written here
---@return (boolean|nil) # `true` if the window has decorations set, `false` otherwise.
function Gdk.Window:get_decorations(decorations) end

--- # method Gdk.Window:get_device_cursor()
---
--- Retrieves a `GdkCursor` pointer for the `device` currently set on the
--- specified `GdkWindow`, or `nil`.  If the return value is `nil` then
--- there is no custom cursor set on the specified window, and it is
--- using the cursor for its parent window.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`.
---@param device Gdk.Device # a master, pointer `GdkDevice`.
---@return Gdk.Cursor # a `GdkCursor`, or `nil`. The returned object is owned by the `GdkWindow` and should not be unreferenced directly. Use `gdk_window_set_cursor()` to unset the cursor of the window
function Gdk.Window:get_device_cursor(device) end

--- # method Gdk.Window:get_device_events()
---
--- Returns the event mask for `window` corresponding to an specific device.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`.
---@param device Gdk.Device # a `GdkDevice`.
---@return Gdk.EventMask # device event mask for `window`
function Gdk.Window:get_device_events(device) end

--- # method Gdk.Window:get_device_position()
---
--- Obtains the current device position and modifier state.
--- The position is given in coordinates relative to the upper left
--- corner of `window`.
--- 
--- Use `gdk_window_get_device_position_double()` if you need subpixel precision.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`.
---@param device Gdk.Device # pointer `GdkDevice` to query to.
---@param x? integer # return location for the X coordinate of `device`, or `nil`.
---@param y? integer # return location for the Y coordinate of `device`, or `nil`.
---@param mask? Gdk.ModifierType # return location for the modifier mask, or `nil`.
---@return Gdk.Window # The window underneath `device` (as with `gdk_device_get_window_at_position()`), or `nil` if the window is not known to GDK.
function Gdk.Window:get_device_position(device, x, y, mask) end

--- # method Gdk.Window:get_device_position_double()
---
--- Obtains the current device position in doubles and modifier state.
--- The position is given in coordinates relative to the upper left
--- corner of `window`.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`.
---@param device Gdk.Device # pointer `GdkDevice` to query to.
---@param x? number # return location for the X coordinate of `device`, or `nil`.
---@param y? number # return location for the Y coordinate of `device`, or `nil`.
---@param mask? Gdk.ModifierType # return location for the modifier mask, or `nil`.
---@return Gdk.Window # The window underneath `device` (as with `gdk_device_get_window_at_position()`), or `nil` if the window is not known to GDK.
function Gdk.Window:get_device_position_double(device, x, y, mask) end

--- # method Gdk.Window:get_display()
---
--- Gets the `GdkDisplay` associated with a `GdkWindow`.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@return Gdk.Display # the `GdkDisplay` associated with `window`
function Gdk.Window:get_display() end

--- # method Gdk.Window:get_drag_protocol()
---
--- Finds out the DND protocol supported by a window.
---
--- ---
---
---@param self Gdk.Window # the destination window
---@param target? Gdk.Window # location of the window where the drop should happen. This may be `window` or a proxy window, or `nil` if `window` does not support Drag and Drop.
---@return Gdk.DragProtocol # the supported DND protocol.
function Gdk.Window:get_drag_protocol(target) end

--- # method Gdk.Window:get_effective_parent()
---
--- Obtains the parent of `window`, as known to GDK. Works like
--- `gdk_window_get_parent()` for normal windows, but returns the
--- window’s embedder for offscreen windows.
--- 
--- See also: `gdk_offscreen_window_get_embedder()`
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@return Gdk.Window # effective parent of `window`
function Gdk.Window:get_effective_parent() end

--- # method Gdk.Window:get_effective_toplevel()
---
--- Gets the toplevel window that’s an ancestor of `window`.
--- 
--- Works like `gdk_window_get_toplevel()`, but treats an offscreen window's
--- embedder as its parent, using `gdk_window_get_effective_parent()`.
--- 
--- See also: `gdk_offscreen_window_get_embedder()`
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@return Gdk.Window # the effective toplevel window containing `window`
function Gdk.Window:get_effective_toplevel() end

--- # method Gdk.Window:get_event_compression()
---
--- Get the current event compression setting for this window.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@return (boolean|nil) # `true` if motion events will be compressed
function Gdk.Window:get_event_compression() end

--- # method Gdk.Window:get_events()
---
--- Gets the event mask for `window` for all master input devices. See
--- `gdk_window_set_events()`.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@return Gdk.EventMask # event mask for `window`
function Gdk.Window:get_events() end

--- # method Gdk.Window:get_focus_on_map()
---
--- Determines whether or not the desktop environment should be hinted that the
--- window does not want to receive input focus when it is mapped.
---
--- ---
---
---@param self Gdk.Window # a toplevel `GdkWindow`.
---@return (boolean|nil) # whether or not the window wants to receive input focus when it is mapped.
function Gdk.Window:get_focus_on_map() end

--- # method Gdk.Window:get_frame_clock()
---
--- Gets the frame clock for the window. The frame clock for a window
--- never changes unless the window is reparented to a new toplevel
--- window.
---
--- ---
---
---@param self Gdk.Window # window to get frame clock for
---@return Gdk.FrameClock # the frame clock
function Gdk.Window:get_frame_clock() end

--- # method Gdk.Window:get_frame_extents()
---
--- Obtains the bounding box of the window, including window manager
--- titlebar/borders if any. The frame position is given in root window
--- coordinates. To get the position of the window itself (rather than
--- the frame) in root window coordinates, use `gdk_window_get_origin()`.
---
--- ---
---
---@param self Gdk.Window # a toplevel `GdkWindow`
---@param rect Gdk.Rectangle # rectangle to fill with bounding box of the window frame
---@return nil
function Gdk.Window:get_frame_extents(rect) end

--- # method Gdk.Window:get_fullscreen_mode()
---
--- Obtains the `GdkFullscreenMode` of the `window`.
---
--- ---
---
---@param self Gdk.Window # a toplevel `GdkWindow`
---@return Gdk.FullscreenMode # The `GdkFullscreenMode` applied to the window when fullscreen.
function Gdk.Window:get_fullscreen_mode() end

--- # method Gdk.Window:get_geometry()
---
--- Any of the return location arguments to this function may be `nil`,
--- if you aren’t interested in getting the value of that field.
--- 
--- The X and Y coordinates returned are relative to the parent window
--- of `window`, which for toplevels usually means relative to the
--- window decorations (titlebar, etc.) rather than relative to the
--- root window (screen-size background window).
--- 
--- On the X11 platform, the geometry is obtained from the X server,
--- so reflects the latest position of `window`; this may be out-of-sync
--- with the position of `window` delivered in the most-recently-processed
--- `GdkEventConfigure`. `gdk_window_get_position()` in contrast gets the
--- position from the most recent configure event.
--- 
--- Note: If `window` is not a toplevel, it is much better
--- to call `gdk_window_get_position()`, `gdk_window_get_width()` and
--- `gdk_window_get_height()` instead, because it avoids the roundtrip to
--- the X server and because these functions support the full 32-bit
--- coordinate space, whereas `gdk_window_get_geometry()` is restricted to
--- the 16-bit coordinates of X11.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@param x? integer # return location for X coordinate of window (relative to its parent)
---@param y? integer # return location for Y coordinate of window (relative to its parent)
---@param width? integer # return location for width of window
---@param height? integer # return location for height of window
---@return nil
function Gdk.Window:get_geometry(x, y, width, height) end

--- # method Gdk.Window:get_group()
---
--- Returns the group leader window for `window`. See `gdk_window_set_group()`.
---
--- ---
---
---@param self Gdk.Window # a toplevel `GdkWindow`
---@return Gdk.Window # the group leader window for `window`
function Gdk.Window:get_group() end

--- # method Gdk.Window:get_height()
---
--- Returns the height of the given `window`.
--- 
--- On the X11 platform the returned size is the size reported in the
--- most-recently-processed configure event, rather than the current
--- size on the X server.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@return integer # The height of `window`
function Gdk.Window:get_height() end

--- # method Gdk.Window:get_modal_hint()
---
--- Determines whether or not the window manager is hinted that `window`
--- has modal behaviour.
---
--- ---
---
---@param self Gdk.Window # A toplevel `GdkWindow`.
---@return (boolean|nil) # whether or not the window has the modal hint set.
function Gdk.Window:get_modal_hint() end

--- # method Gdk.Window:get_origin()
---
--- Obtains the position of a window in root window coordinates.
--- (Compare with `gdk_window_get_position()` and
--- `gdk_window_get_geometry()` which return the position of a window
--- relative to its parent window.)
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@param x? integer # return location for X coordinate
---@param y? integer # return location for Y coordinate
---@return integer # not meaningful, ignore
function Gdk.Window:get_origin(x, y) end

--- # method Gdk.Window:get_parent()
---
--- Obtains the parent of `window`, as known to GDK. Does not query the
--- X server; thus this returns the parent as passed to `gdk_window_new()`,
--- not the actual parent. This should never matter unless you’re using
--- Xlib calls mixed with GDK calls on the X11 platform. It may also
--- matter for toplevel windows, because the window manager may choose
--- to reparent them.
--- 
--- Note that you should use `gdk_window_get_effective_parent()` when
--- writing generic code that walks up a window hierarchy, because
--- `gdk_window_get_parent()` will most likely not do what you expect if
--- there are offscreen windows in the hierarchy.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@return Gdk.Window # parent of `window`
function Gdk.Window:get_parent() end

--- # method Gdk.Window:get_pass_through()
---
--- Returns whether input to the window is passed through to the window
--- below.
--- 
--- See `gdk_window_set_pass_through()` for details
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@return (boolean|nil)
function Gdk.Window:get_pass_through() end

--- # method Gdk.Window:get_pointer()
---
--- Obtains the current pointer position and modifier state.
--- The position is given in coordinates relative to the upper left
--- corner of `window`.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@param x? integer # return location for X coordinate of pointer or `nil` to not return the X coordinate
---@param y? integer # return location for Y coordinate of pointer or `nil` to not return the Y coordinate
---@param mask? Gdk.ModifierType # return location for modifier mask or `nil` to not return the modifier mask
---@return Gdk.Window # the window containing the pointer (as with `gdk_window_at_pointer()`), or `nil` if the window containing the pointer isn’t known to GDK
function Gdk.Window:get_pointer(x, y, mask) end

--- # method Gdk.Window:get_position()
---
--- Obtains the position of the window as reported in the
--- most-recently-processed `GdkEventConfigure`. Contrast with
--- `gdk_window_get_geometry()` which queries the X server for the
--- current window position, regardless of which events have been
--- received or processed.
--- 
--- The position coordinates are relative to the window’s parent window.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@param x? integer # X coordinate of window
---@param y? integer # Y coordinate of window
---@return nil
function Gdk.Window:get_position(x, y) end

--- # method Gdk.Window:get_root_coords()
---
--- Obtains the position of a window position in root
--- window coordinates. This is similar to
--- `gdk_window_get_origin()` but allows you to pass
--- in any position in the window, not just the origin.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@param x integer # X coordinate in window
---@param y integer # Y coordinate in window
---@param root_x integer # return location for X coordinate
---@param root_y integer # return location for Y coordinate
---@return nil
function Gdk.Window:get_root_coords(x, y, root_x, root_y) end

--- # method Gdk.Window:get_root_origin()
---
--- Obtains the top-left corner of the window manager frame in root
--- window coordinates.
---
--- ---
---
---@param self Gdk.Window # a toplevel `GdkWindow`
---@param x integer # return location for X position of window frame
---@param y integer # return location for Y position of window frame
---@return nil
function Gdk.Window:get_root_origin(x, y) end

--- # method Gdk.Window:get_scale_factor()
---
--- Returns the internal scale factor that maps from window coordiantes
--- to the actual device pixels. On traditional systems this is 1, but
--- on very high density outputs this can be a higher value (often 2).
--- 
--- A higher value means that drawing is automatically scaled up to
--- a higher resolution, so any code doing drawing will automatically look
--- nicer. However, if you are supplying pixel-based data the scale
--- value can be used to determine whether to use a pixel resource
--- with higher resolution data.
--- 
--- The scale of a window may change during runtime, if this happens
--- a configure event will be sent to the toplevel window.
---
--- ---
---
---@param self Gdk.Window # window to get scale factor for
---@return integer # the scale factor
function Gdk.Window:get_scale_factor() end

--- # method Gdk.Window:get_screen()
---
--- Gets the `GdkScreen` associated with a `GdkWindow`.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@return Gdk.Screen # the `GdkScreen` associated with `window`
function Gdk.Window:get_screen() end

--- # method Gdk.Window:get_source_events()
---
--- Returns the event mask for `window` corresponding to the device class specified
--- by `source`.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@param source Gdk.InputSource # a `GdkInputSource` to define the source class.
---@return Gdk.EventMask # source event mask for `window`
function Gdk.Window:get_source_events(source) end

--- # method Gdk.Window:get_state()
---
--- Gets the bitwise OR of the currently active window state flags,
--- from the `GdkWindowState` enumeration.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@return Gdk.WindowState # window state bitfield
function Gdk.Window:get_state() end

--- # method Gdk.Window:get_support_multidevice()
---
--- Returns `true` if the window is aware of the existence of multiple
--- devices.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`.
---@return (boolean|nil) # `true` if the window handles multidevice features.
function Gdk.Window:get_support_multidevice() end

--- # method Gdk.Window:get_toplevel()
---
--- Gets the toplevel window that’s an ancestor of `window`.
--- 
--- Any window type but %GDK_WINDOW_CHILD is considered a
--- toplevel window, as is a %GDK_WINDOW_CHILD window that
--- has a root window as parent.
--- 
--- Note that you should use `gdk_window_get_effective_toplevel()` when
--- you want to get to a window’s toplevel as seen on screen, because
--- `gdk_window_get_toplevel()` will most likely not do what you expect
--- if there are offscreen windows in the hierarchy.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@return Gdk.Window # the toplevel window containing `window`
function Gdk.Window:get_toplevel() end

--- # method Gdk.Window:get_type_hint()
---
--- This function returns the type hint set for a window.
---
--- ---
---
---@param self Gdk.Window # A toplevel `GdkWindow`
---@return Gdk.WindowTypeHint # The type hint set for `window`
function Gdk.Window:get_type_hint() end

--- # method Gdk.Window:get_update_area()
---
--- Transfers ownership of the update area from `window` to the caller
--- of the function. That is, after calling this function, `window` will
--- no longer have an invalid/dirty region; the update area is removed
--- from `window` and handed to you. If a window has no update area,
--- `gdk_window_get_update_area()` returns `nil`. You are responsible for
--- calling `cairo_region_destroy()` on the returned region if it’s non-`nil`.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@return cairo.Region # the update area for `window`
function Gdk.Window:get_update_area() end

--- # method Gdk.Window:get_user_data()
---
--- Retrieves the user data for `window`, which is normally the widget
--- that `window` belongs to. See `gdk_window_set_user_data()`.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@param data? userdata # return location for user data
---@return nil
function Gdk.Window:get_user_data(data) end

--- # method Gdk.Window:get_visible_region()
---
--- Computes the region of the `window` that is potentially visible.
--- This does not necessarily take into account if the window is
--- obscured by other windows, but no area outside of this region
--- is visible.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@return cairo.Region # a `cairo_region_t`. This must be freed with `cairo_region_destroy()` when you are done.
function Gdk.Window:get_visible_region() end

--- # method Gdk.Window:get_visual()
---
--- Gets the `GdkVisual` describing the pixel format of `window`.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@return Gdk.Visual # a `GdkVisual`
function Gdk.Window:get_visual() end

--- # method Gdk.Window:get_width()
---
--- Returns the width of the given `window`.
--- 
--- On the X11 platform the returned size is the size reported in the
--- most-recently-processed configure event, rather than the current
--- size on the X server.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@return integer # The width of `window`
function Gdk.Window:get_width() end

--- # method Gdk.Window:get_window_type()
---
--- Gets the type of the window. See `GdkWindowType`.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@return Gdk.WindowType # type of window
function Gdk.Window:get_window_type() end

--- # method Gdk.Window:has_native()
---
--- Checks whether the window has a native window or not. Note that
--- you can use `gdk_window_ensure_native()` if a native window is needed.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@return (boolean|nil) # `true` if the `window` has a native window, `false` otherwise.
function Gdk.Window:has_native() end

--- # method Gdk.Window:hide()
---
--- For toplevel windows, withdraws them, so they will no longer be
--- known to the window manager; for all windows, unmaps them, so
--- they won’t be displayed. Normally done automatically as
--- part of `gtk_widget_hide()`.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@return nil
function Gdk.Window:hide() end

--- # method Gdk.Window:iconify()
---
--- Asks to iconify (minimize) `window`. The window manager may choose
--- to ignore the request, but normally will honor it. Using
--- `gtk_window_iconify()` is preferred, if you have a `GtkWindow` widget.
--- 
--- This function only makes sense when `window` is a toplevel window.
---
--- ---
---
---@param self Gdk.Window # a toplevel `GdkWindow`
---@return nil
function Gdk.Window:iconify() end

--- # method Gdk.Window:input_shape_combine_region()
---
--- Like `gdk_window_shape_combine_region()`, but the shape applies
--- only to event handling. Mouse events which happen while
--- the pointer position corresponds to an unset bit in the
--- mask will be passed on the window below `window`.
--- 
--- An input shape is typically used with RGBA windows.
--- The alpha channel of the window defines which pixels are
--- invisible and allows for nicely antialiased borders,
--- and the input shape controls where the window is
--- “clickable”.
--- 
--- On the X11 platform, this requires version 1.1 of the
--- shape extension.
--- 
--- On the Win32 platform, this functionality is not present and the
--- function does nothing.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@param shape_region cairo.Region # region of window to be non-transparent
---@param offset_x integer # X position of `shape_region` in `window` coordinates
---@param offset_y integer # Y position of `shape_region` in `window` coordinates
---@return nil
function Gdk.Window:input_shape_combine_region(shape_region, offset_x, offset_y) end

--- # method Gdk.Window:invalidate_maybe_recurse()
---
--- Adds `region` to the update area for `window`. The update area is the
--- region that needs to be redrawn, or “dirty region.” The call
--- `gdk_window_process_updates()` sends one or more expose events to the
--- window, which together cover the entire update area. An
--- application would normally redraw the contents of `window` in
--- response to those expose events.
--- 
--- GDK will call `gdk_window_process_all_updates()` on your behalf
--- whenever your program returns to the main loop and becomes idle, so
--- normally there’s no need to do that manually, you just need to
--- invalidate regions that you know should be redrawn.
--- 
--- The `child_func` parameter controls whether the region of
--- each child window that intersects `region` will also be invalidated.
--- Only children for which `child_func` returns `TRUE` will have the area
--- invalidated.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@param region cairo.Region # a `cairo_region_t`
---@param child_func? Gdk.WindowChildFunc # function to use to decide if to recurse to a child, `nil` means never recurse.
---@param user_data? userdata # data passed to `child_func`
---@return nil
function Gdk.Window:invalidate_maybe_recurse(region, child_func, user_data) end

--- # method Gdk.Window:invalidate_rect()
---
--- A convenience wrapper around `gdk_window_invalidate_region()` which
--- invalidates a rectangular region. See
--- `gdk_window_invalidate_region()` for details.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@param rect? Gdk.Rectangle # rectangle to invalidate or `nil` to invalidate the whole window
---@param invalidate_children (boolean|nil) # whether to also invalidate child windows
---@return nil
function Gdk.Window:invalidate_rect(rect, invalidate_children) end

--- # method Gdk.Window:invalidate_region()
---
--- Adds `region` to the update area for `window`. The update area is the
--- region that needs to be redrawn, or “dirty region.” The call
--- `gdk_window_process_updates()` sends one or more expose events to the
--- window, which together cover the entire update area. An
--- application would normally redraw the contents of `window` in
--- response to those expose events.
--- 
--- GDK will call `gdk_window_process_all_updates()` on your behalf
--- whenever your program returns to the main loop and becomes idle, so
--- normally there’s no need to do that manually, you just need to
--- invalidate regions that you know should be redrawn.
--- 
--- The `invalidate_children` parameter controls whether the region of
--- each child window that intersects `region` will also be invalidated.
--- If `false`, then the update area for child windows will remain
--- unaffected. See gdk_window_invalidate_maybe_recurse if you need
--- fine grained control over which children are invalidated.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@param region cairo.Region # a `cairo_region_t`
---@param invalidate_children (boolean|nil) # `true` to also invalidate child windows
---@return nil
function Gdk.Window:invalidate_region(region, invalidate_children) end

--- # method Gdk.Window:is_destroyed()
---
--- Check to see if a window is destroyed..
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@return (boolean|nil) # `true` if the window is destroyed
function Gdk.Window:is_destroyed() end

--- # method Gdk.Window:is_input_only()
---
--- Determines whether or not the window is an input only window.
---
--- ---
---
---@param self Gdk.Window # a toplevel `GdkWindow`
---@return (boolean|nil) # `true` if `window` is input only
function Gdk.Window:is_input_only() end

--- # method Gdk.Window:is_shaped()
---
--- Determines whether or not the window is shaped.
---
--- ---
---
---@param self Gdk.Window # a toplevel `GdkWindow`
---@return (boolean|nil) # `true` if `window` is shaped
function Gdk.Window:is_shaped() end

--- # method Gdk.Window:is_viewable()
---
--- Check if the window and all ancestors of the window are
--- mapped. (This is not necessarily "viewable" in the X sense, since
--- we only check as far as we have GDK window parents, not to the root
--- window.)
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@return (boolean|nil) # `true` if the window is viewable
function Gdk.Window:is_viewable() end

--- # method Gdk.Window:is_visible()
---
--- Checks whether the window has been mapped (with `gdk_window_show()` or
--- `gdk_window_show_unraised()`).
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@return (boolean|nil) # `true` if the window is mapped
function Gdk.Window:is_visible() end

--- # method Gdk.Window:lower()
---
--- Lowers `window` to the bottom of the Z-order (stacking order), so that
--- other windows with the same parent window appear above `window`.
--- This is true whether or not the other windows are visible.
--- 
--- If `window` is a toplevel, the window manager may choose to deny the
--- request to move the window in the Z-order, `gdk_window_lower()` only
--- requests the restack, does not guarantee it.
--- 
--- Note that `gdk_window_show()` raises the window again, so don’t call this
--- function before `gdk_window_show()`. (Try `gdk_window_show_unraised()`.)
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@return nil
function Gdk.Window:lower() end

--- # method Gdk.Window:mark_paint_from_clip()
---
--- If you call this during a paint (e.g. between `gdk_window_begin_paint_region()`
--- and `gdk_window_end_paint()` then GDK will mark the current clip region of the
--- window as being drawn. This is required when mixing GL rendering via
--- `gdk_cairo_draw_from_gl()` and cairo rendering, as otherwise GDK has no way
--- of knowing when something paints over the GL-drawn regions.
--- 
--- This is typically called automatically by GTK+ and you don't need
--- to care about this.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@param cr cairo.Context # a `cairo_t`
---@return nil
function Gdk.Window:mark_paint_from_clip(cr) end

--- # method Gdk.Window:maximize()
---
--- Maximizes the window. If the window was already maximized, then
--- this function does nothing.
--- 
--- On X11, asks the window manager to maximize `window`, if the window
--- manager supports this operation. Not all window managers support
--- this, and some deliberately ignore it or don’t have a concept of
--- “maximized”; so you can’t rely on the maximization actually
--- happening. But it will happen with most standard window managers,
--- and GDK makes a best effort to get it to happen.
--- 
--- On Windows, reliably maximizes the window.
---
--- ---
---
---@param self Gdk.Window # a toplevel `GdkWindow`
---@return nil
function Gdk.Window:maximize() end

--- # method Gdk.Window:merge_child_input_shapes()
---
--- Merges the input shape masks for any child windows into the
--- input shape mask for `window`. i.e. the union of all input masks
--- for `window` and its children will become the new input mask
--- for `window`. See `gdk_window_input_shape_combine_region()`.
--- 
--- This function is distinct from `gdk_window_set_child_input_shapes()`
--- because it includes `window`’s input shape mask in the set of
--- shapes to be merged.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@return nil
function Gdk.Window:merge_child_input_shapes() end

--- # method Gdk.Window:merge_child_shapes()
---
--- Merges the shape masks for any child windows into the
--- shape mask for `window`. i.e. the union of all masks
--- for `window` and its children will become the new mask
--- for `window`. See `gdk_window_shape_combine_region()`.
--- 
--- This function is distinct from `gdk_window_set_child_shapes()`
--- because it includes `window`’s shape mask in the set of shapes to
--- be merged.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@return nil
function Gdk.Window:merge_child_shapes() end

--- # method Gdk.Window:move()
---
--- Repositions a window relative to its parent window.
--- For toplevel windows, window managers may ignore or modify the move;
--- you should probably use `gtk_window_move()` on a `GtkWindow` widget
--- anyway, instead of using GDK functions. For child windows,
--- the move will reliably succeed.
--- 
--- If you’re also planning to resize the window, use `gdk_window_move_resize()`
--- to both move and resize simultaneously, for a nicer visual effect.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@param x integer # X coordinate relative to window’s parent
---@param y integer # Y coordinate relative to window’s parent
---@return nil
function Gdk.Window:move(x, y) end

--- # method Gdk.Window:move_region()
---
--- Move the part of `window` indicated by `region` by `dy` pixels in the Y
--- direction and `dx` pixels in the X direction. The portions of `region`
--- that not covered by the new position of `region` are invalidated.
--- 
--- Child windows are not moved.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@param region cairo.Region # The `cairo_region_t` to move
---@param dx integer # Amount to move in the X direction
---@param dy integer # Amount to move in the Y direction
---@return nil
function Gdk.Window:move_region(region, dx, dy) end

--- # method Gdk.Window:move_resize()
---
--- Equivalent to calling `gdk_window_move()` and `gdk_window_resize()`,
--- except that both operations are performed at once, avoiding strange
--- visual effects. (i.e. the user may be able to see the window first
--- move, then resize, if you don’t use `gdk_window_move_resize()`.)
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@param x integer # new X position relative to window’s parent
---@param y integer # new Y position relative to window’s parent
---@param width integer # new width
---@param height integer # new height
---@return nil
function Gdk.Window:move_resize(x, y, width, height) end

--- # method Gdk.Window:move_to_rect()
---
--- Moves `window` to `rect`, aligning their anchor points.
--- 
--- `rect` is relative to the top-left corner of the window that `window` is
--- transient for. `rect_anchor` and `window_anchor` determine anchor points on
--- `rect` and `window` to pin together. `rect`'s anchor point can optionally be
--- offset by `rect_anchor_dx` and `rect_anchor_dy`, which is equivalent to
--- offsetting the position of `window`.
--- 
--- `anchor_hints` determines how `window` will be moved if the anchor points cause
--- it to move off-screen. For example, %GDK_ANCHOR_FLIP_X will replace
--- %GDK_GRAVITY_NORTH_WEST with %GDK_GRAVITY_NORTH_EAST and vice versa if
--- `window` extends beyond the left or right edges of the monitor.
--- 
--- Connect to the `GdkWindow`::moved-to-rect signal to find out how it was
--- actually positioned.
---
--- ---
---
---@param self Gdk.Window # the `GdkWindow` to move
---@param rect Gdk.Rectangle # the destination `GdkRectangle` to align `window` with
---@param rect_anchor Gdk.Gravity # the point on `rect` to align with `window`'s anchor point
---@param window_anchor Gdk.Gravity # the point on `window` to align with `rect`'s anchor point
---@param anchor_hints Gdk.AnchorHints # positioning hints to use when limited on space
---@param rect_anchor_dx integer # horizontal offset to shift `window`, i.e. `rect`'s anchor point
---@param rect_anchor_dy integer # vertical offset to shift `window`, i.e. `rect`'s anchor point
---@return nil
function Gdk.Window:move_to_rect(rect, rect_anchor, window_anchor, anchor_hints, rect_anchor_dx, rect_anchor_dy) end

--- # method Gdk.Window:peek_children()
---
--- Like `gdk_window_get_children()`, but does not copy the list of
--- children, so the list does not need to be freed.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@return Gdk.Window[] # a reference to the list of child windows in `window`
function Gdk.Window:peek_children() end

--- # method Gdk.Window:process_updates()
---
--- Sends one or more expose events to `window`. The areas in each
--- expose event will cover the entire update area for the window (see
--- `gdk_window_invalidate_region()` for details). Normally GDK calls
--- `gdk_window_process_all_updates()` on your behalf, so there’s no
--- need to call this function unless you want to force expose events
--- to be delivered immediately and synchronously (vs. the usual
--- case, where GDK delivers them in an idle handler). Occasionally
--- this is useful to produce nicer scrolling behavior, for example.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@param update_children (boolean|nil) # whether to also process updates for child windows
---@return nil
function Gdk.Window:process_updates(update_children) end

--- # method Gdk.Window:raise()
---
--- Raises `window` to the top of the Z-order (stacking order), so that
--- other windows with the same parent window appear below `window`.
--- This is true whether or not the windows are visible.
--- 
--- If `window` is a toplevel, the window manager may choose to deny the
--- request to move the window in the Z-order, `gdk_window_raise()` only
--- requests the restack, does not guarantee it.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@return nil
function Gdk.Window:raise() end

--- # method Gdk.Window:register_dnd()
---
--- Registers a window as a potential drop destination.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`.
---@return nil
function Gdk.Window:register_dnd() end

--- # method Gdk.Window:reparent()
---
--- Reparents `window` into the given `new_parent`. The window being
--- reparented will be unmapped as a side effect.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@param new_parent Gdk.Window # new parent to move `window` into
---@param x integer # X location inside the new parent
---@param y integer # Y location inside the new parent
---@return nil
function Gdk.Window:reparent(new_parent, x, y) end

--- # method Gdk.Window:resize()
---
--- Resizes `window`; for toplevel windows, asks the window manager to resize
--- the window. The window manager may not allow the resize. When using GTK+,
--- use `gtk_window_resize()` instead of this low-level GDK function.
--- 
--- Windows may not be resized below 1x1.
--- 
--- If you’re also planning to move the window, use `gdk_window_move_resize()`
--- to both move and resize simultaneously, for a nicer visual effect.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@param width integer # new width of the window
---@param height integer # new height of the window
---@return nil
function Gdk.Window:resize(width, height) end

--- # method Gdk.Window:restack()
---
--- Changes the position of  `window` in the Z-order (stacking order), so that
--- it is above `sibling` (if `above` is `true`) or below `sibling` (if `above` is
--- `false`).
--- 
--- If `sibling` is `nil`, then this either raises (if `above` is `true`) or
--- lowers the window.
--- 
--- If `window` is a toplevel, the window manager may choose to deny the
--- request to move the window in the Z-order, `gdk_window_restack()` only
--- requests the restack, does not guarantee it.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@param sibling? Gdk.Window # a `GdkWindow` that is a sibling of `window`, or `nil`
---@param above (boolean|nil) # a boolean
---@return nil
function Gdk.Window:restack(sibling, above) end

--- # method Gdk.Window:scroll()
---
--- Scroll the contents of `window`, both pixels and children, by the
--- given amount. `window` itself does not move. Portions of the window
--- that the scroll operation brings in from offscreen areas are
--- invalidated. The invalidated region may be bigger than what would
--- strictly be necessary.
--- 
--- For X11, a minimum area will be invalidated if the window has no
--- subwindows, or if the edges of the window’s parent do not extend
--- beyond the edges of the window. In other cases, a multi-step process
--- is used to scroll the window which may produce temporary visual
--- artifacts and unnecessary invalidations.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@param dx integer # Amount to scroll in the X direction
---@param dy integer # Amount to scroll in the Y direction
---@return nil
function Gdk.Window:scroll(dx, dy) end

--- # method Gdk.Window:set_accept_focus()
---
--- Setting `accept_focus` to `false` hints the desktop environment that the
--- window doesn’t want to receive input focus.
--- 
--- On X, it is the responsibility of the window manager to interpret this
--- hint. ICCCM-compliant window manager usually respect it.
---
--- ---
---
---@param self Gdk.Window # a toplevel `GdkWindow`
---@param accept_focus (boolean|nil) # `true` if the window should receive input focus
---@return nil
function Gdk.Window:set_accept_focus(accept_focus) end

--- # method Gdk.Window:set_background()
---
--- Sets the background color of `window`.
--- 
--- However, when using GTK+, influence the background of a widget
--- using a style class or CSS — if you’re an application — or with
--- `gtk_style_context_set_background()` — if you're implementing a
--- custom widget.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@param color Gdk.Color # a `GdkColor`
---@return nil
function Gdk.Window:set_background(color) end

--- # method Gdk.Window:set_background_pattern()
---
--- Sets the background of `window`.
--- 
--- A background of `nil` means that the window won't have any background. On the
--- X11 backend it's also possible to inherit the background from the parent
--- window using gdk_x11`_get_parent_relative_pattern()`.
--- 
--- The windowing system will normally fill a window with its background
--- when the window is obscured then exposed.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@param pattern? cairo.Pattern # a pattern to use, or `nil`
---@return nil
function Gdk.Window:set_background_pattern(pattern) end

--- # method Gdk.Window:set_background_rgba()
---
--- Sets the background color of `window`.
--- 
--- See also `gdk_window_set_background_pattern()`.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@param rgba Gdk.RGBA # a `GdkRGBA` color
---@return nil
function Gdk.Window:set_background_rgba(rgba) end

--- # method Gdk.Window:set_child_input_shapes()
---
--- Sets the input shape mask of `window` to the union of input shape masks
--- for all children of `window`, ignoring the input shape mask of `window`
--- itself. Contrast with `gdk_window_merge_child_input_shapes()` which includes
--- the input shape mask of `window` in the masks to be merged.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@return nil
function Gdk.Window:set_child_input_shapes() end

--- # method Gdk.Window:set_child_shapes()
---
--- Sets the shape mask of `window` to the union of shape masks
--- for all children of `window`, ignoring the shape mask of `window`
--- itself. Contrast with `gdk_window_merge_child_shapes()` which includes
--- the shape mask of `window` in the masks to be merged.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@return nil
function Gdk.Window:set_child_shapes() end

--- # method Gdk.Window:set_composited()
---
--- Sets a `GdkWindow` as composited, or unsets it. Composited
--- windows do not automatically have their contents drawn to
--- the screen. Drawing is redirected to an offscreen buffer
--- and an expose event is emitted on the parent of the composited
--- window. It is the responsibility of the parent’s expose handler
--- to manually merge the off-screen content onto the screen in
--- whatever way it sees fit.
--- 
--- It only makes sense for child windows to be composited; see
--- `gdk_window_set_opacity()` if you need translucent toplevel
--- windows.
--- 
--- An additional effect of this call is that the area of this
--- window is no longer clipped from regions marked for
--- invalidation on its parent. Draws done on the parent
--- window are also no longer clipped by the child.
--- 
--- This call is only supported on some systems (currently,
--- only X11 with new enough Xcomposite and Xdamage extensions).
--- You must call `gdk_display_supports_composite()` to check if
--- setting a window as composited is supported before
--- attempting to do so.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@param composited (boolean|nil) # `true` to set the window as composited
---@return nil
function Gdk.Window:set_composited(composited) end

--- # method Gdk.Window:set_cursor()
---
--- Sets the default mouse pointer for a `GdkWindow`.
--- 
--- Note that `cursor` must be for the same display as `window`.
--- 
--- Use `gdk_cursor_new_for_display()` or `gdk_cursor_new_from_pixbuf()` to
--- create the cursor. To make the cursor invisible, use %GDK_BLANK_CURSOR.
--- Passing `nil` for the `cursor` argument to `gdk_window_set_cursor()` means
--- that `window` will use the cursor of its parent window. Most windows
--- should use this default.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@param cursor? Gdk.Cursor # a cursor
---@return nil
function Gdk.Window:set_cursor(cursor) end

--- # method Gdk.Window:set_decorations()
---
--- “Decorations” are the features the window manager adds to a toplevel `GdkWindow`.
--- This function sets the traditional Motif window manager hints that tell the
--- window manager which decorations you would like your window to have.
--- Usually you should use `gtk_window_set_decorated()` on a `GtkWindow` instead of
--- using the GDK function directly.
--- 
--- The `decorations` argument is the logical OR of the fields in
--- the `GdkWMDecoration` enumeration. If `GDK_DECOR_ALL` is included in the
--- mask, the other bits indicate which decorations should be turned off.
--- If `GDK_DECOR_ALL` is not included, then the other bits indicate
--- which decorations should be turned on.
--- 
--- Most window managers honor a decorations hint of 0 to disable all decorations,
--- but very few honor all possible combinations of bits.
---
--- ---
---
---@param self Gdk.Window # a toplevel `GdkWindow`
---@param decorations Gdk.WMDecoration # decoration hint mask
---@return nil
function Gdk.Window:set_decorations(decorations) end

--- # method Gdk.Window:set_device_cursor()
---
--- Sets a specific `GdkCursor` for a given device when it gets inside `window`.
--- Use `gdk_cursor_new_for_display()` or `gdk_cursor_new_from_pixbuf()` to create
--- the cursor. To make the cursor invisible, use %GDK_BLANK_CURSOR. Passing
--- `nil` for the `cursor` argument to `gdk_window_set_cursor()` means that
--- `window` will use the cursor of its parent window. Most windows should
--- use this default.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@param device Gdk.Device # a master, pointer `GdkDevice`
---@param cursor Gdk.Cursor # a `GdkCursor`
---@return nil
function Gdk.Window:set_device_cursor(device, cursor) end

--- # method Gdk.Window:set_device_events()
---
--- Sets the event mask for a given device (Normally a floating device, not
--- attached to any visible pointer) to `window`. For example, an event mask
--- including `GDK_BUTTON_PRESS_MASK` means the window should report button
--- press events. The event mask is the bitwise OR of values from the
--- `GdkEventMask` enumeration.
--- 
--- See the [input handling overview][event-masks] for details.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@param device Gdk.Device # `GdkDevice` to enable events for.
---@param event_mask Gdk.EventMask # event mask for `window`
---@return nil
function Gdk.Window:set_device_events(device, event_mask) end

--- # method Gdk.Window:set_event_compression()
---
--- Determines whether or not extra unprocessed motion events in
--- the event queue can be discarded. If `true` only the most recent
--- event will be delivered.
--- 
--- Some types of applications, e.g. paint programs, need to see all
--- motion events and will benefit from turning off event compression.
--- 
--- By default, event compression is enabled.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@param event_compression (boolean|nil) # `true` if motion events should be compressed
---@return nil
function Gdk.Window:set_event_compression(event_compression) end

--- # method Gdk.Window:set_events()
---
--- The event mask for a window determines which events will be reported
--- for that window from all master input devices. For example, an event mask
--- including `GDK_BUTTON_PRESS_MASK` means the window should report button
--- press events. The event mask is the bitwise OR of values from the
--- `GdkEventMask` enumeration.
--- 
--- See the [input handling overview][event-masks] for details.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@param event_mask Gdk.EventMask # event mask for `window`
---@return nil
function Gdk.Window:set_events(event_mask) end

--- # method Gdk.Window:set_focus_on_map()
---
--- Setting `focus_on_map` to `false` hints the desktop environment that the
--- window doesn’t want to receive input focus when it is mapped.
--- focus_on_map should be turned off for windows that aren’t triggered
--- interactively (such as popups from network activity).
--- 
--- On X, it is the responsibility of the window manager to interpret
--- this hint. Window managers following the freedesktop.org window
--- manager extension specification should respect it.
---
--- ---
---
---@param self Gdk.Window # a toplevel `GdkWindow`
---@param focus_on_map (boolean|nil) # `true` if the window should receive input focus when mapped
---@return nil
function Gdk.Window:set_focus_on_map(focus_on_map) end

--- # method Gdk.Window:set_fullscreen_mode()
---
--- Specifies whether the `window` should span over all monitors (in a multi-head
--- setup) or only the current monitor when in fullscreen mode.
--- 
--- The `mode` argument is from the `GdkFullscreenMode` enumeration.
--- If `GDK_FULLSCREEN_ON_ALL_MONITORS` is specified, the fullscreen `window` will
--- span over all monitors from the `GdkScreen`.
--- 
--- On X11, searches through the list of monitors from the `GdkScreen` the ones
--- which delimit the 4 edges of the entire `GdkScreen` and will ask the window
--- manager to span the `window` over these monitors.
--- 
--- If the XINERAMA extension is not available or not usable, this function
--- has no effect.
--- 
--- Not all window managers support this, so you can’t rely on the fullscreen
--- window to span over the multiple monitors when `GDK_FULLSCREEN_ON_ALL_MONITORS`
--- is specified.
---
--- ---
---
---@param self Gdk.Window # a toplevel `GdkWindow`
---@param mode Gdk.FullscreenMode # fullscreen mode
---@return nil
function Gdk.Window:set_fullscreen_mode(mode) end

--- # method Gdk.Window:set_functions()
---
--- Sets hints about the window management functions to make available
--- via buttons on the window frame.
--- 
--- On the X backend, this function sets the traditional Motif window
--- manager hint for this purpose. However, few window managers do
--- anything reliable or interesting with this hint. Many ignore it
--- entirely.
--- 
--- The `functions` argument is the logical OR of values from the
--- `GdkWMFunction` enumeration. If the bitmask includes `GDK_FUNC_ALL`,
--- then the other bits indicate which functions to disable; if
--- it doesn’t include `GDK_FUNC_ALL`, it indicates which functions to
--- enable.
---
--- ---
---
---@param self Gdk.Window # a toplevel `GdkWindow`
---@param functions Gdk.WMFunction # bitmask of operations to allow on `window`
---@return nil
function Gdk.Window:set_functions(functions) end

--- # method Gdk.Window:set_geometry_hints()
---
--- Sets the geometry hints for `window`. Hints flagged in `geom_mask`
--- are set, hints not flagged in `geom_mask` are unset.
--- To unset all hints, use a `geom_mask` of 0 and a `geometry` of `nil`.
--- 
--- This function provides hints to the windowing system about
--- acceptable sizes for a toplevel window. The purpose of
--- this is to constrain user resizing, but the windowing system
--- will typically  (but is not required to) also constrain the
--- current size of the window to the provided values and
--- constrain programatic resizing via `gdk_window_resize()` or
--- `gdk_window_move_resize()`.
--- 
--- Note that on X11, this effect has no effect on windows
--- of type %GDK_WINDOW_TEMP or windows where override redirect
--- has been turned on via `gdk_window_set_override_redirect()`
--- since these windows are not resizable by the user.
--- 
--- Since you can’t count on the windowing system doing the
--- constraints for programmatic resizes, you should generally
--- call `gdk_window_constrain_size()` yourself to determine
--- appropriate sizes.
---
--- ---
---
---@param self Gdk.Window # a toplevel `GdkWindow`
---@param geometry Gdk.Geometry # geometry hints
---@param geom_mask Gdk.WindowHints # bitmask indicating fields of `geometry` to pay attention to
---@return nil
function Gdk.Window:set_geometry_hints(geometry, geom_mask) end

--- # method Gdk.Window:set_group()
---
--- Sets the group leader window for `window`. By default,
--- GDK sets the group leader for all toplevel windows
--- to a global window implicitly created by GDK. With this function
--- you can override this default.
--- 
--- The group leader window allows the window manager to distinguish
--- all windows that belong to a single application. It may for example
--- allow users to minimize/unminimize all windows belonging to an
--- application at once. You should only set a non-default group window
--- if your application pretends to be multiple applications.
---
--- ---
---
---@param self Gdk.Window # a toplevel `GdkWindow`
---@param leader? Gdk.Window # group leader window, or `nil` to restore the default group leader window
---@return nil
function Gdk.Window:set_group(leader) end

--- # method Gdk.Window:set_icon_list()
---
--- Sets a list of icons for the window. One of these will be used
--- to represent the window when it has been iconified. The icon is
--- usually shown in an icon box or some sort of task bar. Which icon
--- size is shown depends on the window manager. The window manager
--- can scale the icon  but setting several size icons can give better
--- image quality since the window manager may only need to scale the
--- icon by a small amount or not at all.
--- 
--- Note that some platforms don't support window icons.
---
--- ---
---
---@param self Gdk.Window # The `GdkWindow` toplevel window to set the icon of.
---@param pixbufs GdkPixbuf.Pixbuf[] # A list of pixbufs, of different sizes.
---@return nil
function Gdk.Window:set_icon_list(pixbufs) end

--- # method Gdk.Window:set_icon_name()
---
--- Windows may have a name used while minimized, distinct from the
--- name they display in their titlebar. Most of the time this is a bad
--- idea from a user interface standpoint. But you can set such a name
--- with this function, if you like.
--- 
--- After calling this with a non-`nil` `name`, calls to `gdk_window_set_title()`
--- will not update the icon title.
--- 
--- Using `nil` for `name` unsets the icon title; further calls to
--- `gdk_window_set_title()` will again update the icon title as well.
--- 
--- Note that some platforms don't support window icons.
---
--- ---
---
---@param self Gdk.Window # a toplevel `GdkWindow`
---@param name? string # name of window while iconified (minimized)
---@return nil
function Gdk.Window:set_icon_name(name) end

--- # method Gdk.Window:set_keep_above()
---
--- Set if `window` must be kept above other windows. If the
--- window was already above, then this function does nothing.
--- 
--- On X11, asks the window manager to keep `window` above, if the window
--- manager supports this operation. Not all window managers support
--- this, and some deliberately ignore it or don’t have a concept of
--- “keep above”; so you can’t rely on the window being kept above.
--- But it will happen with most standard window managers,
--- and GDK makes a best effort to get it to happen.
---
--- ---
---
---@param self Gdk.Window # a toplevel `GdkWindow`
---@param setting (boolean|nil) # whether to keep `window` above other windows
---@return nil
function Gdk.Window:set_keep_above(setting) end

--- # method Gdk.Window:set_keep_below()
---
--- Set if `window` must be kept below other windows. If the
--- window was already below, then this function does nothing.
--- 
--- On X11, asks the window manager to keep `window` below, if the window
--- manager supports this operation. Not all window managers support
--- this, and some deliberately ignore it or don’t have a concept of
--- “keep below”; so you can’t rely on the window being kept below.
--- But it will happen with most standard window managers,
--- and GDK makes a best effort to get it to happen.
---
--- ---
---
---@param self Gdk.Window # a toplevel `GdkWindow`
---@param setting (boolean|nil) # whether to keep `window` below other windows
---@return nil
function Gdk.Window:set_keep_below(setting) end

--- # method Gdk.Window:set_modal_hint()
---
--- The application can use this hint to tell the window manager
--- that a certain window has modal behaviour. The window manager
--- can use this information to handle modal windows in a special
--- way.
--- 
--- You should only use this on windows for which you have
--- previously called `gdk_window_set_transient_for()`
---
--- ---
---
---@param self Gdk.Window # A toplevel `GdkWindow`
---@param modal (boolean|nil) # `true` if the window is modal, `false` otherwise.
---@return nil
function Gdk.Window:set_modal_hint(modal) end

--- # method Gdk.Window:set_opacity()
---
--- Set `window` to render as partially transparent,
--- with opacity 0 being fully transparent and 1 fully opaque. (Values
--- of the opacity parameter are clamped to the [0,1] range.)
--- 
--- For toplevel windows this depends on support from the windowing system
--- that may not always be there. For instance, On X11, this works only on
--- X screens with a compositing manager running. On Wayland, there is no
--- per-window opacity value that the compositor would apply. Instead, use
--- `gdk_window_set_opaque_region (window, NULL)` to tell the compositor
--- that the entire window is (potentially) non-opaque, and draw your content
--- with alpha, or use `gtk_widget_set_opacity()` to set an overall opacity
--- for your widgets.
--- 
--- For child windows this function only works for non-native windows.
--- 
--- For setting up per-pixel alpha topelevels, see `gdk_screen_get_rgba_visual()`,
--- and for non-toplevels, see `gdk_window_set_composited()`.
--- 
--- Support for non-toplevel windows was added in 3.8.
---
--- ---
---
---@param self Gdk.Window # a top-level or non-native `GdkWindow`
---@param opacity number # opacity
---@return nil
function Gdk.Window:set_opacity(opacity) end

--- # method Gdk.Window:set_opaque_region()
---
--- For optimisation purposes, compositing window managers may
--- like to not draw obscured regions of windows, or turn off blending
--- during for these regions. With RGB windows with no transparency,
--- this is just the shape of the window, but with ARGB32 windows, the
--- compositor does not know what regions of the window are transparent
--- or not.
--- 
--- This function only works for toplevel windows.
--- 
--- GTK+ will update this property automatically if
--- the `window` background is opaque, as we know where the opaque regions
--- are. If your window background is not opaque, please update this
--- property in your `GtkWidget`::style-updated handler.
---
--- ---
---
---@param self Gdk.Window # a top-level or non-native `GdkWindow`
---@param region? cairo.Region # a region, or `nil`
---@return nil
function Gdk.Window:set_opaque_region(region) end

--- # method Gdk.Window:set_override_redirect()
---
--- An override redirect window is not under the control of the window manager.
--- This means it won’t have a titlebar, won’t be minimizable, etc. - it will
--- be entirely under the control of the application. The window manager
--- can’t see the override redirect window at all.
--- 
--- Override redirect should only be used for short-lived temporary
--- windows, such as popup menus. `GtkMenu` uses an override redirect
--- window in its implementation, for example.
---
--- ---
---
---@param self Gdk.Window # a toplevel `GdkWindow`
---@param override_redirect (boolean|nil) # `true` if window should be override redirect
---@return nil
function Gdk.Window:set_override_redirect(override_redirect) end

--- # method Gdk.Window:set_pass_through()
---
--- Sets whether input to the window is passed through to the window
--- below.
--- 
--- The default value of this is `false`, which means that pointer
--- events that happen inside the window are send first to the window,
--- but if the event is not selected by the event mask then the event
--- is sent to the parent window, and so on up the hierarchy.
--- 
--- If `pass_through` is `true` then such pointer events happen as if the
--- window wasn't there at all, and thus will be sent first to any
--- windows below `window`. This is useful if the window is used in a
--- transparent fashion. In the terminology of the web this would be called
--- "pointer-events: none".
--- 
--- Note that a window with `pass_through` `true` can still have a subwindow
--- without pass through, so you can get events on a subset of a window. And in
--- that cases you would get the in-between related events such as the pointer
--- enter/leave events on its way to the destination window.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@param pass_through (boolean|nil) # a boolean
---@return nil
function Gdk.Window:set_pass_through(pass_through) end

--- # method Gdk.Window:set_role()
---
--- When using GTK+, typically you should use `gtk_window_set_role()` instead
--- of this low-level function.
--- 
--- The window manager and session manager use a window’s role to
--- distinguish it from other kinds of window in the same application.
--- When an application is restarted after being saved in a previous
--- session, all windows with the same title and role are treated as
--- interchangeable.  So if you have two windows with the same title
--- that should be distinguished for session management purposes, you
--- should set the role on those windows. It doesn’t matter what string
--- you use for the role, as long as you have a different role for each
--- non-interchangeable kind of window.
---
--- ---
---
---@param self Gdk.Window # a toplevel `GdkWindow`
---@param role string # a string indicating its role
---@return nil
function Gdk.Window:set_role(role) end

--- # method Gdk.Window:set_shadow_width()
---
--- Newer GTK+ windows using client-side decorations use extra geometry
--- around their frames for effects like shadows and invisible borders.
--- Window managers that want to maximize windows or snap to edges need
--- to know where the extents of the actual frame lie, so that users
--- don’t feel like windows are snapping against random invisible edges.
--- 
--- Note that this property is automatically updated by GTK+, so this
--- function should only be used by applications which do not use GTK+
--- to create toplevel windows.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@param left integer # The left extent
---@param right integer # The right extent
---@param top integer # The top extent
---@param bottom integer # The bottom extent
---@return nil
function Gdk.Window:set_shadow_width(left, right, top, bottom) end

--- # method Gdk.Window:set_skip_pager_hint()
---
--- Toggles whether a window should appear in a pager (workspace
--- switcher, or other desktop utility program that displays a small
--- thumbnail representation of the windows on the desktop). If a
--- window’s semantic type as specified with `gdk_window_set_type_hint()`
--- already fully describes the window, this function should
--- not be called in addition, instead you should
--- allow the window to be treated according to standard policy for
--- its semantic type.
---
--- ---
---
---@param self Gdk.Window # a toplevel `GdkWindow`
---@param skips_pager (boolean|nil) # `true` to skip the pager
---@return nil
function Gdk.Window:set_skip_pager_hint(skips_pager) end

--- # method Gdk.Window:set_skip_taskbar_hint()
---
--- Toggles whether a window should appear in a task list or window
--- list. If a window’s semantic type as specified with
--- `gdk_window_set_type_hint()` already fully describes the window, this
--- function should not be called in addition,
--- instead you should allow the window to be treated according to
--- standard policy for its semantic type.
---
--- ---
---
---@param self Gdk.Window # a toplevel `GdkWindow`
---@param skips_taskbar (boolean|nil) # `true` to skip the taskbar
---@return nil
function Gdk.Window:set_skip_taskbar_hint(skips_taskbar) end

--- # method Gdk.Window:set_source_events()
---
--- Sets the event mask for any floating device (i.e. not attached to any
--- visible pointer) that has the source defined as `source`. This event
--- mask will be applied both to currently existing, newly added devices
--- after this call, and devices being attached/detached.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@param source Gdk.InputSource # a `GdkInputSource` to define the source class.
---@param event_mask Gdk.EventMask # event mask for `window`
---@return nil
function Gdk.Window:set_source_events(source, event_mask) end

--- # method Gdk.Window:set_startup_id()
---
--- When using GTK+, typically you should use `gtk_window_set_startup_id()`
--- instead of this low-level function.
---
--- ---
---
---@param self Gdk.Window # a toplevel `GdkWindow`
---@param startup_id string # a string with startup-notification identifier
---@return nil
function Gdk.Window:set_startup_id(startup_id) end

--- # method Gdk.Window:set_static_gravities()
---
--- Used to set the bit gravity of the given window to static, and flag
--- it so all children get static subwindow gravity. This is used if you
--- are implementing scary features that involve deep knowledge of the
--- windowing system. Don’t worry about it.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@param use_static (boolean|nil) # `true` to turn on static gravity
---@return (boolean|nil) # `false`
function Gdk.Window:set_static_gravities(use_static) end

--- # method Gdk.Window:set_support_multidevice()
---
--- This function will enable multidevice features in `window`.
--- 
--- Multidevice aware windows will need to handle properly multiple,
--- per device enter/leave events, device grabs and grab ownerships.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`.
---@param support_multidevice (boolean|nil) # `true` to enable multidevice support in `window`.
---@return nil
function Gdk.Window:set_support_multidevice(support_multidevice) end

--- # method Gdk.Window:set_title()
---
--- Sets the title of a toplevel window, to be displayed in the titlebar.
--- If you haven’t explicitly set the icon name for the window
--- (using `gdk_window_set_icon_name()`), the icon name will be set to
--- `title` as well. `title` must be in UTF-8 encoding (as with all
--- user-readable strings in GDK/GTK+). `title` may not be `nil`.
---
--- ---
---
---@param self Gdk.Window # a toplevel `GdkWindow`
---@param title string # title of `window`
---@return nil
function Gdk.Window:set_title(title) end

--- # method Gdk.Window:set_transient_for()
---
--- Indicates to the window manager that `window` is a transient dialog
--- associated with the application window `parent`. This allows the
--- window manager to do things like center `window` on `parent` and
--- keep `window` above `parent`.
--- 
--- See `gtk_window_set_transient_for()` if you’re using `GtkWindow` or
--- `GtkDialog`.
---
--- ---
---
---@param self Gdk.Window # a toplevel `GdkWindow`
---@param parent Gdk.Window # another toplevel `GdkWindow`
---@return nil
function Gdk.Window:set_transient_for(parent) end

--- # method Gdk.Window:set_type_hint()
---
--- The application can use this call to provide a hint to the window
--- manager about the functionality of a window. The window manager
--- can use this information when determining the decoration and behaviour
--- of the window.
--- 
--- The hint must be set before the window is mapped.
---
--- ---
---
---@param self Gdk.Window # A toplevel `GdkWindow`
---@param hint Gdk.WindowTypeHint # A hint of the function this window will have
---@return nil
function Gdk.Window:set_type_hint(hint) end

--- # method Gdk.Window:set_urgency_hint()
---
--- Toggles whether a window needs the user's
--- urgent attention.
---
--- ---
---
---@param self Gdk.Window # a toplevel `GdkWindow`
---@param urgent (boolean|nil) # `true` if the window is urgent
---@return nil
function Gdk.Window:set_urgency_hint(urgent) end

--- # method Gdk.Window:set_user_data()
---
--- For most purposes this function is deprecated in favor of
--- `g_object_set_data()`. However, for historical reasons GTK+ stores
--- the `GtkWidget` that owns a `GdkWindow` as user data on the
--- `GdkWindow`. So, custom widget implementations should use
--- this function for that. If GTK+ receives an event for a `GdkWindow`,
--- and the user data for the window is non-`nil`, GTK+ will assume the
--- user data is a `GtkWidget`, and forward the event to that widget.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@param user_data? GObject.Object # user data
---@return nil
function Gdk.Window:set_user_data(user_data) end

--- # method Gdk.Window:shape_combine_region()
---
--- Makes pixels in `window` outside `shape_region` be transparent,
--- so that the window may be nonrectangular.
--- 
--- If `shape_region` is `nil`, the shape will be unset, so the whole
--- window will be opaque again. `offset_x` and `offset_y` are ignored
--- if `shape_region` is `nil`.
--- 
--- On the X11 platform, this uses an X server extension which is
--- widely available on most common platforms, but not available on
--- very old X servers, and occasionally the implementation will be
--- buggy. On servers without the shape extension, this function
--- will do nothing.
--- 
--- This function works on both toplevel and child windows.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@param shape_region? cairo.Region # region of window to be non-transparent
---@param offset_x integer # X position of `shape_region` in `window` coordinates
---@param offset_y integer # Y position of `shape_region` in `window` coordinates
---@return nil
function Gdk.Window:shape_combine_region(shape_region, offset_x, offset_y) end

--- # method Gdk.Window:show()
---
--- Like `gdk_window_show_unraised()`, but also raises the window to the
--- top of the window stack (moves the window to the front of the
--- Z-order).
--- 
--- This function maps a window so it’s visible onscreen. Its opposite
--- is `gdk_window_hide()`.
--- 
--- When implementing a `GtkWidget`, you should call this function on the widget's
--- `GdkWindow` as part of the “map” method.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@return nil
function Gdk.Window:show() end

--- # method Gdk.Window:show_unraised()
---
--- Shows a `GdkWindow` onscreen, but does not modify its stacking
--- order. In contrast, `gdk_window_show()` will raise the window
--- to the top of the window stack.
--- 
--- On the X11 platform, in Xlib terms, this function calls
--- XMapW`indow()` (it also updates some internal GDK state, which means
--- that you can’t really use XMapW`indow()` directly on a GDK window).
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@return nil
function Gdk.Window:show_unraised() end

--- # method Gdk.Window:show_window_menu()
---
--- Asks the windowing system to show the window menu. The window menu
--- is the menu shown when right-clicking the titlebar on traditional
--- windows managed by the window manager. This is useful for windows
--- using client-side decorations, activating it with a right-click
--- on the window decorations.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@param event Gdk.Event # a `GdkEvent` to show the menu for
---@return (boolean|nil) # `true` if the window menu was shown and `false` otherwise.
function Gdk.Window:show_window_menu(event) end

--- # method Gdk.Window:stick()
---
--- “Pins” a window such that it’s on all workspaces and does not scroll
--- with viewports, for window managers that have scrollable viewports.
--- (When using `GtkWindow`, `gtk_window_stick()` may be more useful.)
--- 
--- On the X11 platform, this function depends on window manager
--- support, so may have no effect with many window managers. However,
--- GDK will do the best it can to convince the window manager to stick
--- the window. For window managers that don’t support this operation,
--- there’s nothing you can do to force it to happen.
---
--- ---
---
---@param self Gdk.Window # a toplevel `GdkWindow`
---@return nil
function Gdk.Window:stick() end

--- # method Gdk.Window:thaw_toplevel_updates_libgtk_only()
---
--- Thaws a window frozen with
--- `gdk_window_freeze_toplevel_updates_libgtk_only()`.
--- 
--- This function is not part of the GDK public API and is only
--- for use by GTK+.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@return nil
function Gdk.Window:thaw_toplevel_updates_libgtk_only() end

--- # method Gdk.Window:thaw_updates()
---
--- Thaws a window frozen with `gdk_window_freeze_updates()`.
---
--- ---
---
---@param self Gdk.Window # a `GdkWindow`
---@return nil
function Gdk.Window:thaw_updates() end

--- # method Gdk.Window:unfullscreen()
---
--- Moves the window out of fullscreen mode. If the window was not
--- fullscreen, does nothing.
--- 
--- On X11, asks the window manager to move `window` out of the fullscreen
--- state, if the window manager supports this operation. Not all
--- window managers support this, and some deliberately ignore it or
--- don’t have a concept of “fullscreen”; so you can’t rely on the
--- unfullscreenification actually happening. But it will happen with
--- most standard window managers, and GDK makes a best effort to get
--- it to happen.
---
--- ---
---
---@param self Gdk.Window # a toplevel `GdkWindow`
---@return nil
function Gdk.Window:unfullscreen() end

--- # method Gdk.Window:unmaximize()
---
--- Unmaximizes the window. If the window wasn’t maximized, then this
--- function does nothing.
--- 
--- On X11, asks the window manager to unmaximize `window`, if the
--- window manager supports this operation. Not all window managers
--- support this, and some deliberately ignore it or don’t have a
--- concept of “maximized”; so you can’t rely on the unmaximization
--- actually happening. But it will happen with most standard window
--- managers, and GDK makes a best effort to get it to happen.
--- 
--- On Windows, reliably unmaximizes the window.
---
--- ---
---
---@param self Gdk.Window # a toplevel `GdkWindow`
---@return nil
function Gdk.Window:unmaximize() end

--- # method Gdk.Window:unstick()
---
--- Reverse operation for `gdk_window_stick()`; see `gdk_window_stick()`,
--- and `gtk_window_unstick()`.
---
--- ---
---
---@param self Gdk.Window # a toplevel `GdkWindow`
---@return nil
function Gdk.Window:unstick() end

--- # method Gdk.Window:withdraw()
---
--- Withdraws a window (unmaps it and asks the window manager to forget about it).
--- This function is not really useful as `gdk_window_hide()` automatically
--- withdraws toplevel windows before hiding them.
---
--- ---
---
---@param self Gdk.Window # a toplevel `GdkWindow`
---@return nil
function Gdk.Window:withdraw() end

--- # function Gdk.Window.at_pointer()
---
--- Obtains the window underneath the mouse pointer, returning the
--- location of that window in `win_x`, `win_y`. Returns `nil` if the
--- window under the mouse pointer is not known to GDK (if the window
--- belongs to another application and a `GdkWindow` hasn’t been created
--- for it with `gdk_window_foreign_new()`)
--- 
--- NOTE: For multihead-aware widgets or applications use
--- `gdk_display_get_window_at_pointer()` instead.
---
--- ---
---
---@param win_x? integer # return location for origin of the window under the pointer
---@param win_y? integer # return location for origin of the window under the pointer
---@return Gdk.Window # window under the mouse pointer
function Gdk.Window.at_pointer(win_x, win_y) end

--- # function Gdk.Window.constrain_size()
---
--- Constrains a desired width and height according to a
--- set of geometry hints (such as minimum and maximum size).
---
--- ---
---
---@param geometry Gdk.Geometry # a `GdkGeometry` structure
---@param flags Gdk.WindowHints # a mask indicating what portions of `geometry` are set
---@param width integer # desired width of window
---@param height integer # desired height of the window
---@param new_width integer # location to store resulting width
---@param new_height integer # location to store resulting height
---@return nil
function Gdk.Window.constrain_size(geometry, flags, width, height, new_width, new_height) end

--- # function Gdk.Window.process_all_updates()
---
--- Calls `gdk_window_process_updates()` for all windows (see `GdkWindow`)
--- in the application.
---
--- ---
---
---@return nil
function Gdk.Window.process_all_updates() end

--- # function Gdk.Window.set_debug_updates()
---
--- With update debugging enabled, calls to
--- `gdk_window_invalidate_region()` clear the invalidated region of the
--- screen to a noticeable color, and GDK pauses for a short time
--- before sending exposes to windows during
--- `gdk_window_process_updates()`.  The net effect is that you can see
--- the invalid region for each window and watch redraws as they
--- occur. This allows you to diagnose inefficiencies in your application.
--- 
--- In essence, because the GDK rendering model prevents all flicker,
--- if you are redrawing the same region 400 times you may never
--- notice, aside from noticing a speed problem. Enabling update
--- debugging causes GTK to flicker slowly and noticeably, so you can
--- see exactly what’s being redrawn when, in what order.
--- 
--- The --gtk-debug=updates command line option passed to GTK+ programs
--- enables this debug option at application startup time. That's
--- usually more useful than calling `gdk_window_set_debug_updates()`
--- yourself, though you might want to use this function to enable
--- updates sometime after application startup time.
---
--- ---
---
---@param setting (boolean|nil) # `true` to turn on update debugging
---@return nil
function Gdk.Window.set_debug_updates(setting) end

--- # function Gdk.Window.new()
---
--- Creates a new `GdkWindow` using the attributes from
--- `attributes`. See `GdkWindowAttr` and `GdkWindowAttributesType` for
--- more details.  Note: to use this on displays other than the default
--- display, `parent` must be specified.
---
--- ---
---
---@param parent? Gdk.Window # a `GdkWindow`, or `nil` to create the window as a child of the default root window for the default display.
---@param attributes Gdk.WindowAttr # attributes of the new window
---@param attributes_mask Gdk.WindowAttributesType # mask indicating which fields in `attributes` are valid
---@return Gdk.Window # the new `GdkWindow`
function Gdk.Window.new(parent, attributes, attributes_mask) end

--- # record Gdk.WindowAttr
---
--- Attributes to use for a newly-created window.
---
--- ---
---
---@class Gdk.WindowAttr
---@field title string # title of the window (for toplevel windows)
---@field event_mask integer # event mask (see `gdk_window_set_events()`)
---@field x integer # X coordinate relative to parent window (see `gdk_window_move()`)
---@field y integer # Y coordinate relative to parent window (see `gdk_window_move()`)
---@field width integer # width of window
---@field height integer # height of window
---@field wclass Gdk.WindowWindowClass # `GDK_INPUT_OUTPUT` (normal window) or `GDK_INPUT_ONLY` (invisible window that receives events)
---@field visual Gdk.Visual # `GdkVisual` for window
---@field window_type Gdk.WindowType # type of window
---@field cursor Gdk.Cursor # cursor for the window (see `gdk_window_set_cursor()`)
---@field wmclass_name string # don’t use (see `gtk_window_set_wmclass()`)
---@field wmclass_class string # don’t use (see `gtk_window_set_wmclass()`)
---@field override_redirect (boolean|nil) # `true` to bypass the window manager
---@field type_hint Gdk.WindowTypeHint # a hint of the function of the window
Gdk.WindowAttr = {}

---@enum Gdk.WindowAttributesType
Gdk.WindowAttributesType = {}

---@alias Gdk.WindowChildFunc fun(window: Gdk.Window, user_data: userdata): (boolean|nil)

--- # record Gdk.WindowClass
---
---@class Gdk.WindowClass
---@field parent_class GObject.ObjectClass
---@field to_embedder fun(window: Gdk.Window, offscreen_x: number, offscreen_y: number, embedder_x: number, embedder_y: number): nil
---@field from_embedder fun(window: Gdk.Window, embedder_x: number, embedder_y: number, offscreen_x: number, offscreen_y: number): nil
---@field create_surface fun(window: Gdk.Window, width: integer, height: integer): cairo.Surface
Gdk.WindowClass = {}

---@enum Gdk.WindowEdge
Gdk.WindowEdge = {}

---@enum Gdk.WindowHints
Gdk.WindowHints = {}

---@alias Gdk.WindowInvalidateHandlerFunc fun(window: Gdk.Window, region: cairo.Region): nil

--- # record Gdk.WindowRedirect
---
---@class Gdk.WindowRedirect
Gdk.WindowRedirect = {}

---@enum Gdk.WindowState
Gdk.WindowState = {}

---@enum Gdk.WindowType
Gdk.WindowType = {}

---@enum Gdk.WindowTypeHint
Gdk.WindowTypeHint = {}

---@enum Gdk.WindowWindowClass
Gdk.WindowWindowClass = {}

--- # function Gdk.add_option_entries_libgtk_only()
---
--- Appends gdk option entries to the passed in option group. This is
--- not public API and must not be used by applications.
---
--- ---
---
---@param group GLib.OptionGroup # An option group.
---@return nil
function Gdk.add_option_entries_libgtk_only(group) end

--- # function Gdk.atom_intern()
---
--- Finds or creates an atom corresponding to a given string.
---
--- ---
---
---@param atom_name string # a string.
---@param only_if_exists (boolean|nil) # if `true`, GDK is allowed to not create a new atom, but just return %GDK_NONE if the requested atom doesn’t already exists. Currently, the flag is ignored, since checking the existance of an atom is as expensive as creating it.
---@return Gdk.Atom # the atom corresponding to `atom_name`.
function Gdk.atom_intern(atom_name, only_if_exists) end

--- # function Gdk.atom_intern_static_string()
---
--- Finds or creates an atom corresponding to a given string.
--- 
--- Note that this function is identical to `gdk_atom_intern()` except
--- that if a new `GdkAtom` is created the string itself is used rather
--- than a copy. This saves memory, but can only be used if the string
--- will always exist. It can be used with statically
--- allocated strings in the main program, but not with statically
--- allocated memory in dynamically loaded modules, if you expect to
--- ever unload the module again (e.g. do not use this function in
--- GTK+ theme engines).
---
--- ---
---
---@param atom_name string # a static string
---@return Gdk.Atom # the atom corresponding to `atom_name`
function Gdk.atom_intern_static_string(atom_name) end

--- # function Gdk.beep()
---
--- Emits a short beep on the default display.
---
--- ---
---
---@return nil
function Gdk.beep() end

--- # function Gdk.cairo_create()
---
--- Creates a Cairo context for drawing to `window`.
--- 
--- Note that calling `cairo_reset_clip()` on the resulting `cairo_t` will
--- produce undefined results, so avoid it at all costs.
--- 
--- Typically, this function is used to draw on a `GdkWindow` out of the paint
--- cycle of the toolkit; this should be avoided, as it breaks various assumptions
--- and optimizations.
--- 
--- If you are drawing on a native `GdkWindow` in response to a %GDK_EXPOSE event
--- you should use `gdk_window_begin_draw_frame()` and `gdk_drawing_context_get_cairo_context()`
--- instead. GTK will automatically do this for you when drawing a widget.
---
--- ---
---
---@param window Gdk.Window # a `GdkWindow`
---@return cairo.Context # A newly created Cairo context. Free with `cairo_destroy()` when you are done drawing.
function Gdk.cairo_create(window) end

--- # function Gdk.cairo_draw_from_gl()
---
--- This is the main way to draw GL content in GTK+. It takes a render buffer ID
--- (`source_type` == `GL_RENDERBUFFER`) or a texture id (`source_type` == `GL_TEXTURE`)
--- and draws it onto `cr` with an OVER operation, respecting the current clip.
--- The top left corner of the rectangle specified by `x`, `y`, `width` and `height`
--- will be drawn at the current (0,0) position of the cairo_t.
--- 
--- This will work for *all* cairo_t, as long as `window` is realized, but the
--- fallback implementation that reads back the pixels from the buffer may be
--- used in the general case. In the case of direct drawing to a window with
--- no special effects applied to `cr` it will however use a more efficient
--- approach.
--- 
--- For `GL_RENDERBUFFER` the code will always fall back to software for buffers
--- with alpha components, so make sure you use `GL_TEXTURE` if using alpha.
--- 
--- Calling this may change the current GL context.
---
--- ---
---
---@param cr cairo.Context # a cairo context
---@param window Gdk.Window # The window we're rendering for (not necessarily into)
---@param source integer # The GL ID of the source buffer
---@param source_type integer # The type of the `source`
---@param buffer_scale integer # The scale-factor that the `source` buffer is allocated for
---@param x integer # The source x position in `source` to start copying from in GL coordinates
---@param y integer # The source y position in `source` to start copying from in GL coordinates
---@param width integer # The width of the region to draw
---@param height integer # The height of the region to draw
---@return nil
function Gdk.cairo_draw_from_gl(cr, window, source, source_type, buffer_scale, x, y, width, height) end

--- # function Gdk.cairo_get_clip_rectangle()
---
--- This is a convenience function around `cairo_clip_extents()`.
--- It rounds the clip extents to integer coordinates and returns
--- a boolean indicating if a clip area exists.
---
--- ---
---
---@param cr cairo.Context # a cairo context
---@param rect? Gdk.Rectangle # return location for the clip, or `nil`
---@return (boolean|nil) # `true` if a clip rectangle exists, `false` if all of `cr` is clipped and all drawing can be skipped
function Gdk.cairo_get_clip_rectangle(cr, rect) end

--- # function Gdk.cairo_get_drawing_context()
---
--- Retrieves the `GdkDrawingContext` that created the Cairo
--- context `cr`.
---
--- ---
---
---@param cr cairo.Context # a Cairo context
---@return Gdk.DrawingContext # a `GdkDrawingContext`, if any is set
function Gdk.cairo_get_drawing_context(cr) end

--- # function Gdk.cairo_rectangle()
---
--- Adds the given rectangle to the current path of `cr`.
---
--- ---
---
---@param cr cairo.Context # a cairo context
---@param rectangle Gdk.Rectangle # a `GdkRectangle`
---@return nil
function Gdk.cairo_rectangle(cr, rectangle) end

--- # function Gdk.cairo_region()
---
--- Adds the given region to the current path of `cr`.
---
--- ---
---
---@param cr cairo.Context # a cairo context
---@param region cairo.Region # a `cairo_region_t`
---@return nil
function Gdk.cairo_region(cr, region) end

--- # function Gdk.cairo_region_create_from_surface()
---
--- Creates region that describes covers the area where the given
--- `surface` is more than 50% opaque.
--- 
--- This function takes into account device offsets that might be
--- set with `cairo_surface_set_device_offset()`.
---
--- ---
---
---@param surface cairo.Surface # a cairo surface
---@return cairo.Region # A `cairo_region_t`; must be freed with `cairo_region_destroy()`
function Gdk.cairo_region_create_from_surface(surface) end

--- # function Gdk.cairo_set_source_color()
---
--- Sets the specified `GdkColor` as the source color of `cr`.
---
--- ---
---
---@param cr cairo.Context # a cairo context
---@param color Gdk.Color # a `GdkColor`
---@return nil
function Gdk.cairo_set_source_color(cr, color) end

--- # function Gdk.cairo_set_source_pixbuf()
---
--- Sets the given pixbuf as the source pattern for `cr`.
--- 
--- The pattern has an extend mode of %CAIRO_EXTEND_NONE and is aligned
--- so that the origin of `pixbuf` is `pixbuf_x`, `pixbuf_y`.
---
--- ---
---
---@param cr cairo.Context # a cairo context
---@param pixbuf GdkPixbuf.Pixbuf # a `GdkPixbuf`
---@param pixbuf_x number # X coordinate of location to place upper left corner of `pixbuf`
---@param pixbuf_y number # Y coordinate of location to place upper left corner of `pixbuf`
---@return nil
function Gdk.cairo_set_source_pixbuf(cr, pixbuf, pixbuf_x, pixbuf_y) end

--- # function Gdk.cairo_set_source_rgba()
---
--- Sets the specified `GdkRGBA` as the source color of `cr`.
---
--- ---
---
---@param cr cairo.Context # a cairo context
---@param rgba Gdk.RGBA # a `GdkRGBA`
---@return nil
function Gdk.cairo_set_source_rgba(cr, rgba) end

--- # function Gdk.cairo_set_source_window()
---
--- Sets the given window as the source pattern for `cr`.
--- 
--- The pattern has an extend mode of %CAIRO_EXTEND_NONE and is aligned
--- so that the origin of `window` is `x`, `y`. The window contains all its
--- subwindows when rendering.
--- 
--- Note that the contents of `window` are undefined outside of the
--- visible part of `window`, so use this function with care.
---
--- ---
---
---@param cr cairo.Context # a cairo context
---@param window Gdk.Window # a `GdkWindow`
---@param x number # X coordinate of location to place upper left corner of `window`
---@param y number # Y coordinate of location to place upper left corner of `window`
---@return nil
function Gdk.cairo_set_source_window(cr, window, x, y) end

--- # function Gdk.cairo_surface_create_from_pixbuf()
---
--- Creates an image surface with the same contents as
--- the pixbuf.
---
--- ---
---
---@param pixbuf GdkPixbuf.Pixbuf # a `GdkPixbuf`
---@param scale integer # the scale of the new surface, or 0 to use same as `window`
---@param for_window? Gdk.Window # The window this will be drawn to, or `nil`
---@return cairo.Surface # a new cairo surface, must be freed with `cairo_surface_destroy()`
function Gdk.cairo_surface_create_from_pixbuf(pixbuf, scale, for_window) end

--- # function Gdk.color_parse()
---
--- Parses a textual specification of a color and fill in the
--- `red`, `green`, and `blue` fields of a `GdkColor`.
--- 
--- The string can either one of a large set of standard names
--- (taken from the X11 `rgb.txt` file), or it can be a hexadecimal
--- value in the form “\`rgb`” “\`rrggbb`”, “\`rrrgggbbb`” or
--- “\`rrrrggggbbbb`” where “r”, “g” and “b” are hex digits of
--- the red, green, and blue components of the color, respectively.
--- (White in the four forms is “\`fff`”, “\`ffffff`”, “\`fffffffff`”
--- and “\`ffffffffffff`”).
---
--- ---
---
---@param spec string # the string specifying the color
---@param color Gdk.Color # the `GdkColor` to fill in
---@return (boolean|nil) # `true` if the parsing succeeded
function Gdk.color_parse(spec, color) end

--- # function Gdk.disable_multidevice()
---
--- Disables multidevice support in GDK. This call must happen prior
--- to `gdk_display_open()`, `gtk_init()`, `gtk_init_with_args()` or
--- `gtk_init_check()` in order to take effect.
--- 
--- Most common GTK+ applications won’t ever need to call this. Only
--- applications that do mixed GDK/Xlib calls could want to disable
--- multidevice support if such Xlib code deals with input devices in
--- any way and doesn’t observe the presence of XInput 2.
---
--- ---
---
---@return nil
function Gdk.disable_multidevice() end

--- # function Gdk.drag_abort()
---
--- Aborts a drag without dropping.
--- 
--- This function is called by the drag source.
--- 
--- This function does not need to be called in managed drag and drop
--- operations. See `gdk_drag_context_manage_dnd()` for more information.
---
--- ---
---
---@param context Gdk.DragContext # a `GdkDragContext`
---@param time_ integer # the timestamp for this operation
---@return nil
function Gdk.drag_abort(context, time_) end

--- # function Gdk.drag_begin()
---
--- Starts a drag and creates a new drag context for it.
--- This function assumes that the drag is controlled by the
--- client pointer device, use `gdk_drag_begin_for_device()` to
--- begin a drag with a different device.
--- 
--- This function is called by the drag source.
---
--- ---
---
---@param window Gdk.Window # the source window for this drag.
---@param targets Gdk.Atom[] # the offered targets, as list of `GdkAtoms`
---@return Gdk.DragContext # a newly created `GdkDragContext`
function Gdk.drag_begin(window, targets) end

--- # function Gdk.drag_begin_for_device()
---
--- Starts a drag and creates a new drag context for it.
--- 
--- This function is called by the drag source.
---
--- ---
---
---@param window Gdk.Window # the source window for this drag
---@param device Gdk.Device # the device that controls this drag
---@param targets Gdk.Atom[] # the offered targets, as list of `GdkAtoms`
---@return Gdk.DragContext # a newly created `GdkDragContext`
function Gdk.drag_begin_for_device(window, device, targets) end

--- # function Gdk.drag_begin_from_point()
---
--- Starts a drag and creates a new drag context for it.
--- 
--- This function is called by the drag source.
---
--- ---
---
---@param window Gdk.Window # the source window for this drag
---@param device Gdk.Device # the device that controls this drag
---@param targets Gdk.Atom[] # the offered targets, as list of `GdkAtoms`
---@param x_root integer # the x coordinate where the drag nominally started
---@param y_root integer # the y coordinate where the drag nominally started
---@return Gdk.DragContext # a newly created `GdkDragContext`
function Gdk.drag_begin_from_point(window, device, targets, x_root, y_root) end

--- # function Gdk.drag_drop()
---
--- Drops on the current destination.
--- 
--- This function is called by the drag source.
--- 
--- This function does not need to be called in managed drag and drop
--- operations. See `gdk_drag_context_manage_dnd()` for more information.
---
--- ---
---
---@param context Gdk.DragContext # a `GdkDragContext`
---@param time_ integer # the timestamp for this operation
---@return nil
function Gdk.drag_drop(context, time_) end

--- # function Gdk.drag_drop_done()
---
--- Inform GDK if the drop ended successfully. Passing `false`
--- for `success` may trigger a drag cancellation animation.
--- 
--- This function is called by the drag source, and should
--- be the last call before dropping the reference to the
--- `context`.
--- 
--- The `GdkDragContext` will only take the first `gdk_drag_drop_done()`
--- call as effective, if this function is called multiple times,
--- all subsequent calls will be ignored.
---
--- ---
---
---@param context Gdk.DragContext # a `GdkDragContext`
---@param success (boolean|nil) # whether the drag was ultimatively successful
---@return nil
function Gdk.drag_drop_done(context, success) end

--- # function Gdk.drag_drop_succeeded()
---
--- Returns whether the dropped data has been successfully
--- transferred. This function is intended to be used while
--- handling a %GDK_DROP_FINISHED event, its return value is
--- meaningless at other times.
---
--- ---
---
---@param context Gdk.DragContext # a `GdkDragContext`
---@return (boolean|nil) # `true` if the drop was successful.
function Gdk.drag_drop_succeeded(context) end

--- # function Gdk.drag_find_window_for_screen()
---
--- Finds the destination window and DND protocol to use at the
--- given pointer position.
--- 
--- This function is called by the drag source to obtain the
--- `dest_window` and `protocol` parameters for `gdk_drag_motion()`.
---
--- ---
---
---@param context Gdk.DragContext # a `GdkDragContext`
---@param drag_window Gdk.Window # a window which may be at the pointer position, but should be ignored, since it is put up by the drag source as an icon
---@param screen Gdk.Screen # the screen where the destination window is sought
---@param x_root integer # the x position of the pointer in root coordinates
---@param y_root integer # the y position of the pointer in root coordinates
---@param dest_window Gdk.Window # location to store the destination window in
---@param protocol Gdk.DragProtocol # location to store the DND protocol in
---@return nil
function Gdk.drag_find_window_for_screen(context, drag_window, screen, x_root, y_root, dest_window, protocol) end

--- # function Gdk.drag_get_selection()
---
--- Returns the selection atom for the current source window.
---
--- ---
---
---@param context Gdk.DragContext # a `GdkDragContext`.
---@return Gdk.Atom # the selection atom, or %GDK_NONE
function Gdk.drag_get_selection(context) end

--- # function Gdk.drag_motion()
---
--- Updates the drag context when the pointer moves or the
--- set of actions changes.
--- 
--- This function is called by the drag source.
--- 
--- This function does not need to be called in managed drag and drop
--- operations. See `gdk_drag_context_manage_dnd()` for more information.
---
--- ---
---
---@param context Gdk.DragContext # a `GdkDragContext`
---@param dest_window Gdk.Window # the new destination window, obtained by `gdk_drag_find_window()`
---@param protocol Gdk.DragProtocol # the DND protocol in use, obtained by `gdk_drag_find_window()`
---@param x_root integer # the x position of the pointer in root coordinates
---@param y_root integer # the y position of the pointer in root coordinates
---@param suggested_action Gdk.DragAction # the suggested action
---@param possible_actions Gdk.DragAction # the possible actions
---@param time_ integer # the timestamp for this operation
---@return (boolean|nil)
function Gdk.drag_motion(context, dest_window, protocol, x_root, y_root, suggested_action, possible_actions, time_) end

--- # function Gdk.drag_status()
---
--- Selects one of the actions offered by the drag source.
--- 
--- This function is called by the drag destination in response to
--- `gdk_drag_motion()` called by the drag source.
---
--- ---
---
---@param context Gdk.DragContext # a `GdkDragContext`
---@param action Gdk.DragAction # the selected action which will be taken when a drop happens, or 0 to indicate that a drop will not be accepted
---@param time_ integer # the timestamp for this operation
---@return nil
function Gdk.drag_status(context, action, time_) end

--- # function Gdk.drop_finish()
---
--- Ends the drag operation after a drop.
--- 
--- This function is called by the drag destination.
---
--- ---
---
---@param context Gdk.DragContext # a `GdkDragContext`
---@param success (boolean|nil) # `true` if the data was successfully received
---@param time_ integer # the timestamp for this operation
---@return nil
function Gdk.drop_finish(context, success, time_) end

--- # function Gdk.drop_reply()
---
--- Accepts or rejects a drop.
--- 
--- This function is called by the drag destination in response
--- to a drop initiated by the drag source.
---
--- ---
---
---@param context Gdk.DragContext # a `GdkDragContext`
---@param accepted (boolean|nil) # `true` if the drop is accepted
---@param time_ integer # the timestamp for this operation
---@return nil
function Gdk.drop_reply(context, accepted, time_) end

--- # function Gdk.error_trap_pop()
---
--- Removes an error trap pushed with `gdk_error_trap_push()`.
--- May block until an error has been definitively received
--- or not received from the X server. `gdk_error_trap_pop_ignored()`
--- is preferred if you don’t need to know whether an error
--- occurred, because it never has to block. If you don't
--- need the return value of `gdk_error_trap_pop()`, use
--- `gdk_error_trap_pop_ignored()`.
--- 
--- Prior to GDK 3.0, this function would not automatically
--- sync for you, so you had to `gdk_flush()` if your last
--- call to Xlib was not a blocking round trip.
---
--- ---
---
---@return integer # X error code or 0 on success
function Gdk.error_trap_pop() end

--- # function Gdk.error_trap_pop_ignored()
---
--- Removes an error trap pushed with `gdk_error_trap_push()`, but
--- without bothering to wait and see whether an error occurred.  If an
--- error arrives later asynchronously that was triggered while the
--- trap was pushed, that error will be ignored.
---
--- ---
---
---@return nil
function Gdk.error_trap_pop_ignored() end

--- # function Gdk.error_trap_push()
---
--- This function allows X errors to be trapped instead of the normal
--- behavior of exiting the application. It should only be used if it
--- is not possible to avoid the X error in any other way. Errors are
--- ignored on all `GdkDisplay` currently known to the
--- `GdkDisplayManager`. If you don’t care which error happens and just
--- want to ignore everything, pop with `gdk_error_trap_pop_ignored()`.
--- If you need the error code, use `gdk_error_trap_pop()` which may have
--- to block and wait for the error to arrive from the X server.
--- 
--- This API exists on all platforms but only does anything on X.
--- 
--- You can use gdk_x11`_display_error_trap_push()` to ignore errors
--- on only a single display.
--- 
--- ## Trapping an X error
--- 
--- ```c
--- gdk_error_trap_push ();
--- 
---  // ... Call the X function which may cause an error here ...
--- 
--- 
--- if (gdk_error_trap_pop ())
---  {
---    // ... Handle the error here ...
---  }
--- ```
---
--- ---
---
---@return nil
function Gdk.error_trap_push() end

--- # function Gdk.event_get()
---
--- Checks all open displays for a `GdkEvent` to process,to be processed
--- on, fetching events from the windowing system if necessary.
--- See `gdk_display_get_event()`.
---
--- ---
---
---@return Gdk.Event # the next `GdkEvent` to be processed, or `nil` if no events are pending. The returned `GdkEvent` should be freed with `gdk_event_free()`.
function Gdk.event_get() end

--- # function Gdk.event_handler_set()
---
--- Sets the function to call to handle all events from GDK.
--- 
--- Note that GTK+ uses this to install its own event handler, so it is
--- usually not useful for GTK+ applications. (Although an application
--- can call this function then call `gtk_main_do_event()` to pass
--- events to GTK+.)
---
--- ---
---
---@param func Gdk.EventFunc # the function to call to handle events from GDK.
---@param data? userdata # user data to pass to the function.
---@param notify GLib.DestroyNotify # the function to call when the handler function is removed, i.e. when `gdk_event_handler_set()` is called with another event handler.
---@return nil
function Gdk.event_handler_set(func, data, notify) end

--- # function Gdk.event_peek()
---
--- If there is an event waiting in the event queue of some open
--- display, returns a copy of it. See `gdk_display_peek_event()`.
---
--- ---
---
---@return Gdk.Event # a copy of the first `GdkEvent` on some event queue, or `nil` if no events are in any queues. The returned `GdkEvent` should be freed with `gdk_event_free()`.
function Gdk.event_peek() end

--- # function Gdk.event_request_motions()
---
--- Request more motion notifies if `event` is a motion notify hint event.
--- 
--- This function should be used instead of `gdk_window_get_pointer()` to
--- request further motion notifies, because it also works for extension
--- events where motion notifies are provided for devices other than the
--- core pointer. Coordinate extraction, processing and requesting more
--- motion events from a %GDK_MOTION_NOTIFY event usually works like this:
--- 
--- ```c
--- {
---   // motion_event handler
---   x = motion_event->x;
---   y = motion_event->y;
---   // handle (x,y) motion
---   gdk_event_request_motions (motion_event); // handles is_hint events
--- }
--- ```
---
--- ---
---
---@param event Gdk.EventMotion # a valid `GdkEvent`
---@return nil
function Gdk.event_request_motions(event) end

--- # function Gdk.events_get_angle()
---
--- If both events contain X/Y information, this function will return `true`
--- and return in `angle` the relative angle from `event1` to `event2`. The rotation
--- direction for positive angles is from the positive X axis towards the positive
--- Y axis.
---
--- ---
---
---@param event1 Gdk.Event # first `GdkEvent`
---@param event2 Gdk.Event # second `GdkEvent`
---@param angle number # return location for the relative angle between both events
---@return (boolean|nil) # `true` if the angle could be calculated.
function Gdk.events_get_angle(event1, event2, angle) end

--- # function Gdk.events_get_center()
---
--- If both events contain X/Y information, the center of both coordinates
--- will be returned in `x` and `y`.
---
--- ---
---
---@param event1 Gdk.Event # first `GdkEvent`
---@param event2 Gdk.Event # second `GdkEvent`
---@param x number # return location for the X coordinate of the center
---@param y number # return location for the Y coordinate of the center
---@return (boolean|nil) # `true` if the center could be calculated.
function Gdk.events_get_center(event1, event2, x, y) end

--- # function Gdk.events_get_distance()
---
--- If both events have X/Y information, the distance between both coordinates
--- (as in a straight line going from `event1` to `event2`) will be returned.
---
--- ---
---
---@param event1 Gdk.Event # first `GdkEvent`
---@param event2 Gdk.Event # second `GdkEvent`
---@param distance number # return location for the distance
---@return (boolean|nil) # `true` if the distance could be calculated.
function Gdk.events_get_distance(event1, event2, distance) end

--- # function Gdk.events_pending()
---
--- Checks if any events are ready to be processed for any display.
---
--- ---
---
---@return (boolean|nil) # `true` if any events are pending.
function Gdk.events_pending() end

--- # function Gdk.flush()
---
--- Flushes the output buffers of all display connections and waits
--- until all requests have been processed.
--- This is rarely needed by applications.
---
--- ---
---
---@return nil
function Gdk.flush() end

--- # function Gdk.get_default_root_window()
---
--- Obtains the root window (parent all other windows are inside)
--- for the default display and screen.
---
--- ---
---
---@return Gdk.Window # the default root window
function Gdk.get_default_root_window() end

--- # function Gdk.get_display()
---
--- Gets the name of the display, which usually comes from the
--- `DISPLAY` environment variable or the
--- `--display` command line option.
---
--- ---
---
---@return string # the name of the display.
function Gdk.get_display() end

--- # function Gdk.get_display_arg_name()
---
--- Gets the display name specified in the command line arguments passed
--- to `gdk_init()` or `gdk_parse_args()`, if any.
---
--- ---
---
---@return string # the display name, if specified explicitly, otherwise `nil` this string is owned by GTK+ and must not be modified or freed.
function Gdk.get_display_arg_name() end

--- # function Gdk.get_program_class()
---
--- Gets the program class. Unless the program class has explicitly
--- been set with `gdk_set_program_class()` or with the `--class`
--- commandline option, the default value is the program name (determined
--- with `g_get_prgname()`) with the first character converted to uppercase.
---
--- ---
---
---@return string # the program class.
function Gdk.get_program_class() end

--- # function Gdk.get_show_events()
---
--- Gets whether event debugging output is enabled.
---
--- ---
---
---@return (boolean|nil) # `true` if event debugging output is enabled.
function Gdk.get_show_events() end

--- # function Gdk.gl_error_quark()
---
---@return GLib.Quark
function Gdk.gl_error_quark() end

--- # function Gdk.init()
---
--- Initializes the GDK library and connects to the windowing system.
--- If initialization fails, a warning message is output and the application
--- terminates with a call to `exit(1)`.
--- 
--- Any arguments used by GDK are removed from the array and `argc` and `argv`
--- are updated accordingly.
--- 
--- GTK+ initializes GDK in `gtk_init()` and so this function is not usually
--- needed by GTK+ applications.
---
--- ---
---
---@param argc integer # the number of command line arguments.
---@param argv unknown[] # the array of command line arguments.
---@return nil
function Gdk.init(argc, argv) end

--- # function Gdk.init_check()
---
--- Initializes the GDK library and connects to the windowing system,
--- returning `true` on success.
--- 
--- Any arguments used by GDK are removed from the array and `argc` and `argv`
--- are updated accordingly.
--- 
--- GTK+ initializes GDK in `gtk_init()` and so this function is not usually
--- needed by GTK+ applications.
---
--- ---
---
---@param argc integer # the number of command line arguments.
---@param argv unknown[] # the array of command line arguments.
---@return (boolean|nil) # `true` if initialization succeeded.
function Gdk.init_check(argc, argv) end

--- # function Gdk.keyboard_grab()
---
--- Grabs the keyboard so that all events are passed to this
--- application until the keyboard is ungrabbed with `gdk_keyboard_ungrab()`.
--- This overrides any previous keyboard grab by this client.
--- 
--- If you set up anything at the time you take the grab that needs to be cleaned
--- up when the grab ends, you should handle the `GdkEventGrabBroken` events that
--- are emitted when the grab ends unvoluntarily.
---
--- ---
---
---@param window Gdk.Window # the `GdkWindow` which will own the grab (the grab window).
---@param owner_events (boolean|nil) # if `false` then all keyboard events are reported with respect to `window`. If `true` then keyboard events for this application are reported as normal, but keyboard events outside this application are reported with respect to `window`. Both key press and key release events are always reported, independant of the event mask set by the application.
---@param time_ integer # a timestamp from a `GdkEvent`, or %GDK_CURRENT_TIME if no timestamp is available.
---@return Gdk.GrabStatus # %GDK_GRAB_SUCCESS if the grab was successful.
function Gdk.keyboard_grab(window, owner_events, time_) end

--- # function Gdk.keyboard_ungrab()
---
--- Ungrabs the keyboard on the default display, if it is grabbed by this
--- application.
---
--- ---
---
---@param time_ integer # a timestamp from a `GdkEvent`, or %GDK_CURRENT_TIME if no timestamp is available.
---@return nil
function Gdk.keyboard_ungrab(time_) end

--- # function Gdk.keyval_convert_case()
---
--- Obtains the upper- and lower-case versions of the keyval `symbol`.
--- Examples of keyvals are `GDK_KEY_a`, `GDK_KEY_Enter`, `GDK_KEY_F1`, etc.
---
--- ---
---
---@param symbol integer # a keyval
---@param lower integer # return location for lowercase version of `symbol`
---@param upper integer # return location for uppercase version of `symbol`
---@return nil
function Gdk.keyval_convert_case(symbol, lower, upper) end

--- # function Gdk.keyval_from_name()
---
--- Converts a key name to a key value.
--- 
--- The names are the same as those in the
--- `gdk/gdkkeysyms.h` header file
--- but without the leading “GDK_KEY_”.
---
--- ---
---
---@param keyval_name string # a key name
---@return integer # the corresponding key value, or %GDK_KEY_VoidSymbol if the key name is not a valid key
function Gdk.keyval_from_name(keyval_name) end

--- # function Gdk.keyval_is_lower()
---
--- Returns `true` if the given key value is in lower case.
---
--- ---
---
---@param keyval integer # a key value.
---@return (boolean|nil) # `true` if `keyval` is in lower case, or if `keyval` is not subject to case conversion.
function Gdk.keyval_is_lower(keyval) end

--- # function Gdk.keyval_is_upper()
---
--- Returns `true` if the given key value is in upper case.
---
--- ---
---
---@param keyval integer # a key value.
---@return (boolean|nil) # `true` if `keyval` is in upper case, or if `keyval` is not subject to case conversion.
function Gdk.keyval_is_upper(keyval) end

--- # function Gdk.keyval_name()
---
--- Converts a key value into a symbolic name.
--- 
--- The names are the same as those in the
--- `gdk/gdkkeysyms.h` header file
--- but without the leading “GDK_KEY_”.
---
--- ---
---
---@param keyval integer # a key value
---@return string # a string containing the name of the key, or `nil` if `keyval` is not a valid key. The string should not be modified.
function Gdk.keyval_name(keyval) end

--- # function Gdk.keyval_to_lower()
---
--- Converts a key value to lower case, if applicable.
---
--- ---
---
---@param keyval integer # a key value.
---@return integer # the lower case form of `keyval`, or `keyval` itself if it is already in lower case or it is not subject to case conversion.
function Gdk.keyval_to_lower(keyval) end

--- # function Gdk.keyval_to_unicode()
---
--- Convert from a GDK key symbol to the corresponding ISO10646 (Unicode)
--- character.
---
--- ---
---
---@param keyval integer # a GDK key symbol
---@return integer # the corresponding unicode character, or 0 if there is no corresponding character.
function Gdk.keyval_to_unicode(keyval) end

--- # function Gdk.keyval_to_upper()
---
--- Converts a key value to upper case, if applicable.
---
--- ---
---
---@param keyval integer # a key value.
---@return integer # the upper case form of `keyval`, or `keyval` itself if it is already in upper case or it is not subject to case conversion.
function Gdk.keyval_to_upper(keyval) end

--- # function Gdk.list_visuals()
---
--- Lists the available visuals for the default screen.
--- (See `gdk_screen_list_visuals()`)
--- A visual describes a hardware image data format.
--- For example, a visual might support 24-bit color, or 8-bit color,
--- and might expect pixels to be in a certain format.
--- 
--- Call `g_list_free()` on the return value when you’re finished with it.
---
--- ---
---
---@return Gdk.Visual[] # a list of visuals; the list must be freed, but not its contents
function Gdk.list_visuals() end

--- # function Gdk.notify_startup_complete()
---
--- Indicates to the GUI environment that the application has finished
--- loading. If the applications opens windows, this function is
--- normally called after opening the application’s initial set of
--- windows.
--- 
--- GTK+ will call this function automatically after opening the first
--- `GtkWindow` unless `gtk_window_set_auto_startup_notification()` is called
--- to disable that feature.
---
--- ---
---
---@return nil
function Gdk.notify_startup_complete() end

--- # function Gdk.notify_startup_complete_with_id()
---
--- Indicates to the GUI environment that the application has
--- finished loading, using a given identifier.
--- 
--- GTK+ will call this function automatically for `GtkWindow`
--- with custom startup-notification identifier unless
--- `gtk_window_set_auto_startup_notification()` is called to
--- disable that feature.
---
--- ---
---
---@param startup_id string # a startup-notification identifier, for which notification process should be completed
---@return nil
function Gdk.notify_startup_complete_with_id(startup_id) end

--- # function Gdk.offscreen_window_get_embedder()
---
--- Gets the window that `window` is embedded in.
---
--- ---
---
---@param window Gdk.Window # a `GdkWindow`
---@return Gdk.Window # the embedding `GdkWindow`, or `nil` if `window` is not an mbedded offscreen window
function Gdk.offscreen_window_get_embedder(window) end

--- # function Gdk.offscreen_window_get_surface()
---
--- Gets the offscreen surface that an offscreen window renders into.
--- If you need to keep this around over window resizes, you need to
--- add a reference to it.
---
--- ---
---
---@param window Gdk.Window # a `GdkWindow`
---@return cairo.Surface # The offscreen surface, or `nil` if not offscreen
function Gdk.offscreen_window_get_surface(window) end

--- # function Gdk.offscreen_window_set_embedder()
---
--- Sets `window` to be embedded in `embedder`.
--- 
--- To fully embed an offscreen window, in addition to calling this
--- function, it is also necessary to handle the `GdkWindow`::pick-embedded-child
--- signal on the `embedder` and the `GdkWindow`::to-embedder and
--- `GdkWindow`::from-embedder signals on `window`.
---
--- ---
---
---@param window Gdk.Window # a `GdkWindow`
---@param embedder Gdk.Window # the `GdkWindow` that `window` gets embedded in
---@return nil
function Gdk.offscreen_window_set_embedder(window, embedder) end

--- # function Gdk.pango_context_get()
---
--- Creates a `PangoContext` for the default GDK screen.
--- 
--- The context must be freed when you’re finished with it.
--- 
--- When using GTK+, normally you should use `gtk_widget_get_pango_context()`
--- instead of this function, to get the appropriate context for
--- the widget you intend to render text onto.
--- 
--- The newly created context will have the default font options (see
--- `cairo_font_options_t`) for the default screen; if these options
--- change it will not be updated. Using `gtk_widget_get_pango_context()`
--- is more convenient if you want to keep a context around and track
--- changes to the screen’s font rendering settings.
---
--- ---
---
---@return Pango.Context # a new `PangoContext` for the default display
function Gdk.pango_context_get() end

--- # function Gdk.pango_context_get_for_display()
---
--- Creates a `PangoContext` for `display`.
--- 
--- The context must be freed when you’re finished with it.
--- 
--- When using GTK+, normally you should use `gtk_widget_get_pango_context()`
--- instead of this function, to get the appropriate context for
--- the widget you intend to render text onto.
--- 
--- The newly created context will have the default font options
--- (see `cairo_font_options_t`) for the display; if these options
--- change it will not be updated. Using `gtk_widget_get_pango_context()`
--- is more convenient if you want to keep a context around and track
--- changes to the font rendering settings.
---
--- ---
---
---@param display Gdk.Display # the `GdkDisplay` for which the context is to be created
---@return Pango.Context # a new `PangoContext` for `display`
function Gdk.pango_context_get_for_display(display) end

--- # function Gdk.pango_context_get_for_screen()
---
--- Creates a `PangoContext` for `screen`.
--- 
--- The context must be freed when you’re finished with it.
--- 
--- When using GTK+, normally you should use `gtk_widget_get_pango_context()`
--- instead of this function, to get the appropriate context for
--- the widget you intend to render text onto.
--- 
--- The newly created context will have the default font options
--- (see `cairo_font_options_t`) for the screen; if these options
--- change it will not be updated. Using `gtk_widget_get_pango_context()`
--- is more convenient if you want to keep a context around and track
--- changes to the screen’s font rendering settings.
---
--- ---
---
---@param screen Gdk.Screen # the `GdkScreen` for which the context is to be created.
---@return Pango.Context # a new `PangoContext` for `screen`
function Gdk.pango_context_get_for_screen(screen) end

--- # function Gdk.parse_args()
---
--- Parse command line arguments, and store for future
--- use by calls to `gdk_display_open()`.
--- 
--- Any arguments used by GDK are removed from the array and `argc` and `argv` are
--- updated accordingly.
--- 
--- You shouldn’t call this function explicitly if you are using
--- `gtk_init()`, `gtk_init_check()`, `gdk_init()`, or `gdk_init_check()`.
---
--- ---
---
---@param argc integer # the number of command line arguments.
---@param argv unknown[] # the array of command line arguments.
---@return nil
function Gdk.parse_args(argc, argv) end

--- # function Gdk.pixbuf_get_from_surface()
---
--- Transfers image data from a `cairo_surface_t` and converts it to an RGB(A)
--- representation inside a `GdkPixbuf`. This allows you to efficiently read
--- individual pixels from cairo surfaces. For `GdkWindows`, use
--- `gdk_pixbuf_get_from_window()` instead.
--- 
--- This function will create an RGB pixbuf with 8 bits per channel.
--- The pixbuf will contain an alpha channel if the `surface` contains one.
---
--- ---
---
---@param surface cairo.Surface # surface to copy from
---@param src_x integer # Source X coordinate within `surface`
---@param src_y integer # Source Y coordinate within `surface`
---@param width integer # Width in pixels of region to get
---@param height integer # Height in pixels of region to get
---@return GdkPixbuf.Pixbuf # A newly-created pixbuf with a reference count of 1, or `nil` on error
function Gdk.pixbuf_get_from_surface(surface, src_x, src_y, width, height) end

--- # function Gdk.pixbuf_get_from_window()
---
--- Transfers image data from a `GdkWindow` and converts it to an RGB(A)
--- representation inside a `GdkPixbuf`.
--- 
--- In other words, copies image data from a server-side drawable to a
--- client-side RGB(A) buffer. This allows you to efficiently read
--- individual pixels on the client side.
--- 
--- This function will create an RGB pixbuf with 8 bits per channel with
--- the size specified by the `width` and `height` arguments scaled by the
--- scale factor of `window`. The pixbuf will contain an alpha channel if
--- the `window` contains one.
--- 
--- If the window is off the screen, then there is no image data in the
--- obscured/offscreen regions to be placed in the pixbuf. The contents of
--- portions of the pixbuf corresponding to the offscreen region are
--- undefined.
--- 
--- If the window you’re obtaining data from is partially obscured by
--- other windows, then the contents of the pixbuf areas corresponding
--- to the obscured regions are undefined.
--- 
--- If the window is not mapped (typically because it’s iconified/minimized
--- or not on the current workspace), then `nil` will be returned.
--- 
--- If memory can’t be allocated for the return value, `nil` will be returned
--- instead.
--- 
--- In short, there are several ways this function can fail, and if it fails
--- it returns `nil`; so check the return value.
--- 
--- You should rarely, if ever, need to call this function.
---
--- ---
---
---@param window Gdk.Window # Source window
---@param src_x integer # Source X coordinate within `window`
---@param src_y integer # Source Y coordinate within `window`
---@param width integer # Width in pixels of region to get
---@param height integer # Height in pixels of region to get
---@return GdkPixbuf.Pixbuf # A newly-created pixbuf with a reference count of 1, or `nil` on error
function Gdk.pixbuf_get_from_window(window, src_x, src_y, width, height) end

--- # function Gdk.pointer_grab()
---
--- Grabs the pointer (usually a mouse) so that all events are passed to this
--- application until the pointer is ungrabbed with `gdk_pointer_ungrab()`, or
--- the grab window becomes unviewable.
--- This overrides any previous pointer grab by this client.
--- 
--- Pointer grabs are used for operations which need complete control over mouse
--- events, even if the mouse leaves the application.
--- For example in GTK+ it is used for Drag and Drop, for dragging the handle in
--- the `GtkHPaned` and `GtkVPaned` widgets.
--- 
--- Note that if the event mask of an X window has selected both button press and
--- button release events, then a button press event will cause an automatic
--- pointer grab until the button is released.
--- X does this automatically since most applications expect to receive button
--- press and release events in pairs.
--- It is equivalent to a pointer grab on the window with `owner_events` set to
--- `true`.
--- 
--- If you set up anything at the time you take the grab that needs to be cleaned
--- up when the grab ends, you should handle the `GdkEventGrabBroken` events that
--- are emitted when the grab ends unvoluntarily.
---
--- ---
---
---@param window Gdk.Window # the `GdkWindow` which will own the grab (the grab window).
---@param owner_events (boolean|nil) # if `false` then all pointer events are reported with respect to `window` and are only reported if selected by `event_mask`. If `true` then pointer events for this application are reported as normal, but pointer events outside this application are reported with respect to `window` and only if selected by `event_mask`. In either mode, unreported events are discarded.
---@param event_mask Gdk.EventMask # specifies the event mask, which is used in accordance with `owner_events`. Note that only pointer events (i.e. button and motion events) may be selected.
---@param confine_to? Gdk.Window # If non-`nil`, the pointer will be confined to this window during the grab. If the pointer is outside `confine_to`, it will automatically be moved to the closest edge of `confine_to` and enter and leave events will be generated as necessary.
---@param cursor? Gdk.Cursor # the cursor to display while the grab is active. If this is `nil` then the normal cursors are used for `window` and its descendants, and the cursor for `window` is used for all other windows.
---@param time_ integer # the timestamp of the event which led to this pointer grab. This usually comes from a `GdkEventButton` struct, though %GDK_CURRENT_TIME can be used if the time isn’t known.
---@return Gdk.GrabStatus # %GDK_GRAB_SUCCESS if the grab was successful.
function Gdk.pointer_grab(window, owner_events, event_mask, confine_to, cursor, time_) end

--- # function Gdk.pointer_is_grabbed()
---
--- Returns `true` if the pointer on the default display is currently
--- grabbed by this application.
--- 
--- Note that this does not take the inmplicit pointer grab on button
--- presses into account.
---
--- ---
---
---@return (boolean|nil) # `true` if the pointer is currently grabbed by this application.
function Gdk.pointer_is_grabbed() end

--- # function Gdk.pointer_ungrab()
---
--- Ungrabs the pointer on the default display, if it is grabbed by this
--- application.
---
--- ---
---
---@param time_ integer # a timestamp from a `GdkEvent`, or %GDK_CURRENT_TIME if no timestamp is available.
---@return nil
function Gdk.pointer_ungrab(time_) end

--- # function Gdk.pre_parse_libgtk_only()
---
--- Prepare for parsing command line arguments for GDK. This is not
--- public API and should not be used in application code.
---
--- ---
---
---@return nil
function Gdk.pre_parse_libgtk_only() end

--- # function Gdk.property_delete()
---
--- Deletes a property from a window.
---
--- ---
---
---@param window Gdk.Window # a `GdkWindow`
---@param property Gdk.Atom # the property to delete
---@return nil
function Gdk.property_delete(window, property) end

--- # function Gdk.property_get()
---
--- Retrieves a portion of the contents of a property. If the
--- property does not exist, then the function returns `false`,
--- and %GDK_NONE will be stored in `actual_property_type`.
--- 
--- The XGetWindowP`roperty()` function that `gdk_property_get()`
--- uses has a very confusing and complicated set of semantics.
--- Unfortunately, `gdk_property_get()` makes the situation
--- worse instead of better (the semantics should be considered
--- undefined), and also prints warnings to stderr in cases where it
--- should return a useful error to the program. You are advised to use
--- XGetWindowP`roperty()` directly until a replacement function for
--- `gdk_property_get()` is provided.
---
--- ---
---
---@param window Gdk.Window # a `GdkWindow`
---@param property Gdk.Atom # the property to retrieve
---@param type Gdk.Atom # the desired property type, or %GDK_NONE, if any type of data is acceptable. If this does not match the actual type, then `actual_format` and `actual_length` will be filled in, a warning will be printed to stderr and no data will be returned.
---@param offset integer # the offset into the property at which to begin retrieving data, in 4 byte units.
---@param length integer # the length of the data to retrieve in bytes. Data is considered to be retrieved in 4 byte chunks, so `length` will be rounded up to the next highest 4 byte boundary (so be careful not to pass a value that might overflow when rounded up).
---@param pdelete integer # if `true`, delete the property after retrieving the data.
---@param actual_property_type Gdk.Atom # location to store the actual type of the property.
---@param actual_format integer # location to store the actual return format of the data; either 8, 16 or 32 bits.
---@param actual_length integer # location to store the length of the retrieved data, in bytes. Data returned in the 32 bit format is stored in a long variable, so the actual number of 32 bit elements should be be calculated via `actual_length` / sizeof(glong) to ensure portability to 64 bit systems.
---@param data unknown[] # location to store a pointer to the data. The retrieved data should be freed with `g_free()` when you are finished using it.
---@return (boolean|nil) # `true` if data was successfully received and stored in `data`, otherwise `false`.
function Gdk.property_get(window, property, type, offset, length, pdelete, actual_property_type, actual_format, actual_length, data) end

--- # function Gdk.query_depths()
---
--- This function returns the available bit depths for the default
--- screen. It’s equivalent to listing the visuals
--- (`gdk_list_visuals()`) and then looking at the depth field in each
--- visual, removing duplicates.
--- 
--- The array returned by this function should not be freed.
---
--- ---
---
---@param depths unknown[] # return location for available depths
---@param count integer # return location for number of available depths
---@return nil
function Gdk.query_depths(depths, count) end

--- # function Gdk.query_visual_types()
---
--- This function returns the available visual types for the default
--- screen. It’s equivalent to listing the visuals
--- (`gdk_list_visuals()`) and then looking at the type field in each
--- visual, removing duplicates.
--- 
--- The array returned by this function should not be freed.
---
--- ---
---
---@param visual_types unknown[] # return location for the available visual types
---@param count integer # return location for the number of available visual types
---@return nil
function Gdk.query_visual_types(visual_types, count) end

--- # function Gdk.selection_convert()
---
--- Retrieves the contents of a selection in a given
--- form.
---
--- ---
---
---@param requestor Gdk.Window # a `GdkWindow`.
---@param selection Gdk.Atom # an atom identifying the selection to get the contents of.
---@param target Gdk.Atom # the form in which to retrieve the selection.
---@param time_ integer # the timestamp to use when retrieving the selection. The selection owner may refuse the request if it did not own the selection at the time indicated by the timestamp.
---@return nil
function Gdk.selection_convert(requestor, selection, target, time_) end

--- # function Gdk.selection_owner_get()
---
--- Determines the owner of the given selection.
---
--- ---
---
---@param selection Gdk.Atom # an atom indentifying a selection.
---@return Gdk.Window # if there is a selection owner for this window, and it is a window known to the current process, the `GdkWindow` that owns the selection, otherwise `nil`. Note that the return value may be owned by a different process if a foreign window was previously created for that window, but a new foreign window will never be created by this call.
function Gdk.selection_owner_get(selection) end

--- # function Gdk.selection_owner_get_for_display()
---
--- Determine the owner of the given selection.
--- 
--- Note that the return value may be owned by a different
--- process if a foreign window was previously created for that
--- window, but a new foreign window will never be created by this call.
---
--- ---
---
---@param display Gdk.Display # a `GdkDisplay`
---@param selection Gdk.Atom # an atom indentifying a selection
---@return Gdk.Window # if there is a selection owner for this window, and it is a window known to the current process, the `GdkWindow` that owns the selection, otherwise `nil`.
function Gdk.selection_owner_get_for_display(display, selection) end

--- # function Gdk.selection_owner_set()
---
--- Sets the owner of the given selection.
---
--- ---
---
---@param owner? Gdk.Window # a `GdkWindow` or `nil` to indicate that the the owner for the given should be unset.
---@param selection Gdk.Atom # an atom identifying a selection.
---@param time_ integer # timestamp to use when setting the selection. If this is older than the timestamp given last time the owner was set for the given selection, the request will be ignored.
---@param send_event (boolean|nil) # if `true`, and the new owner is different from the current owner, the current owner will be sent a SelectionClear event.
---@return (boolean|nil) # `true` if the selection owner was successfully changed to `owner`, otherwise `false`.
function Gdk.selection_owner_set(owner, selection, time_, send_event) end

--- # function Gdk.selection_owner_set_for_display()
---
--- Sets the `GdkWindow` `owner` as the current owner of the selection `selection`.
---
--- ---
---
---@param display Gdk.Display # the `GdkDisplay`
---@param owner? Gdk.Window # a `GdkWindow` or `nil` to indicate that the owner for the given should be unset
---@param selection Gdk.Atom # an atom identifying a selection
---@param time_ integer # timestamp to use when setting the selection If this is older than the timestamp given last time the owner was set for the given selection, the request will be ignored
---@param send_event (boolean|nil) # if `true`, and the new owner is different from the current owner, the current owner will be sent a SelectionClear event
---@return (boolean|nil) # `true` if the selection owner was successfully changed to owner, otherwise `false`.
function Gdk.selection_owner_set_for_display(display, owner, selection, time_, send_event) end

--- # function Gdk.selection_send_notify()
---
--- Sends a response to SelectionRequest event.
---
--- ---
---
---@param requestor Gdk.Window # window to which to deliver response.
---@param selection Gdk.Atom # selection that was requested.
---@param target Gdk.Atom # target that was selected.
---@param property Gdk.Atom # property in which the selection owner stored the data, or %GDK_NONE to indicate that the request was rejected.
---@param time_ integer # timestamp.
---@return nil
function Gdk.selection_send_notify(requestor, selection, target, property, time_) end

--- # function Gdk.selection_send_notify_for_display()
---
--- Send a response to SelectionRequest event.
---
--- ---
---
---@param display Gdk.Display # the `GdkDisplay` where `requestor` is realized
---@param requestor Gdk.Window # window to which to deliver response
---@param selection Gdk.Atom # selection that was requested
---@param target Gdk.Atom # target that was selected
---@param property Gdk.Atom # property in which the selection owner stored the data, or %GDK_NONE to indicate that the request was rejected
---@param time_ integer # timestamp
---@return nil
function Gdk.selection_send_notify_for_display(display, requestor, selection, target, property, time_) end

--- # function Gdk.set_allowed_backends()
---
--- Sets a list of backends that GDK should try to use.
--- 
--- This can be be useful if your application does not
--- work with certain GDK backends.
--- 
--- By default, GDK tries all included backends.
--- 
--- For example,
--- ```c
--- gdk_set_allowed_backends ("wayland,quartz,*");
--- ```
--- instructs GDK to try the Wayland backend first,
--- followed by the Quartz backend, and then all
--- others.
--- 
--- If the `GDK_BACKEND` environment variable
--- is set, it determines what backends are tried in what
--- order, while still respecting the set of allowed backends
--- that are specified by this function.
--- 
--- The possible backend names are x11, win32, quartz,
--- broadway, wayland. You can also include a * in the
--- list to try all remaining backends.
--- 
--- This call must happen prior to `gdk_display_open()`,
--- `gtk_init()`, `gtk_init_with_args()` or `gtk_init_check()`
--- in order to take effect.
---
--- ---
---
---@param backends string # a comma-separated list of backends
---@return nil
function Gdk.set_allowed_backends(backends) end

--- # function Gdk.set_double_click_time()
---
--- Set the double click time for the default display. See
--- `gdk_display_set_double_click_time()`.
--- See also `gdk_display_set_double_click_distance()`.
--- Applications should not set this, it is a
--- global user-configured setting.
---
--- ---
---
---@param msec integer # double click time in milliseconds (thousandths of a second)
---@return nil
function Gdk.set_double_click_time(msec) end

--- # function Gdk.set_program_class()
---
--- Sets the program class. The X11 backend uses the program class to set
--- the class name part of the `WM_CLASS` property on
--- toplevel windows; see the ICCCM.
--- 
--- The program class can still be overridden with the --class command
--- line option.
---
--- ---
---
---@param program_class string # a string.
---@return nil
function Gdk.set_program_class(program_class) end

--- # function Gdk.set_show_events()
---
--- Sets whether a trace of received events is output.
--- Note that GTK+ must be compiled with debugging (that is,
--- configured using the `--enable-debug` option)
--- to use this option.
---
--- ---
---
---@param show_events (boolean|nil) # `true` to output event debugging information.
---@return nil
function Gdk.set_show_events(show_events) end

--- # function Gdk.setting_get()
---
--- Obtains a desktop-wide setting, such as the double-click time,
--- for the default screen. See `gdk_screen_get_setting()`.
---
--- ---
---
---@param name string # the name of the setting.
---@param value GObject.Value # location to store the value of the setting.
---@return (boolean|nil) # `true` if the setting existed and a value was stored in `value`, `false` otherwise.
function Gdk.setting_get(name, value) end

--- # function Gdk.synthesize_window_state()
---
---@param window Gdk.Window
---@param unset_flags Gdk.WindowState
---@param set_flags Gdk.WindowState
---@return nil
function Gdk.synthesize_window_state(window, unset_flags, set_flags) end

--- # function Gdk.test_render_sync()
---
--- Retrieves a pixel from `window` to force the windowing
--- system to carry out any pending rendering commands.
--- 
--- This function is intended to be used to synchronize with rendering
--- pipelines, to benchmark windowing system rendering operations.
---
--- ---
---
---@param window Gdk.Window # a mapped `GdkWindow`
---@return nil
function Gdk.test_render_sync(window) end

--- # function Gdk.test_simulate_button()
---
--- This function is intended to be used in GTK+ test programs.
--- It will warp the mouse pointer to the given (`x`,`y`) coordinates
--- within `window` and simulate a button press or release event.
--- Because the mouse pointer needs to be warped to the target
--- location, use of this function outside of test programs that
--- run in their own virtual windowing system (e.g. Xvfb) is not
--- recommended.
--- 
--- Also, `gdk_test_simulate_button()` is a fairly low level function,
--- for most testing purposes, `gtk_test_widget_click()` is the right
--- function to call which will generate a button press event followed
--- by its accompanying button release event.
---
--- ---
---
---@param window Gdk.Window # a `GdkWindow` to simulate a button event for
---@param x integer # x coordinate within `window` for the button event
---@param y integer # y coordinate within `window` for the button event
---@param button integer # Number of the pointer button for the event, usually 1, 2 or 3
---@param modifiers Gdk.ModifierType # Keyboard modifiers the event is setup with
---@param button_pressrelease Gdk.EventType # either %GDK_BUTTON_PRESS or %GDK_BUTTON_RELEASE
---@return (boolean|nil) # whether all actions necessary for a button event simulation were carried out successfully
function Gdk.test_simulate_button(window, x, y, button, modifiers, button_pressrelease) end

--- # function Gdk.test_simulate_key()
---
--- This function is intended to be used in GTK+ test programs.
--- If (`x`,`y`) are > (-1,-1), it will warp the mouse pointer to
--- the given (`x`,`y`) coordinates within `window` and simulate a
--- key press or release event.
--- 
--- When the mouse pointer is warped to the target location, use
--- of this function outside of test programs that run in their
--- own virtual windowing system (e.g. Xvfb) is not recommended.
--- If (`x`,`y`) are passed as (-1,-1), the mouse pointer will not
--- be warped and `window` origin will be used as mouse pointer
--- location for the event.
--- 
--- Also, `gdk_test_simulate_key()` is a fairly low level function,
--- for most testing purposes, `gtk_test_widget_send_key()` is the
--- right function to call which will generate a key press event
--- followed by its accompanying key release event.
---
--- ---
---
---@param window Gdk.Window # a `GdkWindow` to simulate a key event for
---@param x integer # x coordinate within `window` for the key event
---@param y integer # y coordinate within `window` for the key event
---@param keyval integer # A GDK keyboard value
---@param modifiers Gdk.ModifierType # Keyboard modifiers the event is setup with
---@param key_pressrelease Gdk.EventType # either %GDK_KEY_PRESS or %GDK_KEY_RELEASE
---@return (boolean|nil) # whether all actions necessary for a key event simulation were carried out successfully
function Gdk.test_simulate_key(window, x, y, keyval, modifiers, key_pressrelease) end

--- # function Gdk.text_property_to_utf8_list_for_display()
---
--- Converts a text property in the given encoding to
--- a list of UTF-8 strings.
---
--- ---
---
---@param display Gdk.Display # a `GdkDisplay`
---@param encoding Gdk.Atom # an atom representing the encoding of the text
---@param format integer # the format of the property
---@param text unknown[] # the text to convert
---@param length integer # the length of `text`, in bytes
---@param list unknown[] # location to store the list of strings or `nil`. The list should be freed with `g_strfreev()`.
---@return integer # the number of strings in the resulting list
function Gdk.text_property_to_utf8_list_for_display(display, encoding, format, text, length, list) end

--- # function Gdk.threads_add_idle()
---
--- Adds a function to be called whenever there are no higher priority
--- events pending.  If the function returns `false` it is automatically
--- removed from the list of event sources and will not be called again.
--- 
--- This variant of `g_idle_add_full()` calls `function` with the GDK lock
--- held. It can be thought of a MT-safe version for GTK+ widgets for the
--- following use case, where you have to worry about `idle_callback()`
--- running in thread A and accessing `self` after it has been finalized
--- in thread B:
--- 
--- ```c
--- static gboolean
--- idle_callback (gpointer data)
--- {
---    // `gdk_threads_enter()`; would be needed for `g_idle_add()`
--- 
---    SomeWidget *self = data;
---    // do stuff with self
--- 
---    self->idle_id = 0;
--- 
---    // `gdk_threads_leave()`; would be needed for `g_idle_add()`
---    return FALSE;
--- }
--- 
--- static void
--- some_widget_do_stuff_later (SomeWidget *self)
--- {
---    self->idle_id = gdk_threads_add_idle (idle_callback, self)
---    // using `g_idle_add()` here would require thread protection in the callback
--- }
--- 
--- static void
--- some_widget_finalize (GObject *object)
--- {
---    SomeWidget *self = SOME_WIDGET (object);
---    if (self->idle_id)
---      g_source_remove (self->idle_id);
---    G_OBJECT_CLASS (parent_class)->finalize (object);
--- }
--- ```
---
--- ---
---
---@param priority integer # the priority of the idle source. Typically this will be in the range between `G_PRIORITY_DEFAULT_IDLE` and `G_PRIORITY_HIGH_IDLE`
---@param function__ GLib.SourceFunc # function to call
---@param data? userdata # data to pass to `function`
---@param notify? GLib.DestroyNotify # function to call when the idle is removed, or `nil`
---@return integer # the ID (greater than 0) of the event source.
function Gdk.threads_add_idle(priority, function__, data, notify) end

--- # function Gdk.threads_add_timeout()
---
--- Sets a function to be called at regular intervals holding the GDK lock,
--- with the given priority.  The function is called repeatedly until it
--- returns `false`, at which point the timeout is automatically destroyed
--- and the function will not be called again.  The `notify` function is
--- called when the timeout is destroyed.  The first call to the
--- function will be at the end of the first `interval`.
--- 
--- Note that timeout functions may be delayed, due to the processing of other
--- event sources. Thus they should not be relied on for precise timing.
--- After each call to the timeout function, the time of the next
--- timeout is recalculated based on the current time and the given interval
--- (it does not try to “catch up” time lost in delays).
--- 
--- This variant of `g_timeout_add_full()` can be thought of a MT-safe version
--- for GTK+ widgets for the following use case:
--- 
--- ```c
--- static gboolean timeout_callback (gpointer data)
--- {
---    SomeWidget *self = data;
---    
---    // do stuff with self
---    
---    self->timeout_id = 0;
---    
---    return G_SOURCE_REMOVE;
--- }
---  
--- static void some_widget_do_stuff_later (SomeWidget *self)
--- {
---    self->timeout_id = g_timeout_add (timeout_callback, self)
--- }
---  
--- static void some_widget_finalize (GObject *object)
--- {
---    SomeWidget *self = SOME_WIDGET (object);
---    
---    if (self->timeout_id)
---      g_source_remove (self->timeout_id);
---    
---    G_OBJECT_CLASS (parent_class)->finalize (object);
--- }
--- ```
---
--- ---
---
---@param priority integer # the priority of the timeout source. Typically this will be in the range between `G_PRIORITY_DEFAULT_IDLE` and `G_PRIORITY_HIGH_IDLE`.
---@param interval integer # the time between calls to the function, in milliseconds (1/1000ths of a second)
---@param function__ GLib.SourceFunc # function to call
---@param data? userdata # data to pass to `function`
---@param notify? GLib.DestroyNotify # function to call when the timeout is removed, or `nil`
---@return integer # the ID (greater than 0) of the event source.
function Gdk.threads_add_timeout(priority, interval, function__, data, notify) end

--- # function Gdk.threads_add_timeout_seconds()
---
--- A variant of `gdk_threads_add_timeout_full()` with second-granularity.
--- See `g_timeout_add_seconds_full()` for a discussion of why it is
--- a good idea to use this function if you don’t need finer granularity.
---
--- ---
---
---@param priority integer # the priority of the timeout source. Typically this will be in the range between `G_PRIORITY_DEFAULT_IDLE` and `G_PRIORITY_HIGH_IDLE`.
---@param interval integer # the time between calls to the function, in seconds
---@param function__ GLib.SourceFunc # function to call
---@param data? userdata # data to pass to `function`
---@param notify? GLib.DestroyNotify # function to call when the timeout is removed, or `nil`
---@return integer # the ID (greater than 0) of the event source.
function Gdk.threads_add_timeout_seconds(priority, interval, function__, data, notify) end

--- # function Gdk.threads_enter()
---
--- This function marks the beginning of a critical section in which
--- GDK and GTK+ functions can be called safely and without causing race
--- conditions. Only one thread at a time can be in such a critial
--- section.
---
--- ---
---
---@return nil
function Gdk.threads_enter() end

--- # function Gdk.threads_init()
---
--- Initializes GDK so that it can be used from multiple threads
--- in conjunction with `gdk_threads_enter()` and `gdk_threads_leave()`.
--- 
--- This call must be made before any use of the main loop from
--- GTK+; to be safe, call it before `gtk_init()`.
---
--- ---
---
---@return nil
function Gdk.threads_init() end

--- # function Gdk.threads_leave()
---
--- Leaves a critical region begun with `gdk_threads_enter()`.
---
--- ---
---
---@return nil
function Gdk.threads_leave() end

--- # function Gdk.unicode_to_keyval()
---
--- Convert from a ISO10646 character to a key symbol.
---
--- ---
---
---@param wc integer # a ISO10646 encoded character
---@return integer # the corresponding GDK key symbol, if one exists. or, if there is no corresponding symbol, wc | 0x01000000
function Gdk.unicode_to_keyval(wc) end

--- # function Gdk.utf8_to_string_target()
---
--- Converts an UTF-8 string into the best possible representation
--- as a STRING. The representation of characters not in STRING
--- is not specified; it may be as pseudo-escape sequences
--- \x{ABCD}, or it may be in some other form of approximation.
---
--- ---
---
---@param str string # a UTF-8 string
---@return string # the newly-allocated string, or `nil` if the conversion failed. (It should not fail for any properly formed UTF-8 string unless system limits like memory or file descriptors are exceeded.)
function Gdk.utf8_to_string_target(str) end

return Gdk

