---@meta Atk

---@class Atk
local Atk = {}

---@alias Atk.AttributeSet GLib.SList

---@alias Atk.State integer

--- # interface Atk.Action
---
--- The ATK interface provided by UI components
--- which the user can activate/interact with.
--- 
--- `AtkAction` should be implemented by instances of `AtkObject` classes
--- with which the user can interact directly, i.e. buttons,
--- checkboxes, scrollbars, e.g. components which are not "passive"
--- providers of UI information.
--- 
--- Exceptions: when the user interaction is already covered by another
--- appropriate interface such as `AtkEditableText` (insert/delete text,
--- etc.) or `AtkValue` (set value) then these actions should not be
--- exposed by `AtkAction` as well.
--- 
--- Though most UI interactions on components should be invocable via
--- keyboard as well as mouse, there will generally be a close mapping
--- between "mouse actions" that are possible on a component and the
--- AtkActions.  Where mouse and keyboard actions are redundant in
--- effect, `AtkAction` should expose only one action rather than
--- exposing redundant actions if possible.  By convention we have been
--- using "mouse centric" terminology for `AtkAction` names.
---
--- ---
---
---@class Atk.Action
Atk.Action = {}

--- # method Atk.Action:do_action()
---
--- Perform the specified action on the object.
---
--- ---
---
---@param self Atk.Action # a `GObject` instance that implements AtkActionIface
---@param i integer # the action index corresponding to the action to be performed
---@return (boolean|nil) # `true` if success, `false` otherwise
function Atk.Action:do_action(i) end

--- # method Atk.Action:get_description()
---
--- Returns a description of the specified action of the object.
---
--- ---
---
---@param self Atk.Action # a `GObject` instance that implements AtkActionIface
---@param i integer # the action index corresponding to the action to be performed
---@return string # a description string, or `nil` if `action` does not implement this interface.
function Atk.Action:get_description(i) end

--- # method Atk.Action:get_keybinding()
---
--- Gets the keybinding which can be used to activate this action, if one
--- exists. The string returned should contain localized, human-readable,
--- key sequences as they would appear when displayed on screen. It must
--- be in the format "mnemonic;sequence;shortcut".
--- 
--- - The mnemonic key activates the object if it is presently enabled onscreen.
---   This typically corresponds to the underlined letter within the widget.
---   Example: "n" in a traditional "New..." menu item or the "a" in "Apply" for
---   a button.
--- - The sequence is the full list of keys which invoke the action even if the
---   relevant element is not currently shown on screen. For instance, for a menu
---   item the sequence is the keybindings used to open the parent menus before
---   invoking. The sequence string is colon-delimited. Example: "Alt+F:N" in a
---   traditional "New..." menu item.
--- - The shortcut, if it exists, will invoke the same action without showing
---   the component or its enclosing menus or dialogs. Example: "Ctrl+N" in a
---   traditional "New..." menu item.
--- 
--- Example: For a traditional "New..." menu item, the expected return value
--- would be: "N;Alt+F:N;Ctrl+N" for the English locale and "N;Alt+D:N;Strg+N"
--- for the German locale. If, hypothetically, this menu item lacked a mnemonic,
--- it would be represented by ";;Ctrl+N" and ";;Strg+N" respectively.
---
--- ---
---
---@param self Atk.Action # a `GObject` instance that implements AtkActionIface
---@param i integer # the action index corresponding to the action to be performed
---@return string # the keybinding which can be used to activate this action, or `nil` if there is no keybinding for this action.
function Atk.Action:get_keybinding(i) end

--- # method Atk.Action:get_localized_name()
---
--- Returns the localized name of the specified action of the object.
---
--- ---
---
---@param self Atk.Action # a `GObject` instance that implements AtkActionIface
---@param i integer # the action index corresponding to the action to be performed
---@return string # a name string, or `nil` if `action` does not implement this interface.
function Atk.Action:get_localized_name(i) end

--- # method Atk.Action:get_n_actions()
---
--- Gets the number of accessible actions available on the object.
--- If there are more than one, the first one is considered the
--- "default" action of the object.
---
--- ---
---
---@param self Atk.Action # a `GObject` instance that implements AtkActionIface
---@return integer # a the number of actions, or 0 if `action` does not implement this interface.
function Atk.Action:get_n_actions() end

--- # method Atk.Action:get_name()
---
--- Returns a non-localized string naming the specified action of the
--- object. This name is generally not descriptive of the end result
--- of the action, but instead names the 'interaction type' which the
--- object supports. By convention, the above strings should be used to
--- represent the actions which correspond to the common point-and-click
--- interaction techniques of the same name: i.e.
--- "click", "press", "release", "drag", "drop", "popup", etc.
--- The "popup" action should be used to pop up a context menu for the
--- object, if one exists.
--- 
--- For technical reasons, some toolkits cannot guarantee that the
--- reported action is actually 'bound' to a nontrivial user event;
--- i.e. the result of some actions via `atk_action_do_action()` may be
--- NIL.
---
--- ---
---
---@param self Atk.Action # a `GObject` instance that implements AtkActionIface
---@param i integer # the action index corresponding to the action to be performed
---@return string # a name string, or `nil` if `action` does not implement this interface.
function Atk.Action:get_name(i) end

--- # method Atk.Action:set_description()
---
--- Sets a description of the specified action of the object.
---
--- ---
---
---@param self Atk.Action # a `GObject` instance that implements AtkActionIface
---@param i integer # the action index corresponding to the action to be performed
---@param desc string # the description to be assigned to this action
---@return (boolean|nil) # a gboolean representing if the description was successfully set;
function Atk.Action:set_description(i, desc) end

--- # record Atk.ActionIface
---
--- The `AtkAction` interface should be supported by any object that can
--- perform one or more actions. The interface provides the standard
--- mechanism for an assistive technology to determine what those actions
--- are as well as tell the object to perform them. Any object that can
--- be manipulated should support this interface.
---
--- ---
---
---@class Atk.ActionIface
---@field parent GObject.TypeInterface
---@field do_action fun(action: Atk.Action, i: integer): (boolean|nil)
---@field get_n_actions fun(action: Atk.Action): integer
---@field get_description fun(action: Atk.Action, i: integer): string
---@field get_name fun(action: Atk.Action, i: integer): string
---@field get_keybinding fun(action: Atk.Action, i: integer): string
---@field set_description fun(action: Atk.Action, i: integer, desc: string): (boolean|nil)
---@field get_localized_name fun(action: Atk.Action, i: integer): string
Atk.ActionIface = {}

--- # record Atk.Attribute
---
--- AtkAttribute is a string name/value pair representing a generic
--- attribute. This can be used to expose additional information from
--- an accessible object as a whole (see `atk_object_get_attributes()`)
--- or an document (see `atk_document_get_attributes()`). In the case of
--- text attributes (see `atk_text_get_default_attributes()`),
--- `AtkTextAttribute` enum defines all the possible text attribute
--- names. You can use `atk_text_attribute_get_name()` to get the string
--- name from the enum value. See also `atk_text_attribute_for_name()`
--- and `atk_text_attribute_get_value()` for more information.
--- 
--- A string name/value pair representing a generic attribute.
---
--- ---
---
---@class Atk.Attribute
---@field name string # The attribute name.
---@field value string # the value of the attribute, represented as a string.
Atk.Attribute = {}

--- # function Atk.Attribute.set_free()
---
--- Frees the memory used by an `AtkAttributeSet`, including all its
--- `AtkAttributes`.
---
--- ---
---
---@param attrib_set Atk.AttributeSet # The `AtkAttributeSet` to free
---@return nil
function Atk.Attribute.set_free(attrib_set) end

--- # interface Atk.Component
---
--- The ATK interface provided by UI components
--- which occupy a physical area on the screen.
--- which the user can activate/interact with.
--- 
--- `AtkComponent` should be implemented by most if not all UI elements
--- with an actual on-screen presence, i.e. components which can be
--- said to have a screen-coordinate bounding box.  Virtually all
--- widgets will need to have `AtkComponent` implementations provided
--- for their corresponding `AtkObject` class.  In short, only UI
--- elements which are *not* GUI elements will omit this ATK interface.
--- 
--- A possible exception might be textual information with a
--- transparent background, in which case text glyph bounding box
--- information is provided by `AtkText`.
---
--- ---
---
---@class Atk.Component
Atk.Component = {}

--- # method Atk.Component:contains()
---
--- Checks whether the specified point is within the extent of the `component`.
--- 
--- Toolkit implementor note: ATK provides a default implementation for
--- this virtual method. In general there are little reason to
--- re-implement it.
---
--- ---
---
---@param self Atk.Component # the `AtkComponent`
---@param x integer # x coordinate
---@param y integer # y coordinate
---@param coord_type Atk.CoordType # specifies whether the coordinates are relative to the screen or to the components top level window
---@return (boolean|nil) # `true` or `false` indicating whether the specified point is within the extent of the `component` or not
function Atk.Component:contains(x, y, coord_type) end

--- # method Atk.Component:get_alpha()
---
--- Returns the alpha value (i.e. the opacity) for this
--- `component`, on a scale from 0 (fully transparent) to 1.0
--- (fully opaque).
---
--- ---
---
---@param self Atk.Component # an `AtkComponent`
---@return number # An alpha value from 0 to 1.0, inclusive.
function Atk.Component:get_alpha() end

--- # method Atk.Component:get_extents()
---
--- Gets the rectangle which gives the extent of the `component`.
--- 
--- If the extent can not be obtained (e.g. a non-embedded plug or missing
--- support), all of x, y, width, height are set to -1.
---
--- ---
---
---@param self Atk.Component # an `AtkComponent`
---@param x? integer # address of `gint` to put x coordinate
---@param y? integer # address of `gint` to put y coordinate
---@param width? integer # address of `gint` to put width
---@param height? integer # address of `gint` to put height
---@param coord_type Atk.CoordType # specifies whether the coordinates are relative to the screen or to the components top level window
---@return nil
function Atk.Component:get_extents(x, y, width, height, coord_type) end

--- # method Atk.Component:get_layer()
---
--- Gets the layer of the component.
---
--- ---
---
---@param self Atk.Component # an `AtkComponent`
---@return Atk.Layer # an `AtkLayer` which is the layer of the component
function Atk.Component:get_layer() end

--- # method Atk.Component:get_mdi_zorder()
---
--- Gets the zorder of the component. The value G_MININT will be returned
--- if the layer of the component is not ATK_LAYER_MDI or ATK_LAYER_WINDOW.
---
--- ---
---
---@param self Atk.Component # an `AtkComponent`
---@return integer # a gint which is the zorder of the component, i.e. the depth at which the component is shown in relation to other components in the same container.
function Atk.Component:get_mdi_zorder() end

--- # method Atk.Component:get_position()
---
--- Gets the position of `component` in the form of
--- a point specifying `component`'s top-left corner.
--- 
--- If the position can not be obtained (e.g. a non-embedded plug or missing
--- support), x and y are set to -1.
---
--- ---
---
---@param self Atk.Component # an `AtkComponent`
---@param x? integer # address of `gint` to put x coordinate position
---@param y? integer # address of `gint` to put y coordinate position
---@param coord_type Atk.CoordType # specifies whether the coordinates are relative to the screen or to the components top level window
---@return nil
function Atk.Component:get_position(x, y, coord_type) end

--- # method Atk.Component:get_size()
---
--- Gets the size of the `component` in terms of width and height.
--- 
--- If the size can not be obtained (e.g. a non-embedded plug or missing
--- support), width and height are set to -1.
---
--- ---
---
---@param self Atk.Component # an `AtkComponent`
---@param width? integer # address of `gint` to put width of `component`
---@param height? integer # address of `gint` to put height of `component`
---@return nil
function Atk.Component:get_size(width, height) end

--- # method Atk.Component:grab_focus()
---
--- Grabs focus for this `component`.
---
--- ---
---
---@param self Atk.Component # an `AtkComponent`
---@return (boolean|nil) # `true` if successful, `false` otherwise.
function Atk.Component:grab_focus() end

--- # method Atk.Component:ref_accessible_at_point()
---
--- Gets a reference to the accessible child, if one exists, at the
--- coordinate point specified by `x` and `y`.
---
--- ---
---
---@param self Atk.Component # the `AtkComponent`
---@param x integer # x coordinate
---@param y integer # y coordinate
---@param coord_type Atk.CoordType # specifies whether the coordinates are relative to the screen or to the components top level window
---@return Atk.Object # a reference to the accessible child, if one exists
function Atk.Component:ref_accessible_at_point(x, y, coord_type) end

--- # method Atk.Component:remove_focus_handler()
---
--- Remove the handler specified by `handler_id` from the list of
--- functions to be executed when this object receives focus events
--- (in or out).
---
--- ---
---
---@param self Atk.Component # the `AtkComponent` to remove the focus handler from
---@param handler_id integer # the handler id of the focus handler to be removed from `component`
---@return nil
function Atk.Component:remove_focus_handler(handler_id) end

--- # method Atk.Component:scroll_to()
---
--- Makes `component` visible on the screen by scrolling all necessary parents.
--- 
--- Contrary to atk_component_set_position, this does not actually move
--- `component` in its parent, this only makes the parents scroll so that the
--- object shows up on the screen, given its current position within the parents.
---
--- ---
---
---@param self Atk.Component # an `AtkComponent`
---@param type Atk.ScrollType # specify where the object should be made visible.
---@return (boolean|nil) # whether scrolling was successful.
function Atk.Component:scroll_to(type) end

--- # method Atk.Component:scroll_to_point()
---
--- Move the top-left of `component` to a given position of the screen by
--- scrolling all necessary parents.
---
--- ---
---
---@param self Atk.Component # an `AtkComponent`
---@param coords Atk.CoordType # specify whether coordinates are relative to the screen or to the parent object.
---@param x integer # x-position where to scroll to
---@param y integer # y-position where to scroll to
---@return (boolean|nil) # whether scrolling was successful.
function Atk.Component:scroll_to_point(coords, x, y) end

--- # method Atk.Component:set_extents()
---
--- Sets the extents of `component`.
---
--- ---
---
---@param self Atk.Component # an `AtkComponent`
---@param x integer # x coordinate
---@param y integer # y coordinate
---@param width integer # width to set for `component`
---@param height integer # height to set for `component`
---@param coord_type Atk.CoordType # specifies whether the coordinates are relative to the screen or to the components top level window
---@return (boolean|nil) # `true` or `false` whether the extents were set or not
function Atk.Component:set_extents(x, y, width, height, coord_type) end

--- # method Atk.Component:set_position()
---
--- Sets the position of `component`.
--- 
--- Contrary to atk_component_scroll_to, this does not trigger any scrolling,
--- this just moves `component` in its parent.
---
--- ---
---
---@param self Atk.Component # an `AtkComponent`
---@param x integer # x coordinate
---@param y integer # y coordinate
---@param coord_type Atk.CoordType # specifies whether the coordinates are relative to the screen or to the component's top level window
---@return (boolean|nil) # `true` or `false` whether or not the position was set or not
function Atk.Component:set_position(x, y, coord_type) end

--- # method Atk.Component:set_size()
---
--- Set the size of the `component` in terms of width and height.
---
--- ---
---
---@param self Atk.Component # an `AtkComponent`
---@param width integer # width to set for `component`
---@param height integer # height to set for `component`
---@return (boolean|nil) # `true` or `false` whether the size was set or not
function Atk.Component:set_size(width, height) end

--- # record Atk.ComponentIface
---
--- The AtkComponent interface should be supported by any object that is
--- rendered on the screen. The interface provides the standard mechanism
--- for an assistive technology to determine and set the graphical
--- representation of an object.
---
--- ---
---
---@class Atk.ComponentIface
---@field parent GObject.TypeInterface
---@field contains fun(component: Atk.Component, x: integer, y: integer, coord_type: Atk.CoordType): (boolean|nil)
---@field ref_accessible_at_point fun(component: Atk.Component, x: integer, y: integer, coord_type: Atk.CoordType): Atk.Object
---@field get_extents fun(component: Atk.Component, x: integer, y: integer, width: integer, height: integer, coord_type: Atk.CoordType): nil
---@field get_position fun(component: Atk.Component, x: integer, y: integer, coord_type: Atk.CoordType): nil
---@field get_size fun(component: Atk.Component, width: integer, height: integer): nil
---@field grab_focus fun(component: Atk.Component): (boolean|nil)
---@field remove_focus_handler fun(component: Atk.Component, handler_id: integer): nil
---@field set_extents fun(component: Atk.Component, x: integer, y: integer, width: integer, height: integer, coord_type: Atk.CoordType): (boolean|nil)
---@field set_position fun(component: Atk.Component, x: integer, y: integer, coord_type: Atk.CoordType): (boolean|nil)
---@field set_size fun(component: Atk.Component, width: integer, height: integer): (boolean|nil)
---@field get_layer fun(component: Atk.Component): Atk.Layer
---@field get_mdi_zorder fun(component: Atk.Component): integer
---@field bounds_changed fun(component: Atk.Component, bounds: Atk.Rectangle): nil
---@field get_alpha fun(component: Atk.Component): number
---@field scroll_to fun(component: Atk.Component, type: Atk.ScrollType): (boolean|nil)
---@field scroll_to_point fun(component: Atk.Component, coords: Atk.CoordType, x: integer, y: integer): (boolean|nil)
Atk.ComponentIface = {}

---@enum Atk.CoordType
Atk.CoordType = {}

--- # interface Atk.Document
---
--- The ATK interface which represents the toplevel
---  container for document content.
--- 
--- The AtkDocument interface should be supported by any object whose
--- content is a representation or view of a document.  The AtkDocument
--- interface should appear on the toplevel container for the document
--- content; however AtkDocument instances may be nested (i.e. an
--- AtkDocument may be a descendant of another AtkDocument) in those
--- cases where one document contains "embedded content" which can
--- reasonably be considered a document in its own right.
---
--- ---
---
---@class Atk.Document
Atk.Document = {}

--- # method Atk.Document:get_attribute_value()
---
--- Retrieves the value of the given `attribute_name` inside `document`.
---
--- ---
---
---@param self Atk.Document # a `GObject` instance that implements AtkDocumentIface
---@param attribute_name string # a character string representing the name of the attribute whose value is being queried.
---@return string # a string value associated with the named attribute for this document, or `nil` if a value for `attribute_name` has not been specified for this document.
function Atk.Document:get_attribute_value(attribute_name) end

--- # method Atk.Document:get_attributes()
---
--- Gets an AtkAttributeSet which describes document-wide
---          attributes as name-value pairs.
---
--- ---
---
---@param self Atk.Document # a `GObject` instance that implements AtkDocumentIface
---@return Atk.AttributeSet # An AtkAttributeSet containing the explicitly set name-value-pair attributes associated with this document as a whole.
function Atk.Document:get_attributes() end

--- # method Atk.Document:get_current_page_number()
---
--- Retrieves the current page number inside `document`.
---
--- ---
---
---@param self Atk.Document # the `AtkDocument`
---@return integer # the current page number inside `document`, or -1 if not implemented, not know by the implementor, or irrelevant.
function Atk.Document:get_current_page_number() end

--- # method Atk.Document:get_document()
---
--- Gets a %gpointer that points to an instance of the DOM.  It is
--- up to the caller to check atk_document_get_type to determine
--- how to cast this pointer.
---
--- ---
---
---@param self Atk.Document # a `GObject` instance that implements AtkDocumentIface
---@return userdata # a %gpointer that points to an instance of the DOM.
function Atk.Document:get_document() end

--- # method Atk.Document:get_document_type()
---
--- Gets a string indicating the document type.
---
--- ---
---
---@param self Atk.Document # a `GObject` instance that implements AtkDocumentIface
---@return string # a string indicating the document type
function Atk.Document:get_document_type() end

--- # method Atk.Document:get_locale()
---
--- Gets a UTF-8 string indicating the POSIX-style LC_MESSAGES locale
---          of the content of this document instance.  Individual
---          text substrings or images within this document may have
---          a different locale, see atk_text_get_attributes and
---          atk_image_get_image_locale.
---
--- ---
---
---@param self Atk.Document # a `GObject` instance that implements AtkDocumentIface
---@return string # a UTF-8 string indicating the POSIX-style LC_MESSAGES locale of the document content as a whole, or NULL if the document content does not specify a locale.
function Atk.Document:get_locale() end

--- # method Atk.Document:get_page_count()
---
--- Retrieves the total number of pages inside `document`.
---
--- ---
---
---@param self Atk.Document # the `AtkDocument`
---@return integer # total page count of `document`, or -1 if not implemented, not know by the implementor or irrelevant.
function Atk.Document:get_page_count() end

--- # method Atk.Document:set_attribute_value()
---
--- Sets the value for the given `attribute_name` inside `document`.
---
--- ---
---
---@param self Atk.Document # a `GObject` instance that implements `AtkDocumentIface`
---@param attribute_name string # a character string representing the name of the attribute whose value is being set.
---@param attribute_value string # a string value to be associated with `attribute_name`.
---@return (boolean|nil) # `true` if `attribute_value` is successfully associated with `attribute_name` for this `document`, and `false` if if the document does not allow the attribute to be modified
function Atk.Document:set_attribute_value(attribute_name, attribute_value) end

--- # record Atk.DocumentIface
---
---@class Atk.DocumentIface
---@field parent GObject.TypeInterface
---@field get_document_type fun(document: Atk.Document): string
---@field get_document fun(document: Atk.Document): userdata
---@field get_document_locale fun(document: Atk.Document): string
---@field get_document_attributes fun(document: Atk.Document): Atk.AttributeSet
---@field get_document_attribute_value fun(document: Atk.Document, attribute_name: string): string
---@field set_document_attribute fun(document: Atk.Document, attribute_name: string, attribute_value: string): (boolean|nil)
---@field get_current_page_number fun(document: Atk.Document): integer
---@field get_page_count fun(document: Atk.Document): integer
Atk.DocumentIface = {}

--- # interface Atk.EditableText
---
--- The ATK interface implemented by components containing user-editable text content.
--- 
--- `AtkEditableText` should be implemented by UI components which
--- contain text which the user can edit, via the `AtkObject`
--- corresponding to that component (see `AtkObject`).
--- 
--- `AtkEditableText` is a subclass of `AtkText`, and as such, an object
--- which implements `AtkEditableText` is by definition an `AtkText`
--- implementor as well.
--- 
--- See [iface`AtkText`]
---
--- ---
---
---@class Atk.EditableText
Atk.EditableText = {}

--- # method Atk.EditableText:copy_text()
---
--- Copy text from `start_pos` up to, but not including `end_pos`
--- to the clipboard.
---
--- ---
---
---@param self Atk.EditableText # an `AtkEditableText`
---@param start_pos integer # start position
---@param end_pos integer # end position
---@return nil
function Atk.EditableText:copy_text(start_pos, end_pos) end

--- # method Atk.EditableText:cut_text()
---
--- Copy text from `start_pos` up to, but not including `end_pos`
--- to the clipboard and then delete from the widget.
---
--- ---
---
---@param self Atk.EditableText # an `AtkEditableText`
---@param start_pos integer # start position
---@param end_pos integer # end position
---@return nil
function Atk.EditableText:cut_text(start_pos, end_pos) end

--- # method Atk.EditableText:delete_text()
---
--- Delete text `start_pos` up to, but not including `end_pos`.
---
--- ---
---
---@param self Atk.EditableText # an `AtkEditableText`
---@param start_pos integer # start position
---@param end_pos integer # end position
---@return nil
function Atk.EditableText:delete_text(start_pos, end_pos) end

--- # method Atk.EditableText:insert_text()
---
--- Insert text at a given position.
---
--- ---
---
---@param self Atk.EditableText # an `AtkEditableText`
---@param string string # the text to insert
---@param length integer # the length of text to insert, in bytes
---@param position integer # The caller initializes this to the position at which to insert the text. After the call it points at the position after the newly inserted text.
---@return nil
function Atk.EditableText:insert_text(string, length, position) end

--- # method Atk.EditableText:paste_text()
---
--- Paste text from clipboard to specified `position`.
---
--- ---
---
---@param self Atk.EditableText # an `AtkEditableText`
---@param position integer # position to paste
---@return nil
function Atk.EditableText:paste_text(position) end

--- # method Atk.EditableText:set_run_attributes()
---
--- Sets the attributes for a specified range. See the ATK_ATTRIBUTE
--- macros (such as `ATK_ATTRIBUTE_LEFT_MARGIN`) for examples of attributes
--- that can be set. Note that other attributes that do not have corresponding
--- ATK_ATTRIBUTE macros may also be set for certain text widgets.
---
--- ---
---
---@param self Atk.EditableText # an `AtkEditableText`
---@param attrib_set Atk.AttributeSet # an `AtkAttributeSet`
---@param start_offset integer # start of range in which to set attributes
---@param end_offset integer # end of range in which to set attributes
---@return (boolean|nil) # `true` if attributes successfully set for the specified range, otherwise `false`
function Atk.EditableText:set_run_attributes(attrib_set, start_offset, end_offset) end

--- # method Atk.EditableText:set_text_contents()
---
--- Set text contents of `text`.
---
--- ---
---
---@param self Atk.EditableText # an `AtkEditableText`
---@param string string # string to set for text contents of `text`
---@return nil
function Atk.EditableText:set_text_contents(string) end

--- # record Atk.EditableTextIface
---
---@class Atk.EditableTextIface
---@field parent_interface GObject.TypeInterface
---@field set_run_attributes fun(text: Atk.EditableText, attrib_set: Atk.AttributeSet, start_offset: integer, end_offset: integer): (boolean|nil)
---@field set_text_contents fun(text: Atk.EditableText, string: string): nil
---@field insert_text fun(text: Atk.EditableText, string: string, length: integer, position: integer): nil
---@field copy_text fun(text: Atk.EditableText, start_pos: integer, end_pos: integer): nil
---@field cut_text fun(text: Atk.EditableText, start_pos: integer, end_pos: integer): nil
---@field delete_text fun(text: Atk.EditableText, start_pos: integer, end_pos: integer): nil
---@field paste_text fun(text: Atk.EditableText, position: integer): nil
Atk.EditableTextIface = {}

---@alias Atk.EventListener fun(obj: Atk.Object): nil

---@alias Atk.EventListenerInit fun(): nil

---@alias Atk.FocusHandler fun(object: Atk.Object, focus_in: (boolean|nil)): nil

---@alias Atk.Function fun(user_data: userdata): (boolean|nil)

--- # class Atk.GObjectAccessible
---
--- This object class is derived from AtkObject and can be used as a basis implementing accessible objects.
--- 
--- This object class is derived from AtkObject. It can be used as a
--- basis for implementing accessible objects for GObjects which are
--- not derived from GtkWidget. One example of its use is in providing
--- an accessible object for GnomeCanvasItem in the GAIL library.
---
--- ---
---
---@class Atk.GObjectAccessible : Atk.Object
---@field parent Atk.Object
Atk.GObjectAccessible = {}

--- # method Atk.GObjectAccessible:get_object()
---
--- Gets the GObject for which `obj` is the accessible object.
---
--- ---
---
---@param self Atk.GObjectAccessible # a `AtkGObjectAccessible`
---@return GObject.Object # a `GObject` which is the object for which `obj` is the accessible object
function Atk.GObjectAccessible:get_object() end

--- # function Atk.GObjectAccessible.for_object()
---
--- Gets the accessible object for the specified `obj`.
---
--- ---
---
---@param obj GObject.Object # a `GObject`
---@return Atk.Object # a `AtkObject` which is the accessible object for the `obj`
function Atk.GObjectAccessible.for_object(obj) end

--- # record Atk.GObjectAccessibleClass
---
---@class Atk.GObjectAccessibleClass
---@field parent_class Atk.ObjectClass
---@field pad1 Atk.Function
---@field pad2 Atk.Function
Atk.GObjectAccessibleClass = {}

--- # class Atk.Hyperlink
---
--- An ATK object which encapsulates a link or set of links in a hypertext document.
--- 
--- An ATK object which encapsulates a link or set of links (for
--- instance in the case of client-side image maps) in a hypertext
--- document.  It may implement the AtkAction interface.  AtkHyperlink
--- may also be used to refer to inline embedded content, since it
--- allows specification of a start and end offset within the host
--- AtkHypertext object.
---
--- ---
---
---@class Atk.Hyperlink : GObject.Object, Atk.Action
---@field parent GObject.Object
Atk.Hyperlink = {}

--- # method Atk.Hyperlink:get_end_index()
---
--- Gets the index with the hypertext document at which this link ends.
---
--- ---
---
---@param self Atk.Hyperlink # an `AtkHyperlink`
---@return integer # the index with the hypertext document at which this link ends
function Atk.Hyperlink:get_end_index() end

--- # method Atk.Hyperlink:get_n_anchors()
---
--- Gets the number of anchors associated with this hyperlink.
---
--- ---
---
---@param self Atk.Hyperlink # an `AtkHyperlink`
---@return integer # the number of anchors associated with this hyperlink
function Atk.Hyperlink:get_n_anchors() end

--- # method Atk.Hyperlink:get_object()
---
--- Returns the item associated with this hyperlinks nth anchor.
--- For instance, the returned `AtkObject` will implement `AtkText`
--- if `link_` is a text hyperlink, `AtkImage` if `link_` is an image
--- hyperlink etc.
--- 
--- Multiple anchors are primarily used by client-side image maps.
---
--- ---
---
---@param self Atk.Hyperlink # an `AtkHyperlink`
---@param i integer # a (zero-index) integer specifying the desired anchor
---@return Atk.Object # an `AtkObject` associated with this hyperlinks i-th anchor
function Atk.Hyperlink:get_object(i) end

--- # method Atk.Hyperlink:get_start_index()
---
--- Gets the index with the hypertext document at which this link begins.
---
--- ---
---
---@param self Atk.Hyperlink # an `AtkHyperlink`
---@return integer # the index with the hypertext document at which this link begins
function Atk.Hyperlink:get_start_index() end

--- # method Atk.Hyperlink:get_uri()
---
--- Get a the URI associated with the anchor specified
--- by `i` of `link_`.
--- 
--- Multiple anchors are primarily used by client-side image maps.
---
--- ---
---
---@param self Atk.Hyperlink # an `AtkHyperlink`
---@param i integer # a (zero-index) integer specifying the desired anchor
---@return string # a string specifying the URI
function Atk.Hyperlink:get_uri(i) end

--- # method Atk.Hyperlink:is_inline()
---
--- Indicates whether the link currently displays some or all of its
---           content inline.  Ordinary HTML links will usually return
---           `false`, but an inline &lt;src&gt; HTML element will return
---           `true`.
---
--- ---
---
---@param self Atk.Hyperlink # an `AtkHyperlink`
---@return (boolean|nil) # whether or not this link displays its content inline.
function Atk.Hyperlink:is_inline() end

--- # method Atk.Hyperlink:is_selected_link()
---
--- Determines whether this AtkHyperlink is selected
---
--- ---
---
---@param self Atk.Hyperlink # an `AtkHyperlink`
---@return (boolean|nil) # True if the AtkHyperlink is selected, False otherwise
function Atk.Hyperlink:is_selected_link() end

--- # method Atk.Hyperlink:is_valid()
---
--- Since the document that a link is associated with may have changed
--- this method returns `true` if the link is still valid (with
--- respect to the document it references) and `false` otherwise.
---
--- ---
---
---@param self Atk.Hyperlink # an `AtkHyperlink`
---@return (boolean|nil) # whether or not this link is still valid
function Atk.Hyperlink:is_valid() end

--- # record Atk.HyperlinkClass
---
---@class Atk.HyperlinkClass
---@field parent GObject.ObjectClass
---@field get_uri fun(link_: Atk.Hyperlink, i: integer): string
---@field get_object fun(link_: Atk.Hyperlink, i: integer): Atk.Object
---@field get_end_index fun(link_: Atk.Hyperlink): integer
---@field get_start_index fun(link_: Atk.Hyperlink): integer
---@field is_valid fun(link_: Atk.Hyperlink): (boolean|nil)
---@field get_n_anchors fun(link_: Atk.Hyperlink): integer
---@field link_state fun(link_: Atk.Hyperlink): integer
---@field is_selected_link fun(link_: Atk.Hyperlink): (boolean|nil)
---@field link_activated fun(link_: Atk.Hyperlink): nil
---@field pad1 Atk.Function
Atk.HyperlinkClass = {}

--- # interface Atk.HyperlinkImpl
---
--- A queryable interface which allows AtkHyperlink instances
--- associated with an AtkObject to be obtained.  AtkHyperlinkImpl
--- corresponds to AT-SPI's Hyperlink interface, and differs from
--- AtkHyperlink in that AtkHyperlink is an object type, rather than an
--- interface, and thus cannot be directly queried. FTW
---
--- ---
---
---@class Atk.HyperlinkImpl
Atk.HyperlinkImpl = {}

--- # method Atk.HyperlinkImpl:get_hyperlink()
---
--- Gets the hyperlink associated with this object.
---
--- ---
---
---@param self Atk.HyperlinkImpl # a `GObject` instance that implements AtkHyperlinkImplIface
---@return Atk.Hyperlink # an AtkHyperlink object which points to this implementing AtkObject.
function Atk.HyperlinkImpl:get_hyperlink() end

--- # record Atk.HyperlinkImplIface
---
---@class Atk.HyperlinkImplIface
---@field parent GObject.TypeInterface
---@field get_hyperlink fun(impl: Atk.HyperlinkImpl): Atk.Hyperlink
Atk.HyperlinkImplIface = {}

---@enum Atk.HyperlinkStateFlags
Atk.HyperlinkStateFlags = {}

--- # interface Atk.Hypertext
---
--- The ATK interface which provides standard mechanism for manipulating hyperlinks.
--- 
--- An interface used for objects which implement linking between
--- multiple resource or content locations, or multiple 'markers'
--- within a single document.  A Hypertext instance is associated with
--- one or more Hyperlinks, which are associated with particular
--- offsets within the Hypertext's included content.  While this
--- interface is derived from Text, there is no requirement that
--- Hypertext instances have textual content; they may implement Image
--- as well, and Hyperlinks need not have non-zero text offsets.
---
--- ---
---
---@class Atk.Hypertext
Atk.Hypertext = {}

--- # method Atk.Hypertext:get_link()
---
--- Gets the link in this hypertext document at index
--- `link_index`
---
--- ---
---
---@param self Atk.Hypertext # an `AtkHypertext`
---@param link_index integer # an integer specifying the desired link
---@return Atk.Hyperlink # the link in this hypertext document at index `link_index`
function Atk.Hypertext:get_link(link_index) end

--- # method Atk.Hypertext:get_link_index()
---
--- Gets the index into the array of hyperlinks that is associated with
--- the character specified by `char_index`.
---
--- ---
---
---@param self Atk.Hypertext # an `AtkHypertext`
---@param char_index integer # a character index
---@return integer # an index into the array of hyperlinks in `hypertext`, or -1 if there is no hyperlink associated with this character.
function Atk.Hypertext:get_link_index(char_index) end

--- # method Atk.Hypertext:get_n_links()
---
--- Gets the number of links within this hypertext document.
---
--- ---
---
---@param self Atk.Hypertext # an `AtkHypertext`
---@return integer # the number of links within this hypertext document
function Atk.Hypertext:get_n_links() end

--- # record Atk.HypertextIface
---
---@class Atk.HypertextIface
---@field parent GObject.TypeInterface
---@field get_link fun(hypertext: Atk.Hypertext, link_index: integer): Atk.Hyperlink
---@field get_n_links fun(hypertext: Atk.Hypertext): integer
---@field get_link_index fun(hypertext: Atk.Hypertext, char_index: integer): integer
---@field link_selected fun(hypertext: Atk.Hypertext, link_index: integer): nil
Atk.HypertextIface = {}

--- # interface Atk.Image
---
--- The ATK Interface implemented by components
---  which expose image or pixmap content on-screen.
--- 
--- `AtkImage` should be implemented by `AtkObject` subtypes on behalf of
--- components which display image/pixmap information onscreen, and
--- which provide information (other than just widget borders, etc.)
--- via that image content.  For instance, icons, buttons with icons,
--- toolbar elements, and image viewing panes typically should
--- implement `AtkImage`.
--- 
--- `AtkImage` primarily provides two types of information: coordinate
--- information (useful for screen review mode of screenreaders, and
--- for use by onscreen magnifiers), and descriptive information.  The
--- descriptive information is provided for alternative, text-only
--- presentation of the most significant information present in the
--- image.
---
--- ---
---
---@class Atk.Image
Atk.Image = {}

--- # method Atk.Image:get_image_description()
---
--- Get a textual description of this image.
---
--- ---
---
---@param self Atk.Image # a `GObject` instance that implements AtkImageIface
---@return string # a string representing the image description
function Atk.Image:get_image_description() end

--- # method Atk.Image:get_image_locale()
---
--- Retrieves the locale identifier associated to the `AtkImage`.
---
--- ---
---
---@param self Atk.Image # An `AtkImage`
---@return string # a string corresponding to the POSIX `LC_MESSAGES` locale used by the image description, or `nil` if the image does not specify a locale.
function Atk.Image:get_image_locale() end

--- # method Atk.Image:get_image_position()
---
--- Gets the position of the image in the form of a point specifying the
--- images top-left corner.
--- 
--- If the position can not be obtained (e.g. missing support), x and y are set
--- to -1.
---
--- ---
---
---@param self Atk.Image # a `GObject` instance that implements AtkImageIface
---@param x? integer # address of `gint` to put x coordinate position; otherwise, -1 if value cannot be obtained.
---@param y? integer # address of `gint` to put y coordinate position; otherwise, -1 if value cannot be obtained.
---@param coord_type Atk.CoordType # specifies whether the coordinates are relative to the screen or to the components top level window
---@return nil
function Atk.Image:get_image_position(x, y, coord_type) end

--- # method Atk.Image:get_image_size()
---
--- Get the width and height in pixels for the specified image.
--- The values of `width` and `height` are returned as -1 if the
--- values cannot be obtained (for instance, if the object is not onscreen).
--- 
--- If the size can not be obtained (e.g. missing support), x and y are set
--- to -1.
---
--- ---
---
---@param self Atk.Image # a `GObject` instance that implements AtkImageIface
---@param width? integer # filled with the image width, or -1 if the value cannot be obtained.
---@param height? integer # filled with the image height, or -1 if the value cannot be obtained.
---@return nil
function Atk.Image:get_image_size(width, height) end

--- # method Atk.Image:set_image_description()
---
--- Sets the textual description for this image.
---
--- ---
---
---@param self Atk.Image # a `GObject` instance that implements AtkImageIface
---@param description string # a string description to set for `image`
---@return (boolean|nil) # boolean TRUE, or FALSE if operation could not be completed.
function Atk.Image:set_image_description(description) end

--- # record Atk.ImageIface
---
---@class Atk.ImageIface
---@field parent GObject.TypeInterface
---@field get_image_position fun(image: Atk.Image, x: integer, y: integer, coord_type: Atk.CoordType): nil
---@field get_image_description fun(image: Atk.Image): string
---@field get_image_size fun(image: Atk.Image, width: integer, height: integer): nil
---@field set_image_description fun(image: Atk.Image, description: string): (boolean|nil)
---@field get_image_locale fun(image: Atk.Image): string
Atk.ImageIface = {}

--- # record Atk.Implementor
---
---@class Atk.Implementor
Atk.Implementor = {}

--- # method Atk.Implementor:ref_accessible()
---
--- Gets a reference to an object's `AtkObject` implementation, if
--- the object implements `AtkObjectIface`
---
--- ---
---
---@param self Atk.Implementor # The `GObject` instance which should implement `AtkImplementorIface` if a non-null return value is required.
---@return Atk.Object # a reference to an object's `AtkObject` implementation
function Atk.Implementor:ref_accessible() end

--- # interface Atk.ImplementorIface
---
--- The AtkImplementor interface is implemented by objects for which
--- AtkObject peers may be obtained via calls to
--- iface->(ref_accessible)(implementor);
---
--- ---
---
---@class Atk.ImplementorIface
Atk.ImplementorIface = {}

--- # record Atk.KeyEventStruct
---
--- Encapsulates information about a key event.
---
--- ---
---
---@class Atk.KeyEventStruct
---@field type integer # An AtkKeyEventType, generally one of ATK_KEY_EVENT_PRESS or ATK_KEY_EVENT_RELEASE
---@field state integer # A bitmask representing the state of the modifier keys immediately after the event takes place. The meaning of the bits is currently defined to match the bitmask used by GDK in GdkEventType.state, see http://developer.gnome.org/doc/API/2.0/gdk/gdk-Event-Structures.html`GdkEventKey`
---@field keyval integer # A guint representing a keysym value corresponding to those used by GDK and X11: see /usr/X11/include/keysymdef.h.
---@field length integer # The length of member `string`.
---@field string string # A string containing one of the following: either a string approximating the text that would result from this keypress, if the key is a control or graphic character, or a symbolic name for this keypress. Alphanumeric and printable keys will have the symbolic key name in this string member, for instance "A". "0", "semicolon", "aacute". Keypad keys have the prefix "KP".
---@field keycode integer # The raw hardware code that generated the key event. This field is raraly useful.
---@field timestamp integer # A timestamp in milliseconds indicating when the event occurred. These timestamps are relative to a starting point which should be considered arbitrary, and only used to compare the dispatch times of events to one another.
Atk.KeyEventStruct = {}

---@enum Atk.KeyEventType
Atk.KeyEventType = {}

---@alias Atk.KeySnoopFunc fun(event: Atk.KeyEventStruct, user_data: userdata): integer

---@enum Atk.Layer
Atk.Layer = {}

--- # class Atk.Misc
---
--- A set of ATK utility functions for thread locking
--- 
--- A set of utility functions for thread locking. This interface and
--- all his related methods are deprecated since 2.12.
---
--- ---
---
---@class Atk.Misc : GObject.Object
---@field parent GObject.Object
Atk.Misc = {}

--- # method Atk.Misc:threads_enter()
---
--- Take the thread mutex for the GUI toolkit,
--- if one exists.
--- (This method is implemented by the toolkit ATK implementation layer;
---  for instance, for GTK+, GAIL implements this via GDK_THREADS_ENTER).
---
--- ---
---
---@param self Atk.Misc # an AtkMisc instance for this application.
---@return nil
function Atk.Misc:threads_enter() end

--- # method Atk.Misc:threads_leave()
---
--- Release the thread mutex for the GUI toolkit,
--- if one exists. This method, and atk_misc_threads_enter,
--- are needed in some situations by threaded application code which
--- services ATK requests, since fulfilling ATK requests often
--- requires calling into the GUI toolkit.  If a long-running or
--- potentially blocking call takes place inside such a block, it should
--- be bracketed by atk_misc_threads_leave/atk_misc_threads_enter calls.
--- (This method is implemented by the toolkit ATK implementation layer;
---  for instance, for GTK+, GAIL implements this via GDK_THREADS_LEAVE).
---
--- ---
---
---@param self Atk.Misc # an AtkMisc instance for this application.
---@return nil
function Atk.Misc:threads_leave() end

--- # function Atk.Misc.get_instance()
---
--- Obtain the singleton instance of AtkMisc for this application.
---
--- ---
---
---@return Atk.Misc # The singleton instance of AtkMisc for this application.
function Atk.Misc.get_instance() end

--- # record Atk.MiscClass
---
--- Usage of AtkMisc is deprecated since 2.12 and heavily discouraged.
---
--- ---
---
---@class Atk.MiscClass
---@field parent GObject.ObjectClass
---@field threads_enter fun(misc: Atk.Misc): nil
---@field threads_leave fun(misc: Atk.Misc): nil
---@field vfuncs unknown[]
Atk.MiscClass = {}

--- # class Atk.NoOpObject
---
--- An AtkObject which purports to implement all ATK interfaces.
--- 
--- An AtkNoOpObject is an AtkObject which purports to implement all
--- ATK interfaces. It is the type of AtkObject which is created if an
--- accessible object is requested for an object type for which no
--- factory type is specified.
---
--- ---
---
---@class Atk.NoOpObject : Atk.Object, Atk.Action, Atk.Component, Atk.Document, Atk.EditableText, Atk.Hypertext, Atk.Image, Atk.Selection, Atk.Table, Atk.TableCell, Atk.Text, Atk.Value, Atk.Window
---@field parent Atk.Object
---@operator call: Atk.NoOpObject
Atk.NoOpObject = {}

--- # function Atk.NoOpObject.new()
---
--- Provides a default (non-functioning stub) `AtkObject`.
--- Application maintainers should not use this method.
---
--- ---
---
---@param obj GObject.Object # a `GObject`
---@return Atk.Object # a default (non-functioning stub) `AtkObject`
function Atk.NoOpObject.new(obj) end

--- # record Atk.NoOpObjectClass
---
---@class Atk.NoOpObjectClass
---@field parent_class Atk.ObjectClass
Atk.NoOpObjectClass = {}

--- # class Atk.NoOpObjectFactory
---
--- The AtkObjectFactory which creates an AtkNoOpObject.
--- 
--- The AtkObjectFactory which creates an AtkNoOpObject. An instance of
--- this is created by an AtkRegistry if no factory type has not been
--- specified to create an accessible object of a particular type.
---
--- ---
---
---@class Atk.NoOpObjectFactory : Atk.ObjectFactory
---@field parent Atk.ObjectFactory
---@operator call: Atk.NoOpObjectFactory
Atk.NoOpObjectFactory = {}

--- # function Atk.NoOpObjectFactory.new()
---
--- Creates an instance of an `AtkObjectFactory` which generates primitive
--- (non-functioning) `AtkObjects`.
---
--- ---
---
---@return Atk.ObjectFactory # an instance of an `AtkObjectFactory`
function Atk.NoOpObjectFactory.new() end

--- # record Atk.NoOpObjectFactoryClass
---
---@class Atk.NoOpObjectFactoryClass
---@field parent_class Atk.ObjectFactoryClass
Atk.NoOpObjectFactoryClass = {}

--- # class Atk.Object
---
--- The base object class for the Accessibility Toolkit API.
--- 
--- This class is the primary class for accessibility support via the
--- Accessibility ToolKit (ATK).  Objects which are instances of
--- `AtkObject` (or instances of AtkObject-derived types) are queried
--- for properties which relate basic (and generic) properties of a UI
--- component such as name and description.  Instances of `AtkObject`
--- may also be queried as to whether they implement other ATK
--- interfaces (e.g. `AtkAction`, `AtkComponent`, etc.), as appropriate
--- to the role which a given UI component plays in a user interface.
--- 
--- All UI components in an application which provide useful
--- information or services to the user must provide corresponding
--- `AtkObject` instances on request (in GTK+, for instance, usually on
--- a call to `gtk_widget_get_accessible` ()), either via ATK support
--- built into the toolkit for the widget class or ancestor class, or
--- in the case of custom widgets, if the inherited `AtkObject`
--- implementation is insufficient, via instances of a new `AtkObject`
--- subclass.
--- 
--- See [class`AtkObjectFactory`], [class`AtkRegistry`].  (GTK+ users see also
--- `GtkAccessible`).
---
--- ---
---
---@class Atk.Object : GObject.Object
---@field parent GObject.Object
---@field description string
---@field name string
---@field accessible_parent Atk.Object
---@field role Atk.Role
---@field relation_set Atk.RelationSet
---@field layer Atk.Layer
Atk.Object = {}

--- # method Atk.Object:add_relationship()
---
--- Adds a relationship of the specified type with the specified target.
---
--- ---
---
---@param self Atk.Object # The `AtkObject` to which an AtkRelation is to be added.
---@param relationship Atk.RelationType # The `AtkRelationType` of the relation
---@param target Atk.Object # The `AtkObject` which is to be the target of the relation.
---@return (boolean|nil) # TRUE if the relationship is added.
function Atk.Object:add_relationship(relationship, target) end

--- # method Atk.Object:get_accessible_id()
---
--- Gets the accessible id of the accessible.
---
--- ---
---
---@param self Atk.Object # an `AtkObject`
---@return string # a character string representing the accessible id of the object, or NULL if no such string was set.
function Atk.Object:get_accessible_id() end

--- # method Atk.Object:get_attributes()
---
--- Get a list of properties applied to this object as a whole, as an `AtkAttributeSet` consisting of
--- name-value pairs. As such these attributes may be considered weakly-typed properties or annotations,
--- as distinct from strongly-typed object data available via other get/set methods.
--- Not all objects have explicit "name-value pair" `AtkAttributeSet` properties.
---
--- ---
---
---@param self Atk.Object # An `AtkObject`.
---@return Atk.AttributeSet # an `AtkAttributeSet` consisting of all explicit properties/annotations applied to the object, or an empty set if the object has no name-value pair attributes assigned to it. This `atkattributeset` should be freed by a call to `atk_attribute_set_free()`.
function Atk.Object:get_attributes() end

--- # method Atk.Object:get_description()
---
--- Gets the accessible description of the accessible.
---
--- ---
---
---@param self Atk.Object # an `AtkObject`
---@return string # a character string representing the accessible description of the accessible.
function Atk.Object:get_description() end

--- # method Atk.Object:get_index_in_parent()
---
--- Gets the 0-based index of this accessible in its parent; returns -1 if the
--- accessible does not have an accessible parent.
---
--- ---
---
---@param self Atk.Object # an `AtkObject`
---@return integer # an integer which is the index of the accessible in its parent
function Atk.Object:get_index_in_parent() end

--- # method Atk.Object:get_layer()
---
--- Gets the layer of the accessible.
---
--- ---
---
---@param self Atk.Object # an `AtkObject`
---@return Atk.Layer # an `AtkLayer` which is the layer of the accessible
function Atk.Object:get_layer() end

--- # method Atk.Object:get_mdi_zorder()
---
--- Gets the zorder of the accessible. The value G_MININT will be returned
--- if the layer of the accessible is not ATK_LAYER_MDI.
---
--- ---
---
---@param self Atk.Object # an `AtkObject`
---@return integer # a gint which is the zorder of the accessible, i.e. the depth at which the component is shown in relation to other components in the same container.
function Atk.Object:get_mdi_zorder() end

--- # method Atk.Object:get_n_accessible_children()
---
--- Gets the number of accessible children of the accessible.
---
--- ---
---
---@param self Atk.Object # an `AtkObject`
---@return integer # an integer representing the number of accessible children of the accessible.
function Atk.Object:get_n_accessible_children() end

--- # method Atk.Object:get_name()
---
--- Gets the accessible name of the accessible.
---
--- ---
---
---@param self Atk.Object # an `AtkObject`
---@return string # a character string representing the accessible name of the object.
function Atk.Object:get_name() end

--- # method Atk.Object:get_object_locale()
---
--- Gets a UTF-8 string indicating the POSIX-style LC_MESSAGES locale
--- of `accessible`.
---
--- ---
---
---@param self Atk.Object # an `AtkObject`
---@return string # a UTF-8 string indicating the POSIX-style LC_MESSAGES locale of `accessible`.
function Atk.Object:get_object_locale() end

--- # method Atk.Object:get_parent()
---
--- Gets the accessible parent of the accessible. By default this is
--- the one assigned with `atk_object_set_parent()`, but it is assumed
--- that ATK implementors have ways to get the parent of the object
--- without the need of assigning it manually with
--- `atk_object_set_parent()`, and will return it with this method.
--- 
--- If you are only interested on the parent assigned with
--- `atk_object_set_parent()`, use `atk_object_peek_parent()`.
---
--- ---
---
---@param self Atk.Object # an `AtkObject`
---@return Atk.Object # an `AtkObject` representing the accessible parent of the accessible
function Atk.Object:get_parent() end

--- # method Atk.Object:get_role()
---
--- Gets the role of the accessible.
---
--- ---
---
---@param self Atk.Object # an `AtkObject`
---@return Atk.Role # an `AtkRole` which is the role of the accessible
function Atk.Object:get_role() end

--- # method Atk.Object:initialize()
---
--- This function is called when implementing subclasses of `AtkObject`.
--- It does initialization required for the new object. It is intended
--- that this function should called only in the ...`_new()` functions used
--- to create an instance of a subclass of `AtkObject`
---
--- ---
---
---@param self Atk.Object # a `AtkObject`
---@param data? userdata # a `gpointer` which identifies the object for which the AtkObject was created.
---@return nil
function Atk.Object:initialize(data) end

--- # method Atk.Object:notify_state_change()
---
--- Emits a state-change signal for the specified state.
--- 
--- Note that as a general rule when the state of an existing object changes,
--- emitting a notification is expected.
---
--- ---
---
---@param self Atk.Object # an `AtkObject`
---@param state Atk.State # an `AtkState` whose state is changed
---@param value (boolean|nil) # a gboolean which indicates whether the state is being set on or off
---@return nil
function Atk.Object:notify_state_change(state, value) end

--- # method Atk.Object:peek_parent()
---
--- Gets the accessible parent of the accessible, if it has been
--- manually assigned with atk_object_set_parent. Otherwise, this
--- function returns `nil`.
--- 
--- This method is intended as an utility for ATK implementors, and not
--- to be exposed to accessible tools. See `atk_object_get_parent()` for
--- further reference.
---
--- ---
---
---@param self Atk.Object # an `AtkObject`
---@return Atk.Object # an `AtkObject` representing the accessible parent of the accessible if assigned
function Atk.Object:peek_parent() end

--- # method Atk.Object:ref_accessible_child()
---
--- Gets a reference to the specified accessible child of the object.
--- The accessible children are 0-based so the first accessible child is
--- at index 0, the second at index 1 and so on.
---
--- ---
---
---@param self Atk.Object # an `AtkObject`
---@param i integer # a gint representing the position of the child, starting from 0
---@return Atk.Object # an `AtkObject` representing the specified accessible child of the accessible.
function Atk.Object:ref_accessible_child(i) end

--- # method Atk.Object:ref_relation_set()
---
--- Gets the `AtkRelationSet` associated with the object.
---
--- ---
---
---@param self Atk.Object # an `AtkObject`
---@return Atk.RelationSet # an `AtkRelationSet` representing the relation set of the object.
function Atk.Object:ref_relation_set() end

--- # method Atk.Object:ref_state_set()
---
--- Gets a reference to the state set of the accessible; the caller must
--- unreference it when it is no longer needed.
---
--- ---
---
---@param self Atk.Object # an `AtkObject`
---@return Atk.StateSet # a reference to an `AtkStateSet` which is the state set of the accessible
function Atk.Object:ref_state_set() end

--- # method Atk.Object:remove_property_change_handler()
---
--- Removes a property change handler.
---
--- ---
---
---@param self Atk.Object # an `AtkObject`
---@param handler_id integer # a guint which identifies the handler to be removed.
---@return nil
function Atk.Object:remove_property_change_handler(handler_id) end

--- # method Atk.Object:remove_relationship()
---
--- Removes a relationship of the specified type with the specified target.
---
--- ---
---
---@param self Atk.Object # The `AtkObject` from which an AtkRelation is to be removed.
---@param relationship Atk.RelationType # The `AtkRelationType` of the relation
---@param target Atk.Object # The `AtkObject` which is the target of the relation to be removed.
---@return (boolean|nil) # TRUE if the relationship is removed.
function Atk.Object:remove_relationship(relationship, target) end

--- # method Atk.Object:set_accessible_id()
---
--- Sets the accessible ID of the accessible.  This is not meant to be presented
--- to the user, but to be an ID which is stable over application development.
--- Typically, this is the gtkbuilder ID. Such an ID will be available for
--- instance to identify a given well-known accessible object for tailored screen
--- reading, or for automatic regression testing.
---
--- ---
---
---@param self Atk.Object # an `AtkObject`
---@param name string # a character string to be set as the accessible id
---@return nil
function Atk.Object:set_accessible_id(name) end

--- # method Atk.Object:set_description()
---
--- Sets the accessible description of the accessible. You can't set
--- the description to NULL. This is reserved for the initial value. In
--- this aspect NULL is similar to ATK_ROLE_UNKNOWN. If you want to set
--- the name to a empty value you can use "".
---
--- ---
---
---@param self Atk.Object # an `AtkObject`
---@param description string # a character string to be set as the accessible description
---@return nil
function Atk.Object:set_description(description) end

--- # method Atk.Object:set_name()
---
--- Sets the accessible name of the accessible. You can't set the name
--- to NULL. This is reserved for the initial value. In this aspect
--- NULL is similar to ATK_ROLE_UNKNOWN. If you want to set the name to
--- a empty value you can use "".
---
--- ---
---
---@param self Atk.Object # an `AtkObject`
---@param name string # a character string to be set as the accessible name
---@return nil
function Atk.Object:set_name(name) end

--- # method Atk.Object:set_parent()
---
--- Sets the accessible parent of the accessible. `parent` can be NULL.
---
--- ---
---
---@param self Atk.Object # an `AtkObject`
---@param parent Atk.Object # an `AtkObject` to be set as the accessible parent
---@return nil
function Atk.Object:set_parent(parent) end

--- # method Atk.Object:set_role()
---
--- Sets the role of the accessible.
---
--- ---
---
---@param self Atk.Object # an `AtkObject`
---@param role Atk.Role # an `AtkRole` to be set as the role
---@return nil
function Atk.Object:set_role(role) end

--- # record Atk.ObjectClass
---
---@class Atk.ObjectClass
---@field parent GObject.ObjectClass
---@field get_name fun(accessible: Atk.Object): string
---@field get_description fun(accessible: Atk.Object): string
---@field get_parent fun(accessible: Atk.Object): Atk.Object
---@field get_n_children fun(accessible: Atk.Object): integer
---@field get_index_in_parent fun(accessible: Atk.Object): integer
---@field ref_relation_set fun(accessible: Atk.Object): Atk.RelationSet
---@field get_role fun(accessible: Atk.Object): Atk.Role
---@field get_layer fun(accessible: Atk.Object): Atk.Layer
---@field get_mdi_zorder fun(accessible: Atk.Object): integer
---@field ref_state_set fun(accessible: Atk.Object): Atk.StateSet
---@field set_name fun(accessible: Atk.Object, name: string): nil
---@field set_description fun(accessible: Atk.Object, description: string): nil
---@field set_parent fun(accessible: Atk.Object, parent: Atk.Object): nil
---@field set_role fun(accessible: Atk.Object, role: Atk.Role): nil
---@field remove_property_change_handler fun(accessible: Atk.Object, handler_id: integer): nil
---@field initialize fun(accessible: Atk.Object, data: userdata): nil
---@field children_changed fun(accessible: Atk.Object, change_index: integer, changed_child: userdata): nil
---@field focus_event fun(accessible: Atk.Object, focus_in: (boolean|nil)): nil
---@field property_change fun(accessible: Atk.Object, values: Atk.PropertyValues): nil
---@field state_change fun(accessible: Atk.Object, name: string, state_set: (boolean|nil)): nil
---@field visible_data_changed fun(accessible: Atk.Object): nil
---@field active_descendant_changed fun(accessible: Atk.Object, child: userdata): nil
---@field get_attributes fun(accessible: Atk.Object): Atk.AttributeSet
---@field get_object_locale fun(accessible: Atk.Object): string
---@field pad1 Atk.Function
Atk.ObjectClass = {}

--- # class Atk.ObjectFactory
---
--- The base object class for a factory used to
---  create accessible objects for objects of a specific GType.
--- 
--- This class is the base object class for a factory used to create an
--- accessible object for a specific GType. The function
--- `atk_registry_set_factory_type()` is normally called to store in the
--- registry the factory type to be used to create an accessible of a
--- particular GType.
---
--- ---
---
---@class Atk.ObjectFactory : GObject.Object
---@field parent GObject.Object
Atk.ObjectFactory = {}

--- # method Atk.ObjectFactory:create_accessible()
---
--- Provides an `AtkObject` that implements an accessibility interface
--- on behalf of `obj`
---
--- ---
---
---@param self Atk.ObjectFactory # The `AtkObjectFactory` associated with `obj`'s object type
---@param obj GObject.Object # a `GObject`
---@return Atk.Object # an `AtkObject` that implements an accessibility interface on behalf of `obj`
function Atk.ObjectFactory:create_accessible(obj) end

--- # method Atk.ObjectFactory:get_accessible_type()
---
--- Gets the GType of the accessible which is created by the factory.
---
--- ---
---
---@param self Atk.ObjectFactory # an `AtkObjectFactory`
---@return Atk.GType # the type of the accessible which is created by the `factory`. The value G_TYPE_INVALID is returned if no type if found.
function Atk.ObjectFactory:get_accessible_type() end

--- # method Atk.ObjectFactory:invalidate()
---
--- Inform `factory` that it is no longer being used to create
--- accessibles. When called, `factory` may need to inform
--- `AtkObjects` which it has created that they need to be re-instantiated.
--- Note: primarily used for runtime replacement of `AtkObjectFactorys`
--- in object registries.
---
--- ---
---
---@param self Atk.ObjectFactory # an `AtkObjectFactory` to invalidate
---@return nil
function Atk.ObjectFactory:invalidate() end

--- # record Atk.ObjectFactoryClass
---
---@class Atk.ObjectFactoryClass
---@field parent_class GObject.ObjectClass
---@field invalidate fun(factory: Atk.ObjectFactory): nil
---@field get_accessible_type fun(): Atk.GType
---@field pad1 Atk.Function
---@field pad2 Atk.Function
Atk.ObjectFactoryClass = {}

--- # class Atk.Plug
---
--- Toplevel for embedding into other processes
--- 
--- See [class`AtkSocket`]
---
--- ---
---
---@class Atk.Plug : Atk.Object, Atk.Component
---@field parent Atk.Object
---@operator call: Atk.Plug
Atk.Plug = {}

--- # method Atk.Plug:get_id()
---
--- Gets the unique ID of an `AtkPlug` object, which can be used to
--- embed inside of an `AtkSocket` using `atk_socket_embed()`.
--- 
--- Internally, this calls a class function that should be registered
--- by the IPC layer (usually at-spi2-atk). The implementor of an
--- `AtkPlug` object should call this function (after atk-bridge is
--- loaded) and pass the value to the process implementing the
--- `AtkSocket`, so it could embed the plug.
---
--- ---
---
---@param self Atk.Plug # an `AtkPlug`
---@return string # the unique ID for the plug
function Atk.Plug:get_id() end

--- # method Atk.Plug:set_child()
---
--- Sets `child` as accessible child of `plug` and `plug` as accessible parent of
--- `child`. `child` can be NULL.
--- 
--- In some cases, one can not use the AtkPlug type directly as accessible
--- object for the toplevel widget of the application. For instance in the gtk
--- case, GtkPlugAccessible can not inherit both from GtkWindowAccessible and
--- from AtkPlug. In such a case, one can create, in addition to the standard
--- accessible object for the toplevel widget, an AtkPlug object, and make the
--- former the child of the latter by calling `atk_plug_set_child()`.
---
--- ---
---
---@param self Atk.Plug # an `AtkPlug` to be set as accessible parent of `child`.
---@param child Atk.Object # an `AtkObject` to be set as accessible child of `plug`.
---@return nil
function Atk.Plug:set_child(child) end

--- # function Atk.Plug.new()
---
--- Creates a new `AtkPlug` instance.
---
--- ---
---
---@return Atk.Object # the newly created `AtkPlug`
function Atk.Plug.new() end

--- # record Atk.PlugClass
---
---@class Atk.PlugClass
---@field parent_class Atk.ObjectClass
---@field get_object_id fun(obj: Atk.Plug): string
Atk.PlugClass = {}

---@alias Atk.PropertyChangeHandler fun(obj: Atk.Object, vals: Atk.PropertyValues): nil

--- # record Atk.PropertyValues
---
--- Note: `old_value` field of `AtkPropertyValues` will not contain a
--- valid value. This is a field defined with the purpose of contain
--- the previous value of the property, but is not used anymore.
---
--- ---
---
---@class Atk.PropertyValues
---@field property_name string # The name of the ATK property which has changed.
---@field old_value GObject.Value # NULL. This field is not used anymore.
---@field new_value GObject.Value # The new value of the named property.
Atk.PropertyValues = {}

--- # record Atk.Range
---
--- A given range or subrange, to be used with `AtkValue`
--- 
--- `AtkRange` are used on `AtkValue`, in order to represent the full
--- range of a given component (for example an slider or a range
--- control), or to define each individual subrange this full range is
--- splitted if available. See `AtkValue` documentation for further
--- details.
---
--- ---
---
---@class Atk.Range
---@operator call: Atk.Range
Atk.Range = {}

--- # method Atk.Range:copy()
---
--- Returns a new `AtkRange` that is a exact copy of `src`
---
--- ---
---
---@param self Atk.Range # `AtkRange` to copy
---@return Atk.Range # a new `AtkRange` copy of `src`
function Atk.Range:copy() end

--- # method Atk.Range:free()
---
--- Free `range`
---
--- ---
---
---@param self Atk.Range # `AtkRange` to free
---@return nil
function Atk.Range:free() end

--- # method Atk.Range:get_description()
---
--- Returns the human readable description of `range`
---
--- ---
---
---@param self Atk.Range # an `AtkRange`
---@return string # the human-readable description of `range`
function Atk.Range:get_description() end

--- # method Atk.Range:get_lower_limit()
---
--- Returns the lower limit of `range`
---
--- ---
---
---@param self Atk.Range # an `AtkRange`
---@return number # the lower limit of `range`
function Atk.Range:get_lower_limit() end

--- # method Atk.Range:get_upper_limit()
---
--- Returns the upper limit of `range`
---
--- ---
---
---@param self Atk.Range # an `AtkRange`
---@return number # the upper limit of `range`
function Atk.Range:get_upper_limit() end

--- # function Atk.Range.new()
---
--- Creates a new `AtkRange`.
---
--- ---
---
---@param lower_limit number # inferior limit for this range
---@param upper_limit number # superior limit for this range
---@param description string # human readable description of this range.
---@return Atk.Range # a new `AtkRange`
function Atk.Range.new(lower_limit, upper_limit, description) end

--- # record Atk.Rectangle
---
--- A data structure for holding a rectangle. Those coordinates are
--- relative to the component top-level parent.
---
--- ---
---
---@class Atk.Rectangle
---@field x integer # X coordinate of the left side of the rectangle.
---@field y integer # Y coordinate of the top side of the rectangle.
---@field width integer # width of the rectangle.
---@field height integer # height of the rectangle.
Atk.Rectangle = {}

--- # class Atk.Registry
---
--- An object used to store the GType of the
--- factories used to create an accessible object for an object of a
--- particular GType.
--- 
--- The AtkRegistry is normally used to create appropriate ATK "peers"
--- for user interface components.  Application developers usually need
--- only interact with the AtkRegistry by associating appropriate ATK
--- implementation classes with GObject classes via the
--- atk_registry_set_factory_type call, passing the appropriate GType
--- for application custom widget classes.
---
--- ---
---
---@class Atk.Registry : GObject.Object
---@field parent GObject.Object
---@field factory_type_registry table<userdata, userdata>
---@field factory_singleton_cache table<userdata, userdata>
Atk.Registry = {}

--- # method Atk.Registry:get_factory()
---
--- Gets an `AtkObjectFactory` appropriate for creating `AtkObjects`
--- appropriate for `type`.
---
--- ---
---
---@param self Atk.Registry # an `AtkRegistry`
---@param type Atk.GType # a `GType` with which to look up the associated `AtkObjectFactory`
---@return Atk.ObjectFactory # an `AtkObjectFactory` appropriate for creating `AtkObjects` appropriate for `type`.
function Atk.Registry:get_factory(type) end

--- # method Atk.Registry:get_factory_type()
---
--- Provides a `GType` indicating the `AtkObjectFactory` subclass
--- associated with `type`.
---
--- ---
---
---@param self Atk.Registry # an `AtkRegistry`
---@param type Atk.GType # a `GType` with which to look up the associated `AtkObjectFactory` subclass
---@return Atk.GType # a `GType` associated with type `type`
function Atk.Registry:get_factory_type(type) end

--- # method Atk.Registry:set_factory_type()
---
--- Associate an `AtkObjectFactory` subclass with a `GType`. Note:
--- The associated `factory_type` will thereafter be responsible for
--- the creation of new `AtkObject` implementations for instances
--- appropriate for `type`.
---
--- ---
---
---@param self Atk.Registry # the `AtkRegistry` in which to register the type association
---@param type Atk.GType # an `AtkObject` type
---@param factory_type Atk.GType # an `AtkObjectFactory` type to associate with `type`. Must implement AtkObject appropriate for `type`.
---@return nil
function Atk.Registry:set_factory_type(type, factory_type) end

--- # record Atk.RegistryClass
---
---@class Atk.RegistryClass
---@field parent_class GObject.ObjectClass
Atk.RegistryClass = {}

--- # class Atk.Relation
---
--- An object used to describe a relation between a
---  object and one or more other objects.
--- 
--- An AtkRelation describes a relation between an object and one or
--- more other objects. The actual relations that an object has with
--- other objects are defined as an AtkRelationSet, which is a set of
--- AtkRelations.
---
--- ---
---
---@class Atk.Relation : GObject.Object
---@field parent GObject.Object
---@field target unknown[]
---@field relationship Atk.RelationType
---@operator call: Atk.Relation
Atk.Relation = {}

--- # method Atk.Relation:add_target()
---
--- Adds the specified AtkObject to the target for the relation, if it is
--- not already present.  See also `atk_object_add_relationship()`.
---
--- ---
---
---@param self Atk.Relation # an `AtkRelation`
---@param target Atk.Object # an `AtkObject`
---@return nil
function Atk.Relation:add_target(target) end

--- # method Atk.Relation:get_relation_type()
---
--- Gets the type of `relation`
---
--- ---
---
---@param self Atk.Relation # an `AtkRelation`
---@return Atk.RelationType # the type of `relation`
function Atk.Relation:get_relation_type() end

--- # method Atk.Relation:get_target()
---
--- Gets the target list of `relation`
---
--- ---
---
---@param self Atk.Relation # an `AtkRelation`
---@return unknown[] # the target list of `relation`
function Atk.Relation:get_target() end

--- # method Atk.Relation:remove_target()
---
--- Remove the specified AtkObject from the target for the relation.
---
--- ---
---
---@param self Atk.Relation # an `AtkRelation`
---@param target Atk.Object # an `AtkObject`
---@return (boolean|nil) # TRUE if the removal is successful.
function Atk.Relation:remove_target(target) end

--- # function Atk.Relation.new()
---
--- Create a new relation for the specified key and the specified list
--- of targets.  See also `atk_object_add_relationship()`.
---
--- ---
---
---@param targets unknown[] # an array of pointers to `AtkObjects`
---@param n_targets integer # number of `AtkObjects` pointed to by `targets`
---@param relationship Atk.RelationType # an `AtkRelationType` with which to create the new `AtkRelation`
---@return Atk.Relation # a pointer to a new `AtkRelation`
function Atk.Relation.new(targets, n_targets, relationship) end

--- # record Atk.RelationClass
---
---@class Atk.RelationClass
---@field parent GObject.ObjectClass
Atk.RelationClass = {}

--- # class Atk.RelationSet
---
--- A set of AtkRelations, normally the set of
---  AtkRelations which an AtkObject has.
--- 
--- The AtkRelationSet held by an object establishes its relationships
--- with objects beyond the normal "parent/child" hierarchical
--- relationships that all user interface objects have.
--- AtkRelationSets establish whether objects are labelled or
--- controlled by other components, share group membership with other
--- components (for instance within a radio-button group), or share
--- content which "flows" between them, among other types of possible
--- relationships.
---
--- ---
---
---@class Atk.RelationSet : GObject.Object
---@field parent GObject.Object
---@field relations unknown[]
---@operator call: Atk.RelationSet
Atk.RelationSet = {}

--- # method Atk.RelationSet:add()
---
--- Add a new relation to the current relation set if it is not already
--- present.
--- This function ref's the AtkRelation so the caller of this function
--- should unref it to ensure that it will be destroyed when the AtkRelationSet
--- is destroyed.
---
--- ---
---
---@param self Atk.RelationSet # an `AtkRelationSet`
---@param relation Atk.Relation # an `AtkRelation`
---@return nil
function Atk.RelationSet:add(relation) end

--- # method Atk.RelationSet:add_relation_by_type()
---
--- Add a new relation of the specified type with the specified target to
--- the current relation set if the relation set does not contain a relation
--- of that type. If it is does contain a relation of that typea the target
--- is added to the relation.
---
--- ---
---
---@param self Atk.RelationSet # an `AtkRelationSet`
---@param relationship Atk.RelationType # an `AtkRelationType`
---@param target Atk.Object # an `AtkObject`
---@return nil
function Atk.RelationSet:add_relation_by_type(relationship, target) end

--- # method Atk.RelationSet:contains()
---
--- Determines whether the relation set contains a relation that matches the
--- specified type.
---
--- ---
---
---@param self Atk.RelationSet # an `AtkRelationSet`
---@param relationship Atk.RelationType # an `AtkRelationType`
---@return (boolean|nil) # `true` if `relationship` is the relationship type of a relation in `set`, `false` otherwise
function Atk.RelationSet:contains(relationship) end

--- # method Atk.RelationSet:contains_target()
---
--- Determines whether the relation set contains a relation that
--- matches the specified pair formed by type `relationship` and object
--- `target`.
---
--- ---
---
---@param self Atk.RelationSet # an `AtkRelationSet`
---@param relationship Atk.RelationType # an `AtkRelationType`
---@param target Atk.Object # an `AtkObject`
---@return (boolean|nil) # `true` if `set` contains a relation with the relationship type `relationship` with an object `target`, `false` otherwise
function Atk.RelationSet:contains_target(relationship, target) end

--- # method Atk.RelationSet:get_n_relations()
---
--- Determines the number of relations in a relation set.
---
--- ---
---
---@param self Atk.RelationSet # an `AtkRelationSet`
---@return integer # an integer representing the number of relations in the set.
function Atk.RelationSet:get_n_relations() end

--- # method Atk.RelationSet:get_relation()
---
--- Determines the relation at the specified position in the relation set.
---
--- ---
---
---@param self Atk.RelationSet # an `AtkRelationSet`
---@param i integer # a gint representing a position in the set, starting from 0.
---@return Atk.Relation # a `AtkRelation`, which is the relation at position i in the set.
function Atk.RelationSet:get_relation(i) end

--- # method Atk.RelationSet:get_relation_by_type()
---
--- Finds a relation that matches the specified type.
---
--- ---
---
---@param self Atk.RelationSet # an `AtkRelationSet`
---@param relationship Atk.RelationType # an `AtkRelationType`
---@return Atk.Relation # an `AtkRelation`, which is a relation matching the specified type.
function Atk.RelationSet:get_relation_by_type(relationship) end

--- # method Atk.RelationSet:remove()
---
--- Removes a relation from the relation set.
--- This function unref's the `AtkRelation` so it will be deleted unless there
--- is another reference to it.
---
--- ---
---
---@param self Atk.RelationSet # an `AtkRelationSet`
---@param relation Atk.Relation # an `AtkRelation`
---@return nil
function Atk.RelationSet:remove(relation) end

--- # function Atk.RelationSet.new()
---
--- Creates a new empty relation set.
---
--- ---
---
---@return Atk.RelationSet # a new `AtkRelationSet`
function Atk.RelationSet.new() end

--- # record Atk.RelationSetClass
---
---@class Atk.RelationSetClass
---@field parent GObject.ObjectClass
---@field pad1 Atk.Function
---@field pad2 Atk.Function
Atk.RelationSetClass = {}

---@enum Atk.RelationType
Atk.RelationType = {}

---@enum Atk.Role
Atk.Role = {}

---@enum Atk.ScrollType
Atk.ScrollType = {}

--- # interface Atk.Selection
---
--- The ATK interface implemented by container objects whose `AtkObject` children can be selected.
--- 
--- `AtkSelection` should be implemented by UI components with children
--- which are exposed by `atk_object_ref_child` and
--- `atk_object_get_n_children`, if the use of the parent UI component
--- ordinarily involves selection of one or more of the objects
--- corresponding to those `AtkObject` children - for example,
--- selectable lists.
--- 
--- Note that other types of "selection" (for instance text selection)
--- are accomplished a other ATK interfaces - `AtkSelection` is limited
--- to the selection/deselection of children.
---
--- ---
---
---@class Atk.Selection
Atk.Selection = {}

--- # method Atk.Selection:add_selection()
---
--- Adds the specified accessible child of the object to the
--- object's selection.
---
--- ---
---
---@param self Atk.Selection # a `GObject` instance that implements AtkSelectionIface
---@param i integer # a `gint` specifying the child index.
---@return (boolean|nil) # TRUE if success, FALSE otherwise.
function Atk.Selection:add_selection(i) end

--- # method Atk.Selection:clear_selection()
---
--- Clears the selection in the object so that no children in the object
--- are selected.
---
--- ---
---
---@param self Atk.Selection # a `GObject` instance that implements AtkSelectionIface
---@return (boolean|nil) # TRUE if success, FALSE otherwise.
function Atk.Selection:clear_selection() end

--- # method Atk.Selection:get_selection_count()
---
--- Gets the number of accessible children currently selected.
--- Note: callers should not rely on `nil` or on a zero value for
--- indication of whether AtkSelectionIface is implemented, they should
--- use type checking/interface checking macros or the
--- `atk_get_accessible_value()` convenience method.
---
--- ---
---
---@param self Atk.Selection # a `GObject` instance that implements AtkSelectionIface
---@return integer # a gint representing the number of items selected, or 0 if `selection` does not implement this interface.
function Atk.Selection:get_selection_count() end

--- # method Atk.Selection:is_child_selected()
---
--- Determines if the current child of this object is selected
--- Note: callers should not rely on `nil` or on a zero value for
--- indication of whether AtkSelectionIface is implemented, they should
--- use type checking/interface checking macros or the
--- `atk_get_accessible_value()` convenience method.
---
--- ---
---
---@param self Atk.Selection # a `GObject` instance that implements AtkSelectionIface
---@param i integer # a `gint` specifying the child index.
---@return (boolean|nil) # a gboolean representing the specified child is selected, or 0 if `selection` does not implement this interface.
function Atk.Selection:is_child_selected(i) end

--- # method Atk.Selection:ref_selection()
---
--- Gets a reference to the accessible object representing the specified
--- selected child of the object.
--- Note: callers should not rely on `nil` or on a zero value for
--- indication of whether AtkSelectionIface is implemented, they should
--- use type checking/interface checking macros or the
--- `atk_get_accessible_value()` convenience method.
---
--- ---
---
---@param self Atk.Selection # a `GObject` instance that implements AtkSelectionIface
---@param i integer # a `gint` specifying the index in the selection set. (e.g. the ith selection as opposed to the ith child).
---@return Atk.Object # an `AtkObject` representing the selected accessible, or `nil` if `selection` does not implement this interface.
function Atk.Selection:ref_selection(i) end

--- # method Atk.Selection:remove_selection()
---
--- Removes the specified child of the object from the object's selection.
---
--- ---
---
---@param self Atk.Selection # a `GObject` instance that implements AtkSelectionIface
---@param i integer # a `gint` specifying the index in the selection set. (e.g. the ith selection as opposed to the ith child).
---@return (boolean|nil) # TRUE if success, FALSE otherwise.
function Atk.Selection:remove_selection(i) end

--- # method Atk.Selection:select_all_selection()
---
--- Causes every child of the object to be selected if the object
--- supports multiple selections.
---
--- ---
---
---@param self Atk.Selection # a `GObject` instance that implements AtkSelectionIface
---@return (boolean|nil) # TRUE if success, FALSE otherwise.
function Atk.Selection:select_all_selection() end

--- # record Atk.SelectionIface
---
---@class Atk.SelectionIface
---@field parent GObject.TypeInterface
---@field add_selection fun(selection: Atk.Selection, i: integer): (boolean|nil)
---@field clear_selection fun(selection: Atk.Selection): (boolean|nil)
---@field ref_selection fun(selection: Atk.Selection, i: integer): Atk.Object
---@field get_selection_count fun(selection: Atk.Selection): integer
---@field is_child_selected fun(selection: Atk.Selection, i: integer): (boolean|nil)
---@field remove_selection fun(selection: Atk.Selection, i: integer): (boolean|nil)
---@field select_all_selection fun(selection: Atk.Selection): (boolean|nil)
---@field selection_changed fun(selection: Atk.Selection): nil
Atk.SelectionIface = {}

--- # class Atk.Socket
---
--- Container for AtkPlug objects from other processes
--- 
--- Together with `AtkPlug`, `AtkSocket` provides the ability to embed
--- accessibles from one process into another in a fashion that is
--- transparent to assistive technologies. `AtkSocket` works as the
--- container of `AtkPlug`, embedding it using the method
--- `atk_socket_embed()`. Any accessible contained in the `AtkPlug` will
--- appear to the assistive technologies as being inside the
--- application that created the `AtkSocket`.
--- 
--- The communication between a `AtkSocket` and a `AtkPlug` is done by
--- the IPC layer of the accessibility framework, normally implemented
--- by the D-Bus based implementation of AT-SPI (at-spi2). If that is
--- the case, at-spi-atk2 is the responsible to implement the abstract
--- methods `atk_plug_get_id()` and `atk_socket_embed()`, so an ATK
--- implementor shouldn't reimplement them. The process that contains
--- the `AtkPlug` is responsible to send the ID returned by
--- `atk_plug_id()` to the process that contains the `AtkSocket`, so it
--- could call the method `atk_socket_embed()` in order to embed it.
--- 
--- For the same reasons, an implementor doesn't need to implement
--- `atk_object_get_n_accessible_children()` and
--- `atk_object_ref_accessible_child()`. All the logic related to those
--- functions will be implemented by the IPC layer.
--- 
--- See [class`AtkPlug`]
---
--- ---
---
---@class Atk.Socket : Atk.Object, Atk.Component
---@field parent Atk.Object
---@field embedded_plug_id string
---@operator call: Atk.Socket
Atk.Socket = {}

--- # method Atk.Socket:embed()
---
--- Embeds the children of an `AtkPlug` as the children of the
--- `AtkSocket`. The plug may be in the same process or in a different
--- process.
--- 
--- The class item used by this function should be filled in by the IPC
--- layer (usually at-spi2-atk). The implementor of the AtkSocket
--- should call this function and pass the id for the plug as returned
--- by `atk_plug_get_id()`.  It is the responsibility of the application
--- to pass the plug id on to the process implementing the `AtkSocket`
--- as needed.
---
--- ---
---
---@param self Atk.Socket # an `AtkSocket`
---@param plug_id string # the ID of an `AtkPlug`
---@return nil
function Atk.Socket:embed(plug_id) end

--- # method Atk.Socket:is_occupied()
---
--- Determines whether or not the socket has an embedded plug.
---
--- ---
---
---@param self Atk.Socket # an `AtkSocket`
---@return (boolean|nil) # TRUE if a plug is embedded in the socket
function Atk.Socket:is_occupied() end

--- # function Atk.Socket.new()
---
--- Creates a new `AtkSocket`.
---
--- ---
---
---@return Atk.Object # the newly created `AtkSocket` instance
function Atk.Socket.new() end

--- # record Atk.SocketClass
---
---@class Atk.SocketClass
---@field parent_class Atk.ObjectClass
---@field embed fun(obj: Atk.Socket, plug_id: string): nil
Atk.SocketClass = {}

--- # class Atk.StateSet
---
--- An AtkStateSet contains the states of an object.
--- 
--- An AtkStateSet is a read-only representation of the full set of `AtkStates`
--- that apply to an object at a given time. This set is not meant to be
--- modified, but rather created when `atk_object_ref_state_set`() is called.
---
--- ---
---
---@class Atk.StateSet : GObject.Object
---@field parent GObject.Object
---@operator call: Atk.StateSet
Atk.StateSet = {}

--- # method Atk.StateSet:add_state()
---
--- Adds the state of the specified type to the state set if it is not already
--- present.
--- 
--- Note that because an `AtkStateSet` is a read-only object, this method should
--- be used to add a state to a newly-created set which will then be returned by
--- `atk_object_ref_state_set`. It should not be used to modify the existing state
--- of an object. See also `atk_object_notify_state_change`.
---
--- ---
---
---@param self Atk.StateSet # an `AtkStateSet`
---@param type Atk.StateType # an `AtkStateType`
---@return (boolean|nil) # `true` if the state for `type` is not already in `set`.
function Atk.StateSet:add_state(type) end

--- # method Atk.StateSet:add_states()
---
--- Adds the states of the specified types to the state set.
--- 
--- Note that because an `AtkStateSet` is a read-only object, this method should
--- be used to add states to a newly-created set which will then be returned by
--- `atk_object_ref_state_set`. It should not be used to modify the existing state
--- of an object. See also `atk_object_notify_state_change`.
---
--- ---
---
---@param self Atk.StateSet # an `AtkStateSet`
---@param types unknown[] # an array of `AtkStateType`
---@param n_types integer # The number of elements in the array
---@return nil
function Atk.StateSet:add_states(types, n_types) end

--- # method Atk.StateSet:and_sets()
---
--- Constructs the intersection of the two sets, returning `nil` if the
--- intersection is empty.
---
--- ---
---
---@param self Atk.StateSet # an `AtkStateSet`
---@param compare_set Atk.StateSet # another `AtkStateSet`
---@return Atk.StateSet # a new `AtkStateSet` which is the intersection of the two sets.
function Atk.StateSet:and_sets(compare_set) end

--- # method Atk.StateSet:clear_states()
---
--- Removes all states from the state set.
---
--- ---
---
---@param self Atk.StateSet # an `AtkStateSet`
---@return nil
function Atk.StateSet:clear_states() end

--- # method Atk.StateSet:contains_state()
---
--- Checks whether the state for the specified type is in the specified set.
---
--- ---
---
---@param self Atk.StateSet # an `AtkStateSet`
---@param type Atk.StateType # an `AtkStateType`
---@return (boolean|nil) # `true` if `type` is the state type is in `set`.
function Atk.StateSet:contains_state(type) end

--- # method Atk.StateSet:contains_states()
---
--- Checks whether the states for all the specified types are in the
--- specified set.
---
--- ---
---
---@param self Atk.StateSet # an `AtkStateSet`
---@param types unknown[] # an array of `AtkStateType`
---@param n_types integer # The number of elements in the array
---@return (boolean|nil) # `true` if all the states for `type` are in `set`.
function Atk.StateSet:contains_states(types, n_types) end

--- # method Atk.StateSet:is_empty()
---
--- Checks whether the state set is empty, i.e. has no states set.
---
--- ---
---
---@param self Atk.StateSet # an `AtkStateType`
---@return (boolean|nil) # `true` if `set` has no states set, otherwise `false`
function Atk.StateSet:is_empty() end

--- # method Atk.StateSet:or_sets()
---
--- Constructs the union of the two sets.
---
--- ---
---
---@param self Atk.StateSet # an `AtkStateSet`
---@param compare_set Atk.StateSet # another `AtkStateSet`
---@return Atk.StateSet # a new `AtkStateSet` which is the union of the two sets, returning `nil` is empty.
function Atk.StateSet:or_sets(compare_set) end

--- # method Atk.StateSet:remove_state()
---
--- Removes the state for the specified type from the state set.
--- 
--- Note that because an `AtkStateSet` is a read-only object, this method should
--- be used to remove a state to a newly-created set which will then be returned
--- by `atk_object_ref_state_set`. It should not be used to modify the existing
--- state of an object. See also `atk_object_notify_state_change`.
---
--- ---
---
---@param self Atk.StateSet # an `AtkStateSet`
---@param type Atk.StateType # an `AtkType`
---@return (boolean|nil) # `true` if `type` was the state type is in `set`.
function Atk.StateSet:remove_state(type) end

--- # method Atk.StateSet:xor_sets()
---
--- Constructs the exclusive-or of the two sets, returning `nil` is empty.
--- The set returned by this operation contains the states in exactly
--- one of the two sets.
---
--- ---
---
---@param self Atk.StateSet # an `AtkStateSet`
---@param compare_set Atk.StateSet # another `AtkStateSet`
---@return Atk.StateSet # a new `AtkStateSet` which contains the states which are in exactly one of the two sets.
function Atk.StateSet:xor_sets(compare_set) end

--- # function Atk.StateSet.new()
---
--- Creates a new empty state set.
---
--- ---
---
---@return Atk.StateSet # a new `AtkStateSet`
function Atk.StateSet.new() end

--- # record Atk.StateSetClass
---
---@class Atk.StateSetClass
---@field parent GObject.ObjectClass
Atk.StateSetClass = {}

---@enum Atk.StateType
Atk.StateType = {}

--- # interface Atk.StreamableContent
---
--- The ATK interface which provides access to streamable content.
--- 
--- An interface whereby an object allows its backing content to be
--- streamed to clients.  Typical implementors would be images or
--- icons, HTML content, or multimedia display/rendering widgets.
--- 
--- Negotiation of content type is allowed. Clients may examine the
--- backing data and transform, convert, or parse the content in order
--- to present it in an alternate form to end-users.
--- 
--- The AtkStreamableContent interface is particularly useful for
--- saving, printing, or post-processing entire documents, or for
--- persisting alternate views of a document. If document content
--- itself is being serialized, stored, or converted, then use of the
--- AtkStreamableContent interface can help address performance
--- issues. Unlike most ATK interfaces, this interface is not strongly
--- tied to the current user-agent view of the a particular document,
--- but may in some cases give access to the underlying model data.
---
--- ---
---
---@class Atk.StreamableContent
Atk.StreamableContent = {}

--- # method Atk.StreamableContent:get_mime_type()
---
--- Gets the character string of the specified mime type. The first mime
--- type is at position 0, the second at position 1, and so on.
---
--- ---
---
---@param self Atk.StreamableContent # a GObject instance that implements AtkStreamableContent
---@param i integer # a gint representing the position of the mime type starting from 0
---@return string # a gchar* representing the specified mime type; the caller should not free the character string.
function Atk.StreamableContent:get_mime_type(i) end

--- # method Atk.StreamableContent:get_n_mime_types()
---
--- Gets the number of mime types supported by this object.
---
--- ---
---
---@param self Atk.StreamableContent # a GObject instance that implements AtkStreamableContentIface
---@return integer # a gint which is the number of mime types supported by the object.
function Atk.StreamableContent:get_n_mime_types() end

--- # method Atk.StreamableContent:get_stream()
---
--- Gets the content in the specified mime type.
---
--- ---
---
---@param self Atk.StreamableContent # a GObject instance that implements AtkStreamableContentIface
---@param mime_type string # a gchar* representing the mime type
---@return GLib.IOChannel # A `GIOChannel` which contains the content in the specified mime type.
function Atk.StreamableContent:get_stream(mime_type) end

--- # method Atk.StreamableContent:get_uri()
---
--- Get a string representing a URI in IETF standard format
--- (see http://www.ietf.org/rfc/rfc2396.txt) from which the object's content
--- may be streamed in the specified mime-type, if one is available.
--- If mime_type is NULL, the URI for the default (and possibly only) mime-type is
--- returned.
--- 
--- Note that it is possible for get_uri to return NULL but for
--- get_stream to work nonetheless, since not all GIOChannels connect to URIs.
---
--- ---
---
---@param self Atk.StreamableContent # a GObject instance that implements AtkStreamableContentIface
---@param mime_type string # a gchar* representing the mime type, or NULL to request a URI for the default mime type.
---@return string # Returns a string representing a URI, or `nil` if no corresponding URI can be constructed.
function Atk.StreamableContent:get_uri(mime_type) end

--- # record Atk.StreamableContentIface
---
---@class Atk.StreamableContentIface
---@field parent GObject.TypeInterface
---@field get_n_mime_types fun(streamable: Atk.StreamableContent): integer
---@field get_mime_type fun(streamable: Atk.StreamableContent, i: integer): string
---@field get_stream fun(streamable: Atk.StreamableContent, mime_type: string): GLib.IOChannel
---@field get_uri fun(streamable: Atk.StreamableContent, mime_type: string): string
---@field pad1 Atk.Function
---@field pad2 Atk.Function
---@field pad3 Atk.Function
Atk.StreamableContentIface = {}

--- # interface Atk.Table
---
--- The ATK interface implemented for UI components which contain tabular or row/column information.
--- 
--- `AtkTable` should be implemented by components which present
--- elements ordered via rows and columns.  It may also be used to
--- present tree-structured information if the nodes of the trees can
--- be said to contain multiple "columns".  Individual elements of an
--- `AtkTable` are typically referred to as "cells". Those cells should
--- implement the interface `AtkTableCell`, but `Atk` doesn't require
--- them to be direct children of the current `AtkTable`. They can be
--- grand-children, grand-grand-children etc. `AtkTable` provides the
--- API needed to get a individual cell based on the row and column
--- numbers.
--- 
--- Children of `AtkTable` are frequently "lightweight" objects, that
--- is, they may not have backing widgets in the host UI toolkit.  They
--- are therefore often transient.
--- 
--- Since tables are often very complex, `AtkTable` includes provision
--- for offering simplified summary information, as well as row and
--- column headers and captions.  Headers and captions are `AtkObjects`
--- which may implement other interfaces (`AtkText`, `AtkImage`, etc.) as
--- appropriate.  `AtkTable` summaries may themselves be (simplified)
--- `AtkTables`, etc.
--- 
--- Note for implementors: in the past, `AtkTable` required that all the
--- cells should be direct children of `AtkTable`, and provided some
--- index based methods to request the cells. The practice showed that
--- that forcing made `AtkTable` implementation complex, and hard to
--- expose other kind of children, like rows or captions. Right now,
--- index-based methods are deprecated.
---
--- ---
---
---@class Atk.Table
Atk.Table = {}

--- # method Atk.Table:add_column_selection()
---
--- Adds the specified `column` to the selection.
---
--- ---
---
---@param self table<unknown, unknown> # a GObject instance that implements AtkTableIface
---@param column integer # a `gint` representing a column in `table`
---@return (boolean|nil) # a gboolean representing if the column was successfully added to the selection, or 0 if value does not implement this interface.
function Atk.Table:add_column_selection(column) end

--- # method Atk.Table:add_row_selection()
---
--- Adds the specified `row` to the selection.
---
--- ---
---
---@param self table<unknown, unknown> # a GObject instance that implements AtkTableIface
---@param row integer # a `gint` representing a row in `table`
---@return (boolean|nil) # a gboolean representing if row was successfully added to selection, or 0 if value does not implement this interface.
function Atk.Table:add_row_selection(row) end

--- # method Atk.Table:get_caption()
---
--- Gets the caption for the `table`.
---
--- ---
---
---@param self table<unknown, unknown> # a GObject instance that implements AtkTableInterface
---@return Atk.Object # a AtkObject* representing the table caption, or `nil` if value does not implement this interface.
function Atk.Table:get_caption() end

--- # method Atk.Table:get_column_at_index()
---
--- Gets a `gint` representing the column at the specified `index_`.
---
--- ---
---
---@param self table<unknown, unknown> # a GObject instance that implements AtkTableInterface
---@param index_ integer # a `gint` representing an index in `table`
---@return integer # a gint representing the column at the specified index, or -1 if the table does not implement this method.
function Atk.Table:get_column_at_index(index_) end

--- # method Atk.Table:get_column_description()
---
--- Gets the description text of the specified `column` in the table
---
--- ---
---
---@param self table<unknown, unknown> # a GObject instance that implements AtkTableIface
---@param column integer # a `gint` representing a column in `table`
---@return string # a gchar* representing the column description, or `nil` if value does not implement this interface.
function Atk.Table:get_column_description(column) end

--- # method Atk.Table:get_column_extent_at()
---
--- Gets the number of columns occupied by the accessible object
--- at the specified `row` and `column` in the `table`.
---
--- ---
---
---@param self table<unknown, unknown> # a GObject instance that implements AtkTableIface
---@param row integer # a `gint` representing a row in `table`
---@param column integer # a `gint` representing a column in `table`
---@return integer # a gint representing the column extent at specified position, or 0 if value does not implement this interface.
function Atk.Table:get_column_extent_at(row, column) end

--- # method Atk.Table:get_column_header()
---
--- Gets the column header of a specified column in an accessible table.
---
--- ---
---
---@param self table<unknown, unknown> # a GObject instance that implements AtkTableIface
---@param column integer # a `gint` representing a column in the table
---@return Atk.Object # a AtkObject* representing the specified column header, or `nil` if value does not implement this interface.
function Atk.Table:get_column_header(column) end

--- # method Atk.Table:get_index_at()
---
--- Gets a `gint` representing the index at the specified `row` and
--- `column`.
---
--- ---
---
---@param self table<unknown, unknown> # a GObject instance that implements AtkTableIface
---@param row integer # a `gint` representing a row in `table`
---@param column integer # a `gint` representing a column in `table`
---@return integer # a `gint` representing the index at specified position. The value -1 is returned if the object at row,column is not a child of table or table does not implement this interface.
function Atk.Table:get_index_at(row, column) end

--- # method Atk.Table:get_n_columns()
---
--- Gets the number of columns in the table.
---
--- ---
---
---@param self table<unknown, unknown> # a GObject instance that implements AtkTableIface
---@return integer # a gint representing the number of columns, or 0 if value does not implement this interface.
function Atk.Table:get_n_columns() end

--- # method Atk.Table:get_n_rows()
---
--- Gets the number of rows in the table.
---
--- ---
---
---@param self table<unknown, unknown> # a GObject instance that implements AtkTableIface
---@return integer # a gint representing the number of rows, or 0 if value does not implement this interface.
function Atk.Table:get_n_rows() end

--- # method Atk.Table:get_row_at_index()
---
--- Gets a `gint` representing the row at the specified `index_`.
---
--- ---
---
---@param self table<unknown, unknown> # a GObject instance that implements AtkTableInterface
---@param index_ integer # a `gint` representing an index in `table`
---@return integer # a gint representing the row at the specified index, or -1 if the table does not implement this method.
function Atk.Table:get_row_at_index(index_) end

--- # method Atk.Table:get_row_description()
---
--- Gets the description text of the specified row in the table
---
--- ---
---
---@param self table<unknown, unknown> # a GObject instance that implements AtkTableIface
---@param row integer # a `gint` representing a row in `table`
---@return string # a gchar* representing the row description, or `nil` if value does not implement this interface.
function Atk.Table:get_row_description(row) end

--- # method Atk.Table:get_row_extent_at()
---
--- Gets the number of rows occupied by the accessible object
--- at a specified `row` and `column` in the `table`.
---
--- ---
---
---@param self table<unknown, unknown> # a GObject instance that implements AtkTableIface
---@param row integer # a `gint` representing a row in `table`
---@param column integer # a `gint` representing a column in `table`
---@return integer # a gint representing the row extent at specified position, or 0 if value does not implement this interface.
function Atk.Table:get_row_extent_at(row, column) end

--- # method Atk.Table:get_row_header()
---
--- Gets the row header of a specified row in an accessible table.
---
--- ---
---
---@param self table<unknown, unknown> # a GObject instance that implements AtkTableIface
---@param row integer # a `gint` representing a row in the table
---@return Atk.Object # a AtkObject* representing the specified row header, or `nil` if value does not implement this interface.
function Atk.Table:get_row_header(row) end

--- # method Atk.Table:get_selected_columns()
---
--- Gets the selected columns of the table by initializing **selected with
--- the selected column numbers. This array should be freed by the caller.
---
--- ---
---
---@param self table<unknown, unknown> # a GObject instance that implements AtkTableIface
---@param selected integer # a `gint`** that is to contain the selected columns numbers
---@return integer # a gint representing the number of selected columns, or %0 if value does not implement this interface.
function Atk.Table:get_selected_columns(selected) end

--- # method Atk.Table:get_selected_rows()
---
--- Gets the selected rows of the table by initializing **selected with
--- the selected row numbers. This array should be freed by the caller.
---
--- ---
---
---@param self table<unknown, unknown> # a GObject instance that implements AtkTableIface
---@param selected integer # a `gint`** that is to contain the selected row numbers
---@return integer # a gint representing the number of selected rows, or zero if value does not implement this interface.
function Atk.Table:get_selected_rows(selected) end

--- # method Atk.Table:get_summary()
---
--- Gets the summary description of the table.
---
--- ---
---
---@param self table<unknown, unknown> # a GObject instance that implements AtkTableIface
---@return Atk.Object # a AtkObject* representing a summary description of the table, or zero if value does not implement this interface.
function Atk.Table:get_summary() end

--- # method Atk.Table:is_column_selected()
---
--- Gets a boolean value indicating whether the specified `column`
--- is selected
---
--- ---
---
---@param self table<unknown, unknown> # a GObject instance that implements AtkTableIface
---@param column integer # a `gint` representing a column in `table`
---@return (boolean|nil) # a gboolean representing if the column is selected, or 0 if value does not implement this interface.
function Atk.Table:is_column_selected(column) end

--- # method Atk.Table:is_row_selected()
---
--- Gets a boolean value indicating whether the specified `row`
--- is selected
---
--- ---
---
---@param self table<unknown, unknown> # a GObject instance that implements AtkTableIface
---@param row integer # a `gint` representing a row in `table`
---@return (boolean|nil) # a gboolean representing if the row is selected, or 0 if value does not implement this interface.
function Atk.Table:is_row_selected(row) end

--- # method Atk.Table:is_selected()
---
--- Gets a boolean value indicating whether the accessible object
--- at the specified `row` and `column` is selected
---
--- ---
---
---@param self table<unknown, unknown> # a GObject instance that implements AtkTableIface
---@param row integer # a `gint` representing a row in `table`
---@param column integer # a `gint` representing a column in `table`
---@return (boolean|nil) # a gboolean representing if the cell is selected, or 0 if value does not implement this interface.
function Atk.Table:is_selected(row, column) end

--- # method Atk.Table:ref_at()
---
--- Get a reference to the table cell at `row`, `column`. This cell
--- should implement the interface `AtkTableCell`
---
--- ---
---
---@param self table<unknown, unknown> # a GObject instance that implements AtkTableIface
---@param row integer # a `gint` representing a row in `table`
---@param column integer # a `gint` representing a column in `table`
---@return Atk.Object # an `AtkObject` representing the referred to accessible
function Atk.Table:ref_at(row, column) end

--- # method Atk.Table:remove_column_selection()
---
--- Adds the specified `column` to the selection.
---
--- ---
---
---@param self table<unknown, unknown> # a GObject instance that implements AtkTableIface
---@param column integer # a `gint` representing a column in `table`
---@return (boolean|nil) # a gboolean representing if the column was successfully removed from the selection, or 0 if value does not implement this interface.
function Atk.Table:remove_column_selection(column) end

--- # method Atk.Table:remove_row_selection()
---
--- Removes the specified `row` from the selection.
---
--- ---
---
---@param self table<unknown, unknown> # a GObject instance that implements AtkTableIface
---@param row integer # a `gint` representing a row in `table`
---@return (boolean|nil) # a gboolean representing if the row was successfully removed from the selection, or 0 if value does not implement this interface.
function Atk.Table:remove_row_selection(row) end

--- # method Atk.Table:set_caption()
---
--- Sets the caption for the table.
---
--- ---
---
---@param self table<unknown, unknown> # a GObject instance that implements AtkTableIface
---@param caption Atk.Object # a `AtkObject` representing the caption to set for `table`
---@return nil
function Atk.Table:set_caption(caption) end

--- # method Atk.Table:set_column_description()
---
--- Sets the description text for the specified `column` of the `table`.
---
--- ---
---
---@param self table<unknown, unknown> # a GObject instance that implements AtkTableIface
---@param column integer # a `gint` representing a column in `table`
---@param description string # a `gchar` representing the description text to set for the specified `column` of the `table`
---@return nil
function Atk.Table:set_column_description(column, description) end

--- # method Atk.Table:set_column_header()
---
--- Sets the specified column header to `header`.
---
--- ---
---
---@param self table<unknown, unknown> # a GObject instance that implements AtkTableIface
---@param column integer # a `gint` representing a column in `table`
---@param header Atk.Object # an `AtkTable`
---@return nil
function Atk.Table:set_column_header(column, header) end

--- # method Atk.Table:set_row_description()
---
--- Sets the description text for the specified `row` of `table`.
---
--- ---
---
---@param self table<unknown, unknown> # a GObject instance that implements AtkTableIface
---@param row integer # a `gint` representing a row in `table`
---@param description string # a `gchar` representing the description text to set for the specified `row` of `table`
---@return nil
function Atk.Table:set_row_description(row, description) end

--- # method Atk.Table:set_row_header()
---
--- Sets the specified row header to `header`.
---
--- ---
---
---@param self table<unknown, unknown> # a GObject instance that implements AtkTableIface
---@param row integer # a `gint` representing a row in `table`
---@param header Atk.Object # an `AtkTable`
---@return nil
function Atk.Table:set_row_header(row, header) end

--- # method Atk.Table:set_summary()
---
--- Sets the summary description of the table.
---
--- ---
---
---@param self table<unknown, unknown> # a GObject instance that implements AtkTableIface
---@param accessible Atk.Object # an `AtkObject` representing the summary description to set for `table`
---@return nil
function Atk.Table:set_summary(accessible) end

--- # interface Atk.TableCell
---
--- The ATK interface implemented for a cell inside a two-dimentional `AtkTable`
--- 
--- Being `AtkTable` a component which present elements ordered via rows
--- and columns, an `AtkTableCell` is the interface which each of those
--- elements, so "cells" should implement.
--- 
--- See [iface`AtkTable`]
---
--- ---
---
---@class Atk.TableCell
Atk.TableCell = {}

--- # method Atk.TableCell:get_column_header_cells()
---
--- Returns the column headers as an array of cell accessibles.
---
--- ---
---
---@param self Atk.TableCell # a GObject instance that implements AtkTableCellIface
---@return unknown[] # a GPtrArray of AtkObjects representing the column header cells.
function Atk.TableCell:get_column_header_cells() end

--- # method Atk.TableCell:get_column_span()
---
--- Returns the number of columns occupied by this cell accessible.
---
--- ---
---
---@param self Atk.TableCell # a GObject instance that implements AtkTableCellIface
---@return integer # a gint representing the number of columns occupied by this cell, or 0 if the cell does not implement this method.
function Atk.TableCell:get_column_span() end

--- # method Atk.TableCell:get_position()
---
--- Retrieves the tabular position of this cell.
---
--- ---
---
---@param self Atk.TableCell # a GObject instance that implements AtkTableCellIface
---@param row integer # the row of the given cell.
---@param column integer # the column of the given cell.
---@return (boolean|nil) # TRUE if successful; FALSE otherwise.
function Atk.TableCell:get_position(row, column) end

--- # method Atk.TableCell:get_row_column_span()
---
--- Gets the row and column indexes and span of this cell accessible.
--- 
--- Note: If the object does not implement this function, then, by default, atk
--- will implement this function by calling get_row_span and get_column_span
--- on the object.
---
--- ---
---
---@param self Atk.TableCell # a GObject instance that implements AtkTableCellIface
---@param row integer # the row index of the given cell.
---@param column integer # the column index of the given cell.
---@param row_span integer # the number of rows occupied by this cell.
---@param column_span integer # the number of columns occupied by this cell.
---@return (boolean|nil) # TRUE if successful; FALSE otherwise.
function Atk.TableCell:get_row_column_span(row, column, row_span, column_span) end

--- # method Atk.TableCell:get_row_header_cells()
---
--- Returns the row headers as an array of cell accessibles.
---
--- ---
---
---@param self Atk.TableCell # a GObject instance that implements AtkTableCellIface
---@return unknown[] # a GPtrArray of AtkObjects representing the row header cells.
function Atk.TableCell:get_row_header_cells() end

--- # method Atk.TableCell:get_row_span()
---
--- Returns the number of rows occupied by this cell accessible.
---
--- ---
---
---@param self Atk.TableCell # a GObject instance that implements AtkTableCellIface
---@return integer # a gint representing the number of rows occupied by this cell, or 0 if the cell does not implement this method.
function Atk.TableCell:get_row_span() end

--- # method Atk.TableCell:get_table()
---
--- Returns a reference to the accessible of the containing table.
---
--- ---
---
---@param self Atk.TableCell # a GObject instance that implements AtkTableCellIface
---@return Atk.Object # the atk object for the containing table.
function Atk.TableCell:get_table() end

--- # record Atk.TableCellIface
---
--- AtkTableCell is an interface for cells inside an `AtkTable`.
---
--- ---
---
---@class Atk.TableCellIface
---@field parent GObject.TypeInterface
---@field get_column_span fun(cell: Atk.TableCell): integer
---@field get_column_header_cells fun(cell: Atk.TableCell): unknown[]
---@field get_position fun(cell: Atk.TableCell, row: integer, column: integer): (boolean|nil)
---@field get_row_span fun(cell: Atk.TableCell): integer
---@field get_row_header_cells fun(cell: Atk.TableCell): unknown[]
---@field get_row_column_span fun(cell: Atk.TableCell, row: integer, column: integer, row_span: integer, column_span: integer): (boolean|nil)
---@field get_table fun(cell: Atk.TableCell): Atk.Object
Atk.TableCellIface = {}

--- # record Atk.TableIface
---
---@class Atk.TableIface
---@field parent GObject.TypeInterface
---@field ref_at fun(table: table<unknown, unknown>, row: integer, column: integer): Atk.Object
---@field get_index_at fun(table: table<unknown, unknown>, row: integer, column: integer): integer
---@field get_column_at_index fun(table: table<unknown, unknown>, index_: integer): integer
---@field get_row_at_index fun(table: table<unknown, unknown>, index_: integer): integer
---@field get_n_columns fun(table: table<unknown, unknown>): integer
---@field get_n_rows fun(table: table<unknown, unknown>): integer
---@field get_column_extent_at fun(table: table<unknown, unknown>, row: integer, column: integer): integer
---@field get_row_extent_at fun(table: table<unknown, unknown>, row: integer, column: integer): integer
---@field get_caption fun(table: table<unknown, unknown>): Atk.Object
---@field get_column_description fun(table: table<unknown, unknown>, column: integer): string
---@field get_column_header fun(table: table<unknown, unknown>, column: integer): Atk.Object
---@field get_row_description fun(table: table<unknown, unknown>, row: integer): string
---@field get_row_header fun(table: table<unknown, unknown>, row: integer): Atk.Object
---@field get_summary fun(table: table<unknown, unknown>): Atk.Object
---@field set_caption fun(table: table<unknown, unknown>, caption: Atk.Object): nil
---@field set_column_description fun(table: table<unknown, unknown>, column: integer, description: string): nil
---@field set_column_header fun(table: table<unknown, unknown>, column: integer, header: Atk.Object): nil
---@field set_row_description fun(table: table<unknown, unknown>, row: integer, description: string): nil
---@field set_row_header fun(table: table<unknown, unknown>, row: integer, header: Atk.Object): nil
---@field set_summary fun(table: table<unknown, unknown>, accessible: Atk.Object): nil
---@field get_selected_columns fun(table: table<unknown, unknown>, selected: integer): integer
---@field get_selected_rows fun(table: table<unknown, unknown>, selected: integer): integer
---@field is_column_selected fun(table: table<unknown, unknown>, column: integer): (boolean|nil)
---@field is_row_selected fun(table: table<unknown, unknown>, row: integer): (boolean|nil)
---@field is_selected fun(table: table<unknown, unknown>, row: integer, column: integer): (boolean|nil)
---@field add_row_selection fun(table: table<unknown, unknown>, row: integer): (boolean|nil)
---@field remove_row_selection fun(table: table<unknown, unknown>, row: integer): (boolean|nil)
---@field add_column_selection fun(table: table<unknown, unknown>, column: integer): (boolean|nil)
---@field remove_column_selection fun(table: table<unknown, unknown>, column: integer): (boolean|nil)
---@field row_inserted fun(table: table<unknown, unknown>, row: integer, num_inserted: integer): nil
---@field column_inserted fun(table: table<unknown, unknown>, column: integer, num_inserted: integer): nil
---@field row_deleted fun(table: table<unknown, unknown>, row: integer, num_deleted: integer): nil
---@field column_deleted fun(table: table<unknown, unknown>, column: integer, num_deleted: integer): nil
---@field row_reordered fun(table: table<unknown, unknown>): nil
---@field column_reordered fun(table: table<unknown, unknown>): nil
---@field model_changed fun(table: table<unknown, unknown>): nil
Atk.TableIface = {}

--- # interface Atk.Text
---
--- The ATK interface implemented by components with text content.
--- 
--- `AtkText` should be implemented by `AtkObjects` on behalf of widgets
--- that have text content which is either attributed or otherwise
--- non-trivial.  `AtkObjects` whose text content is simple,
--- unattributed, and very brief may expose that content via
--- `atk_object_get_name` instead; however if the text is editable,
--- multi-line, typically longer than three or four words, attributed,
--- selectable, or if the object already uses the 'name' ATK property
--- for other information, the `AtkText` interface should be used to
--- expose the text content.  In the case of editable text content,
--- `AtkEditableText` (a subtype of the `AtkText` interface) should be
--- implemented instead.
--- 
---  `AtkText` provides not only traversal facilities and change
--- notification for text content, but also caret tracking and glyph
--- bounding box calculations.  Note that the text strings are exposed
--- as UTF-8, and are therefore potentially multi-byte, and
--- caret-to-byte offset mapping makes no assumptions about the
--- character length; also bounding box glyph-to-offset mapping may be
--- complex for languages which use ligatures.
---
--- ---
---
---@class Atk.Text
Atk.Text = {}

--- # method Atk.Text:add_selection()
---
--- Adds a selection bounded by the specified offsets.
---
--- ---
---
---@param self Atk.Text # an `AtkText`
---@param start_offset integer # the starting character offset of the selected region
---@param end_offset integer # the offset of the first character after the selected region.
---@return (boolean|nil) # `true` if successful, `false` otherwise
function Atk.Text:add_selection(start_offset, end_offset) end

--- # method Atk.Text:get_bounded_ranges()
---
--- Get the ranges of text in the specified bounding box.
---
--- ---
---
---@param self Atk.Text # an `AtkText`
---@param rect Atk.TextRectangle # An AtkTextRectangle giving the dimensions of the bounding box.
---@param coord_type Atk.CoordType # Specify whether coordinates are relative to the screen or widget window.
---@param x_clip_type Atk.TextClipType # Specify the horizontal clip type.
---@param y_clip_type Atk.TextClipType # Specify the vertical clip type.
---@return unknown[] # Array of AtkTextRange. The last element of the array returned by this function will be NULL.
function Atk.Text:get_bounded_ranges(rect, coord_type, x_clip_type, y_clip_type) end

--- # method Atk.Text:get_caret_offset()
---
--- Gets the offset of the position of the caret (cursor).
---
--- ---
---
---@param self Atk.Text # an `AtkText`
---@return integer # the character offset of the position of the caret or -1 if the caret is not located inside the element or in the case of any other failure.
function Atk.Text:get_caret_offset() end

--- # method Atk.Text:get_character_at_offset()
---
--- Gets the specified text.
---
--- ---
---
---@param self Atk.Text # an `AtkText`
---@param offset integer # a character offset within `text`
---@return integer # the character at `offset` or 0 in the case of failure.
function Atk.Text:get_character_at_offset(offset) end

--- # method Atk.Text:get_character_count()
---
--- Gets the character count.
---
--- ---
---
---@param self Atk.Text # an `AtkText`
---@return integer # the number of characters or -1 in case of failure.
function Atk.Text:get_character_count() end

--- # method Atk.Text:get_character_extents()
---
--- If the extent can not be obtained (e.g. missing support), all of x, y, width,
--- height are set to -1.
--- 
--- Get the bounding box containing the glyph representing the character at
---     a particular text offset.
---
--- ---
---
---@param self Atk.Text # an `AtkText`
---@param offset integer # The offset of the text character for which bounding information is required.
---@param x? integer # Pointer for the x coordinate of the bounding box
---@param y? integer # Pointer for the y coordinate of the bounding box
---@param width? integer # Pointer for the width of the bounding box
---@param height? integer # Pointer for the height of the bounding box
---@param coords Atk.CoordType # specify whether coordinates are relative to the screen or widget window
---@return nil
function Atk.Text:get_character_extents(offset, x, y, width, height, coords) end

--- # method Atk.Text:get_default_attributes()
---
--- Creates an `AtkAttributeSet` which consists of the default values of
--- attributes for the text. See the enum AtkTextAttribute for types of text
--- attributes that can be returned. Note that other attributes may also be
--- returned.
---
--- ---
---
---@param self Atk.Text # an `AtkText`
---@return Atk.AttributeSet # an `AtkAttributeSet` which contains the default text attributes for this `AtkText`. This `AtkAttributeSet` should be freed by a call to `atk_attribute_set_free()`.
function Atk.Text:get_default_attributes() end

--- # method Atk.Text:get_n_selections()
---
--- Gets the number of selected regions.
---
--- ---
---
---@param self Atk.Text # an `AtkText`
---@return integer # The number of selected regions, or -1 in the case of failure.
function Atk.Text:get_n_selections() end

--- # method Atk.Text:get_offset_at_point()
---
--- Gets the offset of the character located at coordinates `x` and `y`. `x` and `y`
--- are interpreted as being relative to the screen or this widget's window
--- depending on `coords`.
---
--- ---
---
---@param self Atk.Text # an `AtkText`
---@param x integer # screen x-position of character
---@param y integer # screen y-position of character
---@param coords Atk.CoordType # specify whether coordinates are relative to the screen or widget window
---@return integer # the offset to the character which is located at the specified `x` and `y` coordinates of -1 in case of failure.
function Atk.Text:get_offset_at_point(x, y, coords) end

--- # method Atk.Text:get_range_extents()
---
--- Get the bounding box for text within the specified range.
--- 
--- If the extents can not be obtained (e.g. or missing support), the rectangle
--- fields are set to -1.
---
--- ---
---
---@param self Atk.Text # an `AtkText`
---@param start_offset integer # The offset of the first text character for which boundary information is required.
---@param end_offset integer # The offset of the text character after the last character for which boundary information is required.
---@param coord_type Atk.CoordType # Specify whether coordinates are relative to the screen or widget window.
---@param rect Atk.TextRectangle # A pointer to a AtkTextRectangle which is filled in by this function.
---@return nil
function Atk.Text:get_range_extents(start_offset, end_offset, coord_type, rect) end

--- # method Atk.Text:get_run_attributes()
---
--- Creates an `AtkAttributeSet` which consists of the attributes explicitly
--- set at the position `offset` in the text. `start_offset` and `end_offset` are
--- set to the start and end of the range around `offset` where the attributes are
--- invariant. Note that `end_offset` is the offset of the first character
--- after the range.  See the enum AtkTextAttribute for types of text
--- attributes that can be returned. Note that other attributes may also be
--- returned.
---
--- ---
---
---@param self Atk.Text # an `AtkText`
---@param offset integer # the character offset at which to get the attributes, -1 means the offset of the character to be inserted at the caret location.
---@param start_offset integer # the address to put the start offset of the range
---@param end_offset integer # the address to put the end offset of the range
---@return Atk.AttributeSet # an `AtkAttributeSet` which contains the attributes explicitly set at `offset`. This `AtkAttributeSet` should be freed by a call to `atk_attribute_set_free()`.
function Atk.Text:get_run_attributes(offset, start_offset, end_offset) end

--- # method Atk.Text:get_selection()
---
--- Gets the text from the specified selection.
---
--- ---
---
---@param self Atk.Text # an `AtkText`
---@param selection_num integer # The selection number. The selected regions are assigned numbers that correspond to how far the region is from the start of the text. The selected region closest to the beginning of the text region is assigned the number 0, etc. Note that adding, moving or deleting a selected region can change the numbering.
---@param start_offset integer # passes back the starting character offset of the selected region
---@param end_offset integer # passes back the ending character offset (offset immediately past) of the selected region
---@return string # a newly allocated string containing the selected text. Use `g_free()` to free the returned string.
function Atk.Text:get_selection(selection_num, start_offset, end_offset) end

--- # method Atk.Text:get_string_at_offset()
---
--- Gets a portion of the text exposed through an `AtkText` according to a given `offset`
--- and a specific `granularity`, along with the start and end offsets defining the
--- boundaries of such a portion of text.
--- 
--- If `granularity` is ATK_TEXT_GRANULARITY_CHAR the character at the
--- offset is returned.
--- 
--- If `granularity` is ATK_TEXT_GRANULARITY_WORD the returned string
--- is from the word start at or before the offset to the word start after
--- the offset.
--- 
--- The returned string will contain the word at the offset if the offset
--- is inside a word and will contain the word before the offset if the
--- offset is not inside a word.
--- 
--- If `granularity` is ATK_TEXT_GRANULARITY_SENTENCE the returned string
--- is from the sentence start at or before the offset to the sentence
--- start after the offset.
--- 
--- The returned string will contain the sentence at the offset if the offset
--- is inside a sentence and will contain the sentence before the offset
--- if the offset is not inside a sentence.
--- 
--- If `granularity` is ATK_TEXT_GRANULARITY_LINE the returned string
--- is from the line start at or before the offset to the line
--- start after the offset.
--- 
--- If `granularity` is ATK_TEXT_GRANULARITY_PARAGRAPH the returned string
--- is from the start of the paragraph at or before the offset to the start
--- of the following paragraph after the offset.
---
--- ---
---
---@param self Atk.Text # an `AtkText`
---@param offset integer # position
---@param granularity Atk.TextGranularity # An `AtkTextGranularity`
---@param start_offset integer # the starting character offset of the returned string, or -1 in the case of error (e.g. invalid offset, not implemented)
---@param end_offset integer # the offset of the first character after the returned string, or -1 in the case of error (e.g. invalid offset, not implemented)
---@return string # a newly allocated string containing the text at the `offset` bounded by the specified `granularity`. Use `g_free()` to free the returned string. Returns `nil` if the offset is invalid or no implementation is available.
function Atk.Text:get_string_at_offset(offset, granularity, start_offset, end_offset) end

--- # method Atk.Text:get_text()
---
--- Gets the specified text.
---
--- ---
---
---@param self Atk.Text # an `AtkText`
---@param start_offset integer # a starting character offset within `text`
---@param end_offset integer # an ending character offset within `text`, or -1 for the end of the string.
---@return string # a newly allocated string containing the text from `start_offset` up to, but not including `end_offset`. Use `g_free()` to free the returned string.
function Atk.Text:get_text(start_offset, end_offset) end

--- # method Atk.Text:get_text_after_offset()
---
--- Gets the specified text.
---
--- ---
---
---@param self Atk.Text # an `AtkText`
---@param offset integer # position
---@param boundary_type Atk.TextBoundary # An `AtkTextBoundary`
---@param start_offset integer # the starting character offset of the returned string
---@param end_offset integer # the offset of the first character after the returned substring
---@return string # a newly allocated string containing the text after `offset` bounded by the specified `boundary_type`. Use `g_free()` to free the returned string.
function Atk.Text:get_text_after_offset(offset, boundary_type, start_offset, end_offset) end

--- # method Atk.Text:get_text_at_offset()
---
--- Gets the specified text.
--- 
--- If the boundary_type if ATK_TEXT_BOUNDARY_CHAR the character at the
--- offset is returned.
--- 
--- If the boundary_type is ATK_TEXT_BOUNDARY_WORD_START the returned string
--- is from the word start at or before the offset to the word start after
--- the offset.
--- 
--- The returned string will contain the word at the offset if the offset
--- is inside a word and will contain the word before the offset if the
--- offset is not inside a word.
--- 
--- If the boundary type is ATK_TEXT_BOUNDARY_SENTENCE_START the returned
--- string is from the sentence start at or before the offset to the sentence
--- start after the offset.
--- 
--- The returned string will contain the sentence at the offset if the offset
--- is inside a sentence and will contain the sentence before the offset
--- if the offset is not inside a sentence.
--- 
--- If the boundary type is ATK_TEXT_BOUNDARY_LINE_START the returned
--- string is from the line start at or before the offset to the line
--- start after the offset.
---
--- ---
---
---@param self Atk.Text # an `AtkText`
---@param offset integer # position
---@param boundary_type Atk.TextBoundary # An `AtkTextBoundary`
---@param start_offset integer # the starting character offset of the returned string
---@param end_offset integer # the offset of the first character after the returned substring
---@return string # a newly allocated string containing the text at `offset` bounded by the specified `boundary_type`. Use `g_free()` to free the returned string.
function Atk.Text:get_text_at_offset(offset, boundary_type, start_offset, end_offset) end

--- # method Atk.Text:get_text_before_offset()
---
--- Gets the specified text.
---
--- ---
---
---@param self Atk.Text # an `AtkText`
---@param offset integer # position
---@param boundary_type Atk.TextBoundary # An `AtkTextBoundary`
---@param start_offset integer # the starting character offset of the returned string
---@param end_offset integer # the offset of the first character after the returned substring
---@return string # a newly allocated string containing the text before `offset` bounded by the specified `boundary_type`. Use `g_free()` to free the returned string.
function Atk.Text:get_text_before_offset(offset, boundary_type, start_offset, end_offset) end

--- # method Atk.Text:remove_selection()
---
--- Removes the specified selection.
---
--- ---
---
---@param self Atk.Text # an `AtkText`
---@param selection_num integer # The selection number. The selected regions are assigned numbers that correspond to how far the region is from the start of the text. The selected region closest to the beginning of the text region is assigned the number 0, etc. Note that adding, moving or deleting a selected region can change the numbering.
---@return (boolean|nil) # `true` if successful, `false` otherwise
function Atk.Text:remove_selection(selection_num) end

--- # method Atk.Text:scroll_substring_to()
---
--- Makes a substring of `text` visible on the screen by scrolling all necessary parents.
---
--- ---
---
---@param self Atk.Text # an `AtkText`
---@param start_offset integer # start offset in the `text`
---@param end_offset integer # end offset in the `text`, or -1 for the end of the text.
---@param type Atk.ScrollType # specify where the object should be made visible.
---@return (boolean|nil) # whether scrolling was successful.
function Atk.Text:scroll_substring_to(start_offset, end_offset, type) end

--- # method Atk.Text:scroll_substring_to_point()
---
--- Move the top-left of a substring of `text` to a given position of the screen
--- by scrolling all necessary parents.
---
--- ---
---
---@param self Atk.Text # an `AtkText`
---@param start_offset integer # start offset in the `text`
---@param end_offset integer # end offset in the `text`, or -1 for the end of the text.
---@param coords Atk.CoordType # specify whether coordinates are relative to the screen or to the parent object.
---@param x integer # x-position where to scroll to
---@param y integer # y-position where to scroll to
---@return (boolean|nil) # whether scrolling was successful.
function Atk.Text:scroll_substring_to_point(start_offset, end_offset, coords, x, y) end

--- # method Atk.Text:set_caret_offset()
---
--- Sets the caret (cursor) position to the specified `offset`.
--- 
--- In the case of rich-text content, this method should either grab focus
--- or move the sequential focus navigation starting point (if the application
--- supports this concept) as if the user had clicked on the new caret position.
--- Typically, this means that the target of this operation is the node containing
--- the new caret position or one of its ancestors. In other words, after this
--- method is called, if the user advances focus, it should move to the first
--- focusable node following the new caret position.
--- 
--- Calling this method should also scroll the application viewport in a way
--- that matches the behavior of the application's typical caret motion or tab
--- navigation as closely as possible. This also means that if the application's
--- caret motion or focus navigation does not trigger a scroll operation, this
--- method should not trigger one either. If the application does not have a caret
--- motion or focus navigation operation, this method should try to scroll the new
--- caret position into view while minimizing unnecessary scroll motion.
---
--- ---
---
---@param self Atk.Text # an `AtkText`
---@param offset integer # the character offset of the new caret position
---@return (boolean|nil) # `true` if successful, `false` otherwise.
function Atk.Text:set_caret_offset(offset) end

--- # method Atk.Text:set_selection()
---
--- Changes the start and end offset of the specified selection.
---
--- ---
---
---@param self Atk.Text # an `AtkText`
---@param selection_num integer # The selection number. The selected regions are assigned numbers that correspond to how far the region is from the start of the text. The selected region closest to the beginning of the text region is assigned the number 0, etc. Note that adding, moving or deleting a selected region can change the numbering.
---@param start_offset integer # the new starting character offset of the selection
---@param end_offset integer # the new end position of (e.g. offset immediately past) the selection
---@return (boolean|nil) # `true` if successful, `false` otherwise
function Atk.Text:set_selection(selection_num, start_offset, end_offset) end

--- # function Atk.Text.free_ranges()
---
--- Frees the memory associated with an array of AtkTextRange. It is assumed
--- that the array was returned by the function atk_text_get_bounded_ranges
--- and is NULL terminated.
---
--- ---
---
---@param ranges unknown[] # A pointer to an array of `AtkTextRange` which is to be freed.
---@return nil
function Atk.Text.free_ranges(ranges) end

---@enum Atk.TextAttribute
Atk.TextAttribute = {}

---@enum Atk.TextBoundary
Atk.TextBoundary = {}

---@enum Atk.TextClipType
Atk.TextClipType = {}

---@enum Atk.TextGranularity
Atk.TextGranularity = {}

--- # record Atk.TextIface
---
---@class Atk.TextIface
---@field parent GObject.TypeInterface
---@field get_text fun(text: Atk.Text, start_offset: integer, end_offset: integer): string
---@field get_text_after_offset fun(text: Atk.Text, offset: integer, boundary_type: Atk.TextBoundary, start_offset: integer, end_offset: integer): string
---@field get_text_at_offset fun(text: Atk.Text, offset: integer, boundary_type: Atk.TextBoundary, start_offset: integer, end_offset: integer): string
---@field get_character_at_offset fun(text: Atk.Text, offset: integer): integer
---@field get_text_before_offset fun(text: Atk.Text, offset: integer, boundary_type: Atk.TextBoundary, start_offset: integer, end_offset: integer): string
---@field get_caret_offset fun(text: Atk.Text): integer
---@field get_run_attributes fun(text: Atk.Text, offset: integer, start_offset: integer, end_offset: integer): Atk.AttributeSet
---@field get_default_attributes fun(text: Atk.Text): Atk.AttributeSet
---@field get_character_extents fun(text: Atk.Text, offset: integer, x: integer, y: integer, width: integer, height: integer, coords: Atk.CoordType): nil
---@field get_character_count fun(text: Atk.Text): integer
---@field get_offset_at_point fun(text: Atk.Text, x: integer, y: integer, coords: Atk.CoordType): integer
---@field get_n_selections fun(text: Atk.Text): integer
---@field get_selection fun(text: Atk.Text, selection_num: integer, start_offset: integer, end_offset: integer): string
---@field add_selection fun(text: Atk.Text, start_offset: integer, end_offset: integer): (boolean|nil)
---@field remove_selection fun(text: Atk.Text, selection_num: integer): (boolean|nil)
---@field set_selection fun(text: Atk.Text, selection_num: integer, start_offset: integer, end_offset: integer): (boolean|nil)
---@field set_caret_offset fun(text: Atk.Text, offset: integer): (boolean|nil)
---@field text_changed fun(text: Atk.Text, position: integer, length: integer): nil
---@field text_caret_moved fun(text: Atk.Text, location: integer): nil
---@field text_selection_changed fun(text: Atk.Text): nil
---@field text_attributes_changed fun(text: Atk.Text): nil
---@field get_range_extents fun(text: Atk.Text, start_offset: integer, end_offset: integer, coord_type: Atk.CoordType, rect: Atk.TextRectangle): nil
---@field get_bounded_ranges fun(text: Atk.Text, rect: Atk.TextRectangle, coord_type: Atk.CoordType, x_clip_type: Atk.TextClipType, y_clip_type: Atk.TextClipType): unknown[]
---@field get_string_at_offset fun(text: Atk.Text, offset: integer, granularity: Atk.TextGranularity, start_offset: integer, end_offset: integer): string
---@field scroll_substring_to fun(text: Atk.Text, start_offset: integer, end_offset: integer, type: Atk.ScrollType): (boolean|nil)
---@field scroll_substring_to_point fun(text: Atk.Text, start_offset: integer, end_offset: integer, coords: Atk.CoordType, x: integer, y: integer): (boolean|nil)
Atk.TextIface = {}

--- # record Atk.TextRange
---
--- A structure used to describe a text range.
---
--- ---
---
---@class Atk.TextRange
---@field bounds Atk.TextRectangle # A rectangle giving the bounds of the text range
---@field start_offset integer # The start offset of a AtkTextRange
---@field end_offset integer # The end offset of a AtkTextRange
---@field content string # The text in the text range
Atk.TextRange = {}

--- # record Atk.TextRectangle
---
--- A structure used to store a rectangle used by AtkText.
---
--- ---
---
---@class Atk.TextRectangle
---@field x integer # The horizontal coordinate of a rectangle
---@field y integer # The vertical coordinate of a rectangle
---@field width integer # The width of a rectangle
---@field height integer # The height of a rectangle
Atk.TextRectangle = {}

--- # class Atk.Util
---
--- A set of ATK utility functions for event and toolkit support.
--- 
--- A set of ATK utility functions which are used to support event
--- registration of various types, and obtaining the 'root' accessible
--- of a process and information about the current ATK implementation
--- and toolkit version.
---
--- ---
---
---@class Atk.Util : GObject.Object
---@field parent GObject.Object
Atk.Util = {}

--- # record Atk.UtilClass
---
---@class Atk.UtilClass
---@field parent GObject.ObjectClass
---@field remove_global_event_listener fun(listener_id: integer): nil
---@field remove_key_event_listener fun(listener_id: integer): nil
---@field get_toolkit_name fun(): string
---@field get_toolkit_version fun(): string
Atk.UtilClass = {}

--- # interface Atk.Value
---
--- The ATK interface implemented by valuators and components which display or select a value from a bounded range of values.
--- 
--- `AtkValue` should be implemented for components which either display
--- a value from a bounded range, or which allow the user to specify a
--- value from a bounded range, or both. For instance, most sliders and
--- range controls, as well as dials, should have `AtkObject`
--- representations which implement `AtkValue` on the component's
--- behalf. `AtKValues` may be read-only, in which case attempts to
--- alter the value return would fail.
--- 
--- <refsect1 id="current-value-text">
--- <title>On the subject of current value text</title>
--- <para>
--- In addition to providing the current value, implementors can
--- optionally provide an end-user-consumable textual description
--- associated with this value. This description should be included
--- when the numeric value fails to convey the full, on-screen
--- representation seen by users.
--- </para>
--- 
--- <example>
--- <title>Password strength</title>
--- A password strength meter whose value changes as the user types
--- their new password. Red is used for values less than 4.0, yellow
--- for values between 4.0 and 7.0, and green for values greater than
--- 7.0. In this instance, value text should be provided by the
--- implementor. Appropriate value text would be "weak", "acceptable,"
--- and "strong" respectively.
--- </example>
--- 
--- A level bar whose value changes to reflect the battery charge. The
--- color remains the same regardless of the charge and there is no
--- on-screen text reflecting the fullness of the battery. In this
--- case, because the position within the bar is the only indication
--- the user has of the current charge, value text should not be
--- provided by the implementor.
--- 
--- <refsect2 id="implementor-notes">
--- <title>Implementor Notes</title>
--- <para>
--- Implementors should bear in mind that assistive technologies will
--- likely prefer the value text provided over the numeric value when
--- presenting a widget's value. As a result, strings not intended for
--- end users should not be exposed in the value text, and strings
--- which are exposed should be localized. In the case of widgets which
--- display value text on screen, for instance through a separate label
--- in close proximity to the value-displaying widget, it is still
--- expected that implementors will expose the value text using the
--- above API.
--- </para>
--- 
--- <para>
--- `AtkValue` should NOT be implemented for widgets whose displayed
--- value is not reflective of a meaningful amount. For instance, a
--- progress pulse indicator whose value alternates between 0.0 and 1.0
--- to indicate that some process is still taking place should not
--- implement `AtkValue` because the current value does not reflect
--- progress towards completion.
--- </para>
--- </refsect2>
--- </refsect1>
--- 
--- <refsect1 id="ranges">
--- <title>On the subject of ranges</title>
--- <para>
--- In addition to providing the minimum and maximum values,
--- implementors can optionally provide details about subranges
--- associated with the widget. These details should be provided by the
--- implementor when both of the following are communicated visually to
--- the end user:
--- </para>
--- <itemizedlist>
---   <listitem>The existence of distinct ranges such as "weak",
---   "acceptable", and "strong" indicated by color, bar tick marks,
---   and/or on-screen text.</listitem>
---   <listitem>Where the current value stands within a given subrange,
---   for instance illustrating progression from very "weak" towards
---   nearly "acceptable" through changes in shade and/or position on
---   the bar within the "weak" subrange.</listitem>
--- </itemizedlist>
--- <para>
--- If both of the above do not apply to the widget, it should be
--- sufficient to expose the numeric value, along with the value text
--- if appropriate, to make the widget accessible.
--- </para>
--- 
--- <refsect2 id="ranges-implementor-notes">
--- <title>Implementor Notes</title>
--- <para>
--- If providing subrange details is deemed necessary, all possible
--- values of the widget are expected to fall within one of the
--- subranges defined by the implementor.
--- </para>
--- </refsect2>
--- </refsect1>
--- 
--- <refsect1 id="localization">
--- <title>On the subject of localization of end-user-consumable text
--- values</title>
--- <para>
--- Because value text and subrange descriptors are human-consumable,
--- implementors are expected to provide localized strings which can be
--- directly presented to end users via their assistive technology. In
--- order to simplify this for implementors, implementors can use
--- `atk_value_type_get_localized_name()` with the following
--- already-localized constants for commonly-needed values can be used:
--- </para>
--- 
--- <itemizedlist>
---   <listitem>ATK_VALUE_VERY_WEAK</listitem>
---   <listitem>ATK_VALUE_WEAK</listitem>
---   <listitem>ATK_VALUE_ACCEPTABLE</listitem>
---   <listitem>ATK_VALUE_STRONG</listitem>
---   <listitem>ATK_VALUE_VERY_STRONG</listitem>
---   <listitem>ATK_VALUE_VERY_LOW</listitem>
---   <listitem>ATK_VALUE_LOW</listitem>
---   <listitem>ATK_VALUE_MEDIUM</listitem>
---   <listitem>ATK_VALUE_HIGH</listitem>
---   <listitem>ATK_VALUE_VERY_HIGH</listitem>
---   <listitem>ATK_VALUE_VERY_BAD</listitem>
---   <listitem>ATK_VALUE_BAD</listitem>
---   <listitem>ATK_VALUE_GOOD</listitem>
---   <listitem>ATK_VALUE_VERY_GOOD</listitem>
---   <listitem>ATK_VALUE_BEST</listitem>
---   <listitem>ATK_VALUE_SUBSUBOPTIMAL</listitem>
---   <listitem>ATK_VALUE_SUBOPTIMAL</listitem>
---   <listitem>ATK_VALUE_OPTIMAL</listitem>
--- </itemizedlist>
--- <para>
--- Proposals for additional constants, along with their use cases,
--- should be submitted to the GNOME Accessibility Team.
--- </para>
--- </refsect1>
--- 
--- <refsect1 id="changes">
--- <title>On the subject of changes</title>
--- <para>
--- Note that if there is a textual description associated with the new
--- numeric value, that description should be included regardless of
--- whether or not it has also changed.
--- </para>
--- </refsect1>
---
--- ---
---
---@class Atk.Value
Atk.Value = {}

--- # method Atk.Value:get_current_value()
---
--- Gets the value of this object.
---
--- ---
---
---@param self Atk.Value # a GObject instance that implements AtkValueIface
---@param value GObject.Value # a `GValue` representing the current accessible value
---@return nil
function Atk.Value:get_current_value(value) end

--- # method Atk.Value:get_increment()
---
--- Gets the minimum increment by which the value of this object may be
--- changed.  If zero, the minimum increment is undefined, which may
--- mean that it is limited only by the floating point precision of the
--- platform.
---
--- ---
---
---@param self Atk.Value # a GObject instance that implements AtkValueIface
---@return number # the minimum increment by which the value of this object may be changed. zero if undefined.
function Atk.Value:get_increment() end

--- # method Atk.Value:get_maximum_value()
---
--- Gets the maximum value of this object.
---
--- ---
---
---@param self Atk.Value # a GObject instance that implements AtkValueIface
---@param value GObject.Value # a `GValue` representing the maximum accessible value
---@return nil
function Atk.Value:get_maximum_value(value) end

--- # method Atk.Value:get_minimum_increment()
---
--- Gets the minimum increment by which the value of this object may be changed.  If zero,
--- the minimum increment is undefined, which may mean that it is limited only by the
--- floating point precision of the platform.
---
--- ---
---
---@param self Atk.Value # a GObject instance that implements AtkValueIface
---@param value GObject.Value # a `GValue` representing the minimum increment by which the accessible value may be changed
---@return nil
function Atk.Value:get_minimum_increment(value) end

--- # method Atk.Value:get_minimum_value()
---
--- Gets the minimum value of this object.
---
--- ---
---
---@param self Atk.Value # a GObject instance that implements AtkValueIface
---@param value GObject.Value # a `GValue` representing the minimum accessible value
---@return nil
function Atk.Value:get_minimum_value(value) end

--- # method Atk.Value:get_range()
---
--- Gets the range of this object.
---
--- ---
---
---@param self Atk.Value # a GObject instance that implements AtkValueIface
---@return Atk.Range # a newly allocated `AtkRange` that represents the minimum, maximum and descriptor (if available) of `obj`. NULL if that range is not defined.
function Atk.Value:get_range() end

--- # method Atk.Value:get_sub_ranges()
---
--- Gets the list of subranges defined for this object. See `AtkValue`
--- introduction for examples of subranges and when to expose them.
---
--- ---
---
---@param self Atk.Value # a GObject instance that implements AtkValueIface
---@return Atk.Range[] # an `GSList` of `AtkRange` which each of the subranges defined for this object. Free the returns list with `g_slist_free()`.
function Atk.Value:get_sub_ranges() end

--- # method Atk.Value:get_value_and_text()
---
--- Gets the current value and the human readable text alternative of
--- `obj`. `text` is a newly created string, that must be freed by the
--- caller. Can be NULL if no descriptor is available.
---
--- ---
---
---@param self Atk.Value # a GObject instance that implements AtkValueIface
---@param value number # address of `gdouble` to put the current value of `obj`
---@param text? string # address of `gchar` to put the human readable text alternative for `value`
---@return nil
function Atk.Value:get_value_and_text(value, text) end

--- # method Atk.Value:set_current_value()
---
--- Sets the value of this object.
---
--- ---
---
---@param self Atk.Value # a GObject instance that implements AtkValueIface
---@param value GObject.Value # a `GValue` which is the desired new accessible value.
---@return (boolean|nil) # `true` if new value is successfully set, `false` otherwise.
function Atk.Value:set_current_value(value) end

--- # method Atk.Value:set_value()
---
--- Sets the value of this object.
--- 
--- This method is intended to provide a way to change the value of the
--- object. In any case, it is possible that the value can't be
--- modified (ie: a read-only component). If the value changes due this
--- call, it is possible that the text could change, and will trigger
--- an `AtkValue`::value-changed signal emission.
--- 
--- Note for implementors: the deprecated `atk_value_set_current_value()`
--- method returned TRUE or FALSE depending if the value was assigned
--- or not. In the practice several implementors were not able to
--- decide it, and returned TRUE in any case. For that reason it is not
--- required anymore to return if the value was properly assigned or
--- not.
---
--- ---
---
---@param self Atk.Value # a GObject instance that implements AtkValueIface
---@param new_value number # a double which is the desired new accessible value.
---@return nil
function Atk.Value:set_value(new_value) end

--- # record Atk.ValueIface
---
---@class Atk.ValueIface
---@field parent GObject.TypeInterface
---@field get_current_value fun(obj: Atk.Value, value: GObject.Value): nil
---@field get_maximum_value fun(obj: Atk.Value, value: GObject.Value): nil
---@field get_minimum_value fun(obj: Atk.Value, value: GObject.Value): nil
---@field set_current_value fun(obj: Atk.Value, value: GObject.Value): (boolean|nil)
---@field get_minimum_increment fun(obj: Atk.Value, value: GObject.Value): nil
---@field get_value_and_text fun(obj: Atk.Value, value: number, text: string): nil
---@field get_range fun(obj: Atk.Value): Atk.Range
---@field get_increment fun(obj: Atk.Value): number
---@field get_sub_ranges fun(obj: Atk.Value): Atk.Range[]
---@field set_value fun(obj: Atk.Value, new_value: number): nil
Atk.ValueIface = {}

---@enum Atk.ValueType
Atk.ValueType = {}

--- # interface Atk.Window
---
--- The ATK Interface provided by UI components that represent a top-level window.
--- 
--- `AtkWindow` should be implemented by the UI elements that represent
--- a top-level window, such as the main window of an application or
--- dialog.
--- 
--- See [class`AtkObject`]
---
--- ---
---
---@class Atk.Window
Atk.Window = {}

--- # record Atk.WindowIface
---
---@class Atk.WindowIface
---@field parent GObject.TypeInterface
Atk.WindowIface = {}

--- # function Atk.attribute_set_free()
---
--- Frees the memory used by an `AtkAttributeSet`, including all its
--- `AtkAttributes`.
---
--- ---
---
---@param attrib_set Atk.AttributeSet # The `AtkAttributeSet` to free
---@return nil
function Atk.attribute_set_free(attrib_set) end

--- # function Atk.focus_tracker_notify()
---
--- Cause the focus tracker functions which have been specified to be
--- executed for the object.
---
--- ---
---
---@param object Atk.Object # an `AtkObject`
---@return nil
function Atk.focus_tracker_notify(object) end

--- # function Atk.get_binary_age()
---
--- Returns the binary age as passed to libtool when building the ATK
--- library the process is running against.
---
--- ---
---
---@return integer # the binary age of the ATK library
function Atk.get_binary_age() end

--- # function Atk.get_default_registry()
---
--- Gets a default implementation of the `AtkObjectFactory`/type
--- registry.
--- Note: For most toolkit maintainers, this will be the correct
--- registry for registering new `AtkObject` factories. Following
--- a call to this function, maintainers may call `atk_registry_set_factory_type()`
--- to associate an `AtkObjectFactory` subclass with the GType of objects
--- for whom accessibility information will be provided.
---
--- ---
---
---@return Atk.Registry # a default implementation of the `AtkObjectFactory`/type registry
function Atk.get_default_registry() end

--- # function Atk.get_focus_object()
---
--- Gets the currently focused object.
---
--- ---
---
---@return Atk.Object # the currently focused object for the current application
function Atk.get_focus_object() end

--- # function Atk.get_interface_age()
---
--- Returns the interface age as passed to libtool when building the
--- ATK library the process is running against.
---
--- ---
---
---@return integer # the interface age of the ATK library
function Atk.get_interface_age() end

--- # function Atk.get_major_version()
---
--- Returns the major version number of the ATK library.  (e.g. in ATK
--- version 2.7.4 this is 2.)
--- 
--- This function is in the library, so it represents the ATK library
--- your code is running against. In contrast, the `ATK_MAJOR_VERSION`
--- macro represents the major version of the ATK headers you have
--- included when compiling your code.
---
--- ---
---
---@return integer # the major version number of the ATK library
function Atk.get_major_version() end

--- # function Atk.get_micro_version()
---
--- Returns the micro version number of the ATK library.  (e.g. in ATK
--- version 2.7.4 this is 4.)
--- 
--- This function is in the library, so it represents the ATK library
--- your code is are running against. In contrast, the
--- `ATK_MICRO_VERSION` macro represents the micro version of the ATK
--- headers you have included when compiling your code.
---
--- ---
---
---@return integer # the micro version number of the ATK library
function Atk.get_micro_version() end

--- # function Atk.get_minor_version()
---
--- Returns the minor version number of the ATK library.  (e.g. in ATK
--- version 2.7.4 this is 7.)
--- 
--- This function is in the library, so it represents the ATK library
--- your code is are running against. In contrast, the
--- `ATK_MINOR_VERSION` macro represents the minor version of the ATK
--- headers you have included when compiling your code.
---
--- ---
---
---@return integer # the minor version number of the ATK library
function Atk.get_minor_version() end

--- # function Atk.get_root()
---
--- Gets the root accessible container for the current application.
---
--- ---
---
---@return Atk.Object # the root accessible container for the current application
function Atk.get_root() end

--- # function Atk.get_toolkit_name()
---
--- Gets name string for the GUI toolkit implementing ATK for this application.
---
--- ---
---
---@return string # name string for the GUI toolkit implementing ATK for this application
function Atk.get_toolkit_name() end

--- # function Atk.get_toolkit_version()
---
--- Gets version string for the GUI toolkit implementing ATK for this application.
---
--- ---
---
---@return string # version string for the GUI toolkit implementing ATK for this application
function Atk.get_toolkit_version() end

--- # function Atk.get_version()
---
--- Gets the current version for ATK.
---
--- ---
---
---@return string # version string for ATK
function Atk.get_version() end

--- # function Atk.relation_type_for_name()
---
--- Get the `AtkRelationType` type corresponding to a relation name.
---
--- ---
---
---@param name string # a string which is the (non-localized) name of an ATK relation type.
---@return Atk.RelationType # the `AtkRelationType` enumerated type corresponding to the specified name, or `ATK_RELATION_NULL` if no matching relation type is found.
function Atk.relation_type_for_name(name) end

--- # function Atk.relation_type_get_name()
---
--- Gets the description string describing the `AtkRelationType` `type`.
---
--- ---
---
---@param type Atk.RelationType # The `AtkRelationType` whose name is required
---@return string # the string describing the AtkRelationType
function Atk.relation_type_get_name(type) end

--- # function Atk.relation_type_register()
---
--- Associate `name` with a new `AtkRelationType`
---
--- ---
---
---@param name string # a name string
---@return Atk.RelationType # an `AtkRelationType` associated with `name`
function Atk.relation_type_register(name) end

--- # function Atk.remove_focus_tracker()
---
--- Removes the specified focus tracker from the list of functions
--- to be called when any object receives focus.
---
--- ---
---
---@param tracker_id integer # the id of the focus tracker to remove
---@return nil
function Atk.remove_focus_tracker(tracker_id) end

--- # function Atk.remove_global_event_listener()
---
--- `listener_id` is the value returned by `atk_add_global_event_listener`
--- when you registered that event listener.
--- 
--- Toolkit implementor note: ATK provides a default implementation for
--- this virtual method. ATK implementors are discouraged from
--- reimplementing this method.
--- 
--- Toolkit implementor note: this method is not intended to be used by
--- ATK implementors but by ATK consumers.
--- 
--- Removes the specified event listener
---
--- ---
---
---@param listener_id integer # the id of the event listener to remove
---@return nil
function Atk.remove_global_event_listener(listener_id) end

--- # function Atk.remove_key_event_listener()
---
--- `listener_id` is the value returned by `atk_add_key_event_listener`
--- when you registered that event listener.
--- 
--- Removes the specified event listener.
---
--- ---
---
---@param listener_id integer # the id of the event listener to remove
---@return nil
function Atk.remove_key_event_listener(listener_id) end

--- # function Atk.role_for_name()
---
--- Get the `AtkRole` type corresponding to a rolew name.
---
--- ---
---
---@param name string # a string which is the (non-localized) name of an ATK role.
---@return Atk.Role # the `AtkRole` enumerated type corresponding to the specified name, or `ATK_ROLE_INVALID` if no matching role is found.
function Atk.role_for_name(name) end

--- # function Atk.role_get_localized_name()
---
--- Gets the localized description string describing the `AtkRole` `role`.
---
--- ---
---
---@param role Atk.Role # The `AtkRole` whose localized name is required
---@return string # the localized string describing the AtkRole
function Atk.role_get_localized_name(role) end

--- # function Atk.role_get_name()
---
--- Gets the description string describing the `AtkRole` `role`.
---
--- ---
---
---@param role Atk.Role # The `AtkRole` whose name is required
---@return string # the string describing the AtkRole
function Atk.role_get_name(role) end

--- # function Atk.role_register()
---
--- Registers the role specified by `name`. `name` must be a meaningful
--- name. So it should not be empty, or consisting on whitespaces.
---
--- ---
---
---@param name string # a character string describing the new role.
---@return Atk.Role # an `AtkRole` for the new role if added properly. ATK_ROLE_INVALID in case of error.
function Atk.role_register(name) end

--- # function Atk.state_type_for_name()
---
--- Gets the `AtkStateType` corresponding to the description string `name`.
---
--- ---
---
---@param name string # a character string state name
---@return Atk.StateType # an `AtkStateType` corresponding to `name`
function Atk.state_type_for_name(name) end

--- # function Atk.state_type_get_name()
---
--- Gets the description string describing the `AtkStateType` `type`.
---
--- ---
---
---@param type Atk.StateType # The `AtkStateType` whose name is required
---@return string # the string describing the AtkStateType
function Atk.state_type_get_name(type) end

--- # function Atk.state_type_register()
---
--- Register a new object state.
---
--- ---
---
---@param name string # a character string describing the new state.
---@return Atk.StateType # an `AtkState` value for the new state.
function Atk.state_type_register(name) end

--- # function Atk.text_attribute_for_name()
---
--- Get the `AtkTextAttribute` type corresponding to a text attribute name.
---
--- ---
---
---@param name string # a string which is the (non-localized) name of an ATK text attribute.
---@return Atk.TextAttribute # the `AtkTextAttribute` enumerated type corresponding to the specified name, or `ATK_TEXT_ATTRIBUTE_INVALID` if no matching text attribute is found.
function Atk.text_attribute_for_name(name) end

--- # function Atk.text_attribute_get_name()
---
--- Gets the name corresponding to the `AtkTextAttribute`
---
--- ---
---
---@param attr Atk.TextAttribute # The `AtkTextAttribute` whose name is required
---@return string # a string containing the name; this string should not be freed
function Atk.text_attribute_get_name(attr) end

--- # function Atk.text_attribute_get_value()
---
--- Gets the value for the index of the `AtkTextAttribute`
---
--- ---
---
---@param attr Atk.TextAttribute # The `AtkTextAttribute` for which a value is required
---@param index_ integer # The index of the required value
---@return string # a string containing the value; this string should not be freed; `nil` is returned if there are no values maintained for the attr value.
function Atk.text_attribute_get_value(attr, index_) end

--- # function Atk.text_attribute_register()
---
--- Associate `name` with a new `AtkTextAttribute`
---
--- ---
---
---@param name string # a name string
---@return Atk.TextAttribute # an `AtkTextAttribute` associated with `name`
function Atk.text_attribute_register(name) end

--- # function Atk.text_free_ranges()
---
--- Frees the memory associated with an array of AtkTextRange. It is assumed
--- that the array was returned by the function atk_text_get_bounded_ranges
--- and is NULL terminated.
---
--- ---
---
---@param ranges unknown[] # A pointer to an array of `AtkTextRange` which is to be freed.
---@return nil
function Atk.text_free_ranges(ranges) end

--- # function Atk.value_type_get_localized_name()
---
--- Gets the localized description string describing the `AtkValueType` `value_type`.
---
--- ---
---
---@param value_type Atk.ValueType # The `AtkValueType` whose localized name is required
---@return string # the localized string describing the `AtkValueType`
function Atk.value_type_get_localized_name(value_type) end

--- # function Atk.value_type_get_name()
---
--- Gets the description string describing the `AtkValueType` `value_type`.
---
--- ---
---
---@param value_type Atk.ValueType # The `AtkValueType` whose name is required
---@return string # the string describing the `AtkValueType`
function Atk.value_type_get_name(value_type) end

return Atk

