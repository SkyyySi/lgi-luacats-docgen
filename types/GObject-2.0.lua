---@meta GObject

---@class GObject
local GObject = {}

---@alias GObject.SignalCMarshaller <Element 'namespace' at 0x7f02abcef970>.ClosureMarshal

---@alias GObject.SignalCVaMarshaller <Element 'namespace' at 0x7f02abcef970>.VaClosureMarshal

---@alias GObject.Type integer

---@alias GObject.BaseFinalizeFunc fun(g_class: GObject.TypeClass): nil

---@alias GObject.BaseInitFunc fun(g_class: GObject.TypeClass): nil

--- # class GObject.Binding
---
--- `GBinding` is the representation of a binding between a property on a
--- `GObject` instance (or source) and another property on another `GObject`
--- instance (or target).
--- 
--- Whenever the source property changes, the same value is applied to the
--- target property; for instance, the following binding:
--- 
--- ```c
---   g_object_bind_property (object1, "property-a",
---                           object2, "property-b",
---                           G_BINDING_DEFAULT);
--- ```
--- 
--- will cause the property named "property-b" of `object2` to be updated
--- every time `g_object_set()` or the specific accessor changes the value of
--- the property "property-a" of `object1`.
--- 
--- It is possible to create a bidirectional binding between two properties
--- of two `GObject` instances, so that if either property changes, the
--- other is updated as well, for instance:
--- 
--- ```c
---   g_object_bind_property (object1, "property-a",
---                           object2, "property-b",
---                           G_BINDING_BIDIRECTIONAL);
--- ```
--- 
--- will keep the two properties in sync.
--- 
--- It is also possible to set a custom transformation function (in both
--- directions, in case of a bidirectional binding) to apply a custom
--- transformation from the source value to the target value before
--- applying it; for instance, the following binding:
--- 
--- ```c
---   g_object_bind_property_full (adjustment1, "value",
---                                adjustment2, "value",
---                                G_BINDING_BIDIRECTIONAL,
---                                celsius_to_fahrenheit,
---                                fahrenheit_to_celsius,
---                                NULL, NULL);
--- ```
--- 
--- will keep the "value" property of the two adjustments in sync; the
--- `celsius_to_fahrenheit` function will be called whenever the "value"
--- property of `adjustment1` changes and will transform the current value
--- of the property before applying it to the "value" property of `adjustment2`.
--- 
--- Vice versa, the `fahrenheit_to_celsius` function will be called whenever
--- the "value" property of `adjustment2` changes, and will transform the
--- current value of the property before applying it to the "value" property
--- of `adjustment1`.
--- 
--- Note that `GBinding` does not resolve cycles by itself; a cycle like
--- 
--- ```c
---   object1:propertyA -> object2:propertyB
---   object2:propertyB -> object3:propertyC
---   object3:propertyC -> object1:propertyA
--- ```
--- 
--- might lead to an infinite loop. The loop, in this particular case,
--- can be avoided if the objects emit the `GObject`::notify signal only
--- if the value has effectively been changed. A binding is implemented
--- using the `GObject`::notify signal, so it is susceptible to all the
--- various ways of blocking a signal emission, like `g_signal_stop_emission()`
--- or `g_signal_handler_block()`.
--- 
--- A binding will be severed, and the resources it allocates freed, whenever
--- either one of the `GObject` instances it refers to are finalized, or when
--- the `GBinding` instance loses its last reference.
--- 
--- Bindings for languages with garbage collection can use
--- `g_binding_unbind()` to explicitly release a binding between the source
--- and target properties, instead of relying on the last reference on the
--- binding, source, and target instances to drop.
--- 
--- `GBinding` is available since GObject 2.26
---
--- ---
---
---@class GObject.Binding : GObject.Object
GObject.Binding = {}

--- # method GObject.Binding:dup_source()
---
--- Retrieves the `GObject` instance used as the source of the binding.
--- 
--- A `GBinding` can outlive the source `GObject` as the binding does not hold a
--- strong reference to the source. If the source is destroyed before the
--- binding then this function will return `nil`.
---
--- ---
---
---@param self GObject.Binding # a `GBinding`
---@return GObject.Object # the source `GObject`, or `nil` if the source does not exist any more.
function GObject.Binding:dup_source() end

--- # method GObject.Binding:dup_target()
---
--- Retrieves the `GObject` instance used as the target of the binding.
--- 
--- A `GBinding` can outlive the target `GObject` as the binding does not hold a
--- strong reference to the target. If the target is destroyed before the
--- binding then this function will return `nil`.
---
--- ---
---
---@param self GObject.Binding # a `GBinding`
---@return GObject.Object # the target `GObject`, or `nil` if the target does not exist any more.
function GObject.Binding:dup_target() end

--- # method GObject.Binding:get_flags()
---
--- Retrieves the flags passed when constructing the `GBinding`.
---
--- ---
---
---@param self GObject.Binding # a `GBinding`
---@return GObject.BindingFlags # the `GBindingFlags` used by the `GBinding`
function GObject.Binding:get_flags() end

--- # method GObject.Binding:get_source()
---
--- Retrieves the `GObject` instance used as the source of the binding.
--- 
--- A `GBinding` can outlive the source `GObject` as the binding does not hold a
--- strong reference to the source. If the source is destroyed before the
--- binding then this function will return `nil`.
--- 
--- Use `g_binding_dup_source()` if the source or binding are used from different
--- threads as otherwise the pointer returned from this function might become
--- invalid if the source is finalized from another thread in the meantime.
---
--- ---
---
---@param self GObject.Binding # a `GBinding`
---@return GObject.Object # the source `GObject`, or `nil` if the source does not exist any more.
function GObject.Binding:get_source() end

--- # method GObject.Binding:get_source_property()
---
--- Retrieves the name of the property of `GBinding`:source used as the source
--- of the binding.
---
--- ---
---
---@param self GObject.Binding # a `GBinding`
---@return string # the name of the source property
function GObject.Binding:get_source_property() end

--- # method GObject.Binding:get_target()
---
--- Retrieves the `GObject` instance used as the target of the binding.
--- 
--- A `GBinding` can outlive the target `GObject` as the binding does not hold a
--- strong reference to the target. If the target is destroyed before the
--- binding then this function will return `nil`.
--- 
--- Use `g_binding_dup_target()` if the target or binding are used from different
--- threads as otherwise the pointer returned from this function might become
--- invalid if the target is finalized from another thread in the meantime.
---
--- ---
---
---@param self GObject.Binding # a `GBinding`
---@return GObject.Object # the target `GObject`, or `nil` if the target does not exist any more.
function GObject.Binding:get_target() end

--- # method GObject.Binding:get_target_property()
---
--- Retrieves the name of the property of `GBinding`:target used as the target
--- of the binding.
---
--- ---
---
---@param self GObject.Binding # a `GBinding`
---@return string # the name of the target property
function GObject.Binding:get_target_property() end

--- # method GObject.Binding:unbind()
---
--- Explicitly releases the binding between the source and the target
--- property expressed by `binding`.
--- 
--- This function will release the reference that is being held on
--- the `binding` instance if the binding is still bound; if you want to hold on
--- to the `GBinding` instance after calling `g_binding_unbind()`, you will need
--- to hold a reference to it.
--- 
--- Note however that this function does not take ownership of `binding`, it
--- only unrefs the reference that was initially created by
--- `g_object_bind_property()` and is owned by the binding.
---
--- ---
---
---@param self GObject.Binding # a `GBinding`
---@return nil
function GObject.Binding:unbind() end

---@enum GObject.BindingFlags
GObject.BindingFlags = {}

--- # class GObject.BindingGroup
---
--- The `GBindingGroup` can be used to bind multiple properties
--- from an object collectively.
--- 
--- Use the various methods to bind properties from a single source
--- object to multiple destination objects. Properties can be bound
--- bidirectionally and are connected when the source object is set
--- with `g_binding_group_set_source()`.
---
--- ---
---
---@class GObject.BindingGroup : GObject.Object
---@operator call: GObject.BindingGroup
GObject.BindingGroup = {}

--- # method GObject.BindingGroup:bind()
---
--- Creates a binding between `source_property` on the source object
--- and `target_property` on `target`. Whenever the `source_property`
--- is changed the `target_property` is updated using the same value.
--- The binding flag %G_BINDING_SYNC_CREATE is automatically specified.
--- 
--- See `g_object_bind_property()` for more information.
---
--- ---
---
---@param self GObject.BindingGroup # the `GBindingGroup`
---@param source_property string # the property on the source to bind
---@param target GObject.Object # the target `GObject`
---@param target_property string # the property on `target` to bind
---@param flags GObject.BindingFlags # the flags used to create the `GBinding`
---@return nil
function GObject.BindingGroup:bind(source_property, target, target_property, flags) end

--- # method GObject.BindingGroup:bind_full()
---
--- Creates a binding between `source_property` on the source object and
--- `target_property` on `target`, allowing you to set the transformation
--- functions to be used by the binding. The binding flag
--- %G_BINDING_SYNC_CREATE is automatically specified.
--- 
--- This function is the language bindings friendly version of
--- `g_binding_group_bind_property_full()`, using `GClosures`
--- instead of function pointers.
--- 
--- See `g_object_bind_property_with_closures()` for more information.
---
--- ---
---
---@param self GObject.BindingGroup # the `GBindingGroup`
---@param source_property string # the property on the source to bind
---@param target GObject.Object # the target `GObject`
---@param target_property string # the property on `target` to bind
---@param flags GObject.BindingFlags # the flags used to create the `GBinding`
---@param transform_to? GObject.Closure # a `GClosure` wrapping the transformation function from the source object to the `target`, or `nil` to use the default
---@param transform_from? GObject.Closure # a `GClosure` wrapping the transformation function from the `target` to the source object, or `nil` to use the default
---@return nil
function GObject.BindingGroup:bind_full(source_property, target, target_property, flags, transform_to, transform_from) end

--- # method GObject.BindingGroup:dup_source()
---
--- Gets the source object used for binding properties.
---
--- ---
---
---@param self GObject.BindingGroup # the `GBindingGroup`
---@return GObject.Object # a `GObject` or `nil`.
function GObject.BindingGroup:dup_source() end

--- # method GObject.BindingGroup:set_source()
---
--- Sets `source` as the source object used for creating property
--- bindings. If there is already a source object all bindings from it
--- will be removed.
--- 
--- Note that all properties that have been bound must exist on `source`.
---
--- ---
---
---@param self GObject.BindingGroup # the `GBindingGroup`
---@param source? GObject.Object # the source `GObject`, or `nil` to clear it
---@return nil
function GObject.BindingGroup:set_source(source) end

--- # function GObject.BindingGroup.new()
---
--- Creates a new `GBindingGroup`.
---
--- ---
---
---@return GObject.BindingGroup # a new `GBindingGroup`
function GObject.BindingGroup.new() end

---@alias GObject.BindingTransformFunc fun(binding: GObject.Binding, from_value: GObject.Value, to_value: GObject.Value, user_data: userdata): (boolean|nil)

---@alias GObject.BoxedCopyFunc fun(boxed: userdata): userdata

---@alias GObject.BoxedFreeFunc fun(boxed: userdata): nil

--- # record GObject.CClosure
---
--- A `GCClosure` is a specialization of `GClosure` for C function callbacks.
---
--- ---
---
---@class GObject.CClosure
---@field closure GObject.Closure # the `GClosure`
---@field callback userdata # the callback function
GObject.CClosure = {}

--- # function GObject.CClosure.marshal_BOOLEAN__BOXED_BOXED()
---
--- A `GClosureMarshal` function for use with signals with handlers that
--- take two boxed pointers as arguments and return a boolean.  If you
--- have such a signal, you will probably also need to use an
--- accumulator, such as `g_signal_accumulator_true_handled()`.
---
--- ---
---
---@param closure GObject.Closure # A `GClosure`.
---@param return_value GObject.Value # A `GValue` to store the return value. May be `nil` if the callback of closure doesn't return a value.
---@param n_param_values integer # The length of the `param_values` array.
---@param param_values GObject.Value # An array of `GValues` holding the arguments on which to invoke the callback of closure.
---@param invocation_hint? userdata # The invocation hint given as the last argument to `g_closure_invoke()`.
---@param marshal_data? userdata # Additional data specified when registering the marshaller, see `g_closure_set_marshal()` and `g_closure_set_meta_marshal()`
---@return nil
function GObject.CClosure.marshal_BOOLEAN__BOXED_BOXED(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data) end

--- # function GObject.CClosure.marshal_BOOLEAN__FLAGS()
---
--- A marshaller for a `GCClosure` with a callback of type
--- `gboolean (*callback) (gpointer instance, gint arg1, gpointer user_data)` where the `gint` parameter
--- denotes a flags type.
---
--- ---
---
---@param closure GObject.Closure # the `GClosure` to which the marshaller belongs
---@param return_value GObject.Value # a `GValue` which can store the returned `gboolean`
---@param n_param_values integer # 2
---@param param_values GObject.Value # a `GValue` array holding instance and arg1
---@param invocation_hint? userdata # the invocation hint given as the last argument to `g_closure_invoke()`
---@param marshal_data? userdata # additional data specified when registering the marshaller
---@return nil
function GObject.CClosure.marshal_BOOLEAN__FLAGS(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data) end

--- # function GObject.CClosure.marshal_STRING__OBJECT_POINTER()
---
--- A marshaller for a `GCClosure` with a callback of type
--- `gchar* (*callback) (gpointer instance, GObject *arg1, gpointer arg2, gpointer user_data)`.
---
--- ---
---
---@param closure GObject.Closure # the `GClosure` to which the marshaller belongs
---@param return_value GObject.Value # a `GValue`, which can store the returned string
---@param n_param_values integer # 3
---@param param_values GObject.Value # a `GValue` array holding instance, arg1 and arg2
---@param invocation_hint? userdata # the invocation hint given as the last argument to `g_closure_invoke()`
---@param marshal_data? userdata # additional data specified when registering the marshaller
---@return nil
function GObject.CClosure.marshal_STRING__OBJECT_POINTER(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data) end

--- # function GObject.CClosure.marshal_VOID__BOOLEAN()
---
--- A marshaller for a `GCClosure` with a callback of type
--- `void (*callback) (gpointer instance, gboolean arg1, gpointer user_data)`.
---
--- ---
---
---@param closure GObject.Closure # the `GClosure` to which the marshaller belongs
---@param return_value GObject.Value # ignored
---@param n_param_values integer # 2
---@param param_values GObject.Value # a `GValue` array holding the instance and the `gboolean` parameter
---@param invocation_hint? userdata # the invocation hint given as the last argument to `g_closure_invoke()`
---@param marshal_data? userdata # additional data specified when registering the marshaller
---@return nil
function GObject.CClosure.marshal_VOID__BOOLEAN(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data) end

--- # function GObject.CClosure.marshal_VOID__BOXED()
---
--- A marshaller for a `GCClosure` with a callback of type
--- `void (*callback) (gpointer instance, GBoxed *arg1, gpointer user_data)`.
---
--- ---
---
---@param closure GObject.Closure # the `GClosure` to which the marshaller belongs
---@param return_value GObject.Value # ignored
---@param n_param_values integer # 2
---@param param_values GObject.Value # a `GValue` array holding the instance and the `GBoxed`* parameter
---@param invocation_hint? userdata # the invocation hint given as the last argument to `g_closure_invoke()`
---@param marshal_data? userdata # additional data specified when registering the marshaller
---@return nil
function GObject.CClosure.marshal_VOID__BOXED(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data) end

--- # function GObject.CClosure.marshal_VOID__CHAR()
---
--- A marshaller for a `GCClosure` with a callback of type
--- `void (*callback) (gpointer instance, gchar arg1, gpointer user_data)`.
---
--- ---
---
---@param closure GObject.Closure # the `GClosure` to which the marshaller belongs
---@param return_value GObject.Value # ignored
---@param n_param_values integer # 2
---@param param_values GObject.Value # a `GValue` array holding the instance and the `gchar` parameter
---@param invocation_hint? userdata # the invocation hint given as the last argument to `g_closure_invoke()`
---@param marshal_data? userdata # additional data specified when registering the marshaller
---@return nil
function GObject.CClosure.marshal_VOID__CHAR(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data) end

--- # function GObject.CClosure.marshal_VOID__DOUBLE()
---
--- A marshaller for a `GCClosure` with a callback of type
--- `void (*callback) (gpointer instance, gdouble arg1, gpointer user_data)`.
---
--- ---
---
---@param closure GObject.Closure # the `GClosure` to which the marshaller belongs
---@param return_value GObject.Value # ignored
---@param n_param_values integer # 2
---@param param_values GObject.Value # a `GValue` array holding the instance and the `gdouble` parameter
---@param invocation_hint? userdata # the invocation hint given as the last argument to `g_closure_invoke()`
---@param marshal_data? userdata # additional data specified when registering the marshaller
---@return nil
function GObject.CClosure.marshal_VOID__DOUBLE(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data) end

--- # function GObject.CClosure.marshal_VOID__ENUM()
---
--- A marshaller for a `GCClosure` with a callback of type
--- `void (*callback) (gpointer instance, gint arg1, gpointer user_data)` where the `gint` parameter denotes an enumeration type..
---
--- ---
---
---@param closure GObject.Closure # the `GClosure` to which the marshaller belongs
---@param return_value GObject.Value # ignored
---@param n_param_values integer # 2
---@param param_values GObject.Value # a `GValue` array holding the instance and the enumeration parameter
---@param invocation_hint? userdata # the invocation hint given as the last argument to `g_closure_invoke()`
---@param marshal_data? userdata # additional data specified when registering the marshaller
---@return nil
function GObject.CClosure.marshal_VOID__ENUM(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data) end

--- # function GObject.CClosure.marshal_VOID__FLAGS()
---
--- A marshaller for a `GCClosure` with a callback of type
--- `void (*callback) (gpointer instance, gint arg1, gpointer user_data)` where the `gint` parameter denotes a flags type.
---
--- ---
---
---@param closure GObject.Closure # the `GClosure` to which the marshaller belongs
---@param return_value GObject.Value # ignored
---@param n_param_values integer # 2
---@param param_values GObject.Value # a `GValue` array holding the instance and the flags parameter
---@param invocation_hint? userdata # the invocation hint given as the last argument to `g_closure_invoke()`
---@param marshal_data? userdata # additional data specified when registering the marshaller
---@return nil
function GObject.CClosure.marshal_VOID__FLAGS(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data) end

--- # function GObject.CClosure.marshal_VOID__FLOAT()
---
--- A marshaller for a `GCClosure` with a callback of type
--- `void (*callback) (gpointer instance, gfloat arg1, gpointer user_data)`.
---
--- ---
---
---@param closure GObject.Closure # the `GClosure` to which the marshaller belongs
---@param return_value GObject.Value # ignored
---@param n_param_values integer # 2
---@param param_values GObject.Value # a `GValue` array holding the instance and the `gfloat` parameter
---@param invocation_hint? userdata # the invocation hint given as the last argument to `g_closure_invoke()`
---@param marshal_data? userdata # additional data specified when registering the marshaller
---@return nil
function GObject.CClosure.marshal_VOID__FLOAT(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data) end

--- # function GObject.CClosure.marshal_VOID__INT()
---
--- A marshaller for a `GCClosure` with a callback of type
--- `void (*callback) (gpointer instance, gint arg1, gpointer user_data)`.
---
--- ---
---
---@param closure GObject.Closure # the `GClosure` to which the marshaller belongs
---@param return_value GObject.Value # ignored
---@param n_param_values integer # 2
---@param param_values GObject.Value # a `GValue` array holding the instance and the `gint` parameter
---@param invocation_hint? userdata # the invocation hint given as the last argument to `g_closure_invoke()`
---@param marshal_data? userdata # additional data specified when registering the marshaller
---@return nil
function GObject.CClosure.marshal_VOID__INT(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data) end

--- # function GObject.CClosure.marshal_VOID__LONG()
---
--- A marshaller for a `GCClosure` with a callback of type
--- `void (*callback) (gpointer instance, glong arg1, gpointer user_data)`.
---
--- ---
---
---@param closure GObject.Closure # the `GClosure` to which the marshaller belongs
---@param return_value GObject.Value # ignored
---@param n_param_values integer # 2
---@param param_values GObject.Value # a `GValue` array holding the instance and the `glong` parameter
---@param invocation_hint? userdata # the invocation hint given as the last argument to `g_closure_invoke()`
---@param marshal_data? userdata # additional data specified when registering the marshaller
---@return nil
function GObject.CClosure.marshal_VOID__LONG(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data) end

--- # function GObject.CClosure.marshal_VOID__OBJECT()
---
--- A marshaller for a `GCClosure` with a callback of type
--- `void (*callback) (gpointer instance, GObject *arg1, gpointer user_data)`.
---
--- ---
---
---@param closure GObject.Closure # the `GClosure` to which the marshaller belongs
---@param return_value GObject.Value # ignored
---@param n_param_values integer # 2
---@param param_values GObject.Value # a `GValue` array holding the instance and the `GObject`* parameter
---@param invocation_hint? userdata # the invocation hint given as the last argument to `g_closure_invoke()`
---@param marshal_data? userdata # additional data specified when registering the marshaller
---@return nil
function GObject.CClosure.marshal_VOID__OBJECT(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data) end

--- # function GObject.CClosure.marshal_VOID__PARAM()
---
--- A marshaller for a `GCClosure` with a callback of type
--- `void (*callback) (gpointer instance, GParamSpec *arg1, gpointer user_data)`.
---
--- ---
---
---@param closure GObject.Closure # the `GClosure` to which the marshaller belongs
---@param return_value GObject.Value # ignored
---@param n_param_values integer # 2
---@param param_values GObject.Value # a `GValue` array holding the instance and the `GParamSpec`* parameter
---@param invocation_hint? userdata # the invocation hint given as the last argument to `g_closure_invoke()`
---@param marshal_data? userdata # additional data specified when registering the marshaller
---@return nil
function GObject.CClosure.marshal_VOID__PARAM(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data) end

--- # function GObject.CClosure.marshal_VOID__POINTER()
---
--- A marshaller for a `GCClosure` with a callback of type
--- `void (*callback) (gpointer instance, gpointer arg1, gpointer user_data)`.
---
--- ---
---
---@param closure GObject.Closure # the `GClosure` to which the marshaller belongs
---@param return_value GObject.Value # ignored
---@param n_param_values integer # 2
---@param param_values GObject.Value # a `GValue` array holding the instance and the `gpointer` parameter
---@param invocation_hint? userdata # the invocation hint given as the last argument to `g_closure_invoke()`
---@param marshal_data? userdata # additional data specified when registering the marshaller
---@return nil
function GObject.CClosure.marshal_VOID__POINTER(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data) end

--- # function GObject.CClosure.marshal_VOID__STRING()
---
--- A marshaller for a `GCClosure` with a callback of type
--- `void (*callback) (gpointer instance, const gchar *arg1, gpointer user_data)`.
---
--- ---
---
---@param closure GObject.Closure # the `GClosure` to which the marshaller belongs
---@param return_value GObject.Value # ignored
---@param n_param_values integer # 2
---@param param_values GObject.Value # a `GValue` array holding the instance and the `gchar`* parameter
---@param invocation_hint? userdata # the invocation hint given as the last argument to `g_closure_invoke()`
---@param marshal_data? userdata # additional data specified when registering the marshaller
---@return nil
function GObject.CClosure.marshal_VOID__STRING(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data) end

--- # function GObject.CClosure.marshal_VOID__UCHAR()
---
--- A marshaller for a `GCClosure` with a callback of type
--- `void (*callback) (gpointer instance, guchar arg1, gpointer user_data)`.
---
--- ---
---
---@param closure GObject.Closure # the `GClosure` to which the marshaller belongs
---@param return_value GObject.Value # ignored
---@param n_param_values integer # 2
---@param param_values GObject.Value # a `GValue` array holding the instance and the `guchar` parameter
---@param invocation_hint? userdata # the invocation hint given as the last argument to `g_closure_invoke()`
---@param marshal_data? userdata # additional data specified when registering the marshaller
---@return nil
function GObject.CClosure.marshal_VOID__UCHAR(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data) end

--- # function GObject.CClosure.marshal_VOID__UINT()
---
--- A marshaller for a `GCClosure` with a callback of type
--- `void (*callback) (gpointer instance, guint arg1, gpointer user_data)`.
---
--- ---
---
---@param closure GObject.Closure # the `GClosure` to which the marshaller belongs
---@param return_value GObject.Value # ignored
---@param n_param_values integer # 2
---@param param_values GObject.Value # a `GValue` array holding the instance and the `guint` parameter
---@param invocation_hint? userdata # the invocation hint given as the last argument to `g_closure_invoke()`
---@param marshal_data? userdata # additional data specified when registering the marshaller
---@return nil
function GObject.CClosure.marshal_VOID__UINT(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data) end

--- # function GObject.CClosure.marshal_VOID__UINT_POINTER()
---
--- A marshaller for a `GCClosure` with a callback of type
--- `void (*callback) (gpointer instance, guint arg1, gpointer arg2, gpointer user_data)`.
---
--- ---
---
---@param closure GObject.Closure # the `GClosure` to which the marshaller belongs
---@param return_value GObject.Value # ignored
---@param n_param_values integer # 3
---@param param_values GObject.Value # a `GValue` array holding instance, arg1 and arg2
---@param invocation_hint? userdata # the invocation hint given as the last argument to `g_closure_invoke()`
---@param marshal_data? userdata # additional data specified when registering the marshaller
---@return nil
function GObject.CClosure.marshal_VOID__UINT_POINTER(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data) end

--- # function GObject.CClosure.marshal_VOID__ULONG()
---
--- A marshaller for a `GCClosure` with a callback of type
--- `void (*callback) (gpointer instance, gulong arg1, gpointer user_data)`.
---
--- ---
---
---@param closure GObject.Closure # the `GClosure` to which the marshaller belongs
---@param return_value GObject.Value # ignored
---@param n_param_values integer # 2
---@param param_values GObject.Value # a `GValue` array holding the instance and the `gulong` parameter
---@param invocation_hint? userdata # the invocation hint given as the last argument to `g_closure_invoke()`
---@param marshal_data? userdata # additional data specified when registering the marshaller
---@return nil
function GObject.CClosure.marshal_VOID__ULONG(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data) end

--- # function GObject.CClosure.marshal_VOID__VARIANT()
---
--- A marshaller for a `GCClosure` with a callback of type
--- `void (*callback) (gpointer instance, GVariant *arg1, gpointer user_data)`.
---
--- ---
---
---@param closure GObject.Closure # the `GClosure` to which the marshaller belongs
---@param return_value GObject.Value # ignored
---@param n_param_values integer # 2
---@param param_values GObject.Value # a `GValue` array holding the instance and the `GVariant`* parameter
---@param invocation_hint? userdata # the invocation hint given as the last argument to `g_closure_invoke()`
---@param marshal_data? userdata # additional data specified when registering the marshaller
---@return nil
function GObject.CClosure.marshal_VOID__VARIANT(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data) end

--- # function GObject.CClosure.marshal_VOID__VOID()
---
--- A marshaller for a `GCClosure` with a callback of type
--- `void (*callback) (gpointer instance, gpointer user_data)`.
---
--- ---
---
---@param closure GObject.Closure # the `GClosure` to which the marshaller belongs
---@param return_value GObject.Value # ignored
---@param n_param_values integer # 1
---@param param_values GObject.Value # a `GValue` array holding only the instance
---@param invocation_hint? userdata # the invocation hint given as the last argument to `g_closure_invoke()`
---@param marshal_data? userdata # additional data specified when registering the marshaller
---@return nil
function GObject.CClosure.marshal_VOID__VOID(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data) end

--- # function GObject.CClosure.marshal_generic()
---
--- A generic marshaller function implemented via
--- [libffi](http://sourceware.org/libffi/).
--- 
--- Normally this function is not passed explicitly to `g_signal_new()`,
--- but used automatically by GLib when specifying a `nil` marshaller.
---
--- ---
---
---@param closure GObject.Closure # A `GClosure`.
---@param return_gvalue GObject.Value # A `GValue` to store the return value. May be `nil` if the callback of closure doesn't return a value.
---@param n_param_values integer # The length of the `param_values` array.
---@param param_values GObject.Value # An array of `GValues` holding the arguments on which to invoke the callback of closure.
---@param invocation_hint? userdata # The invocation hint given as the last argument to `g_closure_invoke()`.
---@param marshal_data? userdata # Additional data specified when registering the marshaller, see `g_closure_set_marshal()` and `g_closure_set_meta_marshal()`
---@return nil
function GObject.CClosure.marshal_generic(closure, return_gvalue, n_param_values, param_values, invocation_hint, marshal_data) end

---@alias GObject.Callback fun(): nil

---@alias GObject.ClassFinalizeFunc fun(g_class: GObject.TypeClass, class_data: userdata): nil

---@alias GObject.ClassInitFunc fun(g_class: GObject.TypeClass, class_data: userdata): nil

--- # record GObject.Closure
---
--- A `GClosure` represents a callback supplied by the programmer.
--- 
--- It will generally comprise a function of some kind and a marshaller
--- used to call it. It is the responsibility of the marshaller to
--- convert the arguments for the invocation from `GValues` into
--- a suitable form, perform the callback on the converted arguments,
--- and transform the return value back into a `GValue`.
--- 
--- In the case of C programs, a closure usually just holds a pointer
--- to a function and maybe a data argument, and the marshaller
--- converts between `GValue` and native C types. The GObject
--- library provides the `GCClosure` type for this purpose. Bindings for
--- other languages need marshallers which convert between `GValues`
--- and suitable representations in the runtime of the language in
--- order to use functions written in that language as callbacks. Use
--- `g_closure_set_marshal()` to set the marshaller on such a custom
--- closure implementation.
--- 
--- Within GObject, closures play an important role in the
--- implementation of signals. When a signal is registered, the
--- `c_marshaller` argument to `g_signal_new()` specifies the default C
--- marshaller for any closure which is connected to this
--- signal. GObject provides a number of C marshallers for this
--- purpose, see the g_cclosure_marshal_*() functions. Additional C
--- marshallers can be generated with the [glib-genmarshal][glib-genmarshal]
--- utility.  Closures can be explicitly connected to signals with
--- `g_signal_connect_closure()`, but it usually more convenient to let
--- GObject create a closure automatically by using one of the
--- g_signal_connect_*() functions which take a callback function/user
--- data pair.
--- 
--- Using closures has a number of important advantages over a simple
--- callback function/data pointer combination:
--- 
--- - Closures allow the callee to get the types of the callback parameters,
---   which means that language bindings don't have to write individual glue
---   for each callback type.
--- 
--- - The reference counting of `GClosure` makes it easy to handle reentrancy
---   right; if a callback is removed while it is being invoked, the closure
---   and its parameters won't be freed until the invocation finishes.
--- 
--- - `g_closure_invalidate()` and invalidation notifiers allow callbacks to be
---   automatically removed when the objects they point to go away.
---
--- ---
---
---@class GObject.Closure
---@field ref_count integer
---@field meta_marshal_nouse integer
---@field n_guards integer
---@field n_fnotifiers integer
---@field n_inotifiers integer
---@field in_inotify integer
---@field floating integer
---@field derivative_flag integer
---@field in_marshal integer # Indicates whether the closure is currently being invoked with `g_closure_invoke()`
---@field is_invalid integer # Indicates whether the closure has been invalidated by `g_closure_invalidate()`
---@field marshal fun(closure: GObject.Closure, return_value: GObject.Value, n_param_values: integer, param_values: GObject.Value, invocation_hint: userdata, marshal_data: userdata): nil
---@field data userdata
---@field notifiers GObject.ClosureNotifyData
GObject.Closure = {}

--- # method GObject.Closure:invalidate()
---
--- Sets a flag on the closure to indicate that its calling
--- environment has become invalid, and thus causes any future
--- invocations of `g_closure_invoke()` on this `closure` to be
--- ignored.
--- 
--- Also, invalidation notifiers installed on the closure will
--- be called at this point. Note that unless you are holding a
--- reference to the closure yourself, the invalidation notifiers may
--- unref the closure and cause it to be destroyed, so if you need to
--- access the closure after calling `g_closure_invalidate()`, make sure
--- that you've previously called `g_closure_ref()`.
--- 
--- Note that `g_closure_invalidate()` will also be called when the
--- reference count of a closure drops to zero (unless it has already
--- been invalidated before).
---
--- ---
---
---@param self GObject.Closure # `GClosure` to invalidate
---@return nil
function GObject.Closure:invalidate() end

--- # method GObject.Closure:invoke()
---
--- Invokes the closure, i.e. executes the callback represented by the `closure`.
---
--- ---
---
---@param self GObject.Closure # a `GClosure`
---@param return_value? GObject.Value # a `GValue` to store the return value. May be `nil` if the callback of `closure` doesn't return a value.
---@param n_param_values integer # the length of the `param_values` array
---@param param_values unknown[] # an array of `GValues` holding the arguments on which to invoke the callback of `closure`
---@param invocation_hint? userdata # a context-dependent invocation hint
---@return nil
function GObject.Closure:invoke(return_value, n_param_values, param_values, invocation_hint) end

--- # method GObject.Closure:ref()
---
--- Increments the reference count on a closure to force it staying
--- alive while the caller holds a pointer to it.
---
--- ---
---
---@param self GObject.Closure # `GClosure` to increment the reference count on
---@return GObject.Closure # The `closure` passed in, for convenience
function GObject.Closure:ref() end

--- # method GObject.Closure:sink()
---
--- Takes over the initial ownership of a closure.
--- 
--- Each closure is initially created in a "floating" state, which means
--- that the initial reference count is not owned by any caller.
--- 
--- This function checks to see if the object is still floating, and if so,
--- unsets the floating state and decreases the reference count. If the
--- closure is not floating, `g_closure_sink()` does nothing.
--- 
--- The reason for the existence of the floating state is to prevent
--- cumbersome code sequences like:
--- 
--- ```c
--- closure = g_cclosure_new (cb_func, cb_data);
--- g_source_set_closure (source, closure);
--- g_closure_unref (closure); // GObject doesn't really need this
--- ```
--- 
--- Because `g_source_set_closure()` (and similar functions) take ownership of the
--- initial reference count, if it is unowned, we instead can write:
--- 
--- ```c
--- g_source_set_closure (source, g_cclosure_new (cb_func, cb_data));
--- ```
--- 
--- Generally, this function is used together with `g_closure_ref()`. An example
--- of storing a closure for later notification looks like:
--- 
--- ```c
--- static GClosure *notify_closure = NULL;
--- void
--- foo_notify_set_closure (GClosure *closure)
--- {
---   if (notify_closure)
---     g_closure_unref (notify_closure);
---   notify_closure = closure;
---   if (notify_closure)
---     {
---       g_closure_ref (notify_closure);
---       g_closure_sink (notify_closure);
---     }
--- }
--- ```
--- 
--- Because `g_closure_sink()` may decrement the reference count of a closure
--- (if it hasn't been called on `closure` yet) just like `g_closure_unref()`,
--- `g_closure_ref()` should be called prior to this function.
---
--- ---
---
---@param self GObject.Closure # `GClosure` to decrement the initial reference count on, if it's still being held
---@return nil
function GObject.Closure:sink() end

--- # method GObject.Closure:unref()
---
--- Decrements the reference count of a closure after it was previously
--- incremented by the same caller.
--- 
--- If no other callers are using the closure, then the closure will be
--- destroyed and freed.
---
--- ---
---
---@param self GObject.Closure # `GClosure` to decrement the reference count on
---@return nil
function GObject.Closure:unref() end

--- # function GObject.Closure.new_object()
---
--- A variant of `g_closure_new_simple()` which stores `object` in the
--- `data` field of the closure and calls `g_object_watch_closure()` on
--- `object` and the created closure. This function is mainly useful
--- when implementing new types of closures.
---
--- ---
---
---@param sizeof_closure integer # the size of the structure to allocate, must be at least `sizeof (GClosure)`
---@param object GObject.Object # a `GObject` pointer to store in the `data` field of the newly allocated `GClosure`
---@return GObject.Closure # a newly allocated `GClosure`
function GObject.Closure.new_object(sizeof_closure, object) end

--- # function GObject.Closure.new_simple()
---
--- Allocates a struct of the given size and initializes the initial
--- part as a `GClosure`.
--- 
--- This function is mainly useful when implementing new types of closures:
--- 
--- ```c
--- typedef struct _MyClosure MyClosure;
--- struct _MyClosure
--- {
---   GClosure closure;
---   // extra data goes here
--- };
--- 
--- static void
--- my_closure_finalize (gpointer  notify_data,
---                      GClosure *closure)
--- {
---   MyClosure *my_closure = (MyClosure *)closure;
--- 
---   // free extra data here
--- }
--- 
--- MyClosure *my_closure_new (gpointer data)
--- {
---   GClosure *closure;
---   MyClosure *my_closure;
--- 
---   closure = g_closure_new_simple (sizeof (MyClosure), data);
---   my_closure = (MyClosure *) closure;
--- 
---   // initialize extra data here
--- 
---   g_closure_add_finalize_notifier (closure, notify_data,
---                                    my_closure_finalize);
---   return my_closure;
--- }
--- ```
---
--- ---
---
---@param sizeof_closure integer # the size of the structure to allocate, must be at least `sizeof (GClosure)`
---@param data? userdata # data to store in the `data` field of the newly allocated `GClosure`
---@return GObject.Closure # a floating reference to a new `GClosure`
function GObject.Closure.new_simple(sizeof_closure, data) end

---@alias GObject.ClosureMarshal fun(closure: GObject.Closure, return_value: GObject.Value, n_param_values: integer, param_values: unknown[], invocation_hint: userdata, marshal_data: userdata): nil

---@alias GObject.ClosureNotify fun(data: userdata, closure: GObject.Closure): nil

--- # record GObject.ClosureNotifyData
---
---@class GObject.ClosureNotifyData
---@field data userdata
---@field notify GObject.ClosureNotify
GObject.ClosureNotifyData = {}

---@enum GObject.ConnectFlags
GObject.ConnectFlags = {}

--- # record GObject.EnumClass
---
--- The class of an enumeration type holds information about its
--- possible values.
---
--- ---
---
---@class GObject.EnumClass
---@field g_type_class GObject.TypeClass # the parent class
---@field minimum integer # the smallest possible value.
---@field maximum integer # the largest possible value.
---@field n_values integer # the number of possible values.
---@field values GObject.EnumValue # an array of `GEnumValue` structs describing the individual values.
GObject.EnumClass = {}

--- # record GObject.EnumValue
---
--- A structure which contains a single enum value, its name, and its
--- nickname.
---
--- ---
---
---@class GObject.EnumValue
---@field value integer # the enum value
---@field value_name string # the name of the value
---@field value_nick string # the nickname of the value
GObject.EnumValue = {}

--- # record GObject.FlagsClass
---
--- The class of a flags type holds information about its
--- possible values.
---
--- ---
---
---@class GObject.FlagsClass
---@field g_type_class GObject.TypeClass # the parent class
---@field mask integer # a mask covering all possible values.
---@field n_values integer # the number of possible values.
---@field values GObject.FlagsValue # an array of `GFlagsValue` structs describing the individual values.
GObject.FlagsClass = {}

--- # record GObject.FlagsValue
---
--- A structure which contains a single flags value, its name, and its
--- nickname.
---
--- ---
---
---@class GObject.FlagsValue
---@field value integer # the flags value
---@field value_name string # the name of the value
---@field value_nick string # the nickname of the value
GObject.FlagsValue = {}

--- # class GObject.InitiallyUnowned
---
--- A type for objects that have an initially floating reference.
--- 
--- All the fields in the `GInitiallyUnowned` structure are private to the
--- implementation and should never be accessed directly.
---
--- ---
---
---@class GObject.InitiallyUnowned : GObject.Object
---@field g_type_instance GObject.TypeInstance
---@field ref_count integer
---@field qdata GLib.Data
GObject.InitiallyUnowned = {}

--- # record GObject.InitiallyUnownedClass
---
--- The class structure for the GInitiallyUnowned type.
---
--- ---
---
---@class GObject.InitiallyUnownedClass
---@field g_type_class GObject.TypeClass # the parent class
---@field construct_properties userdata[]
---@field set_property fun(object: GObject.Object, property_id: integer, value: GObject.Value, pspec: GObject.ParamSpec): nil
---@field get_property fun(object: GObject.Object, property_id: integer, value: GObject.Value, pspec: GObject.ParamSpec): nil
---@field dispose fun(object: GObject.Object): nil
---@field finalize fun(object: GObject.Object): nil
---@field dispatch_properties_changed fun(object: GObject.Object, n_pspecs: integer, pspecs: GObject.ParamSpec): nil
---@field notify fun(object: GObject.Object, pspec: GObject.ParamSpec): nil
---@field constructed fun(object: GObject.Object): nil
---@field flags integer
---@field n_construct_properties integer
---@field pspecs userdata
---@field n_pspecs integer
---@field pdummy unknown[]
GObject.InitiallyUnownedClass = {}

---@alias GObject.InstanceInitFunc fun(instance: GObject.TypeInstance, g_class: GObject.TypeClass): nil

---@alias GObject.InterfaceFinalizeFunc fun(g_iface: GObject.TypeInterface, iface_data: userdata): nil

--- # record GObject.InterfaceInfo
---
--- A structure that provides information to the type system which is
--- used specifically for managing interface types.
---
--- ---
---
---@class GObject.InterfaceInfo
---@field interface_init GObject.InterfaceInitFunc # location of the interface initialization function
---@field interface_finalize GObject.InterfaceFinalizeFunc # location of the interface finalization function
---@field interface_data userdata # user-supplied data passed to the interface init/finalize functions
GObject.InterfaceInfo = {}

---@alias GObject.InterfaceInitFunc fun(g_iface: GObject.TypeInterface, iface_data: userdata): nil

--- # class GObject.Object
---
--- The base object type.
--- 
--- All the fields in the `GObject` structure are private to the implementation
--- and should never be accessed directly.
--- 
--- Since GLib 2.72, all `GObjects` are guaranteed to be aligned to at least the
--- alignment of the largest basic GLib type (typically this is `guint64` or
--- `gdouble`). If you need larger alignment for an element in a `GObject`, you
--- should allocate it on the heap (aligned), or arrange for your `GObject` to be
--- appropriately padded. This guarantee applies to the `GObject` (or derived)
--- struct, the `GObjectClass` (or derived) struct, and any private data allocated
--- by G_ADD_PRIVATE().
---
--- ---
---
---@class GObject.Object
---@field g_type_instance GObject.TypeInstance
---@field ref_count integer
---@field qdata GLib.Data
GObject.Object = {}

--- # method GObject.Object:bind_property()
---
--- Creates a binding between `source_property` on `source` and `target_property`
--- on `target`.
--- 
--- Whenever the `source_property` is changed the `target_property` is
--- updated using the same value. For instance:
--- 
--- ```c
---   g_object_bind_property (action, "active", widget, "sensitive", 0);
--- ```
--- 
--- Will result in the "sensitive" property of the widget `GObject` instance to be
--- updated with the same value of the "active" property of the action `GObject`
--- instance.
--- 
--- If `flags` contains %G_BINDING_BIDIRECTIONAL then the binding will be mutual:
--- if `target_property` on `target` changes then the `source_property` on `source`
--- will be updated as well.
--- 
--- The binding will automatically be removed when either the `source` or the
--- `target` instances are finalized. To remove the binding without affecting the
--- `source` and the `target` you can just call `g_object_unref()` on the returned
--- `GBinding` instance.
--- 
--- Removing the binding by calling `g_object_unref()` on it must only be done if
--- the binding, `source` and `target` are only used from a single thread and it
--- is clear that both `source` and `target` outlive the binding. Especially it
--- is not safe to rely on this if the binding, `source` or `target` can be
--- finalized from different threads. Keep another reference to the binding and
--- use `g_binding_unbind()` instead to be on the safe side.
--- 
--- A `GObject` can have multiple bindings.
---
--- ---
---
---@param self GObject.Object # the source `GObject`
---@param source_property string # the property on `source` to bind
---@param target GObject.Object # the target `GObject`
---@param target_property string # the property on `target` to bind
---@param flags GObject.BindingFlags # flags to pass to `GBinding`
---@return GObject.Binding # the `GBinding` instance representing the binding between the two `GObject` instances. The binding is released whenever the `GBinding` reference count reaches zero.
function GObject.Object:bind_property(source_property, target, target_property, flags) end

--- # method GObject.Object:bind_property_full()
---
--- Creates a binding between `source_property` on `source` and `target_property`
--- on `target`, allowing you to set the transformation functions to be used by
--- the binding.
--- 
--- This function is the language bindings friendly version of
--- `g_object_bind_property_full()`, using `GClosures` instead of
--- function pointers.
---
--- ---
---
---@param self GObject.Object # the source `GObject`
---@param source_property string # the property on `source` to bind
---@param target GObject.Object # the target `GObject`
---@param target_property string # the property on `target` to bind
---@param flags GObject.BindingFlags # flags to pass to `GBinding`
---@param transform_to GObject.Closure # a `GClosure` wrapping the transformation function from the `source` to the `target`, or `nil` to use the default
---@param transform_from GObject.Closure # a `GClosure` wrapping the transformation function from the `target` to the `source`, or `nil` to use the default
---@return GObject.Binding # the `GBinding` instance representing the binding between the two `GObject` instances. The binding is released whenever the `GBinding` reference count reaches zero.
function GObject.Object:bind_property_full(source_property, target, target_property, flags, transform_to, transform_from) end

--- # method GObject.Object:force_floating()
---
--- This function is intended for `GObject` implementations to re-enforce
--- a [floating][floating-ref] object reference. Doing this is seldom
--- required: all `GInitiallyUnowneds` are created with a floating reference
--- which usually just needs to be sunken by calling `g_object_ref_sink()`.
---
--- ---
---
---@param self GObject.Object # a `GObject`
---@return nil
function GObject.Object:force_floating() end

--- # method GObject.Object:freeze_notify()
---
--- Increases the freeze count on `object`. If the freeze count is
--- non-zero, the emission of "notify" signals on `object` is
--- stopped. The signals are queued until the freeze count is decreased
--- to zero. Duplicate notifications are squashed so that at most one
--- `GObject`::notify signal is emitted for each property modified while the
--- object is frozen.
--- 
--- This is necessary for accessors that modify multiple properties to prevent
--- premature notification while the object is still being modified.
---
--- ---
---
---@param self GObject.Object # a `GObject`
---@return nil
function GObject.Object:freeze_notify() end

--- # method GObject.Object:get_data()
---
--- Gets a named field from the objects table of associations (see `g_object_set_data()`).
---
--- ---
---
---@param self GObject.Object # `GObject` containing the associations
---@param key string # name of the key for that association
---@return userdata # the data if found, or `nil` if no such data exists.
function GObject.Object:get_data(key) end

--- # method GObject.Object:get_property()
---
--- Gets a property of an object.
--- 
--- The `value` can be:
--- 
---  - an empty `GValue` initialized by %G_VALUE_INIT, which will be
---    automatically initialized with the expected type of the property
---    (since GLib 2.60)
---  - a `GValue` initialized with the expected type of the property
---  - a `GValue` initialized with a type to which the expected type
---    of the property can be transformed
--- 
--- In general, a copy is made of the property contents and the caller is
--- responsible for freeing the memory by calling `g_value_unset()`.
--- 
--- Note that `g_object_get_property()` is really intended for language
--- bindings, `g_object_get()` is much more convenient for C programming.
---
--- ---
---
---@param self GObject.Object # a `GObject`
---@param property_name string # the name of the property to get
---@param value GObject.Value # return location for the property value
---@return nil
function GObject.Object:get_property(property_name, value) end

--- # method GObject.Object:get_qdata()
---
--- This function gets back user data pointers stored via
--- `g_object_set_qdata()`.
---
--- ---
---
---@param self GObject.Object # The GObject to get a stored user data pointer from
---@param quark GLib.Quark # A `GQuark`, naming the user data pointer
---@return userdata # The user data pointer set, or `nil`
function GObject.Object:get_qdata(quark) end

--- # method GObject.Object:getv()
---
--- Gets `n_properties` properties for an `object`.
--- Obtained properties will be set to `values`. All properties must be valid.
--- Warnings will be emitted and undefined behaviour may result if invalid
--- properties are passed in.
---
--- ---
---
---@param self GObject.Object # a `GObject`
---@param n_properties integer # the number of properties
---@param names unknown[] # the names of each property to get
---@param values unknown[] # the values of each property to get
---@return nil
function GObject.Object:getv(n_properties, names, values) end

--- # method GObject.Object:is_floating()
---
--- Checks whether `object` has a [floating][floating-ref] reference.
---
--- ---
---
---@param self GObject.Object # a `GObject`
---@return (boolean|nil) # `true` if `object` has a floating reference
function GObject.Object:is_floating() end

--- # method GObject.Object:notify()
---
--- Emits a "notify" signal for the property `property_name` on `object`.
--- 
--- When possible, eg. when signaling a property change from within the class
--- that registered the property, you should use `g_object_notify_by_pspec()`
--- instead.
--- 
--- Note that emission of the notify signal may be blocked with
--- `g_object_freeze_notify()`. In this case, the signal emissions are queued
--- and will be emitted (in reverse order) when `g_object_thaw_notify()` is
--- called.
---
--- ---
---
---@param self GObject.Object # a `GObject`
---@param property_name string # the name of a property installed on the class of `object`.
---@return nil
function GObject.Object:notify(property_name) end

--- # method GObject.Object:notify_by_pspec()
---
--- Emits a "notify" signal for the property specified by `pspec` on `object`.
--- 
--- This function omits the property name lookup, hence it is faster than
--- `g_object_notify()`.
--- 
--- One way to avoid using `g_object_notify()` from within the
--- class that registered the properties, and using `g_object_notify_by_pspec()`
--- instead, is to store the GParamSpec used with
--- `g_object_class_install_property()` inside a static array, e.g.:
--- 
--- ```c
---   typedef enum
---   {
---     PROP_FOO = 1,
---     PROP_LAST
---   } MyObjectProperty;
--- 
---   static GParamSpec *properties[PROP_LAST];
--- 
---   static void
---   my_object_class_init (MyObjectClass *klass)
---   {
---     properties[PROP_FOO] = g_param_spec_int ("foo", "Foo", "The foo",
---                                              0, 100,
---                                              50,
---                                              G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS);
---     g_object_class_install_property (gobject_class,
---                                      PROP_FOO,
---                                      properties[PROP_FOO]);
---   }
--- ```
--- 
--- and then notify a change on the "foo" property with:
--- 
--- ```c
---   g_object_notify_by_pspec (self, properties[PROP_FOO]);
--- ```
---
--- ---
---
---@param self GObject.Object # a `GObject`
---@param pspec GObject.ParamSpec # the `GParamSpec` of a property installed on the class of `object`.
---@return nil
function GObject.Object:notify_by_pspec(pspec) end

--- # method GObject.Object:ref()
---
--- Increases the reference count of `object`.
--- 
--- Since GLib 2.56, if `GLIB_VERSION_MAX_ALLOWED` is 2.56 or greater, the type
--- of `object` will be propagated to the return type (using the GCC `typeof()`
--- extension), so any casting the caller needs to do on the return type must be
--- explicit.
---
--- ---
---
---@param self GObject.Object # a `GObject`
---@return GObject.Object # the same `object`
function GObject.Object:ref() end

--- # method GObject.Object:ref_sink()
---
--- Increase the reference count of `object`, and possibly remove the
--- [floating][floating-ref] reference, if `object` has a floating reference.
--- 
--- In other words, if the object is floating, then this call "assumes
--- ownership" of the floating reference, converting it to a normal
--- reference by clearing the floating flag while leaving the reference
--- count unchanged.  If the object is not floating, then this call
--- adds a new normal reference increasing the reference count by one.
--- 
--- Since GLib 2.56, the type of `object` will be propagated to the return type
--- under the same conditions as for `g_object_ref()`.
---
--- ---
---
---@param self GObject.Object # a `GObject`
---@return GObject.Object # `object`
function GObject.Object:ref_sink() end

--- # method GObject.Object:run_dispose()
---
--- Releases all references to other objects. This can be used to break
--- reference cycles.
--- 
--- This function should only be called from object system implementations.
---
--- ---
---
---@param self GObject.Object # a `GObject`
---@return nil
function GObject.Object:run_dispose() end

--- # method GObject.Object:set_data()
---
--- Each object carries around a table of associations from
--- strings to pointers.  This function lets you set an association.
--- 
--- If the object already had an association with that name,
--- the old association will be destroyed.
--- 
--- Internally, the `key` is converted to a `GQuark` using `g_quark_from_string()`.
--- This means a copy of `key` is kept permanently (even after `object` has been
--- finalized) — so it is recommended to only use a small, bounded set of values
--- for `key` in your program, to avoid the `GQuark` storage growing unbounded.
---
--- ---
---
---@param self GObject.Object # `GObject` containing the associations.
---@param key string # name of the key
---@param data? userdata # data to associate with that key
---@return nil
function GObject.Object:set_data(key, data) end

--- # method GObject.Object:set_property()
---
--- Sets a property on an object.
---
--- ---
---
---@param self GObject.Object # a `GObject`
---@param property_name string # the name of the property to set
---@param value GObject.Value # the value
---@return nil
function GObject.Object:set_property(property_name, value) end

--- # method GObject.Object:steal_data()
---
--- Remove a specified datum from the object's data associations,
--- without invoking the association's destroy handler.
---
--- ---
---
---@param self GObject.Object # `GObject` containing the associations
---@param key string # name of the key
---@return userdata # the data if found, or `nil` if no such data exists.
function GObject.Object:steal_data(key) end

--- # method GObject.Object:steal_qdata()
---
--- This function gets back user data pointers stored via
--- `g_object_set_qdata()` and removes the `data` from object
--- without invoking its `destroy()` function (if any was
--- set).
--- Usually, calling this function is only required to update
--- user data pointers with a destroy notifier, for example:
--- ```c
--- void
--- object_add_to_user_list (GObject     *object,
---                          const gchar *new_string)
--- {
---   // the quark, naming the object data
---   GQuark quark_string_list = g_quark_from_static_string ("my-string-list");
---   // retrieve the old string list
---   GList *list = g_object_steal_qdata (object, quark_string_list);
--- 
---   // prepend new string
---   list = g_list_prepend (list, g_strdup (new_string));
---   // this changed 'list', so we need to set it again
---   g_object_set_qdata_full (object, quark_string_list, list, free_string_list);
--- }
--- static void
--- free_string_list (gpointer data)
--- {
---   GList *node, *list = data;
--- 
---   for (node = list; node; node = node->next)
---     g_free (node->data);
---   g_list_free (list);
--- }
--- ```
--- Using `g_object_get_qdata()` in the above example, instead of
--- `g_object_steal_qdata()` would have left the destroy function set,
--- and thus the partial string list would have been freed upon
--- `g_object_set_qdata_full()`.
---
--- ---
---
---@param self GObject.Object # The GObject to get a stored user data pointer from
---@param quark GLib.Quark # A `GQuark`, naming the user data pointer
---@return userdata # The user data pointer set, or `nil`
function GObject.Object:steal_qdata(quark) end

--- # method GObject.Object:thaw_notify()
---
--- Reverts the effect of a previous call to
--- `g_object_freeze_notify()`. The freeze count is decreased on `object`
--- and when it reaches zero, queued "notify" signals are emitted.
--- 
--- Duplicate notifications for each property are squashed so that at most one
--- `GObject`::notify signal is emitted for each property, in the reverse order
--- in which they have been queued.
--- 
--- It is an error to call this function when the freeze count is zero.
---
--- ---
---
---@param self GObject.Object # a `GObject`
---@return nil
function GObject.Object:thaw_notify() end

--- # method GObject.Object:unref()
---
--- Decreases the reference count of `object`. When its reference count
--- drops to 0, the object is finalized (i.e. its memory is freed).
--- 
--- If the pointer to the `GObject` may be reused in future (for example, if it is
--- an instance variable of another object), it is recommended to clear the
--- pointer to `nil` rather than retain a dangling pointer to a potentially
--- invalid `GObject` instance. Use `g_clear_object()` for this.
---
--- ---
---
---@param self GObject.Object # a `GObject`
---@return nil
function GObject.Object:unref() end

--- # method GObject.Object:watch_closure()
---
--- This function essentially limits the life time of the `closure` to
--- the life time of the object. That is, when the object is finalized,
--- the `closure` is invalidated by calling `g_closure_invalidate()` on
--- it, in order to prevent invocations of the closure with a finalized
--- (nonexisting) object. Also, `g_object_ref()` and `g_object_unref()` are
--- added as marshal guards to the `closure`, to ensure that an extra
--- reference count is held on `object` during invocation of the
--- `closure`.  Usually, this function will be called on closures that
--- use this `object` as closure data.
---
--- ---
---
---@param self GObject.Object # `GObject` restricting lifetime of `closure`
---@param closure GObject.Closure # `GClosure` to watch
---@return nil
function GObject.Object:watch_closure(closure) end

--- # function GObject.Object.compat_control()
---
---@param what integer
---@param data? userdata
---@return integer
function GObject.Object.compat_control(what, data) end

--- # function GObject.Object.interface_find_property()
---
--- Find the `GParamSpec` with the given name for an
--- interface. Generally, the interface vtable passed in as `g_iface`
--- will be the default vtable from `g_type_default_interface_ref()`, or,
--- if you know the interface has already been loaded,
--- `g_type_default_interface_peek()`.
---
--- ---
---
---@param g_iface GObject.TypeInterface # any interface vtable for the interface, or the default vtable for the interface
---@param property_name string # name of a property to look up.
---@return GObject.ParamSpec # the `GParamSpec` for the property of the interface with the name `property_name`, or `nil` if no such property exists.
function GObject.Object.interface_find_property(g_iface, property_name) end

--- # function GObject.Object.interface_install_property()
---
--- Add a property to an interface; this is only useful for interfaces
--- that are added to GObject-derived types. Adding a property to an
--- interface forces all objects classes with that interface to have a
--- compatible property. The compatible property could be a newly
--- created `GParamSpec`, but normally
--- `g_object_class_override_property()` will be used so that the object
--- class only needs to provide an implementation and inherits the
--- property description, default value, bounds, and so forth from the
--- interface property.
--- 
--- This function is meant to be called from the interface's default
--- vtable initialization function (the `class_init` member of
--- `GTypeInfo`.) It must not be called after after `class_init` has
--- been called for any object types implementing this interface.
--- 
--- If `pspec` is a floating reference, it will be consumed.
---
--- ---
---
---@param g_iface GObject.TypeInterface # any interface vtable for the interface, or the default vtable for the interface.
---@param pspec GObject.ParamSpec # the `GParamSpec` for the new property
---@return nil
function GObject.Object.interface_install_property(g_iface, pspec) end

--- # function GObject.Object.interface_list_properties()
---
--- Lists the properties of an interface.Generally, the interface
--- vtable passed in as `g_iface` will be the default vtable from
--- `g_type_default_interface_ref()`, or, if you know the interface has
--- already been loaded, `g_type_default_interface_peek()`.
---
--- ---
---
---@param g_iface GObject.TypeInterface # any interface vtable for the interface, or the default vtable for the interface
---@param n_properties_p integer # location to store number of properties returned.
---@return unknown[] # a pointer to an array of pointers to `GParamSpec` structures. The paramspecs are owned by GLib, but the array should be freed with `g_free()` when you are done with it.
function GObject.Object.interface_list_properties(g_iface, n_properties_p) end

--- # function GObject.Object.newv()
---
--- Creates a new instance of a `GObject` subtype and sets its properties.
--- 
--- Construction parameters (see %G_PARAM_CONSTRUCT, %G_PARAM_CONSTRUCT_ONLY)
--- which are not explicitly specified are set to their default values.
---
--- ---
---
---@param object_type GObject.GType # the type id of the `GObject` subtype to instantiate
---@param n_parameters integer # the length of the `parameters` array
---@param parameters unknown[] # an array of `GParameter`
---@return GObject.Object # a new instance of `object_type`
function GObject.Object.newv(object_type, n_parameters, parameters) end

--- # record GObject.ObjectClass
---
--- The class structure for the GObject type.
--- 
--- ```c
--- // Example of implementing a singleton using a constructor.
--- static MySingleton *the_singleton = NULL;
--- 
--- static GObject*
--- my_singleton_constructor (GType                  type,
---                           guint                  n_construct_params,
---                           GObjectConstructParam *construct_params)
--- {
---   GObject *object;
---   
---   if (!the_singleton)
---     {
---       object = G_OBJECT_CLASS (parent_class)->constructor (type,
---                                                            n_construct_params,
---                                                            construct_params);
---       the_singleton = MY_SINGLETON (object);
---     }
---   else
---     object = g_object_ref (G_OBJECT (the_singleton));
--- 
---   return object;
--- }
--- ```
---
--- ---
---
---@class GObject.ObjectClass
---@field g_type_class GObject.TypeClass # the parent class
---@field construct_properties userdata[]
---@field set_property fun(object: GObject.Object, property_id: integer, value: GObject.Value, pspec: GObject.ParamSpec): nil
---@field get_property fun(object: GObject.Object, property_id: integer, value: GObject.Value, pspec: GObject.ParamSpec): nil
---@field dispose fun(object: GObject.Object): nil
---@field finalize fun(object: GObject.Object): nil
---@field dispatch_properties_changed fun(object: GObject.Object, n_pspecs: integer, pspecs: GObject.ParamSpec): nil
---@field notify fun(object: GObject.Object, pspec: GObject.ParamSpec): nil
---@field constructed fun(object: GObject.Object): nil
---@field flags integer
---@field n_construct_properties integer
---@field pspecs userdata
---@field n_pspecs integer
---@field pdummy unknown[]
GObject.ObjectClass = {}

--- # method GObject.ObjectClass:find_property()
---
--- Looks up the `GParamSpec` for a property of a class.
---
--- ---
---
---@param self GObject.ObjectClass # a `GObjectClass`
---@param property_name string # the name of the property to look up
---@return GObject.ParamSpec # the `GParamSpec` for the property, or `nil` if the class doesn't have a property of that name
function GObject.ObjectClass:find_property(property_name) end

--- # method GObject.ObjectClass:install_properties()
---
--- Installs new properties from an array of `GParamSpecs`.
--- 
--- All properties should be installed during the class initializer.  It
--- is possible to install properties after that, but doing so is not
--- recommend, and specifically, is not guaranteed to be thread-safe vs.
--- use of properties on the same type on other threads.
--- 
--- The property id of each property is the index of each `GParamSpec` in
--- the `pspecs` array.
--- 
--- The property id of 0 is treated specially by `GObject` and it should not
--- be used to store a `GParamSpec`.
--- 
--- This function should be used if you plan to use a static array of
--- `GParamSpecs` and `g_object_notify_by_pspec()`. For instance, this
--- class initialization:
--- 
--- ```c
--- typedef enum {
---   PROP_FOO = 1,
---   PROP_BAR,
---   N_PROPERTIES
--- } MyObjectProperty;
--- 
--- static GParamSpec *obj_properties[N_PROPERTIES] = { NULL, };
--- 
--- static void
--- my_object_class_init (MyObjectClass *klass)
--- {
---   GObjectClass *gobject_class = G_OBJECT_CLASS (klass);
--- 
---   obj_properties[PROP_FOO] =
---     g_param_spec_int ("foo", "Foo", "Foo",
---                       -1, G_MAXINT,
---                       0,
---                       G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS);
--- 
---   obj_properties[PROP_BAR] =
---     g_param_spec_string ("bar", "Bar", "Bar",
---                          NULL,
---                          G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS);
--- 
---   gobject_class->set_property = my_object_set_property;
---   gobject_class->get_property = my_object_get_property;
---   g_object_class_install_properties (gobject_class,
---                                      G_N_ELEMENTS (obj_properties),
---                                      obj_properties);
--- }
--- ```
--- 
--- allows calling `g_object_notify_by_pspec()` to notify of property changes:
--- 
--- ```c
--- void
--- my_object_set_foo (MyObject *self, gint foo)
--- {
---   if (self->foo != foo)
---     {
---       self->foo = foo;
---       g_object_notify_by_pspec (G_OBJECT (self), obj_properties[PROP_FOO]);
---     }
---  }
--- ```
---
--- ---
---
---@param self GObject.ObjectClass # a `GObjectClass`
---@param n_pspecs integer # the length of the `GParamSpecs` array
---@param pspecs unknown[] # the `GParamSpecs` array defining the new properties
---@return nil
function GObject.ObjectClass:install_properties(n_pspecs, pspecs) end

--- # method GObject.ObjectClass:install_property()
---
--- Installs a new property.
--- 
--- All properties should be installed during the class initializer.  It
--- is possible to install properties after that, but doing so is not
--- recommend, and specifically, is not guaranteed to be thread-safe vs.
--- use of properties on the same type on other threads.
--- 
--- Note that it is possible to redefine a property in a derived class,
--- by installing a property with the same name. This can be useful at times,
--- e.g. to change the range of allowed values or the default value.
---
--- ---
---
---@param self GObject.ObjectClass # a `GObjectClass`
---@param property_id integer # the id for the new property
---@param pspec GObject.ParamSpec # the `GParamSpec` for the new property
---@return nil
function GObject.ObjectClass:install_property(property_id, pspec) end

--- # method GObject.ObjectClass:list_properties()
---
--- Get an array of `GParamSpec`* for all properties of a class.
---
--- ---
---
---@param self GObject.ObjectClass # a `GObjectClass`
---@param n_properties integer # return location for the length of the returned array
---@return unknown[] # an array of `GParamSpec`* which should be freed after use
function GObject.ObjectClass:list_properties(n_properties) end

--- # method GObject.ObjectClass:override_property()
---
--- Registers `property_id` as referring to a property with the name
--- `name` in a parent class or in an interface implemented by `oclass`.
--- This allows this class to "override" a property implementation in
--- a parent class or to provide the implementation of a property from
--- an interface.
--- 
--- Internally, overriding is implemented by creating a property of type
--- `GParamSpecOverride`; generally operations that query the properties of
--- the object class, such as `g_object_class_find_property()` or
--- `g_object_class_list_properties()` will return the overridden
--- property. However, in one case, the `construct_properties` argument of
--- the `constructor` virtual function, the `GParamSpecOverride` is passed
--- instead, so that the `param_id` field of the `GParamSpec` will be
--- correct.  For virtually all uses, this makes no difference. If you
--- need to get the overridden property, you can call
--- `g_param_spec_get_redirect_target()`.
---
--- ---
---
---@param self GObject.ObjectClass # a `GObjectClass`
---@param property_id integer # the new property ID
---@param name string # the name of a property registered in a parent class or in an interface of this class.
---@return nil
function GObject.ObjectClass:override_property(property_id, name) end

--- # record GObject.ObjectConstructParam
---
--- The GObjectConstructParam struct is an auxiliary structure used to hand
--- `GParamSpec`/`GValue` pairs to the `constructor` of a `GObjectClass`.
---
--- ---
---
---@class GObject.ObjectConstructParam
---@field pspec GObject.ParamSpec # the `GParamSpec` of the construct parameter
---@field value GObject.Value # the value to set the parameter to
GObject.ObjectConstructParam = {}

---@alias GObject.ObjectFinalizeFunc fun(object: GObject.Object): nil

---@alias GObject.ObjectGetPropertyFunc fun(object: GObject.Object, property_id: integer, value: GObject.Value, pspec: GObject.ParamSpec): nil

---@alias GObject.ObjectSetPropertyFunc fun(object: GObject.Object, property_id: integer, value: GObject.Value, pspec: GObject.ParamSpec): nil

---@enum GObject.ParamFlags
GObject.ParamFlags = {}

--- # class GObject.ParamSpec
---
--- `GParamSpec` is an object structure that encapsulates the metadata
--- required to specify parameters, such as e.g. `GObject` properties.
--- 
--- ## Parameter names # {`canonical`-parameter-names}
--- 
--- A property name consists of one or more segments consisting of ASCII letters
--- and digits, separated by either the `-` or `_` character. The first
--- character of a property name must be a letter. These are the same rules as
--- for signal naming (see `g_signal_new()`).
--- 
--- When creating and looking up a `GParamSpec`, either separator can be
--- used, but they cannot be mixed. Using `-` is considerably more
--- efficient, and is the ‘canonical form’. Using `_` is discouraged.
---
--- ---
---
---@class GObject.ParamSpec
---@field g_type_instance GObject.TypeInstance # private `GTypeInstance` portion
---@field name string # name of this parameter: always an interned string
---@field flags GObject.ParamFlags # `GParamFlags` flags for this parameter
---@field value_type GObject.GType # the `GValue` type for this parameter
---@field owner_type GObject.GType # `GType` type that uses (introduces) this parameter
---@field _nick string
---@field _blurb string
---@field qdata GLib.Data
---@field ref_count integer
---@field param_id integer
GObject.ParamSpec = {}

--- # method GObject.ParamSpec:get_blurb()
---
--- Get the short description of a `GParamSpec`.
---
--- ---
---
---@param self GObject.ParamSpec # a valid `GParamSpec`
---@return string # the short description of `pspec`.
function GObject.ParamSpec:get_blurb() end

--- # method GObject.ParamSpec:get_default_value()
---
--- Gets the default value of `pspec` as a pointer to a `GValue`.
--- 
--- The `GValue` will remain valid for the life of `pspec`.
---
--- ---
---
---@param self GObject.ParamSpec # a `GParamSpec`
---@return GObject.Value # a pointer to a `GValue` which must not be modified
function GObject.ParamSpec:get_default_value() end

--- # method GObject.ParamSpec:get_name()
---
--- Get the name of a `GParamSpec`.
--- 
--- The name is always an "interned" string (as per `g_intern_string()`).
--- This allows for pointer-value comparisons.
---
--- ---
---
---@param self GObject.ParamSpec # a valid `GParamSpec`
---@return string # the name of `pspec`.
function GObject.ParamSpec:get_name() end

--- # method GObject.ParamSpec:get_name_quark()
---
--- Gets the GQuark for the name.
---
--- ---
---
---@param self GObject.ParamSpec # a `GParamSpec`
---@return GLib.Quark # the GQuark for `pspec`->name.
function GObject.ParamSpec:get_name_quark() end

--- # method GObject.ParamSpec:get_nick()
---
--- Get the nickname of a `GParamSpec`.
---
--- ---
---
---@param self GObject.ParamSpec # a valid `GParamSpec`
---@return string # the nickname of `pspec`.
function GObject.ParamSpec:get_nick() end

--- # method GObject.ParamSpec:get_qdata()
---
--- Gets back user data pointers stored via `g_param_spec_set_qdata()`.
---
--- ---
---
---@param self GObject.ParamSpec # a valid `GParamSpec`
---@param quark GLib.Quark # a `GQuark`, naming the user data pointer
---@return userdata # the user data pointer set, or `nil`
function GObject.ParamSpec:get_qdata(quark) end

--- # method GObject.ParamSpec:get_redirect_target()
---
--- If the paramspec redirects operations to another paramspec,
--- returns that paramspec. Redirect is used typically for
--- providing a new implementation of a property in a derived
--- type while preserving all the properties from the parent
--- type. Redirection is established by creating a property
--- of type `GParamSpecOverride`. See `g_object_class_override_property()`
--- for an example of the use of this capability.
---
--- ---
---
---@param self GObject.ParamSpec # a `GParamSpec`
---@return GObject.ParamSpec # paramspec to which requests on this paramspec should be redirected, or `nil` if none.
function GObject.ParamSpec:get_redirect_target() end

--- # method GObject.ParamSpec:set_qdata()
---
--- Sets an opaque, named pointer on a `GParamSpec`. The name is
--- specified through a `GQuark` (retrieved e.g. via
--- `g_quark_from_static_string()`), and the pointer can be gotten back
--- from the `pspec` with `g_param_spec_get_qdata()`.  Setting a
--- previously set user data pointer, overrides (frees) the old pointer
--- set, using `nil` as pointer essentially removes the data stored.
---
--- ---
---
---@param self GObject.ParamSpec # the `GParamSpec` to set store a user data pointer
---@param quark GLib.Quark # a `GQuark`, naming the user data pointer
---@param data? userdata # an opaque user data pointer
---@return nil
function GObject.ParamSpec:set_qdata(quark, data) end

--- # method GObject.ParamSpec:sink()
---
--- The initial reference count of a newly created `GParamSpec` is 1,
--- even though no one has explicitly called `g_param_spec_ref()` on it
--- yet. So the initial reference count is flagged as "floating", until
--- someone calls `g_param_spec_ref (pspec); g_param_spec_sink
--- (pspec);` in sequence on it, taking over the initial
--- reference count (thus ending up with a `pspec` that has a reference
--- count of 1 still, but is not flagged "floating" anymore).
---
--- ---
---
---@param self GObject.ParamSpec # a valid `GParamSpec`
---@return nil
function GObject.ParamSpec:sink() end

--- # method GObject.ParamSpec:steal_qdata()
---
--- Gets back user data pointers stored via `g_param_spec_set_qdata()`
--- and removes the `data` from `pspec` without invoking its `destroy()`
--- function (if any was set).  Usually, calling this function is only
--- required to update user data pointers with a destroy notifier.
---
--- ---
---
---@param self GObject.ParamSpec # the `GParamSpec` to get a stored user data pointer from
---@param quark GLib.Quark # a `GQuark`, naming the user data pointer
---@return userdata # the user data pointer set, or `nil`
function GObject.ParamSpec:steal_qdata(quark) end

--- # function GObject.ParamSpec.is_valid_name()
---
--- Validate a property name for a `GParamSpec`. This can be useful for
--- dynamically-generated properties which need to be validated at run-time
--- before actually trying to create them.
--- 
--- See [canonical parameter names][canonical-parameter-names] for details of
--- the rules for valid names.
---
--- ---
---
---@param name string # the canonical name of the property
---@return (boolean|nil) # `true` if `name` is a valid property name, `false` otherwise.
function GObject.ParamSpec.is_valid_name(name) end

--- # class GObject.ParamSpecBoolean
---
--- A `GParamSpec` derived structure that contains the meta data for boolean properties.
---
--- ---
---
---@class GObject.ParamSpecBoolean : GObject.ParamSpec
---@field parent_instance GObject.ParamSpec # private `GParamSpec` portion
---@field default_value (boolean|nil) # default value for the property specified
GObject.ParamSpecBoolean = {}

--- # class GObject.ParamSpecBoxed
---
--- A `GParamSpec` derived structure that contains the meta data for boxed properties.
---
--- ---
---
---@class GObject.ParamSpecBoxed : GObject.ParamSpec
---@field parent_instance GObject.ParamSpec # private `GParamSpec` portion
GObject.ParamSpecBoxed = {}

--- # class GObject.ParamSpecChar
---
--- A `GParamSpec` derived structure that contains the meta data for character properties.
---
--- ---
---
---@class GObject.ParamSpecChar : GObject.ParamSpec
---@field parent_instance GObject.ParamSpec # private `GParamSpec` portion
---@field minimum integer # minimum value for the property specified
---@field maximum integer # maximum value for the property specified
---@field default_value integer # default value for the property specified
GObject.ParamSpecChar = {}

--- # record GObject.ParamSpecClass
---
--- The class structure for the GParamSpec type.
--- Normally, GParamSpec classes are filled by
--- `g_param_type_register_static()`.
---
--- ---
---
---@class GObject.ParamSpecClass
---@field g_type_class GObject.TypeClass # the parent class
---@field value_type GObject.GType # the `GValue` type for this parameter
---@field finalize fun(pspec: GObject.ParamSpec): nil
---@field value_set_default fun(pspec: GObject.ParamSpec, value: GObject.Value): nil
---@field value_validate fun(pspec: GObject.ParamSpec, value: GObject.Value): (boolean|nil)
---@field values_cmp fun(pspec: GObject.ParamSpec, value1: GObject.Value, value2: GObject.Value): integer
---@field value_is_valid fun(pspec: GObject.ParamSpec, value: GObject.Value): (boolean|nil)
---@field dummy unknown[]
GObject.ParamSpecClass = {}

--- # class GObject.ParamSpecDouble
---
--- A `GParamSpec` derived structure that contains the meta data for double properties.
---
--- ---
---
---@class GObject.ParamSpecDouble : GObject.ParamSpec
---@field parent_instance GObject.ParamSpec # private `GParamSpec` portion
---@field minimum number # minimum value for the property specified
---@field maximum number # maximum value for the property specified
---@field default_value number # default value for the property specified
---@field epsilon number # values closer than `epsilon` will be considered identical by `g_param_values_cmp()`; the default value is 1e-90.
GObject.ParamSpecDouble = {}

--- # class GObject.ParamSpecEnum
---
--- A `GParamSpec` derived structure that contains the meta data for enum
--- properties.
---
--- ---
---
---@class GObject.ParamSpecEnum : GObject.ParamSpec
---@field parent_instance GObject.ParamSpec # private `GParamSpec` portion
---@field enum_class GObject.EnumClass # the `GEnumClass` for the enum
---@field default_value integer # default value for the property specified
GObject.ParamSpecEnum = {}

--- # class GObject.ParamSpecFlags
---
--- A `GParamSpec` derived structure that contains the meta data for flags
--- properties.
---
--- ---
---
---@class GObject.ParamSpecFlags : GObject.ParamSpec
---@field parent_instance GObject.ParamSpec # private `GParamSpec` portion
---@field flags_class GObject.FlagsClass # the `GFlagsClass` for the flags
---@field default_value integer # default value for the property specified
GObject.ParamSpecFlags = {}

--- # class GObject.ParamSpecFloat
---
--- A `GParamSpec` derived structure that contains the meta data for float properties.
---
--- ---
---
---@class GObject.ParamSpecFloat : GObject.ParamSpec
---@field parent_instance GObject.ParamSpec # private `GParamSpec` portion
---@field minimum number # minimum value for the property specified
---@field maximum number # maximum value for the property specified
---@field default_value number # default value for the property specified
---@field epsilon number # values closer than `epsilon` will be considered identical by `g_param_values_cmp()`; the default value is 1e-30.
GObject.ParamSpecFloat = {}

--- # class GObject.ParamSpecGType
---
--- A `GParamSpec` derived structure that contains the meta data for `GType` properties.
---
--- ---
---
---@class GObject.ParamSpecGType : GObject.ParamSpec
---@field parent_instance GObject.ParamSpec # private `GParamSpec` portion
---@field is_a_type GObject.GType # a `GType` whose subtypes can occur as values
GObject.ParamSpecGType = {}

--- # class GObject.ParamSpecInt
---
--- A `GParamSpec` derived structure that contains the meta data for integer properties.
---
--- ---
---
---@class GObject.ParamSpecInt : GObject.ParamSpec
---@field parent_instance GObject.ParamSpec # private `GParamSpec` portion
---@field minimum integer # minimum value for the property specified
---@field maximum integer # maximum value for the property specified
---@field default_value integer # default value for the property specified
GObject.ParamSpecInt = {}

--- # class GObject.ParamSpecInt64
---
--- A `GParamSpec` derived structure that contains the meta data for 64bit integer properties.
---
--- ---
---
---@class GObject.ParamSpecInt64 : GObject.ParamSpec
---@field parent_instance GObject.ParamSpec # private `GParamSpec` portion
---@field minimum integer # minimum value for the property specified
---@field maximum integer # maximum value for the property specified
---@field default_value integer # default value for the property specified
GObject.ParamSpecInt64 = {}

--- # class GObject.ParamSpecLong
---
--- A `GParamSpec` derived structure that contains the meta data for long integer properties.
---
--- ---
---
---@class GObject.ParamSpecLong : GObject.ParamSpec
---@field parent_instance GObject.ParamSpec # private `GParamSpec` portion
---@field minimum integer # minimum value for the property specified
---@field maximum integer # maximum value for the property specified
---@field default_value integer # default value for the property specified
GObject.ParamSpecLong = {}

--- # class GObject.ParamSpecObject
---
--- A `GParamSpec` derived structure that contains the meta data for object properties.
---
--- ---
---
---@class GObject.ParamSpecObject : GObject.ParamSpec
---@field parent_instance GObject.ParamSpec # private `GParamSpec` portion
GObject.ParamSpecObject = {}

--- # class GObject.ParamSpecOverride
---
--- A `GParamSpec` derived structure that redirects operations to
--- other types of `GParamSpec`.
--- 
--- All operations other than getting or setting the value are redirected,
--- including accessing the nick and blurb, validating a value, and so
--- forth.
--- 
--- See `g_param_spec_get_redirect_target()` for retrieving the overridden
--- property. `GParamSpecOverride` is used in implementing
--- `g_object_class_override_property()`, and will not be directly useful
--- unless you are implementing a new base type similar to GObject.
---
--- ---
---
---@class GObject.ParamSpecOverride : GObject.ParamSpec
---@field parent_instance GObject.ParamSpec
---@field overridden GObject.ParamSpec
GObject.ParamSpecOverride = {}

--- # class GObject.ParamSpecParam
---
--- A `GParamSpec` derived structure that contains the meta data for %G_TYPE_PARAM
--- properties.
---
--- ---
---
---@class GObject.ParamSpecParam : GObject.ParamSpec
---@field parent_instance GObject.ParamSpec # private `GParamSpec` portion
GObject.ParamSpecParam = {}

--- # class GObject.ParamSpecPointer
---
--- A `GParamSpec` derived structure that contains the meta data for pointer properties.
---
--- ---
---
---@class GObject.ParamSpecPointer : GObject.ParamSpec
---@field parent_instance GObject.ParamSpec # private `GParamSpec` portion
GObject.ParamSpecPointer = {}

--- # record GObject.ParamSpecPool
---
--- A `GParamSpecPool` maintains a collection of `GParamSpecs` which can be
--- quickly accessed by owner and name.
--- 
--- The implementation of the `GObject` property system uses such a pool to
--- store the `GParamSpecs` of the properties all object types.
---
--- ---
---
---@class GObject.ParamSpecPool
GObject.ParamSpecPool = {}

--- # method GObject.ParamSpecPool:insert()
---
--- Inserts a `GParamSpec` in the pool.
---
--- ---
---
---@param self GObject.ParamSpecPool # a `GParamSpecPool`.
---@param pspec GObject.ParamSpec # the `GParamSpec` to insert
---@param owner_type GObject.GType # a `GType` identifying the owner of `pspec`
---@return nil
function GObject.ParamSpecPool:insert(pspec, owner_type) end

--- # method GObject.ParamSpecPool:list()
---
--- Gets an array of all `GParamSpecs` owned by `owner_type` in
--- the pool.
---
--- ---
---
---@param self GObject.ParamSpecPool # a `GParamSpecPool`
---@param owner_type GObject.GType # the owner to look for
---@param n_pspecs_p integer # return location for the length of the returned array
---@return unknown[] # a newly allocated array containing pointers to all `GParamSpecs` owned by `owner_type` in the pool
function GObject.ParamSpecPool:list(owner_type, n_pspecs_p) end

--- # method GObject.ParamSpecPool:list_owned()
---
--- Gets an `GList` of all `GParamSpecs` owned by `owner_type` in
--- the pool.
---
--- ---
---
---@param self GObject.ParamSpecPool # a `GParamSpecPool`
---@param owner_type GObject.GType # the owner to look for
---@return GObject.ParamSpec[] # a `GList` of all `GParamSpecs` owned by `owner_type` in the pool`GParamSpecs`.
function GObject.ParamSpecPool:list_owned(owner_type) end

--- # method GObject.ParamSpecPool:lookup()
---
--- Looks up a `GParamSpec` in the pool.
---
--- ---
---
---@param self GObject.ParamSpecPool # a `GParamSpecPool`
---@param param_name string # the name to look for
---@param owner_type GObject.GType # the owner to look for
---@param walk_ancestors (boolean|nil) # If `true`, also try to find a `GParamSpec` with `param_name` owned by an ancestor of `owner_type`.
---@return GObject.ParamSpec # The found `GParamSpec`, or `nil` if no matching `GParamSpec` was found.
function GObject.ParamSpecPool:lookup(param_name, owner_type, walk_ancestors) end

--- # method GObject.ParamSpecPool:remove()
---
--- Removes a `GParamSpec` from the pool.
---
--- ---
---
---@param self GObject.ParamSpecPool # a `GParamSpecPool`
---@param pspec GObject.ParamSpec # the `GParamSpec` to remove
---@return nil
function GObject.ParamSpecPool:remove(pspec) end

--- # class GObject.ParamSpecString
---
--- A `GParamSpec` derived structure that contains the meta data for string
--- properties.
---
--- ---
---
---@class GObject.ParamSpecString : GObject.ParamSpec
---@field parent_instance GObject.ParamSpec # private `GParamSpec` portion
---@field default_value string # default value for the property specified
---@field cset_first string # a string containing the allowed values for the first byte
---@field cset_nth string # a string containing the allowed values for the subsequent bytes
---@field substitutor integer # the replacement byte for bytes which don't match `cset_first` or `cset_nth`.
---@field null_fold_if_empty integer # replace empty string by `nil`
---@field ensure_non_null integer # replace `nil` strings by an empty string
GObject.ParamSpecString = {}

--- # record GObject.ParamSpecTypeInfo
---
--- This structure is used to provide the type system with the information
--- required to initialize and destruct (finalize) a parameter's class and
--- instances thereof.
--- 
--- The initialized structure is passed to the `g_param_type_register_static()`
--- The type system will perform a deep copy of this structure, so its memory
--- does not need to be persistent across invocation of
--- `g_param_type_register_static()`.
---
--- ---
---
---@class GObject.ParamSpecTypeInfo
---@field instance_size integer # Size of the instance (object) structure.
---@field n_preallocs integer # Prior to GLib 2.10, it specified the number of pre-allocated (cached) instances to reserve memory for (0 indicates no caching). Since GLib 2.10, it is ignored, since instances are allocated with the [slice allocator][glib-Memory-Slices] now.
---@field instance_init fun(pspec: GObject.ParamSpec): nil
---@field value_type GObject.GType # The `GType` of values conforming to this `GParamSpec`
---@field finalize fun(pspec: GObject.ParamSpec): nil
---@field value_set_default fun(pspec: GObject.ParamSpec, value: GObject.Value): nil
---@field value_validate fun(pspec: GObject.ParamSpec, value: GObject.Value): (boolean|nil)
---@field values_cmp fun(pspec: GObject.ParamSpec, value1: GObject.Value, value2: GObject.Value): integer
GObject.ParamSpecTypeInfo = {}

--- # class GObject.ParamSpecUChar
---
--- A `GParamSpec` derived structure that contains the meta data for unsigned character properties.
---
--- ---
---
---@class GObject.ParamSpecUChar : GObject.ParamSpec
---@field parent_instance GObject.ParamSpec # private `GParamSpec` portion
---@field minimum integer # minimum value for the property specified
---@field maximum integer # maximum value for the property specified
---@field default_value integer # default value for the property specified
GObject.ParamSpecUChar = {}

--- # class GObject.ParamSpecUInt
---
--- A `GParamSpec` derived structure that contains the meta data for unsigned integer properties.
---
--- ---
---
---@class GObject.ParamSpecUInt : GObject.ParamSpec
---@field parent_instance GObject.ParamSpec # private `GParamSpec` portion
---@field minimum integer # minimum value for the property specified
---@field maximum integer # maximum value for the property specified
---@field default_value integer # default value for the property specified
GObject.ParamSpecUInt = {}

--- # class GObject.ParamSpecUInt64
---
--- A `GParamSpec` derived structure that contains the meta data for unsigned 64bit integer properties.
---
--- ---
---
---@class GObject.ParamSpecUInt64 : GObject.ParamSpec
---@field parent_instance GObject.ParamSpec # private `GParamSpec` portion
---@field minimum integer # minimum value for the property specified
---@field maximum integer # maximum value for the property specified
---@field default_value integer # default value for the property specified
GObject.ParamSpecUInt64 = {}

--- # class GObject.ParamSpecULong
---
--- A `GParamSpec` derived structure that contains the meta data for unsigned long integer properties.
---
--- ---
---
---@class GObject.ParamSpecULong : GObject.ParamSpec
---@field parent_instance GObject.ParamSpec # private `GParamSpec` portion
---@field minimum integer # minimum value for the property specified
---@field maximum integer # maximum value for the property specified
---@field default_value integer # default value for the property specified
GObject.ParamSpecULong = {}

--- # class GObject.ParamSpecUnichar
---
--- A `GParamSpec` derived structure that contains the meta data for unichar (unsigned integer) properties.
---
--- ---
---
---@class GObject.ParamSpecUnichar : GObject.ParamSpec
---@field parent_instance GObject.ParamSpec # private `GParamSpec` portion
---@field default_value integer # default value for the property specified
GObject.ParamSpecUnichar = {}

--- # class GObject.ParamSpecValueArray
---
--- A `GParamSpec` derived structure that contains the meta data for `GValueArray` properties.
---
--- ---
---
---@class GObject.ParamSpecValueArray : GObject.ParamSpec
---@field parent_instance GObject.ParamSpec # private `GParamSpec` portion
---@field element_spec GObject.ParamSpec # a `GParamSpec` describing the elements contained in arrays of this property, may be `nil`
---@field fixed_n_elements integer # if greater than 0, arrays of this property will always have this many elements
GObject.ParamSpecValueArray = {}

--- # class GObject.ParamSpecVariant
---
--- A `GParamSpec` derived structure that contains the meta data for `GVariant` properties.
--- 
--- When comparing values with `g_param_values_cmp()`, scalar values with the same
--- type will be compared with `g_variant_compare()`. Other non-`nil` variants will
--- be checked for equality with `g_variant_equal()`, and their sort order is
--- otherwise undefined. `nil` is ordered before non-`nil` variants. Two `nil`
--- values compare equal.
---
--- ---
---
---@class GObject.ParamSpecVariant : GObject.ParamSpec
---@field parent_instance GObject.ParamSpec # private `GParamSpec` portion
---@field type GLib.VariantType # a `GVariantType`, or `nil`
---@field default_value GLib.Variant # a `GVariant`, or `nil`
---@field padding unknown[]
GObject.ParamSpecVariant = {}

--- # record GObject.Parameter
---
--- The GParameter struct is an auxiliary structure used
--- to hand parameter name/value pairs to `g_object_newv()`.
---
--- ---
---
---@class GObject.Parameter
---@field name string # the parameter name
---@field value GObject.Value # the parameter value
GObject.Parameter = {}

---@alias GObject.SignalAccumulator fun(ihint: GObject.SignalInvocationHint, return_accu: GObject.Value, handler_return: GObject.Value, data: userdata): (boolean|nil)

---@alias GObject.SignalEmissionHook fun(ihint: GObject.SignalInvocationHint, n_param_values: integer, param_values: unknown[], data: userdata): (boolean|nil)

---@enum GObject.SignalFlags
GObject.SignalFlags = {}

--- # class GObject.SignalGroup
---
--- `GSignalGroup` manages to simplify the process of connecting
--- many signals to a `GObject` as a group. As such there is no API
--- to disconnect a signal from the group.
--- 
--- In particular, this allows you to:
--- 
---  - Change the target instance, which automatically causes disconnection
---    of the signals from the old instance and connecting to the new instance.
---  - Block and unblock signals as a group
---  - Ensuring that blocked state transfers across target instances.
--- 
--- One place you might want to use such a structure is with `GtkTextView` and
--- `GtkTextBuffer`. Often times, you'll need to connect to many signals on
--- `GtkTextBuffer` from a `GtkTextView` subclass. This allows you to create a
--- signal group during instance construction, simply bind the
--- `GtkTextView`:buffer property to `GSignalGroup`:target and connect
--- all the signals you need. When the `GtkTextView`:buffer property changes
--- all of the signals will be transitioned correctly.
---
--- ---
---
---@class GObject.SignalGroup : GObject.Object
---@operator call: GObject.SignalGroup
GObject.SignalGroup = {}

--- # method GObject.SignalGroup:block()
---
--- Blocks all signal handlers managed by `self` so they will not
--- be called during any signal emissions. Must be unblocked exactly
--- the same number of times it has been blocked to become active again.
--- 
--- This blocked state will be kept across changes of the target instance.
---
--- ---
---
---@param self GObject.SignalGroup # the `GSignalGroup`
---@return nil
function GObject.SignalGroup:block() end

--- # method GObject.SignalGroup:connect_closure()
---
--- Connects `closure` to the signal `detailed_signal` on `GSignalGroup`:target.
--- 
--- You cannot connect a signal handler after `GSignalGroup`:target has been set.
---
--- ---
---
---@param self GObject.SignalGroup # a `GSignalGroup`
---@param detailed_signal string # a string of the form `signal-name` with optional `::signal-detail`
---@param closure GObject.Closure # the closure to connect.
---@param after (boolean|nil) # whether the handler should be called before or after the default handler of the signal.
---@return nil
function GObject.SignalGroup:connect_closure(detailed_signal, closure, after) end

--- # method GObject.SignalGroup:connect_data()
---
--- Connects `c_handler` to the signal `detailed_signal`
--- on the target instance of `self`.
--- 
--- You cannot connect a signal handler after `GSignalGroup`:target has been set.
---
--- ---
---
---@param self GObject.SignalGroup # a `GSignalGroup`
---@param detailed_signal string # a string of the form "signal-name::detail"
---@param c_handler GObject.Callback # the `GCallback` to connect
---@param data? userdata # the data to pass to `c_handler` calls
---@param notify GObject.ClosureNotify # function to be called when disposing of `self`
---@param flags GObject.ConnectFlags # the flags used to create the signal connection
---@return nil
function GObject.SignalGroup:connect_data(detailed_signal, c_handler, data, notify, flags) end

--- # method GObject.SignalGroup:connect_swapped()
---
--- Connects `c_handler` to the signal `detailed_signal`
--- on the target instance of `self`.
--- 
--- The instance on which the signal is emitted and `data`
--- will be swapped when calling `c_handler`.
--- 
--- You cannot connect a signal handler after `GSignalGroup`:target has been set.
---
--- ---
---
---@param self GObject.SignalGroup # a `GSignalGroup`
---@param detailed_signal string # a string of the form "signal-name::detail"
---@param c_handler GObject.Callback # the `GCallback` to connect
---@param data? userdata # the data to pass to `c_handler` calls
---@return nil
function GObject.SignalGroup:connect_swapped(detailed_signal, c_handler, data) end

--- # method GObject.SignalGroup:dup_target()
---
--- Gets the target instance used when connecting signals.
---
--- ---
---
---@param self GObject.SignalGroup # the `GSignalGroup`
---@return GObject.Object # The target instance
function GObject.SignalGroup:dup_target() end

--- # method GObject.SignalGroup:set_target()
---
--- Sets the target instance used when connecting signals. Any signal
--- that has been registered with `g_signal_group_connect_object()` or
--- similar functions will be connected to this object.
--- 
--- If the target instance was previously set, signals will be
--- disconnected from that object prior to connecting to `target`.
---
--- ---
---
---@param self GObject.SignalGroup # the `GSignalGroup`.
---@param target? GObject.Object # The target instance used when connecting signals.
---@return nil
function GObject.SignalGroup:set_target(target) end

--- # method GObject.SignalGroup:unblock()
---
--- Unblocks all signal handlers managed by `self` so they will be
--- called again during any signal emissions unless it is blocked
--- again. Must be unblocked exactly the same number of times it
--- has been blocked to become active again.
---
--- ---
---
---@param self GObject.SignalGroup # the `GSignalGroup`
---@return nil
function GObject.SignalGroup:unblock() end

--- # function GObject.SignalGroup.new()
---
--- Creates a new `GSignalGroup` for target instances of `target_type`.
---
--- ---
---
---@param target_type GObject.GType # the `GType` of the target instance.
---@return GObject.SignalGroup # a new `GSignalGroup`
function GObject.SignalGroup.new(target_type) end

--- # record GObject.SignalInvocationHint
---
--- The `GSignalInvocationHint` structure is used to pass on additional information
--- to callbacks during a signal emission.
---
--- ---
---
---@class GObject.SignalInvocationHint
---@field signal_id integer # The signal id of the signal invoking the callback
---@field detail GLib.Quark # The detail passed on for this emission
---@field run_type GObject.SignalFlags # The stage the signal emission is currently in, this field will contain one of %G_SIGNAL_RUN_FIRST, %G_SIGNAL_RUN_LAST or %G_SIGNAL_RUN_CLEANUP and %G_SIGNAL_ACCUMULATOR_FIRST_RUN. %G_SIGNAL_ACCUMULATOR_FIRST_RUN is only set for the first run of the accumulator function for a signal emission.
GObject.SignalInvocationHint = {}

---@enum GObject.SignalMatchType
GObject.SignalMatchType = {}

--- # record GObject.SignalQuery
---
--- A structure holding in-depth information for a specific signal.
--- 
--- See also: `g_signal_query()`
---
--- ---
---
---@class GObject.SignalQuery
---@field signal_id integer # The signal id of the signal being queried, or 0 if the signal to be queried was unknown.
---@field signal_name string # The signal name.
---@field itype GObject.GType # The interface/instance type that this signal can be emitted for.
---@field signal_flags GObject.SignalFlags # The signal flags as passed in to `g_signal_new()`.
---@field return_type GObject.GType # The return type for user callbacks.
---@field n_params integer # The number of parameters that user callbacks take.
---@field param_types unknown[] # The individual parameter types for user callbacks, note that the effective callback signature is: |[<!-- language="C" --> `return_type` callback (`gpointer` data1, [param_types param_names,] gpointer data2); ]|
GObject.SignalQuery = {}

---@alias GObject.ToggleNotify fun(data: userdata, object: GObject.Object, is_last_ref: (boolean|nil)): nil

--- # union GObject.TypeCValue
---
---@class GObject.TypeCValue
GObject.TypeCValue = {}

--- # record GObject.TypeClass
---
--- An opaque structure used as the base of all classes.
---
--- ---
---
---@class GObject.TypeClass
---@field g_type GObject.GType
GObject.TypeClass = {}

--- # method GObject.TypeClass:add_private()
---
--- Registers a private structure for an instantiatable type.
--- 
--- When an object is allocated, the private structures for
--- the type and all of its parent types are allocated
--- sequentially in the same memory block as the public
--- structures, and are zero-filled.
--- 
--- Note that the accumulated size of the private structures of
--- a type and all its parent types cannot exceed 64 KiB.
--- 
--- This function should be called in the type's `class_init()` function.
--- The private structure can be retrieved using the
--- G_TYPE_INSTANCE_GET_PRIVATE() macro.
--- 
--- The following example shows attaching a private structure
--- MyObjectPrivate to an object MyObject defined in the standard
--- GObject fashion in the type's `class_init()` function.
--- 
--- Note the use of a structure member "priv" to avoid the overhead
--- of repeatedly calling MY_OBJECT_GET_PRIVATE().
--- 
--- ```c
--- typedef struct _MyObject        MyObject;
--- typedef struct _MyObjectPrivate MyObjectPrivate;
--- 
--- struct _MyObject {
---  GObject parent;
--- 
---  MyObjectPrivate *priv;
--- };
--- 
--- struct _MyObjectPrivate {
---   int some_field;
--- };
--- 
--- static void
--- my_object_class_init (MyObjectClass *klass)
--- {
---   g_type_class_add_private (klass, sizeof (MyObjectPrivate));
--- }
--- 
--- static void
--- my_object_init (MyObject *my_object)
--- {
---   my_object->priv = G_TYPE_INSTANCE_GET_PRIVATE (my_object,
---                                                  MY_TYPE_OBJECT,
---                                                  MyObjectPrivate);
---   // my_object->priv->some_field will be automatically initialised to 0
--- }
--- 
--- static int
--- my_object_get_some_field (MyObject *my_object)
--- {
---   MyObjectPrivate *priv;
--- 
---   g_return_val_if_fail (MY_IS_OBJECT (my_object), 0);
--- 
---   priv = my_object->priv;
--- 
---   return priv->some_field;
--- }
--- ```
---
--- ---
---
---@param self GObject.TypeClass # class structure for an instantiatable type
---@param private_size integer # size of private structure
---@return nil
function GObject.TypeClass:add_private(private_size) end

--- # method GObject.TypeClass:get_private()
---
---@param self GObject.TypeClass
---@param private_type GObject.GType
---@return userdata
function GObject.TypeClass:get_private(private_type) end

--- # method GObject.TypeClass:peek_parent()
---
--- This is a convenience function often needed in class initializers.
--- It returns the class structure of the immediate parent type of the
--- class passed in.  Since derived classes hold a reference count on
--- their parent classes as long as they are instantiated, the returned
--- class will always exist.
--- 
--- This function is essentially equivalent to:
--- g_type_class_peek (g_type_parent (G_TYPE_FROM_CLASS (g_class)))
---
--- ---
---
---@param self GObject.TypeClass # the `GTypeClass` structure to retrieve the parent class for
---@return GObject.TypeClass # the parent class of `g_class`
function GObject.TypeClass:peek_parent() end

--- # method GObject.TypeClass:unref()
---
--- Decrements the reference count of the class structure being passed in.
--- Once the last reference count of a class has been released, classes
--- may be finalized by the type system, so further dereferencing of a
--- class pointer after `g_type_class_unref()` are invalid.
---
--- ---
---
---@param self GObject.TypeClass # a `GTypeClass` structure to unref
---@return nil
function GObject.TypeClass:unref() end

--- # function GObject.TypeClass.adjust_private_offset()
---
---@param g_class? userdata
---@param private_size_or_offset integer
---@return nil
function GObject.TypeClass.adjust_private_offset(g_class, private_size_or_offset) end

--- # function GObject.TypeClass.peek()
---
--- This function is essentially the same as `g_type_class_ref()`,
--- except that the classes reference count isn't incremented.
--- As a consequence, this function may return `nil` if the class
--- of the type passed in does not currently exist (hasn't been
--- referenced before).
---
--- ---
---
---@param type GObject.GType # type ID of a classed type
---@return GObject.TypeClass # the `GTypeClass` structure for the given type ID or `nil` if the class does not currently exist
function GObject.TypeClass.peek(type) end

--- # function GObject.TypeClass.peek_static()
---
--- A more efficient version of `g_type_class_peek()` which works only for
--- static types.
---
--- ---
---
---@param type GObject.GType # type ID of a classed type
---@return GObject.TypeClass # the `GTypeClass` structure for the given type ID or `nil` if the class does not currently exist or is dynamically loaded
function GObject.TypeClass.peek_static(type) end

--- # function GObject.TypeClass.ref()
---
--- Increments the reference count of the class structure belonging to
--- `type`. This function will demand-create the class if it doesn't
--- exist already.
---
--- ---
---
---@param type GObject.GType # type ID of a classed type
---@return GObject.TypeClass # the `GTypeClass` structure for the given type ID
function GObject.TypeClass.ref(type) end

---@alias GObject.TypeClassCacheFunc fun(cache_data: userdata, g_class: GObject.TypeClass): (boolean|nil)

---@enum GObject.TypeDebugFlags
GObject.TypeDebugFlags = {}

---@enum GObject.TypeFlags
GObject.TypeFlags = {}

---@enum GObject.TypeFundamentalFlags
GObject.TypeFundamentalFlags = {}

--- # record GObject.TypeFundamentalInfo
---
--- A structure that provides information to the type system which is
--- used specifically for managing fundamental types.
---
--- ---
---
---@class GObject.TypeFundamentalInfo
---@field type_flags GObject.TypeFundamentalFlags # `GTypeFundamentalFlags` describing the characteristics of the fundamental type
GObject.TypeFundamentalInfo = {}

--- # record GObject.TypeInfo
---
--- This structure is used to provide the type system with the information
--- required to initialize and destruct (finalize) a type's class and
--- its instances.
--- 
--- The initialized structure is passed to the `g_type_register_static()` function
--- (or is copied into the provided `GTypeInfo` structure in the
--- `g_type_plugin_complete_type_info()`). The type system will perform a deep
--- copy of this structure, so its memory does not need to be persistent
--- across invocation of `g_type_register_static()`.
---
--- ---
---
---@class GObject.TypeInfo
---@field class_size integer # Size of the class structure (required for interface, classed and instantiatable types)
---@field base_init GObject.BaseInitFunc # Location of the base initialization function (optional)
---@field base_finalize GObject.BaseFinalizeFunc # Location of the base finalization function (optional)
---@field class_init GObject.ClassInitFunc # Location of the class initialization function for classed and instantiatable types. Location of the default vtable inititalization function for interface types. (optional) This function is used both to fill in virtual functions in the class or default vtable, and to do type-specific setup such as registering signals and object properties.
---@field class_finalize GObject.ClassFinalizeFunc # Location of the class finalization function for classed and instantiatable types. Location of the default vtable finalization function for interface types. (optional)
---@field class_data userdata # User-supplied data passed to the class init/finalize functions
---@field instance_size integer # Size of the instance (object) structure (required for instantiatable types only)
---@field n_preallocs integer # Prior to GLib 2.10, it specified the number of pre-allocated (cached) instances to reserve memory for (0 indicates no caching). Since GLib 2.10 this field is ignored.
---@field instance_init GObject.InstanceInitFunc # Location of the instance initialization function (optional, for instantiatable types only)
---@field value_table GObject.TypeValueTable # A `GTypeValueTable` function table for generic handling of GValues of this type (usually only useful for fundamental types)
GObject.TypeInfo = {}

--- # record GObject.TypeInstance
---
--- An opaque structure used as the base of all type instances.
---
--- ---
---
---@class GObject.TypeInstance
---@field g_class GObject.TypeClass
GObject.TypeInstance = {}

--- # method GObject.TypeInstance:get_private()
---
---@param self GObject.TypeInstance
---@param private_type GObject.GType
---@return userdata
function GObject.TypeInstance:get_private(private_type) end

--- # record GObject.TypeInterface
---
--- An opaque structure used as the base of all interface types.
---
--- ---
---
---@class GObject.TypeInterface
---@field g_type GObject.GType
---@field g_instance_type GObject.GType
GObject.TypeInterface = {}

--- # method GObject.TypeInterface:peek_parent()
---
--- Returns the corresponding `GTypeInterface` structure of the parent type
--- of the instance type to which `g_iface` belongs. This is useful when
--- deriving the implementation of an interface from the parent type and
--- then possibly overriding some methods.
---
--- ---
---
---@param self GObject.TypeInterface # a `GTypeInterface` structure
---@return GObject.TypeInterface # the corresponding `GTypeInterface` structure of the parent type of the instance type to which `g_iface` belongs, or `nil` if the parent type doesn't conform to the interface
function GObject.TypeInterface:peek_parent() end

--- # function GObject.TypeInterface.add_prerequisite()
---
--- Adds `prerequisite_type` to the list of prerequisites of `interface_type`.
--- This means that any type implementing `interface_type` must also implement
--- `prerequisite_type`. Prerequisites can be thought of as an alternative to
--- interface derivation (which GType doesn't support). An interface can have
--- at most one instantiatable prerequisite type.
---
--- ---
---
---@param interface_type GObject.GType # `GType` value of an interface type
---@param prerequisite_type GObject.GType # `GType` value of an interface or instantiatable type
---@return nil
function GObject.TypeInterface.add_prerequisite(interface_type, prerequisite_type) end

--- # function GObject.TypeInterface.get_plugin()
---
--- Returns the `GTypePlugin` structure for the dynamic interface
--- `interface_type` which has been added to `instance_type`, or `nil`
--- if `interface_type` has not been added to `instance_type` or does
--- not have a `GTypePlugin` structure. See `g_type_add_interface_dynamic()`.
---
--- ---
---
---@param instance_type GObject.GType # `GType` of an instantiatable type
---@param interface_type GObject.GType # `GType` of an interface type
---@return GObject.TypePlugin # the `GTypePlugin` for the dynamic interface `interface_type` of `instance_type`
function GObject.TypeInterface.get_plugin(instance_type, interface_type) end

--- # function GObject.TypeInterface.instantiatable_prerequisite()
---
--- Returns the most specific instantiatable prerequisite of an
--- interface type. If the interface type has no instantiatable
--- prerequisite, %G_TYPE_INVALID is returned.
--- 
--- See `g_type_interface_add_prerequisite()` for more information
--- about prerequisites.
---
--- ---
---
---@param interface_type GObject.GType # an interface type
---@return GObject.GType # the instantiatable prerequisite type or %G_TYPE_INVALID if none
function GObject.TypeInterface.instantiatable_prerequisite(interface_type) end

--- # function GObject.TypeInterface.peek()
---
--- Returns the `GTypeInterface` structure of an interface to which the
--- passed in class conforms.
---
--- ---
---
---@param instance_class GObject.TypeClass # a `GTypeClass` structure
---@param iface_type GObject.GType # an interface ID which this class conforms to
---@return GObject.TypeInterface # the `GTypeInterface` structure of `iface_type` if implemented by `instance_class`, `nil` otherwise
function GObject.TypeInterface.peek(instance_class, iface_type) end

--- # function GObject.TypeInterface.prerequisites()
---
--- Returns the prerequisites of an interfaces type.
---
--- ---
---
---@param interface_type GObject.GType # an interface type
---@param n_prerequisites? integer # location to return the number of prerequisites, or `nil`
---@return unknown[] # a newly-allocated zero-terminated array of `GType` containing the prerequisites of `interface_type`
function GObject.TypeInterface.prerequisites(interface_type, n_prerequisites) end

---@alias GObject.TypeInterfaceCheckFunc fun(check_data: userdata, g_iface: GObject.TypeInterface): nil

--- # class GObject.TypeModule
---
--- `GTypeModule` provides a simple implementation of the `GTypePlugin`
--- interface.
--- 
--- The model of `GTypeModule` is a dynamically loaded module which
--- implements some number of types and interface implementations.
--- 
--- When the module is loaded, it registers its types and interfaces
--- using `g_type_module_register_type()` and `g_type_module_add_interface()`.
--- As long as any instances of these types and interface implementations
--- are in use, the module is kept loaded. When the types and interfaces
--- are gone, the module may be unloaded. If the types and interfaces
--- become used again, the module will be reloaded. Note that the last
--- reference cannot be released from within the module code, since that
--- would lead to the caller's code being unloaded before `g_object_unref()`
--- returns to it.
--- 
--- Keeping track of whether the module should be loaded or not is done by
--- using a use count - it starts at zero, and whenever it is greater than
--- zero, the module is loaded. The use count is maintained internally by
--- the type system, but also can be explicitly controlled by
--- `g_type_module_use()` and `g_type_module_unuse()`. Typically, when loading
--- a module for the first type, `g_type_module_use()` will be used to load
--- it so that it can initialize its types. At some later point, when the
--- module no longer needs to be loaded except for the type
--- implementations it contains, `g_type_module_unuse()` is called.
--- 
--- `GTypeModule` does not actually provide any implementation of module
--- loading and unloading. To create a particular module type you must
--- derive from `GTypeModule` and implement the load and unload functions
--- in `GTypeModuleClass`.
---
--- ---
---
---@class GObject.TypeModule : GObject.Object, GObject.TypePlugin
---@field parent_instance GObject.Object
---@field use_count integer
---@field type_infos userdata[]
---@field interface_infos userdata[]
---@field name string # the name of the module
GObject.TypeModule = {}

--- # method GObject.TypeModule:add_interface()
---
--- Registers an additional interface for a type, whose interface lives
--- in the given type plugin. If the interface was already registered
--- for the type in this plugin, nothing will be done.
--- 
--- As long as any instances of the type exist, the type plugin will
--- not be unloaded.
--- 
--- Since 2.56 if `module` is `nil` this will call `g_type_add_interface_static()`
--- instead. This can be used when making a static build of the module.
---
--- ---
---
---@param self? GObject.TypeModule # a `GTypeModule`
---@param instance_type GObject.GType # type to which to add the interface.
---@param interface_type GObject.GType # interface type to add
---@param interface_info GObject.InterfaceInfo # type information structure
---@return nil
function GObject.TypeModule:add_interface(instance_type, interface_type, interface_info) end

--- # method GObject.TypeModule:register_enum()
---
--- Looks up or registers an enumeration that is implemented with a particular
--- type plugin. If a type with name `type_name` was previously registered,
--- the `GType` identifier for the type is returned, otherwise the type
--- is newly registered, and the resulting `GType` identifier returned.
--- 
--- As long as any instances of the type exist, the type plugin will
--- not be unloaded.
--- 
--- Since 2.56 if `module` is `nil` this will call `g_type_register_static()`
--- instead. This can be used when making a static build of the module.
---
--- ---
---
---@param self? GObject.TypeModule # a `GTypeModule`
---@param name string # name for the type
---@param const_static_values GObject.EnumValue # an array of `GEnumValue` structs for the possible enumeration values. The array is terminated by a struct with all members being 0.
---@return GObject.GType # the new or existing type ID
function GObject.TypeModule:register_enum(name, const_static_values) end

--- # method GObject.TypeModule:register_flags()
---
--- Looks up or registers a flags type that is implemented with a particular
--- type plugin. If a type with name `type_name` was previously registered,
--- the `GType` identifier for the type is returned, otherwise the type
--- is newly registered, and the resulting `GType` identifier returned.
--- 
--- As long as any instances of the type exist, the type plugin will
--- not be unloaded.
--- 
--- Since 2.56 if `module` is `nil` this will call `g_type_register_static()`
--- instead. This can be used when making a static build of the module.
---
--- ---
---
---@param self? GObject.TypeModule # a `GTypeModule`
---@param name string # name for the type
---@param const_static_values GObject.FlagsValue # an array of `GFlagsValue` structs for the possible flags values. The array is terminated by a struct with all members being 0.
---@return GObject.GType # the new or existing type ID
function GObject.TypeModule:register_flags(name, const_static_values) end

--- # method GObject.TypeModule:register_type()
---
--- Looks up or registers a type that is implemented with a particular
--- type plugin. If a type with name `type_name` was previously registered,
--- the `GType` identifier for the type is returned, otherwise the type
--- is newly registered, and the resulting `GType` identifier returned.
--- 
--- When reregistering a type (typically because a module is unloaded
--- then reloaded, and reinitialized), `module` and `parent_type` must
--- be the same as they were previously.
--- 
--- As long as any instances of the type exist, the type plugin will
--- not be unloaded.
--- 
--- Since 2.56 if `module` is `nil` this will call `g_type_register_static()`
--- instead. This can be used when making a static build of the module.
---
--- ---
---
---@param self? GObject.TypeModule # a `GTypeModule`
---@param parent_type GObject.GType # the type for the parent class
---@param type_name string # name for the type
---@param type_info GObject.TypeInfo # type information structure
---@param flags GObject.TypeFlags # flags field providing details about the type
---@return GObject.GType # the new or existing type ID
function GObject.TypeModule:register_type(parent_type, type_name, type_info, flags) end

--- # method GObject.TypeModule:set_name()
---
--- Sets the name for a `GTypeModule`
---
--- ---
---
---@param self GObject.TypeModule # a `GTypeModule`.
---@param name string # a human-readable name to use in error messages.
---@return nil
function GObject.TypeModule:set_name(name) end

--- # method GObject.TypeModule:unuse()
---
--- Decreases the use count of a `GTypeModule` by one. If the
--- result is zero, the module will be unloaded. (However, the
--- `GTypeModule` will not be freed, and types associated with the
--- `GTypeModule` are not unregistered. Once a `GTypeModule` is
--- initialized, it must exist forever.)
---
--- ---
---
---@param self GObject.TypeModule # a `GTypeModule`
---@return nil
function GObject.TypeModule:unuse() end

--- # method GObject.TypeModule:use()
---
--- Increases the use count of a `GTypeModule` by one. If the
--- use count was zero before, the plugin will be loaded.
--- If loading the plugin fails, the use count is reset to
--- its prior value.
---
--- ---
---
---@param self GObject.TypeModule # a `GTypeModule`
---@return (boolean|nil) # `false` if the plugin needed to be loaded and loading the plugin failed.
function GObject.TypeModule:use() end

--- # record GObject.TypeModuleClass
---
--- In order to implement dynamic loading of types based on `GTypeModule`,
--- the `load` and `unload` functions in `GTypeModuleClass` must be implemented.
---
--- ---
---
---@class GObject.TypeModuleClass
---@field parent_class GObject.ObjectClass # the parent class
---@field load fun(module: GObject.TypeModule): (boolean|nil)
---@field unload fun(module: GObject.TypeModule): nil
---@field reserved1 fun(): nil
---@field reserved2 fun(): nil
---@field reserved3 fun(): nil
---@field reserved4 fun(): nil
GObject.TypeModuleClass = {}

--- # interface GObject.TypePlugin
---
--- An interface that handles the lifecycle of dynamically loaded types.
--- 
--- The GObject type system supports dynamic loading of types.
--- It goes as follows:
--- 
--- 1. The type is initially introduced (usually upon loading the module
---    the first time, or by your main application that knows what modules
---    introduces what types), like this:
---    ```c
---    new_type_id = g_type_register_dynamic (parent_type_id,
---                                           "TypeName",
---                                           new_type_plugin,
---                                           type_flags);
---    ```
---    where `new_type_plugin` is an implementation of the
---    `GTypePlugin` interface.
--- 
--- 2. The type's implementation is referenced, e.g. through
---    `g_type_class_ref()` or through `g_type_create_instance()` (this is
---    being called by `g_object_new()`) or through one of the above done on
---    a type derived from `new_type_id`.
--- 
--- 3. This causes the type system to load the type's implementation by
---    calling `g_type_plugin_use()` and `g_type_plugin_complete_type_info()`
---    on `new_type_plugin`.
--- 
--- 4. At some point the type's implementation isn't required anymore,
---    e.g. after `g_type_class_unref()` or `g_type_free_instance()` (called
---    when the reference count of an instance drops to zero).
--- 
--- 5. This causes the type system to throw away the information retrieved
---    from `g_type_plugin_complete_type_info()` and then it calls
---    `g_type_plugin_unuse()` on `new_type_plugin`.
--- 
--- 6. Things may repeat from the second step.
--- 
--- So basically, you need to implement a `GTypePlugin` type that
--- carries a use_count, once use_count goes from zero to one, you need
--- to load the implementation to successfully handle the upcoming
--- `g_type_plugin_complete_type_info()` call. Later, maybe after
--- succeeding use/unuse calls, once use_count drops to zero, you can
--- unload the implementation again. The type system makes sure to call
--- `g_type_plugin_use()` and `g_type_plugin_complete_type_info()` again
--- when the type is needed again.
--- 
--- `GTypeModule` is an implementation of `GTypePlugin` that already
--- implements most of this except for the actual module loading and
--- unloading. It even handles multiple registered types per module.
---
--- ---
---
---@class GObject.TypePlugin
GObject.TypePlugin = {}

--- # method GObject.TypePlugin:complete_interface_info()
---
--- Calls the `complete_interface_info` function from the
--- `GTypePluginClass` of `plugin`. There should be no need to use this
--- function outside of the GObject type system itself.
---
--- ---
---
---@param self GObject.TypePlugin # the `GTypePlugin`
---@param instance_type GObject.GType # the `GType` of an instantiatable type to which the interface is added
---@param interface_type GObject.GType # the `GType` of the interface whose info is completed
---@param info GObject.InterfaceInfo # the `GInterfaceInfo` to fill in
---@return nil
function GObject.TypePlugin:complete_interface_info(instance_type, interface_type, info) end

--- # method GObject.TypePlugin:complete_type_info()
---
--- Calls the `complete_type_info` function from the `GTypePluginClass` of `plugin`.
--- There should be no need to use this function outside of the GObject
--- type system itself.
---
--- ---
---
---@param self GObject.TypePlugin # a `GTypePlugin`
---@param g_type GObject.GType # the `GType` whose info is completed
---@param info GObject.TypeInfo # the `GTypeInfo` struct to fill in
---@param value_table GObject.TypeValueTable # the `GTypeValueTable` to fill in
---@return nil
function GObject.TypePlugin:complete_type_info(g_type, info, value_table) end

--- # method GObject.TypePlugin:unuse()
---
--- Calls the `unuse_plugin` function from the `GTypePluginClass` of
--- `plugin`.  There should be no need to use this function outside of
--- the GObject type system itself.
---
--- ---
---
---@param self GObject.TypePlugin # a `GTypePlugin`
---@return nil
function GObject.TypePlugin:unuse() end

--- # method GObject.TypePlugin:use()
---
--- Calls the `use_plugin` function from the `GTypePluginClass` of
--- `plugin`.  There should be no need to use this function outside of
--- the GObject type system itself.
---
--- ---
---
---@param self GObject.TypePlugin # a `GTypePlugin`
---@return nil
function GObject.TypePlugin:use() end

--- # record GObject.TypePluginClass
---
--- The `GTypePlugin` interface is used by the type system in order to handle
--- the lifecycle of dynamically loaded types.
---
--- ---
---
---@class GObject.TypePluginClass
---@field base_iface GObject.TypeInterface
---@field use_plugin GObject.TypePluginUse # Increases the use count of the plugin.
---@field unuse_plugin GObject.TypePluginUnuse # Decreases the use count of the plugin.
---@field complete_type_info GObject.TypePluginCompleteTypeInfo # Fills in the `GTypeInfo` and `GTypeValueTable` structs for the type. The structs are initialized with `memset(s, 0, sizeof (s))` before calling this function.
---@field complete_interface_info GObject.TypePluginCompleteInterfaceInfo # Fills in missing parts of the `GInterfaceInfo` for the interface. The structs is initialized with `memset(s, 0, sizeof (s))` before calling this function.
GObject.TypePluginClass = {}

---@alias GObject.TypePluginCompleteInterfaceInfo fun(plugin: GObject.TypePlugin, instance_type: GObject.GType, interface_type: GObject.GType, info: GObject.InterfaceInfo): nil

---@alias GObject.TypePluginCompleteTypeInfo fun(plugin: GObject.TypePlugin, g_type: GObject.GType, info: GObject.TypeInfo, value_table: GObject.TypeValueTable): nil

---@alias GObject.TypePluginUnuse fun(plugin: GObject.TypePlugin): nil

---@alias GObject.TypePluginUse fun(plugin: GObject.TypePlugin): nil

--- # record GObject.TypeQuery
---
--- A structure holding information for a specific type.
--- 
--- See also: `g_type_query()`
---
--- ---
---
---@class GObject.TypeQuery
---@field type GObject.GType # the `GType` value of the type
---@field type_name string # the name of the type
---@field class_size integer # the size of the class structure
---@field instance_size integer # the size of the instance structure
GObject.TypeQuery = {}

--- # record GObject.TypeValueTable
---
--- The `GTypeValueTable` provides the functions required by the `GValue`
--- implementation, to serve as a container for values of a type.
---
--- ---
---
---@class GObject.TypeValueTable
---@field value_init fun(value: GObject.Value): nil
---@field value_free fun(value: GObject.Value): nil
---@field value_copy fun(src_value: GObject.Value, dest_value: GObject.Value): nil
---@field value_peek_pointer fun(value: GObject.Value): userdata
---@field collect_format string # A string format describing how to collect the contents of this value bit-by-bit. Each character in the format represents an argument to be collected, and the characters themselves indicate the type of the argument. Currently supported arguments are: - 'i' - Integers. passed as collect_values[].v_int. - 'l' - Longs. passed as collect_values[].v_long. - 'd' - Doubles. passed as collect_values[].v_double. - 'p' - Pointers. passed as collect_values[].v_pointer. It should be noted that for variable argument list construction, ANSI C promotes every type smaller than an integer to an int, and floats to doubles. So for collection of short int or char, 'i' needs to be used, and for collection of floats 'd'.
---@field collect_value fun(value: GObject.Value, n_collect_values: integer, collect_values: GObject.TypeCValue, collect_flags: integer): string
---@field lcopy_format string # Format description of the arguments to collect for `lcopy_value`, analogous to `collect_format`. Usually, `lcopy_format` string consists only of 'p's to provide `lcopy_value()` with pointers to storage locations.
---@field lcopy_value fun(value: GObject.Value, n_collect_values: integer, collect_values: GObject.TypeCValue, collect_flags: integer): string
GObject.TypeValueTable = {}

--- # record GObject.Value
---
--- An opaque structure used to hold different types of values.
--- 
--- The data within the structure has protected scope: it is accessible only
--- to functions within a `GTypeValueTable` structure, or implementations of
--- the g_value_*() API. That is, code portions which implement new fundamental
--- types.
--- 
--- `GValue` users cannot make any assumptions about how data is stored
--- within the 2 element `data` union, and the `g_type` member should
--- only be accessed through the G_VALUE_TYPE() macro.
---
--- ---
---
---@class GObject.Value
---@field g_type GObject.GType
---@field data unknown[]
GObject.Value = {}

--- # method GObject.Value:copy()
---
--- Copies the value of `src_value` into `dest_value`.
---
--- ---
---
---@param self GObject.Value # An initialized `GValue` structure.
---@param dest_value GObject.Value # An initialized `GValue` structure of the same type as `src_value`.
---@return nil
function GObject.Value:copy(dest_value) end

--- # method GObject.Value:dup_object()
---
--- Get the contents of a %G_TYPE_OBJECT derived `GValue`, increasing
--- its reference count. If the contents of the `GValue` are `nil`, then
--- `nil` will be returned.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` whose type is derived from %G_TYPE_OBJECT
---@return GObject.Object # object content of `value`, should be unreferenced when no longer needed.
function GObject.Value:dup_object() end

--- # method GObject.Value:dup_string()
---
--- Get a copy the contents of a %G_TYPE_STRING `GValue`.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of type %G_TYPE_STRING
---@return string # a newly allocated copy of the string content of `value`
function GObject.Value:dup_string() end

--- # method GObject.Value:dup_variant()
---
--- Get the contents of a variant `GValue`, increasing its refcount. The returned
--- `GVariant` is never floating.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of type %G_TYPE_VARIANT
---@return GLib.Variant # variant contents of `value` (may be `nil`); should be unreffed using `g_variant_unref()` when no longer needed
function GObject.Value:dup_variant() end

--- # method GObject.Value:fits_pointer()
---
--- Determines if `value` will fit inside the size of a pointer value.
--- This is an internal function introduced mainly for C marshallers.
---
--- ---
---
---@param self GObject.Value # An initialized `GValue` structure.
---@return (boolean|nil) # `true` if `value` will fit inside a pointer value.
function GObject.Value:fits_pointer() end

--- # method GObject.Value:get_boolean()
---
--- Get the contents of a %G_TYPE_BOOLEAN `GValue`.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of type %G_TYPE_BOOLEAN
---@return (boolean|nil) # boolean contents of `value`
function GObject.Value:get_boolean() end

--- # method GObject.Value:get_boxed()
---
--- Get the contents of a %G_TYPE_BOXED derived `GValue`.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of %G_TYPE_BOXED derived type
---@return userdata # boxed contents of `value`
function GObject.Value:get_boxed() end

--- # method GObject.Value:get_char()
---
--- Do not use this function; it is broken on platforms where the %char
--- type is unsigned, such as ARM and PowerPC.  See `g_value_get_schar()`.
--- 
--- Get the contents of a %G_TYPE_CHAR `GValue`.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of type %G_TYPE_CHAR
---@return integer # character contents of `value`
function GObject.Value:get_char() end

--- # method GObject.Value:get_double()
---
--- Get the contents of a %G_TYPE_DOUBLE `GValue`.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of type %G_TYPE_DOUBLE
---@return number # double contents of `value`
function GObject.Value:get_double() end

--- # method GObject.Value:get_enum()
---
--- Get the contents of a %G_TYPE_ENUM `GValue`.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` whose type is derived from %G_TYPE_ENUM
---@return integer # enum contents of `value`
function GObject.Value:get_enum() end

--- # method GObject.Value:get_flags()
---
--- Get the contents of a %G_TYPE_FLAGS `GValue`.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` whose type is derived from %G_TYPE_FLAGS
---@return integer # flags contents of `value`
function GObject.Value:get_flags() end

--- # method GObject.Value:get_float()
---
--- Get the contents of a %G_TYPE_FLOAT `GValue`.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of type %G_TYPE_FLOAT
---@return number # float contents of `value`
function GObject.Value:get_float() end

--- # method GObject.Value:get_gtype()
---
--- Get the contents of a %G_TYPE_GTYPE `GValue`.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of type %G_TYPE_GTYPE
---@return GObject.GType # the `GType` stored in `value`
function GObject.Value:get_gtype() end

--- # method GObject.Value:get_int()
---
--- Get the contents of a %G_TYPE_INT `GValue`.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of type %G_TYPE_INT
---@return integer # integer contents of `value`
function GObject.Value:get_int() end

--- # method GObject.Value:get_int64()
---
--- Get the contents of a %G_TYPE_INT64 `GValue`.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of type %G_TYPE_INT64
---@return integer # 64bit integer contents of `value`
function GObject.Value:get_int64() end

--- # method GObject.Value:get_long()
---
--- Get the contents of a %G_TYPE_LONG `GValue`.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of type %G_TYPE_LONG
---@return integer # long integer contents of `value`
function GObject.Value:get_long() end

--- # method GObject.Value:get_object()
---
--- Get the contents of a %G_TYPE_OBJECT derived `GValue`.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of %G_TYPE_OBJECT derived type
---@return GObject.Object # object contents of `value`
function GObject.Value:get_object() end

--- # method GObject.Value:get_param()
---
--- Get the contents of a %G_TYPE_PARAM `GValue`.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` whose type is derived from %G_TYPE_PARAM
---@return GObject.ParamSpec # `GParamSpec` content of `value`
function GObject.Value:get_param() end

--- # method GObject.Value:get_pointer()
---
--- Get the contents of a pointer `GValue`.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of %G_TYPE_POINTER
---@return userdata # pointer contents of `value`
function GObject.Value:get_pointer() end

--- # method GObject.Value:get_schar()
---
--- Get the contents of a %G_TYPE_CHAR `GValue`.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of type %G_TYPE_CHAR
---@return integer # signed 8 bit integer contents of `value`
function GObject.Value:get_schar() end

--- # method GObject.Value:get_string()
---
--- Get the contents of a %G_TYPE_STRING `GValue`.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of type %G_TYPE_STRING
---@return string # string content of `value`
function GObject.Value:get_string() end

--- # method GObject.Value:get_uchar()
---
--- Get the contents of a %G_TYPE_UCHAR `GValue`.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of type %G_TYPE_UCHAR
---@return integer # unsigned character contents of `value`
function GObject.Value:get_uchar() end

--- # method GObject.Value:get_uint()
---
--- Get the contents of a %G_TYPE_UINT `GValue`.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of type %G_TYPE_UINT
---@return integer # unsigned integer contents of `value`
function GObject.Value:get_uint() end

--- # method GObject.Value:get_uint64()
---
--- Get the contents of a %G_TYPE_UINT64 `GValue`.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of type %G_TYPE_UINT64
---@return integer # unsigned 64bit integer contents of `value`
function GObject.Value:get_uint64() end

--- # method GObject.Value:get_ulong()
---
--- Get the contents of a %G_TYPE_ULONG `GValue`.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of type %G_TYPE_ULONG
---@return integer # unsigned long integer contents of `value`
function GObject.Value:get_ulong() end

--- # method GObject.Value:get_variant()
---
--- Get the contents of a variant `GValue`.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of type %G_TYPE_VARIANT
---@return GLib.Variant # variant contents of `value` (may be `nil`)
function GObject.Value:get_variant() end

--- # method GObject.Value:init()
---
--- Initializes `value` with the default value of `type`.
---
--- ---
---
---@param self GObject.Value # A zero-filled (uninitialized) `GValue` structure.
---@param g_type GObject.GType # Type the `GValue` should hold values of.
---@return GObject.Value # the `GValue` structure that has been passed in
function GObject.Value:init(g_type) end

--- # method GObject.Value:init_from_instance()
---
--- Initializes and sets `value` from an instantiatable type via the
--- value_table's `collect_value()` function.
--- 
--- Note: The `value` will be initialised with the exact type of
--- `instance`.  If you wish to set the `value`'s type to a different GType
--- (such as a parent class GType), you need to manually call
--- `g_value_init()` and `g_value_set_instance()`.
---
--- ---
---
---@param self GObject.Value # An uninitialized `GValue` structure.
---@param instance GObject.TypeInstance # the instance
---@return nil
function GObject.Value:init_from_instance(instance) end

--- # method GObject.Value:peek_pointer()
---
--- Returns the value contents as pointer. This function asserts that
--- `g_value_fits_pointer()` returned `true` for the passed in value.
--- This is an internal function introduced mainly for C marshallers.
---
--- ---
---
---@param self GObject.Value # An initialized `GValue` structure
---@return userdata # the value contents as pointer
function GObject.Value:peek_pointer() end

--- # method GObject.Value:reset()
---
--- Clears the current value in `value` and resets it to the default value
--- (as if the value had just been initialized).
---
--- ---
---
---@param self GObject.Value # An initialized `GValue` structure.
---@return GObject.Value # the `GValue` structure that has been passed in
function GObject.Value:reset() end

--- # method GObject.Value:set_boolean()
---
--- Set the contents of a %G_TYPE_BOOLEAN `GValue` to `v_boolean`.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of type %G_TYPE_BOOLEAN
---@param v_boolean (boolean|nil) # boolean value to be set
---@return nil
function GObject.Value:set_boolean(v_boolean) end

--- # method GObject.Value:set_boxed()
---
--- Set the contents of a %G_TYPE_BOXED derived `GValue` to `v_boxed`.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of %G_TYPE_BOXED derived type
---@param v_boxed? userdata # boxed value to be set
---@return nil
function GObject.Value:set_boxed(v_boxed) end

--- # method GObject.Value:set_boxed_take_ownership()
---
--- This is an internal function introduced mainly for C marshallers.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of %G_TYPE_BOXED derived type
---@param v_boxed? userdata # duplicated unowned boxed value to be set
---@return nil
function GObject.Value:set_boxed_take_ownership(v_boxed) end

--- # method GObject.Value:set_char()
---
--- Set the contents of a %G_TYPE_CHAR `GValue` to `v_char`.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of type %G_TYPE_CHAR
---@param v_char integer # character value to be set
---@return nil
function GObject.Value:set_char(v_char) end

--- # method GObject.Value:set_double()
---
--- Set the contents of a %G_TYPE_DOUBLE `GValue` to `v_double`.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of type %G_TYPE_DOUBLE
---@param v_double number # double value to be set
---@return nil
function GObject.Value:set_double(v_double) end

--- # method GObject.Value:set_enum()
---
--- Set the contents of a %G_TYPE_ENUM `GValue` to `v_enum`.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` whose type is derived from %G_TYPE_ENUM
---@param v_enum integer # enum value to be set
---@return nil
function GObject.Value:set_enum(v_enum) end

--- # method GObject.Value:set_flags()
---
--- Set the contents of a %G_TYPE_FLAGS `GValue` to `v_flags`.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` whose type is derived from %G_TYPE_FLAGS
---@param v_flags integer # flags value to be set
---@return nil
function GObject.Value:set_flags(v_flags) end

--- # method GObject.Value:set_float()
---
--- Set the contents of a %G_TYPE_FLOAT `GValue` to `v_float`.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of type %G_TYPE_FLOAT
---@param v_float number # float value to be set
---@return nil
function GObject.Value:set_float(v_float) end

--- # method GObject.Value:set_gtype()
---
--- Set the contents of a %G_TYPE_GTYPE `GValue` to `v_gtype`.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of type %G_TYPE_GTYPE
---@param v_gtype GObject.GType # `GType` to be set
---@return nil
function GObject.Value:set_gtype(v_gtype) end

--- # method GObject.Value:set_instance()
---
--- Sets `value` from an instantiatable type via the
--- value_table's `collect_value()` function.
---
--- ---
---
---@param self GObject.Value # An initialized `GValue` structure.
---@param instance? userdata # the instance
---@return nil
function GObject.Value:set_instance(instance) end

--- # method GObject.Value:set_int()
---
--- Set the contents of a %G_TYPE_INT `GValue` to `v_int`.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of type %G_TYPE_INT
---@param v_int integer # integer value to be set
---@return nil
function GObject.Value:set_int(v_int) end

--- # method GObject.Value:set_int64()
---
--- Set the contents of a %G_TYPE_INT64 `GValue` to `v_int64`.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of type %G_TYPE_INT64
---@param v_int64 integer # 64bit integer value to be set
---@return nil
function GObject.Value:set_int64(v_int64) end

--- # method GObject.Value:set_interned_string()
---
--- Set the contents of a %G_TYPE_STRING `GValue` to `v_string`.  The string is
--- assumed to be static and interned (canonical, for example from
--- `g_intern_string()`), and is thus not duplicated when setting the `GValue`.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of type %G_TYPE_STRING
---@param v_string? string # static string to be set
---@return nil
function GObject.Value:set_interned_string(v_string) end

--- # method GObject.Value:set_long()
---
--- Set the contents of a %G_TYPE_LONG `GValue` to `v_long`.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of type %G_TYPE_LONG
---@param v_long integer # long integer value to be set
---@return nil
function GObject.Value:set_long(v_long) end

--- # method GObject.Value:set_object()
---
--- Set the contents of a %G_TYPE_OBJECT derived `GValue` to `v_object`.
--- 
--- `g_value_set_object()` increases the reference count of `v_object`
--- (the `GValue` holds a reference to `v_object`).  If you do not wish
--- to increase the reference count of the object (i.e. you wish to
--- pass your current reference to the `GValue` because you no longer
--- need it), use `g_value_take_object()` instead.
--- 
--- It is important that your `GValue` holds a reference to `v_object` (either its
--- own, or one it has taken) to ensure that the object won't be destroyed while
--- the `GValue` still exists).
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of %G_TYPE_OBJECT derived type
---@param v_object? GObject.Object # object value to be set
---@return nil
function GObject.Value:set_object(v_object) end

--- # method GObject.Value:set_param()
---
--- Set the contents of a %G_TYPE_PARAM `GValue` to `param`.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of type %G_TYPE_PARAM
---@param param? GObject.ParamSpec # the `GParamSpec` to be set
---@return nil
function GObject.Value:set_param(param) end

--- # method GObject.Value:set_pointer()
---
--- Set the contents of a pointer `GValue` to `v_pointer`.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of %G_TYPE_POINTER
---@param v_pointer? userdata # pointer value to be set
---@return nil
function GObject.Value:set_pointer(v_pointer) end

--- # method GObject.Value:set_schar()
---
--- Set the contents of a %G_TYPE_CHAR `GValue` to `v_char`.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of type %G_TYPE_CHAR
---@param v_char integer # signed 8 bit integer to be set
---@return nil
function GObject.Value:set_schar(v_char) end

--- # method GObject.Value:set_static_boxed()
---
--- Set the contents of a %G_TYPE_BOXED derived `GValue` to `v_boxed`.
--- 
--- The boxed value is assumed to be static, and is thus not duplicated
--- when setting the `GValue`.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of %G_TYPE_BOXED derived type
---@param v_boxed? userdata # static boxed value to be set
---@return nil
function GObject.Value:set_static_boxed(v_boxed) end

--- # method GObject.Value:set_static_string()
---
--- Set the contents of a %G_TYPE_STRING `GValue` to `v_string`.
--- The string is assumed to be static, and is thus not duplicated
--- when setting the `GValue`.
--- 
--- If the the string is a canonical string, using `g_value_set_interned_string()`
--- is more appropriate.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of type %G_TYPE_STRING
---@param v_string? string # static string to be set
---@return nil
function GObject.Value:set_static_string(v_string) end

--- # method GObject.Value:set_string()
---
--- Set the contents of a %G_TYPE_STRING `GValue` to a copy of `v_string`.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of type %G_TYPE_STRING
---@param v_string? string # caller-owned string to be duplicated for the `GValue`
---@return nil
function GObject.Value:set_string(v_string) end

--- # method GObject.Value:set_string_take_ownership()
---
--- This is an internal function introduced mainly for C marshallers.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of type %G_TYPE_STRING
---@param v_string? string # duplicated unowned string to be set
---@return nil
function GObject.Value:set_string_take_ownership(v_string) end

--- # method GObject.Value:set_uchar()
---
--- Set the contents of a %G_TYPE_UCHAR `GValue` to `v_uchar`.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of type %G_TYPE_UCHAR
---@param v_uchar integer # unsigned character value to be set
---@return nil
function GObject.Value:set_uchar(v_uchar) end

--- # method GObject.Value:set_uint()
---
--- Set the contents of a %G_TYPE_UINT `GValue` to `v_uint`.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of type %G_TYPE_UINT
---@param v_uint integer # unsigned integer value to be set
---@return nil
function GObject.Value:set_uint(v_uint) end

--- # method GObject.Value:set_uint64()
---
--- Set the contents of a %G_TYPE_UINT64 `GValue` to `v_uint64`.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of type %G_TYPE_UINT64
---@param v_uint64 integer # unsigned 64bit integer value to be set
---@return nil
function GObject.Value:set_uint64(v_uint64) end

--- # method GObject.Value:set_ulong()
---
--- Set the contents of a %G_TYPE_ULONG `GValue` to `v_ulong`.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of type %G_TYPE_ULONG
---@param v_ulong integer # unsigned long integer value to be set
---@return nil
function GObject.Value:set_ulong(v_ulong) end

--- # method GObject.Value:set_variant()
---
--- Set the contents of a variant `GValue` to `variant`.
--- If the variant is floating, it is consumed.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of type %G_TYPE_VARIANT
---@param variant? GLib.Variant # a `GVariant`, or `nil`
---@return nil
function GObject.Value:set_variant(variant) end

--- # method GObject.Value:take_boxed()
---
--- Sets the contents of a %G_TYPE_BOXED derived `GValue` to `v_boxed`
--- and takes over the ownership of the caller’s reference to `v_boxed`;
--- the caller doesn’t have to unref it any more.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of %G_TYPE_BOXED derived type
---@param v_boxed? userdata # duplicated unowned boxed value to be set
---@return nil
function GObject.Value:take_boxed(v_boxed) end

--- # method GObject.Value:take_string()
---
--- Sets the contents of a %G_TYPE_STRING `GValue` to `v_string`.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of type %G_TYPE_STRING
---@param v_string? string # string to take ownership of
---@return nil
function GObject.Value:take_string(v_string) end

--- # method GObject.Value:take_variant()
---
--- Set the contents of a variant `GValue` to `variant`, and takes over
--- the ownership of the caller's reference to `variant`;
--- the caller doesn't have to unref it any more (i.e. the reference
--- count of the variant is not increased).
--- 
--- If `variant` was floating then its floating reference is converted to
--- a hard reference.
--- 
--- If you want the `GValue` to hold its own reference to `variant`, use
--- `g_value_set_variant()` instead.
--- 
--- This is an internal function introduced mainly for C marshallers.
---
--- ---
---
---@param self GObject.Value # a valid `GValue` of type %G_TYPE_VARIANT
---@param variant? GLib.Variant # a `GVariant`, or `nil`
---@return nil
function GObject.Value:take_variant(variant) end

--- # method GObject.Value:transform()
---
--- Tries to cast the contents of `src_value` into a type appropriate
--- to store in `dest_value`, e.g. to transform a %G_TYPE_INT value
--- into a %G_TYPE_FLOAT value. Performing transformations between
--- value types might incur precision lossage. Especially
--- transformations into strings might reveal seemingly arbitrary
--- results and shouldn't be relied upon for production code (such
--- as rcfile value or object property serialization).
---
--- ---
---
---@param self GObject.Value # Source value.
---@param dest_value GObject.Value # Target value.
---@return (boolean|nil) # Whether a transformation rule was found and could be applied. Upon failing transformations, `dest_value` is left untouched.
function GObject.Value:transform(dest_value) end

--- # method GObject.Value:unset()
---
--- Clears the current value in `value` (if any) and "unsets" the type,
--- this releases all resources associated with this GValue. An unset
--- value is the same as an uninitialized (zero-filled) `GValue`
--- structure.
---
--- ---
---
---@param self GObject.Value # An initialized `GValue` structure.
---@return nil
function GObject.Value:unset() end

--- # function GObject.Value.type_compatible()
---
--- Returns whether a `GValue` of type `src_type` can be copied into
--- a `GValue` of type `dest_type`.
---
--- ---
---
---@param src_type GObject.GType # source type to be copied.
---@param dest_type GObject.GType # destination type for copying.
---@return (boolean|nil) # `true` if `g_value_copy()` is possible with `src_type` and `dest_type`.
function GObject.Value.type_compatible(src_type, dest_type) end

--- # function GObject.Value.type_transformable()
---
--- Check whether `g_value_transform()` is able to transform values
--- of type `src_type` into values of type `dest_type`. Note that for
--- the types to be transformable, they must be compatible or a
--- transformation function must be registered.
---
--- ---
---
---@param src_type GObject.GType # Source type.
---@param dest_type GObject.GType # Target type.
---@return (boolean|nil) # `true` if the transformation is possible, `false` otherwise.
function GObject.Value.type_transformable(src_type, dest_type) end

--- # record GObject.ValueArray
---
--- A `GValueArray` contains an array of `GValue` elements.
---
--- ---
---
---@class GObject.ValueArray
---@field n_values integer # number of values contained in the array
---@field values GObject.Value # array of values
---@field n_prealloced integer
---@operator call: GObject.ValueArray
GObject.ValueArray = {}

--- # method GObject.ValueArray:append()
---
--- Insert a copy of `value` as last element of `value_array`. If `value` is
--- `nil`, an uninitialized value is appended.
---
--- ---
---
---@param self GObject.ValueArray # `GValueArray` to add an element to
---@param value? GObject.Value # `GValue` to copy into `GValueArray`, or `nil`
---@return GObject.ValueArray # the `GValueArray` passed in as `value_array`
function GObject.ValueArray:append(value) end

--- # method GObject.ValueArray:copy()
---
--- Construct an exact copy of a `GValueArray` by duplicating all its
--- contents.
---
--- ---
---
---@param self GObject.ValueArray # `GValueArray` to copy
---@return GObject.ValueArray # Newly allocated copy of `GValueArray`
function GObject.ValueArray:copy() end

--- # method GObject.ValueArray:get_nth()
---
--- Return a pointer to the value at `index_` containd in `value_array`.
---
--- ---
---
---@param self GObject.ValueArray # `GValueArray` to get a value from
---@param index_ integer # index of the value of interest
---@return GObject.Value # pointer to a value at `index_` in `value_array`
function GObject.ValueArray:get_nth(index_) end

--- # method GObject.ValueArray:insert()
---
--- Insert a copy of `value` at specified position into `value_array`. If `value`
--- is `nil`, an uninitialized value is inserted.
---
--- ---
---
---@param self GObject.ValueArray # `GValueArray` to add an element to
---@param index_ integer # insertion position, must be <= value_array->;n_values
---@param value? GObject.Value # `GValue` to copy into `GValueArray`, or `nil`
---@return GObject.ValueArray # the `GValueArray` passed in as `value_array`
function GObject.ValueArray:insert(index_, value) end

--- # method GObject.ValueArray:prepend()
---
--- Insert a copy of `value` as first element of `value_array`. If `value` is
--- `nil`, an uninitialized value is prepended.
---
--- ---
---
---@param self GObject.ValueArray # `GValueArray` to add an element to
---@param value? GObject.Value # `GValue` to copy into `GValueArray`, or `nil`
---@return GObject.ValueArray # the `GValueArray` passed in as `value_array`
function GObject.ValueArray:prepend(value) end

--- # method GObject.ValueArray:remove()
---
--- Remove the value at position `index_` from `value_array`.
---
--- ---
---
---@param self GObject.ValueArray # `GValueArray` to remove an element from
---@param index_ integer # position of value to remove, which must be less than `value_array`->n_values
---@return GObject.ValueArray # the `GValueArray` passed in as `value_array`
function GObject.ValueArray:remove(index_) end

--- # method GObject.ValueArray:sort()
---
--- Sort `value_array` using `compare_func` to compare the elements according
--- to the semantics of `GCompareDataFunc`.
--- 
--- The current implementation uses the same sorting algorithm as standard
--- C `qsort()` function.
---
--- ---
---
---@param self GObject.ValueArray # `GValueArray` to sort
---@param compare_func GLib.CompareDataFunc # function to compare elements
---@param user_data? userdata # extra data argument provided for `compare_func`
---@return GObject.ValueArray # the `GValueArray` passed in as `value_array`
function GObject.ValueArray:sort(compare_func, user_data) end

--- # function GObject.ValueArray.new()
---
--- Allocate and initialize a new `GValueArray`, optionally preserve space
--- for `n_prealloced` elements. New arrays always contain 0 elements,
--- regardless of the value of `n_prealloced`.
---
--- ---
---
---@param n_prealloced integer # number of values to preallocate space for
---@return GObject.ValueArray # a newly allocated `GValueArray` with 0 values
function GObject.ValueArray.new(n_prealloced) end

---@alias GObject.ValueTransform fun(src_value: GObject.Value, dest_value: GObject.Value): nil

---@alias GObject.WeakNotify fun(data: userdata, where_the_object_was: GObject.Object): nil

--- # record GObject.WeakRef
---
--- A structure containing a weak reference to a `GObject`.
--- 
--- A `GWeakRef` can either be empty (i.e. point to `nil`), or point to an
--- object for as long as at least one "strong" reference to that object
--- exists. Before the object's `GObjectClass`.dispose method is called,
--- every `GWeakRef` associated with becomes empty (i.e. points to `nil`).
--- 
--- Like `GValue`, `GWeakRef` can be statically allocated, stack- or
--- heap-allocated, or embedded in larger structures.
--- 
--- Unlike `g_object_weak_ref()` and `g_object_add_weak_pointer()`, this weak
--- reference is thread-safe: converting a weak pointer to a reference is
--- atomic with respect to invalidation of weak pointers to destroyed
--- objects.
--- 
--- If the object's `GObjectClass`.dispose method results in additional
--- references to the object being held (‘re-referencing’), any `GWeakRefs` taken
--- before it was disposed will continue to point to `nil`.  Any `GWeakRefs` taken
--- during disposal and after re-referencing, or after disposal has returned due
--- to the re-referencing, will continue to point to the object until its refcount
--- goes back to zero, at which point they too will be invalidated.
--- 
--- It is invalid to take a `GWeakRef` on an object during `GObjectClass`.dispose
--- without first having or creating a strong reference to the object.
---
--- ---
---
---@class GObject.WeakRef
GObject.WeakRef = {}

--- # union GObject._Value__data__union
---
---@class GObject._Value__data__union
---@field v_int integer
---@field v_uint integer
---@field v_long integer
---@field v_ulong integer
---@field v_int64 integer
---@field v_uint64 integer
---@field v_float number
---@field v_double number
---@field v_pointer userdata
GObject._Value__data__union = {}

--- # function GObject.boxed_copy()
---
--- Provide a copy of a boxed structure `src_boxed` which is of type `boxed_type`.
---
--- ---
---
---@param boxed_type GObject.GType # The type of `src_boxed`.
---@param src_boxed userdata # The boxed structure to be copied.
---@return userdata # The newly created copy of the boxed structure.
function GObject.boxed_copy(boxed_type, src_boxed) end

--- # function GObject.boxed_free()
---
--- Free the boxed structure `boxed` which is of type `boxed_type`.
---
--- ---
---
---@param boxed_type GObject.GType # The type of `boxed`.
---@param boxed userdata # The boxed structure to be freed.
---@return nil
function GObject.boxed_free(boxed_type, boxed) end

--- # function GObject.cclosure_marshal_BOOLEAN__BOXED_BOXED()
---
--- A `GClosureMarshal` function for use with signals with handlers that
--- take two boxed pointers as arguments and return a boolean.  If you
--- have such a signal, you will probably also need to use an
--- accumulator, such as `g_signal_accumulator_true_handled()`.
---
--- ---
---
---@param closure GObject.Closure # A `GClosure`.
---@param return_value GObject.Value # A `GValue` to store the return value. May be `nil` if the callback of closure doesn't return a value.
---@param n_param_values integer # The length of the `param_values` array.
---@param param_values GObject.Value # An array of `GValues` holding the arguments on which to invoke the callback of closure.
---@param invocation_hint? userdata # The invocation hint given as the last argument to `g_closure_invoke()`.
---@param marshal_data? userdata # Additional data specified when registering the marshaller, see `g_closure_set_marshal()` and `g_closure_set_meta_marshal()`
---@return nil
function GObject.cclosure_marshal_BOOLEAN__BOXED_BOXED(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data) end

--- # function GObject.cclosure_marshal_BOOLEAN__FLAGS()
---
--- A marshaller for a `GCClosure` with a callback of type
--- `gboolean (*callback) (gpointer instance, gint arg1, gpointer user_data)` where the `gint` parameter
--- denotes a flags type.
---
--- ---
---
---@param closure GObject.Closure # the `GClosure` to which the marshaller belongs
---@param return_value GObject.Value # a `GValue` which can store the returned `gboolean`
---@param n_param_values integer # 2
---@param param_values GObject.Value # a `GValue` array holding instance and arg1
---@param invocation_hint? userdata # the invocation hint given as the last argument to `g_closure_invoke()`
---@param marshal_data? userdata # additional data specified when registering the marshaller
---@return nil
function GObject.cclosure_marshal_BOOLEAN__FLAGS(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data) end

--- # function GObject.cclosure_marshal_STRING__OBJECT_POINTER()
---
--- A marshaller for a `GCClosure` with a callback of type
--- `gchar* (*callback) (gpointer instance, GObject *arg1, gpointer arg2, gpointer user_data)`.
---
--- ---
---
---@param closure GObject.Closure # the `GClosure` to which the marshaller belongs
---@param return_value GObject.Value # a `GValue`, which can store the returned string
---@param n_param_values integer # 3
---@param param_values GObject.Value # a `GValue` array holding instance, arg1 and arg2
---@param invocation_hint? userdata # the invocation hint given as the last argument to `g_closure_invoke()`
---@param marshal_data? userdata # additional data specified when registering the marshaller
---@return nil
function GObject.cclosure_marshal_STRING__OBJECT_POINTER(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data) end

--- # function GObject.cclosure_marshal_VOID__BOOLEAN()
---
--- A marshaller for a `GCClosure` with a callback of type
--- `void (*callback) (gpointer instance, gboolean arg1, gpointer user_data)`.
---
--- ---
---
---@param closure GObject.Closure # the `GClosure` to which the marshaller belongs
---@param return_value GObject.Value # ignored
---@param n_param_values integer # 2
---@param param_values GObject.Value # a `GValue` array holding the instance and the `gboolean` parameter
---@param invocation_hint? userdata # the invocation hint given as the last argument to `g_closure_invoke()`
---@param marshal_data? userdata # additional data specified when registering the marshaller
---@return nil
function GObject.cclosure_marshal_VOID__BOOLEAN(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data) end

--- # function GObject.cclosure_marshal_VOID__BOXED()
---
--- A marshaller for a `GCClosure` with a callback of type
--- `void (*callback) (gpointer instance, GBoxed *arg1, gpointer user_data)`.
---
--- ---
---
---@param closure GObject.Closure # the `GClosure` to which the marshaller belongs
---@param return_value GObject.Value # ignored
---@param n_param_values integer # 2
---@param param_values GObject.Value # a `GValue` array holding the instance and the `GBoxed`* parameter
---@param invocation_hint? userdata # the invocation hint given as the last argument to `g_closure_invoke()`
---@param marshal_data? userdata # additional data specified when registering the marshaller
---@return nil
function GObject.cclosure_marshal_VOID__BOXED(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data) end

--- # function GObject.cclosure_marshal_VOID__CHAR()
---
--- A marshaller for a `GCClosure` with a callback of type
--- `void (*callback) (gpointer instance, gchar arg1, gpointer user_data)`.
---
--- ---
---
---@param closure GObject.Closure # the `GClosure` to which the marshaller belongs
---@param return_value GObject.Value # ignored
---@param n_param_values integer # 2
---@param param_values GObject.Value # a `GValue` array holding the instance and the `gchar` parameter
---@param invocation_hint? userdata # the invocation hint given as the last argument to `g_closure_invoke()`
---@param marshal_data? userdata # additional data specified when registering the marshaller
---@return nil
function GObject.cclosure_marshal_VOID__CHAR(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data) end

--- # function GObject.cclosure_marshal_VOID__DOUBLE()
---
--- A marshaller for a `GCClosure` with a callback of type
--- `void (*callback) (gpointer instance, gdouble arg1, gpointer user_data)`.
---
--- ---
---
---@param closure GObject.Closure # the `GClosure` to which the marshaller belongs
---@param return_value GObject.Value # ignored
---@param n_param_values integer # 2
---@param param_values GObject.Value # a `GValue` array holding the instance and the `gdouble` parameter
---@param invocation_hint? userdata # the invocation hint given as the last argument to `g_closure_invoke()`
---@param marshal_data? userdata # additional data specified when registering the marshaller
---@return nil
function GObject.cclosure_marshal_VOID__DOUBLE(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data) end

--- # function GObject.cclosure_marshal_VOID__ENUM()
---
--- A marshaller for a `GCClosure` with a callback of type
--- `void (*callback) (gpointer instance, gint arg1, gpointer user_data)` where the `gint` parameter denotes an enumeration type..
---
--- ---
---
---@param closure GObject.Closure # the `GClosure` to which the marshaller belongs
---@param return_value GObject.Value # ignored
---@param n_param_values integer # 2
---@param param_values GObject.Value # a `GValue` array holding the instance and the enumeration parameter
---@param invocation_hint? userdata # the invocation hint given as the last argument to `g_closure_invoke()`
---@param marshal_data? userdata # additional data specified when registering the marshaller
---@return nil
function GObject.cclosure_marshal_VOID__ENUM(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data) end

--- # function GObject.cclosure_marshal_VOID__FLAGS()
---
--- A marshaller for a `GCClosure` with a callback of type
--- `void (*callback) (gpointer instance, gint arg1, gpointer user_data)` where the `gint` parameter denotes a flags type.
---
--- ---
---
---@param closure GObject.Closure # the `GClosure` to which the marshaller belongs
---@param return_value GObject.Value # ignored
---@param n_param_values integer # 2
---@param param_values GObject.Value # a `GValue` array holding the instance and the flags parameter
---@param invocation_hint? userdata # the invocation hint given as the last argument to `g_closure_invoke()`
---@param marshal_data? userdata # additional data specified when registering the marshaller
---@return nil
function GObject.cclosure_marshal_VOID__FLAGS(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data) end

--- # function GObject.cclosure_marshal_VOID__FLOAT()
---
--- A marshaller for a `GCClosure` with a callback of type
--- `void (*callback) (gpointer instance, gfloat arg1, gpointer user_data)`.
---
--- ---
---
---@param closure GObject.Closure # the `GClosure` to which the marshaller belongs
---@param return_value GObject.Value # ignored
---@param n_param_values integer # 2
---@param param_values GObject.Value # a `GValue` array holding the instance and the `gfloat` parameter
---@param invocation_hint? userdata # the invocation hint given as the last argument to `g_closure_invoke()`
---@param marshal_data? userdata # additional data specified when registering the marshaller
---@return nil
function GObject.cclosure_marshal_VOID__FLOAT(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data) end

--- # function GObject.cclosure_marshal_VOID__INT()
---
--- A marshaller for a `GCClosure` with a callback of type
--- `void (*callback) (gpointer instance, gint arg1, gpointer user_data)`.
---
--- ---
---
---@param closure GObject.Closure # the `GClosure` to which the marshaller belongs
---@param return_value GObject.Value # ignored
---@param n_param_values integer # 2
---@param param_values GObject.Value # a `GValue` array holding the instance and the `gint` parameter
---@param invocation_hint? userdata # the invocation hint given as the last argument to `g_closure_invoke()`
---@param marshal_data? userdata # additional data specified when registering the marshaller
---@return nil
function GObject.cclosure_marshal_VOID__INT(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data) end

--- # function GObject.cclosure_marshal_VOID__LONG()
---
--- A marshaller for a `GCClosure` with a callback of type
--- `void (*callback) (gpointer instance, glong arg1, gpointer user_data)`.
---
--- ---
---
---@param closure GObject.Closure # the `GClosure` to which the marshaller belongs
---@param return_value GObject.Value # ignored
---@param n_param_values integer # 2
---@param param_values GObject.Value # a `GValue` array holding the instance and the `glong` parameter
---@param invocation_hint? userdata # the invocation hint given as the last argument to `g_closure_invoke()`
---@param marshal_data? userdata # additional data specified when registering the marshaller
---@return nil
function GObject.cclosure_marshal_VOID__LONG(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data) end

--- # function GObject.cclosure_marshal_VOID__OBJECT()
---
--- A marshaller for a `GCClosure` with a callback of type
--- `void (*callback) (gpointer instance, GObject *arg1, gpointer user_data)`.
---
--- ---
---
---@param closure GObject.Closure # the `GClosure` to which the marshaller belongs
---@param return_value GObject.Value # ignored
---@param n_param_values integer # 2
---@param param_values GObject.Value # a `GValue` array holding the instance and the `GObject`* parameter
---@param invocation_hint? userdata # the invocation hint given as the last argument to `g_closure_invoke()`
---@param marshal_data? userdata # additional data specified when registering the marshaller
---@return nil
function GObject.cclosure_marshal_VOID__OBJECT(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data) end

--- # function GObject.cclosure_marshal_VOID__PARAM()
---
--- A marshaller for a `GCClosure` with a callback of type
--- `void (*callback) (gpointer instance, GParamSpec *arg1, gpointer user_data)`.
---
--- ---
---
---@param closure GObject.Closure # the `GClosure` to which the marshaller belongs
---@param return_value GObject.Value # ignored
---@param n_param_values integer # 2
---@param param_values GObject.Value # a `GValue` array holding the instance and the `GParamSpec`* parameter
---@param invocation_hint? userdata # the invocation hint given as the last argument to `g_closure_invoke()`
---@param marshal_data? userdata # additional data specified when registering the marshaller
---@return nil
function GObject.cclosure_marshal_VOID__PARAM(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data) end

--- # function GObject.cclosure_marshal_VOID__POINTER()
---
--- A marshaller for a `GCClosure` with a callback of type
--- `void (*callback) (gpointer instance, gpointer arg1, gpointer user_data)`.
---
--- ---
---
---@param closure GObject.Closure # the `GClosure` to which the marshaller belongs
---@param return_value GObject.Value # ignored
---@param n_param_values integer # 2
---@param param_values GObject.Value # a `GValue` array holding the instance and the `gpointer` parameter
---@param invocation_hint? userdata # the invocation hint given as the last argument to `g_closure_invoke()`
---@param marshal_data? userdata # additional data specified when registering the marshaller
---@return nil
function GObject.cclosure_marshal_VOID__POINTER(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data) end

--- # function GObject.cclosure_marshal_VOID__STRING()
---
--- A marshaller for a `GCClosure` with a callback of type
--- `void (*callback) (gpointer instance, const gchar *arg1, gpointer user_data)`.
---
--- ---
---
---@param closure GObject.Closure # the `GClosure` to which the marshaller belongs
---@param return_value GObject.Value # ignored
---@param n_param_values integer # 2
---@param param_values GObject.Value # a `GValue` array holding the instance and the `gchar`* parameter
---@param invocation_hint? userdata # the invocation hint given as the last argument to `g_closure_invoke()`
---@param marshal_data? userdata # additional data specified when registering the marshaller
---@return nil
function GObject.cclosure_marshal_VOID__STRING(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data) end

--- # function GObject.cclosure_marshal_VOID__UCHAR()
---
--- A marshaller for a `GCClosure` with a callback of type
--- `void (*callback) (gpointer instance, guchar arg1, gpointer user_data)`.
---
--- ---
---
---@param closure GObject.Closure # the `GClosure` to which the marshaller belongs
---@param return_value GObject.Value # ignored
---@param n_param_values integer # 2
---@param param_values GObject.Value # a `GValue` array holding the instance and the `guchar` parameter
---@param invocation_hint? userdata # the invocation hint given as the last argument to `g_closure_invoke()`
---@param marshal_data? userdata # additional data specified when registering the marshaller
---@return nil
function GObject.cclosure_marshal_VOID__UCHAR(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data) end

--- # function GObject.cclosure_marshal_VOID__UINT()
---
--- A marshaller for a `GCClosure` with a callback of type
--- `void (*callback) (gpointer instance, guint arg1, gpointer user_data)`.
---
--- ---
---
---@param closure GObject.Closure # the `GClosure` to which the marshaller belongs
---@param return_value GObject.Value # ignored
---@param n_param_values integer # 2
---@param param_values GObject.Value # a `GValue` array holding the instance and the `guint` parameter
---@param invocation_hint? userdata # the invocation hint given as the last argument to `g_closure_invoke()`
---@param marshal_data? userdata # additional data specified when registering the marshaller
---@return nil
function GObject.cclosure_marshal_VOID__UINT(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data) end

--- # function GObject.cclosure_marshal_VOID__UINT_POINTER()
---
--- A marshaller for a `GCClosure` with a callback of type
--- `void (*callback) (gpointer instance, guint arg1, gpointer arg2, gpointer user_data)`.
---
--- ---
---
---@param closure GObject.Closure # the `GClosure` to which the marshaller belongs
---@param return_value GObject.Value # ignored
---@param n_param_values integer # 3
---@param param_values GObject.Value # a `GValue` array holding instance, arg1 and arg2
---@param invocation_hint? userdata # the invocation hint given as the last argument to `g_closure_invoke()`
---@param marshal_data? userdata # additional data specified when registering the marshaller
---@return nil
function GObject.cclosure_marshal_VOID__UINT_POINTER(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data) end

--- # function GObject.cclosure_marshal_VOID__ULONG()
---
--- A marshaller for a `GCClosure` with a callback of type
--- `void (*callback) (gpointer instance, gulong arg1, gpointer user_data)`.
---
--- ---
---
---@param closure GObject.Closure # the `GClosure` to which the marshaller belongs
---@param return_value GObject.Value # ignored
---@param n_param_values integer # 2
---@param param_values GObject.Value # a `GValue` array holding the instance and the `gulong` parameter
---@param invocation_hint? userdata # the invocation hint given as the last argument to `g_closure_invoke()`
---@param marshal_data? userdata # additional data specified when registering the marshaller
---@return nil
function GObject.cclosure_marshal_VOID__ULONG(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data) end

--- # function GObject.cclosure_marshal_VOID__VARIANT()
---
--- A marshaller for a `GCClosure` with a callback of type
--- `void (*callback) (gpointer instance, GVariant *arg1, gpointer user_data)`.
---
--- ---
---
---@param closure GObject.Closure # the `GClosure` to which the marshaller belongs
---@param return_value GObject.Value # ignored
---@param n_param_values integer # 2
---@param param_values GObject.Value # a `GValue` array holding the instance and the `GVariant`* parameter
---@param invocation_hint? userdata # the invocation hint given as the last argument to `g_closure_invoke()`
---@param marshal_data? userdata # additional data specified when registering the marshaller
---@return nil
function GObject.cclosure_marshal_VOID__VARIANT(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data) end

--- # function GObject.cclosure_marshal_VOID__VOID()
---
--- A marshaller for a `GCClosure` with a callback of type
--- `void (*callback) (gpointer instance, gpointer user_data)`.
---
--- ---
---
---@param closure GObject.Closure # the `GClosure` to which the marshaller belongs
---@param return_value GObject.Value # ignored
---@param n_param_values integer # 1
---@param param_values GObject.Value # a `GValue` array holding only the instance
---@param invocation_hint? userdata # the invocation hint given as the last argument to `g_closure_invoke()`
---@param marshal_data? userdata # additional data specified when registering the marshaller
---@return nil
function GObject.cclosure_marshal_VOID__VOID(closure, return_value, n_param_values, param_values, invocation_hint, marshal_data) end

--- # function GObject.cclosure_marshal_generic()
---
--- A generic marshaller function implemented via
--- [libffi](http://sourceware.org/libffi/).
--- 
--- Normally this function is not passed explicitly to `g_signal_new()`,
--- but used automatically by GLib when specifying a `nil` marshaller.
---
--- ---
---
---@param closure GObject.Closure # A `GClosure`.
---@param return_gvalue GObject.Value # A `GValue` to store the return value. May be `nil` if the callback of closure doesn't return a value.
---@param n_param_values integer # The length of the `param_values` array.
---@param param_values GObject.Value # An array of `GValues` holding the arguments on which to invoke the callback of closure.
---@param invocation_hint? userdata # The invocation hint given as the last argument to `g_closure_invoke()`.
---@param marshal_data? userdata # Additional data specified when registering the marshaller, see `g_closure_set_marshal()` and `g_closure_set_meta_marshal()`
---@return nil
function GObject.cclosure_marshal_generic(closure, return_gvalue, n_param_values, param_values, invocation_hint, marshal_data) end

--- # function GObject.clear_signal_handler()
---
--- Disconnects a handler from `instance` so it will not be called during
--- any future or currently ongoing emissions of the signal it has been
--- connected to. The `handler_id_ptr` is then set to zero, which is never a valid handler ID value (see `g_signal_connect()`).
--- 
--- If the handler ID is 0 then this function does nothing.
--- 
--- There is also a macro version of this function so that the code
--- will be inlined.
---
--- ---
---
---@param handler_id_ptr integer # A pointer to a handler ID (of type `gulong`) of the handler to be disconnected.
---@param instance GObject.Object # The instance to remove the signal handler from. This pointer may be `nil` or invalid, if the handler ID is zero.
---@return nil
function GObject.clear_signal_handler(handler_id_ptr, instance) end

--- # function GObject.enum_complete_type_info()
---
--- This function is meant to be called from the `complete_type_info`
--- function of a `GTypePlugin` implementation, as in the following
--- example:
--- 
--- ```c
--- static void
--- my_enum_complete_type_info (GTypePlugin     *plugin,
---                             GType            g_type,
---                             GTypeInfo       *info,
---                             GTypeValueTable *value_table)
--- {
---   static const GEnumValue values[] = {
---     { MY_ENUM_FOO, "MY_ENUM_FOO", "foo" },
---     { MY_ENUM_BAR, "MY_ENUM_BAR", "bar" },
---     { 0, NULL, NULL }
---   };
--- 
---   g_enum_complete_type_info (type, info, values);
--- }
--- ```
---
--- ---
---
---@param g_enum_type GObject.GType # the type identifier of the type being completed
---@param info GObject.TypeInfo # the `GTypeInfo` struct to be filled in
---@param const_values GObject.EnumValue # An array of `GEnumValue` structs for the possible enumeration values. The array is terminated by a struct with all members being 0.
---@return nil
function GObject.enum_complete_type_info(g_enum_type, info, const_values) end

--- # function GObject.enum_get_value()
---
--- Returns the `GEnumValue` for a value.
---
--- ---
---
---@param enum_class GObject.EnumClass # a `GEnumClass`
---@param value integer # the value to look up
---@return GObject.EnumValue # the `GEnumValue` for `value`, or `nil` if `value` is not a member of the enumeration
function GObject.enum_get_value(enum_class, value) end

--- # function GObject.enum_get_value_by_name()
---
--- Looks up a `GEnumValue` by name.
---
--- ---
---
---@param enum_class GObject.EnumClass # a `GEnumClass`
---@param name string # the name to look up
---@return GObject.EnumValue # the `GEnumValue` with name `name`, or `nil` if the enumeration doesn't have a member with that name
function GObject.enum_get_value_by_name(enum_class, name) end

--- # function GObject.enum_get_value_by_nick()
---
--- Looks up a `GEnumValue` by nickname.
---
--- ---
---
---@param enum_class GObject.EnumClass # a `GEnumClass`
---@param nick string # the nickname to look up
---@return GObject.EnumValue # the `GEnumValue` with nickname `nick`, or `nil` if the enumeration doesn't have a member with that nickname
function GObject.enum_get_value_by_nick(enum_class, nick) end

--- # function GObject.enum_register_static()
---
--- Registers a new static enumeration type with the name `name`.
--- 
--- It is normally more convenient to let [glib-mkenums][glib-mkenums],
--- generate a `my_enum_get_type()` function from a usual C enumeration
--- definition  than to write one yourself using `g_enum_register_static()`.
---
--- ---
---
---@param name string # A nul-terminated string used as the name of the new type.
---@param const_static_values GObject.EnumValue # An array of `GEnumValue` structs for the possible enumeration values. The array is terminated by a struct with all members being 0. GObject keeps a reference to the data, so it cannot be stack-allocated.
---@return GObject.GType # The new type identifier.
function GObject.enum_register_static(name, const_static_values) end

--- # function GObject.enum_to_string()
---
--- Pretty-prints `value` in the form of the enum’s name.
--- 
--- This is intended to be used for debugging purposes. The format of the output
--- may change in the future.
---
--- ---
---
---@param g_enum_type GObject.GType # the type identifier of a `GEnumClass` type
---@param value integer # the value
---@return string # a newly-allocated text string
function GObject.enum_to_string(g_enum_type, value) end

--- # function GObject.flags_complete_type_info()
---
--- This function is meant to be called from the `complete_type_info()`
--- function of a `GTypePlugin` implementation, see the example for
--- `g_enum_complete_type_info()` above.
---
--- ---
---
---@param g_flags_type GObject.GType # the type identifier of the type being completed
---@param info GObject.TypeInfo # the `GTypeInfo` struct to be filled in
---@param const_values GObject.FlagsValue # An array of `GFlagsValue` structs for the possible enumeration values. The array is terminated by a struct with all members being 0.
---@return nil
function GObject.flags_complete_type_info(g_flags_type, info, const_values) end

--- # function GObject.flags_get_first_value()
---
--- Returns the first `GFlagsValue` which is set in `value`.
---
--- ---
---
---@param flags_class GObject.FlagsClass # a `GFlagsClass`
---@param value integer # the value
---@return GObject.FlagsValue # the first `GFlagsValue` which is set in `value`, or `nil` if none is set
function GObject.flags_get_first_value(flags_class, value) end

--- # function GObject.flags_get_value_by_name()
---
--- Looks up a `GFlagsValue` by name.
---
--- ---
---
---@param flags_class GObject.FlagsClass # a `GFlagsClass`
---@param name string # the name to look up
---@return GObject.FlagsValue # the `GFlagsValue` with name `name`, or `nil` if there is no flag with that name
function GObject.flags_get_value_by_name(flags_class, name) end

--- # function GObject.flags_get_value_by_nick()
---
--- Looks up a `GFlagsValue` by nickname.
---
--- ---
---
---@param flags_class GObject.FlagsClass # a `GFlagsClass`
---@param nick string # the nickname to look up
---@return GObject.FlagsValue # the `GFlagsValue` with nickname `nick`, or `nil` if there is no flag with that nickname
function GObject.flags_get_value_by_nick(flags_class, nick) end

--- # function GObject.flags_register_static()
---
--- Registers a new static flags type with the name `name`.
--- 
--- It is normally more convenient to let [glib-mkenums][glib-mkenums]
--- generate a `my_flags_get_type()` function from a usual C enumeration
--- definition than to write one yourself using `g_flags_register_static()`.
---
--- ---
---
---@param name string # A nul-terminated string used as the name of the new type.
---@param const_static_values GObject.FlagsValue # An array of `GFlagsValue` structs for the possible flags values. The array is terminated by a struct with all members being 0. GObject keeps a reference to the data, so it cannot be stack-allocated.
---@return GObject.GType # The new type identifier.
function GObject.flags_register_static(name, const_static_values) end

--- # function GObject.flags_to_string()
---
--- Pretty-prints `value` in the form of the flag names separated by ` | ` and
--- sorted. Any extra bits will be shown at the end as a hexadecimal number.
--- 
--- This is intended to be used for debugging purposes. The format of the output
--- may change in the future.
---
--- ---
---
---@param flags_type GObject.GType # the type identifier of a `GFlagsClass` type
---@param value integer # the value
---@return string # a newly-allocated text string
function GObject.flags_to_string(flags_type, value) end

--- # function GObject.gtype_get_type()
---
---@return GObject.GType
function GObject.gtype_get_type() end

--- # function GObject.param_spec_boolean()
---
--- Creates a new `GParamSpecBoolean` instance specifying a %G_TYPE_BOOLEAN
--- property. In many cases, it may be more appropriate to use an enum with
--- `g_param_spec_enum()`, both to improve code clarity by using explicitly named
--- values, and to allow for more values to be added in future without breaking
--- API.
--- 
--- See `g_param_spec_internal()` for details on property names.
---
--- ---
---
---@param name string # canonical name of the property specified
---@param nick? string # nick name for the property specified
---@param blurb? string # description of the property specified
---@param default_value (boolean|nil) # default value for the property specified
---@param flags GObject.ParamFlags # flags for the property specified
---@return GObject.ParamSpec # a newly created parameter specification
function GObject.param_spec_boolean(name, nick, blurb, default_value, flags) end

--- # function GObject.param_spec_boxed()
---
--- Creates a new `GParamSpecBoxed` instance specifying a %G_TYPE_BOXED
--- derived property.
--- 
--- See `g_param_spec_internal()` for details on property names.
---
--- ---
---
---@param name string # canonical name of the property specified
---@param nick? string # nick name for the property specified
---@param blurb? string # description of the property specified
---@param boxed_type GObject.GType # %G_TYPE_BOXED derived type of this property
---@param flags GObject.ParamFlags # flags for the property specified
---@return GObject.ParamSpec # a newly created parameter specification
function GObject.param_spec_boxed(name, nick, blurb, boxed_type, flags) end

--- # function GObject.param_spec_char()
---
--- Creates a new `GParamSpecChar` instance specifying a %G_TYPE_CHAR property.
---
--- ---
---
---@param name string # canonical name of the property specified
---@param nick? string # nick name for the property specified
---@param blurb? string # description of the property specified
---@param minimum integer # minimum value for the property specified
---@param maximum integer # maximum value for the property specified
---@param default_value integer # default value for the property specified
---@param flags GObject.ParamFlags # flags for the property specified
---@return GObject.ParamSpec # a newly created parameter specification
function GObject.param_spec_char(name, nick, blurb, minimum, maximum, default_value, flags) end

--- # function GObject.param_spec_double()
---
--- Creates a new `GParamSpecDouble` instance specifying a %G_TYPE_DOUBLE
--- property.
--- 
--- See `g_param_spec_internal()` for details on property names.
---
--- ---
---
---@param name string # canonical name of the property specified
---@param nick? string # nick name for the property specified
---@param blurb? string # description of the property specified
---@param minimum number # minimum value for the property specified
---@param maximum number # maximum value for the property specified
---@param default_value number # default value for the property specified
---@param flags GObject.ParamFlags # flags for the property specified
---@return GObject.ParamSpec # a newly created parameter specification
function GObject.param_spec_double(name, nick, blurb, minimum, maximum, default_value, flags) end

--- # function GObject.param_spec_enum()
---
--- Creates a new `GParamSpecEnum` instance specifying a %G_TYPE_ENUM
--- property.
--- 
--- See `g_param_spec_internal()` for details on property names.
---
--- ---
---
---@param name string # canonical name of the property specified
---@param nick? string # nick name for the property specified
---@param blurb? string # description of the property specified
---@param enum_type GObject.GType # a `GType` derived from %G_TYPE_ENUM
---@param default_value integer # default value for the property specified
---@param flags GObject.ParamFlags # flags for the property specified
---@return GObject.ParamSpec # a newly created parameter specification
function GObject.param_spec_enum(name, nick, blurb, enum_type, default_value, flags) end

--- # function GObject.param_spec_flags()
---
--- Creates a new `GParamSpecFlags` instance specifying a %G_TYPE_FLAGS
--- property.
--- 
--- See `g_param_spec_internal()` for details on property names.
---
--- ---
---
---@param name string # canonical name of the property specified
---@param nick? string # nick name for the property specified
---@param blurb? string # description of the property specified
---@param flags_type GObject.GType # a `GType` derived from %G_TYPE_FLAGS
---@param default_value integer # default value for the property specified
---@param flags GObject.ParamFlags # flags for the property specified
---@return GObject.ParamSpec # a newly created parameter specification
function GObject.param_spec_flags(name, nick, blurb, flags_type, default_value, flags) end

--- # function GObject.param_spec_float()
---
--- Creates a new `GParamSpecFloat` instance specifying a %G_TYPE_FLOAT property.
--- 
--- See `g_param_spec_internal()` for details on property names.
---
--- ---
---
---@param name string # canonical name of the property specified
---@param nick? string # nick name for the property specified
---@param blurb? string # description of the property specified
---@param minimum number # minimum value for the property specified
---@param maximum number # maximum value for the property specified
---@param default_value number # default value for the property specified
---@param flags GObject.ParamFlags # flags for the property specified
---@return GObject.ParamSpec # a newly created parameter specification
function GObject.param_spec_float(name, nick, blurb, minimum, maximum, default_value, flags) end

--- # function GObject.param_spec_gtype()
---
--- Creates a new `GParamSpecGType` instance specifying a
--- %G_TYPE_GTYPE property.
--- 
--- See `g_param_spec_internal()` for details on property names.
---
--- ---
---
---@param name string # canonical name of the property specified
---@param nick? string # nick name for the property specified
---@param blurb? string # description of the property specified
---@param is_a_type GObject.GType # a `GType` whose subtypes are allowed as values of the property (use %G_TYPE_NONE for any type)
---@param flags GObject.ParamFlags # flags for the property specified
---@return GObject.ParamSpec # a newly created parameter specification
function GObject.param_spec_gtype(name, nick, blurb, is_a_type, flags) end

--- # function GObject.param_spec_int()
---
--- Creates a new `GParamSpecInt` instance specifying a %G_TYPE_INT property.
--- 
--- See `g_param_spec_internal()` for details on property names.
---
--- ---
---
---@param name string # canonical name of the property specified
---@param nick? string # nick name for the property specified
---@param blurb? string # description of the property specified
---@param minimum integer # minimum value for the property specified
---@param maximum integer # maximum value for the property specified
---@param default_value integer # default value for the property specified
---@param flags GObject.ParamFlags # flags for the property specified
---@return GObject.ParamSpec # a newly created parameter specification
function GObject.param_spec_int(name, nick, blurb, minimum, maximum, default_value, flags) end

--- # function GObject.param_spec_int64()
---
--- Creates a new `GParamSpecInt64` instance specifying a %G_TYPE_INT64 property.
--- 
--- See `g_param_spec_internal()` for details on property names.
---
--- ---
---
---@param name string # canonical name of the property specified
---@param nick? string # nick name for the property specified
---@param blurb? string # description of the property specified
---@param minimum integer # minimum value for the property specified
---@param maximum integer # maximum value for the property specified
---@param default_value integer # default value for the property specified
---@param flags GObject.ParamFlags # flags for the property specified
---@return GObject.ParamSpec # a newly created parameter specification
function GObject.param_spec_int64(name, nick, blurb, minimum, maximum, default_value, flags) end

--- # function GObject.param_spec_long()
---
--- Creates a new `GParamSpecLong` instance specifying a %G_TYPE_LONG property.
--- 
--- See `g_param_spec_internal()` for details on property names.
---
--- ---
---
---@param name string # canonical name of the property specified
---@param nick? string # nick name for the property specified
---@param blurb? string # description of the property specified
---@param minimum integer # minimum value for the property specified
---@param maximum integer # maximum value for the property specified
---@param default_value integer # default value for the property specified
---@param flags GObject.ParamFlags # flags for the property specified
---@return GObject.ParamSpec # a newly created parameter specification
function GObject.param_spec_long(name, nick, blurb, minimum, maximum, default_value, flags) end

--- # function GObject.param_spec_object()
---
--- Creates a new `GParamSpecBoxed` instance specifying a %G_TYPE_OBJECT
--- derived property.
--- 
--- See `g_param_spec_internal()` for details on property names.
---
--- ---
---
---@param name string # canonical name of the property specified
---@param nick? string # nick name for the property specified
---@param blurb? string # description of the property specified
---@param object_type GObject.GType # %G_TYPE_OBJECT derived type of this property
---@param flags GObject.ParamFlags # flags for the property specified
---@return GObject.ParamSpec # a newly created parameter specification
function GObject.param_spec_object(name, nick, blurb, object_type, flags) end

--- # function GObject.param_spec_param()
---
--- Creates a new `GParamSpecParam` instance specifying a %G_TYPE_PARAM
--- property.
--- 
--- See `g_param_spec_internal()` for details on property names.
---
--- ---
---
---@param name string # canonical name of the property specified
---@param nick? string # nick name for the property specified
---@param blurb? string # description of the property specified
---@param param_type GObject.GType # a `GType` derived from %G_TYPE_PARAM
---@param flags GObject.ParamFlags # flags for the property specified
---@return GObject.ParamSpec # a newly created parameter specification
function GObject.param_spec_param(name, nick, blurb, param_type, flags) end

--- # function GObject.param_spec_pointer()
---
--- Creates a new `GParamSpecPointer` instance specifying a pointer property.
--- Where possible, it is better to use `g_param_spec_object()` or
--- `g_param_spec_boxed()` to expose memory management information.
--- 
--- See `g_param_spec_internal()` for details on property names.
---
--- ---
---
---@param name string # canonical name of the property specified
---@param nick? string # nick name for the property specified
---@param blurb? string # description of the property specified
---@param flags GObject.ParamFlags # flags for the property specified
---@return GObject.ParamSpec # a newly created parameter specification
function GObject.param_spec_pointer(name, nick, blurb, flags) end

--- # function GObject.param_spec_string()
---
--- Creates a new `GParamSpecString` instance.
--- 
--- See `g_param_spec_internal()` for details on property names.
---
--- ---
---
---@param name string # canonical name of the property specified
---@param nick? string # nick name for the property specified
---@param blurb? string # description of the property specified
---@param default_value? string # default value for the property specified
---@param flags GObject.ParamFlags # flags for the property specified
---@return GObject.ParamSpec # a newly created parameter specification
function GObject.param_spec_string(name, nick, blurb, default_value, flags) end

--- # function GObject.param_spec_uchar()
---
--- Creates a new `GParamSpecUChar` instance specifying a %G_TYPE_UCHAR property.
---
--- ---
---
---@param name string # canonical name of the property specified
---@param nick? string # nick name for the property specified
---@param blurb? string # description of the property specified
---@param minimum integer # minimum value for the property specified
---@param maximum integer # maximum value for the property specified
---@param default_value integer # default value for the property specified
---@param flags GObject.ParamFlags # flags for the property specified
---@return GObject.ParamSpec # a newly created parameter specification
function GObject.param_spec_uchar(name, nick, blurb, minimum, maximum, default_value, flags) end

--- # function GObject.param_spec_uint()
---
--- Creates a new `GParamSpecUInt` instance specifying a %G_TYPE_UINT property.
--- 
--- See `g_param_spec_internal()` for details on property names.
---
--- ---
---
---@param name string # canonical name of the property specified
---@param nick? string # nick name for the property specified
---@param blurb? string # description of the property specified
---@param minimum integer # minimum value for the property specified
---@param maximum integer # maximum value for the property specified
---@param default_value integer # default value for the property specified
---@param flags GObject.ParamFlags # flags for the property specified
---@return GObject.ParamSpec # a newly created parameter specification
function GObject.param_spec_uint(name, nick, blurb, minimum, maximum, default_value, flags) end

--- # function GObject.param_spec_uint64()
---
--- Creates a new `GParamSpecUInt64` instance specifying a %G_TYPE_UINT64
--- property.
--- 
--- See `g_param_spec_internal()` for details on property names.
---
--- ---
---
---@param name string # canonical name of the property specified
---@param nick? string # nick name for the property specified
---@param blurb? string # description of the property specified
---@param minimum integer # minimum value for the property specified
---@param maximum integer # maximum value for the property specified
---@param default_value integer # default value for the property specified
---@param flags GObject.ParamFlags # flags for the property specified
---@return GObject.ParamSpec # a newly created parameter specification
function GObject.param_spec_uint64(name, nick, blurb, minimum, maximum, default_value, flags) end

--- # function GObject.param_spec_ulong()
---
--- Creates a new `GParamSpecULong` instance specifying a %G_TYPE_ULONG
--- property.
--- 
--- See `g_param_spec_internal()` for details on property names.
---
--- ---
---
---@param name string # canonical name of the property specified
---@param nick? string # nick name for the property specified
---@param blurb? string # description of the property specified
---@param minimum integer # minimum value for the property specified
---@param maximum integer # maximum value for the property specified
---@param default_value integer # default value for the property specified
---@param flags GObject.ParamFlags # flags for the property specified
---@return GObject.ParamSpec # a newly created parameter specification
function GObject.param_spec_ulong(name, nick, blurb, minimum, maximum, default_value, flags) end

--- # function GObject.param_spec_unichar()
---
--- Creates a new `GParamSpecUnichar` instance specifying a %G_TYPE_UINT
--- property. `GValue` structures for this property can be accessed with
--- `g_value_set_uint()` and `g_value_get_uint()`.
--- 
--- See `g_param_spec_internal()` for details on property names.
---
--- ---
---
---@param name string # canonical name of the property specified
---@param nick? string # nick name for the property specified
---@param blurb? string # description of the property specified
---@param default_value integer # default value for the property specified
---@param flags GObject.ParamFlags # flags for the property specified
---@return GObject.ParamSpec # a newly created parameter specification
function GObject.param_spec_unichar(name, nick, blurb, default_value, flags) end

--- # function GObject.param_spec_variant()
---
--- Creates a new `GParamSpecVariant` instance specifying a `GVariant`
--- property.
--- 
--- If `default_value` is floating, it is consumed.
--- 
--- See `g_param_spec_internal()` for details on property names.
---
--- ---
---
---@param name string # canonical name of the property specified
---@param nick? string # nick name for the property specified
---@param blurb? string # description of the property specified
---@param type GLib.VariantType # a `GVariantType`
---@param default_value? GLib.Variant # a `GVariant` of type `type` to use as the default value, or `nil`
---@param flags GObject.ParamFlags # flags for the property specified
---@return GObject.ParamSpec # the newly created `GParamSpec`
function GObject.param_spec_variant(name, nick, blurb, type, default_value, flags) end

--- # function GObject.param_type_register_static()
---
--- Registers `name` as the name of a new static type derived
--- from %G_TYPE_PARAM.
--- 
--- The type system uses the information contained in the `GParamSpecTypeInfo`
--- structure pointed to by `info` to manage the `GParamSpec` type and its
--- instances.
---
--- ---
---
---@param name string # 0-terminated string used as the name of the new `GParamSpec` type.
---@param pspec_info GObject.ParamSpecTypeInfo # The `GParamSpecTypeInfo` for this `GParamSpec` type.
---@return GObject.GType # The new type identifier.
function GObject.param_type_register_static(name, pspec_info) end

--- # function GObject.param_value_convert()
---
--- Transforms `src_value` into `dest_value` if possible, and then
--- validates `dest_value`, in order for it to conform to `pspec`.  If
--- `strict_validation` is `true` this function will only succeed if the
--- transformed `dest_value` complied to `pspec` without modifications.
--- 
--- See also `g_value_type_transformable()`, `g_value_transform()` and
--- `g_param_value_validate()`.
---
--- ---
---
---@param pspec GObject.ParamSpec # a valid `GParamSpec`
---@param src_value GObject.Value # source `GValue`
---@param dest_value GObject.Value # destination `GValue` of correct type for `pspec`
---@param strict_validation (boolean|nil) # `true` requires `dest_value` to conform to `pspec` without modifications
---@return (boolean|nil) # `true` if transformation and validation were successful, `false` otherwise and `dest_value` is left untouched.
function GObject.param_value_convert(pspec, src_value, dest_value, strict_validation) end

--- # function GObject.param_value_defaults()
---
--- Checks whether `value` contains the default value as specified in `pspec`.
---
--- ---
---
---@param pspec GObject.ParamSpec # a valid `GParamSpec`
---@param value GObject.Value # a `GValue` of correct type for `pspec`
---@return (boolean|nil) # whether `value` contains the canonical default for this `pspec`
function GObject.param_value_defaults(pspec, value) end

--- # function GObject.param_value_is_valid()
---
--- Return whether the contents of `value` comply with the specifications
--- set out by `pspec`.
---
--- ---
---
---@param pspec GObject.ParamSpec # a valid `GParamSpec`
---@param value GObject.Value # a `GValue` of correct type for `pspec`
---@return (boolean|nil) # whether the contents of `value` comply with the specifications set out by `pspec`.
function GObject.param_value_is_valid(pspec, value) end

--- # function GObject.param_value_set_default()
---
--- Sets `value` to its default value as specified in `pspec`.
---
--- ---
---
---@param pspec GObject.ParamSpec # a valid `GParamSpec`
---@param value GObject.Value # a `GValue` of correct type for `pspec`; since 2.64, you can also pass an empty `GValue`, initialized with %G_VALUE_INIT
---@return nil
function GObject.param_value_set_default(pspec, value) end

--- # function GObject.param_value_validate()
---
--- Ensures that the contents of `value` comply with the specifications
--- set out by `pspec`. For example, a `GParamSpecInt` might require
--- that integers stored in `value` may not be smaller than -42 and not be
--- greater than +42. If `value` contains an integer outside of this range,
--- it is modified accordingly, so the resulting value will fit into the
--- range -42 .. +42.
---
--- ---
---
---@param pspec GObject.ParamSpec # a valid `GParamSpec`
---@param value GObject.Value # a `GValue` of correct type for `pspec`
---@return (boolean|nil) # whether modifying `value` was necessary to ensure validity
function GObject.param_value_validate(pspec, value) end

--- # function GObject.param_values_cmp()
---
--- Compares `value1` with `value2` according to `pspec`, and return -1, 0 or +1,
--- if `value1` is found to be less than, equal to or greater than `value2`,
--- respectively.
---
--- ---
---
---@param pspec GObject.ParamSpec # a valid `GParamSpec`
---@param value1 GObject.Value # a `GValue` of correct type for `pspec`
---@param value2 GObject.Value # a `GValue` of correct type for `pspec`
---@return integer # -1, 0 or +1, for a less than, equal to or greater than result
function GObject.param_values_cmp(pspec, value1, value2) end

--- # function GObject.pointer_type_register_static()
---
--- Creates a new %G_TYPE_POINTER derived type id for a new
--- pointer type with name `name`.
---
--- ---
---
---@param name string # the name of the new pointer type.
---@return GObject.GType # a new %G_TYPE_POINTER derived type id for `name`.
function GObject.pointer_type_register_static(name) end

--- # function GObject.signal_accumulator_first_wins()
---
--- A predefined `GSignalAccumulator` for signals intended to be used as a
--- hook for application code to provide a particular value.  Usually
--- only one such value is desired and multiple handlers for the same
--- signal don't make much sense (except for the case of the default
--- handler defined in the class structure, in which case you will
--- usually want the signal connection to override the class handler).
--- 
--- This accumulator will use the return value from the first signal
--- handler that is run as the return value for the signal and not run
--- any further handlers (ie: the first handler "wins").
---
--- ---
---
---@param ihint GObject.SignalInvocationHint # standard `GSignalAccumulator` parameter
---@param return_accu GObject.Value # standard `GSignalAccumulator` parameter
---@param handler_return GObject.Value # standard `GSignalAccumulator` parameter
---@param dummy? userdata # standard `GSignalAccumulator` parameter
---@return (boolean|nil) # standard `GSignalAccumulator` result
function GObject.signal_accumulator_first_wins(ihint, return_accu, handler_return, dummy) end

--- # function GObject.signal_accumulator_true_handled()
---
--- A predefined `GSignalAccumulator` for signals that return a
--- boolean values. The behavior that this accumulator gives is
--- that a return of `true` stops the signal emission: no further
--- callbacks will be invoked, while a return of `false` allows
--- the emission to continue. The idea here is that a `true` return
--- indicates that the callback handled the signal, and no further
--- handling is needed.
---
--- ---
---
---@param ihint GObject.SignalInvocationHint # standard `GSignalAccumulator` parameter
---@param return_accu GObject.Value # standard `GSignalAccumulator` parameter
---@param handler_return GObject.Value # standard `GSignalAccumulator` parameter
---@param dummy? userdata # standard `GSignalAccumulator` parameter
---@return (boolean|nil) # standard `GSignalAccumulator` result
function GObject.signal_accumulator_true_handled(ihint, return_accu, handler_return, dummy) end

--- # function GObject.signal_add_emission_hook()
---
--- Adds an emission hook for a signal, which will get called for any emission
--- of that signal, independent of the instance. This is possible only
--- for signals which don't have %G_SIGNAL_NO_HOOKS flag set.
---
--- ---
---
---@param signal_id integer # the signal identifier, as returned by `g_signal_lookup()`.
---@param detail GLib.Quark # the detail on which to call the hook.
---@param hook_func GObject.SignalEmissionHook # a `GSignalEmissionHook` function.
---@param hook_data? userdata # user data for `hook_func`.
---@param data_destroy? GLib.DestroyNotify # a `GDestroyNotify` for `hook_data`.
---@return integer # the hook id, for later use with `g_signal_remove_emission_hook()`.
function GObject.signal_add_emission_hook(signal_id, detail, hook_func, hook_data, data_destroy) end

--- # function GObject.signal_chain_from_overridden()
---
--- Calls the original class closure of a signal. This function should only
--- be called from an overridden class closure; see
--- `g_signal_override_class_closure()` and
--- `g_signal_override_class_handler()`.
---
--- ---
---
---@param instance_and_params unknown[] # the argument list of the signal emission. The first element in the array is a `GValue` for the instance the signal is being emitted on. The rest are any arguments to be passed to the signal.
---@param return_value GObject.Value # Location for the return value.
---@return nil
function GObject.signal_chain_from_overridden(instance_and_params, return_value) end

--- # function GObject.signal_connect_closure()
---
--- Connects a closure to a signal for a particular object.
--- 
--- If `closure` is a floating reference (see `g_closure_sink()`), this function
--- takes ownership of `closure`.
---
--- ---
---
---@param instance GObject.Object # the instance to connect to.
---@param detailed_signal string # a string of the form "signal-name::detail".
---@param closure GObject.Closure # the closure to connect.
---@param after (boolean|nil) # whether the handler should be called before or after the default handler of the signal.
---@return integer # the handler ID (always greater than 0 for successful connections)
function GObject.signal_connect_closure(instance, detailed_signal, closure, after) end

--- # function GObject.signal_connect_closure_by_id()
---
--- Connects a closure to a signal for a particular object.
--- 
--- If `closure` is a floating reference (see `g_closure_sink()`), this function
--- takes ownership of `closure`.
---
--- ---
---
---@param instance GObject.Object # the instance to connect to.
---@param signal_id integer # the id of the signal.
---@param detail GLib.Quark # the detail.
---@param closure GObject.Closure # the closure to connect.
---@param after (boolean|nil) # whether the handler should be called before or after the default handler of the signal.
---@return integer # the handler ID (always greater than 0 for successful connections)
function GObject.signal_connect_closure_by_id(instance, signal_id, detail, closure, after) end

--- # function GObject.signal_emitv()
---
--- Emits a signal. Signal emission is done synchronously.
--- The method will only return control after all handlers are called or signal emission was stopped.
--- 
--- Note that `g_signal_emitv()` doesn't change `return_value` if no handlers are
--- connected, in contrast to `g_signal_emit()` and `g_signal_emit_valist()`.
---
--- ---
---
---@param instance_and_params unknown[] # argument list for the signal emission. The first element in the array is a `GValue` for the instance the signal is being emitted on. The rest are any arguments to be passed to the signal.
---@param signal_id integer # the signal id
---@param detail GLib.Quark # the detail
---@param return_value GObject.Value # Location to store the return value of the signal emission. This must be provided if the specified signal returns a value, but may be ignored otherwise.
---@return nil
function GObject.signal_emitv(instance_and_params, signal_id, detail, return_value) end

--- # function GObject.signal_get_invocation_hint()
---
--- Returns the invocation hint of the innermost signal emission of instance.
---
--- ---
---
---@param instance GObject.Object # the instance to query
---@return GObject.SignalInvocationHint # the invocation hint of the innermost signal emission, or `nil` if not found.
function GObject.signal_get_invocation_hint(instance) end

--- # function GObject.signal_handler_block()
---
--- Blocks a handler of an instance so it will not be called during any
--- signal emissions unless it is unblocked again. Thus "blocking" a
--- signal handler means to temporarily deactivate it, a signal handler
--- has to be unblocked exactly the same amount of times it has been
--- blocked before to become active again.
--- 
--- The `handler_id` has to be a valid signal handler id, connected to a
--- signal of `instance`.
---
--- ---
---
---@param instance GObject.Object # The instance to block the signal handler of.
---@param handler_id integer # Handler id of the handler to be blocked.
---@return nil
function GObject.signal_handler_block(instance, handler_id) end

--- # function GObject.signal_handler_disconnect()
---
--- Disconnects a handler from an instance so it will not be called during
--- any future or currently ongoing emissions of the signal it has been
--- connected to. The `handler_id` becomes invalid and may be reused.
--- 
--- The `handler_id` has to be a valid signal handler id, connected to a
--- signal of `instance`.
---
--- ---
---
---@param instance GObject.Object # The instance to remove the signal handler from.
---@param handler_id integer # Handler id of the handler to be disconnected.
---@return nil
function GObject.signal_handler_disconnect(instance, handler_id) end

--- # function GObject.signal_handler_find()
---
--- Finds the first signal handler that matches certain selection criteria.
--- The criteria mask is passed as an OR-ed combination of `GSignalMatchType`
--- flags, and the criteria values are passed as arguments.
--- The match `mask` has to be non-0 for successful matches.
--- If no handler was found, 0 is returned.
---
--- ---
---
---@param instance GObject.Object # The instance owning the signal handler to be found.
---@param mask GObject.SignalMatchType # Mask indicating which of `signal_id`, `detail`, `closure`, `func` and/or `data` the handler has to match.
---@param signal_id integer # Signal the handler has to be connected to.
---@param detail GLib.Quark # Signal detail the handler has to be connected to.
---@param closure? GObject.Closure # The closure the handler will invoke.
---@param func? userdata # The C closure callback of the handler (useless for non-C closures).
---@param data? userdata # The closure data of the handler's closure.
---@return integer # A valid non-0 signal handler id for a successful match.
function GObject.signal_handler_find(instance, mask, signal_id, detail, closure, func, data) end

--- # function GObject.signal_handler_is_connected()
---
--- Returns whether `handler_id` is the ID of a handler connected to `instance`.
---
--- ---
---
---@param instance GObject.Object # The instance where a signal handler is sought.
---@param handler_id integer # the handler ID.
---@return (boolean|nil) # whether `handler_id` identifies a handler connected to `instance`.
function GObject.signal_handler_is_connected(instance, handler_id) end

--- # function GObject.signal_handler_unblock()
---
--- Undoes the effect of a previous `g_signal_handler_block()` call.  A
--- blocked handler is skipped during signal emissions and will not be
--- invoked, unblocking it (for exactly the amount of times it has been
--- blocked before) reverts its "blocked" state, so the handler will be
--- recognized by the signal system and is called upon future or
--- currently ongoing signal emissions (since the order in which
--- handlers are called during signal emissions is deterministic,
--- whether the unblocked handler in question is called as part of a
--- currently ongoing emission depends on how far that emission has
--- proceeded yet).
--- 
--- The `handler_id` has to be a valid id of a signal handler that is
--- connected to a signal of `instance` and is currently blocked.
---
--- ---
---
---@param instance GObject.Object # The instance to unblock the signal handler of.
---@param handler_id integer # Handler id of the handler to be unblocked.
---@return nil
function GObject.signal_handler_unblock(instance, handler_id) end

--- # function GObject.signal_handlers_block_matched()
---
--- Blocks all handlers on an instance that match a certain selection criteria.
--- The criteria mask is passed as an OR-ed combination of `GSignalMatchType`
--- flags, and the criteria values are passed as arguments.
--- Passing at least one of the %G_SIGNAL_MATCH_CLOSURE, %G_SIGNAL_MATCH_FUNC
--- or %G_SIGNAL_MATCH_DATA match flags is required for successful matches.
--- If no handlers were found, 0 is returned, the number of blocked handlers
--- otherwise.
---
--- ---
---
---@param instance GObject.Object # The instance to block handlers from.
---@param mask GObject.SignalMatchType # Mask indicating which of `signal_id`, `detail`, `closure`, `func` and/or `data` the handlers have to match.
---@param signal_id integer # Signal the handlers have to be connected to.
---@param detail GLib.Quark # Signal detail the handlers have to be connected to.
---@param closure? GObject.Closure # The closure the handlers will invoke.
---@param func? userdata # The C closure callback of the handlers (useless for non-C closures).
---@param data? userdata # The closure data of the handlers' closures.
---@return integer # The number of handlers that matched.
function GObject.signal_handlers_block_matched(instance, mask, signal_id, detail, closure, func, data) end

--- # function GObject.signal_handlers_destroy()
---
--- Destroy all signal handlers of a type instance. This function is
--- an implementation detail of the `GObject` dispose implementation,
--- and should not be used outside of the type system.
---
--- ---
---
---@param instance GObject.Object # The instance whose signal handlers are destroyed
---@return nil
function GObject.signal_handlers_destroy(instance) end

--- # function GObject.signal_handlers_disconnect_matched()
---
--- Disconnects all handlers on an instance that match a certain
--- selection criteria. The criteria mask is passed as an OR-ed
--- combination of `GSignalMatchType` flags, and the criteria values are
--- passed as arguments.  Passing at least one of the
--- %G_SIGNAL_MATCH_CLOSURE, %G_SIGNAL_MATCH_FUNC or
--- %G_SIGNAL_MATCH_DATA match flags is required for successful
--- matches.  If no handlers were found, 0 is returned, the number of
--- disconnected handlers otherwise.
---
--- ---
---
---@param instance GObject.Object # The instance to remove handlers from.
---@param mask GObject.SignalMatchType # Mask indicating which of `signal_id`, `detail`, `closure`, `func` and/or `data` the handlers have to match.
---@param signal_id integer # Signal the handlers have to be connected to.
---@param detail GLib.Quark # Signal detail the handlers have to be connected to.
---@param closure? GObject.Closure # The closure the handlers will invoke.
---@param func? userdata # The C closure callback of the handlers (useless for non-C closures).
---@param data? userdata # The closure data of the handlers' closures.
---@return integer # The number of handlers that matched.
function GObject.signal_handlers_disconnect_matched(instance, mask, signal_id, detail, closure, func, data) end

--- # function GObject.signal_handlers_unblock_matched()
---
--- Unblocks all handlers on an instance that match a certain selection
--- criteria. The criteria mask is passed as an OR-ed combination of
--- `GSignalMatchType` flags, and the criteria values are passed as arguments.
--- Passing at least one of the %G_SIGNAL_MATCH_CLOSURE, %G_SIGNAL_MATCH_FUNC
--- or %G_SIGNAL_MATCH_DATA match flags is required for successful matches.
--- If no handlers were found, 0 is returned, the number of unblocked handlers
--- otherwise. The match criteria should not apply to any handlers that are
--- not currently blocked.
---
--- ---
---
---@param instance GObject.Object # The instance to unblock handlers from.
---@param mask GObject.SignalMatchType # Mask indicating which of `signal_id`, `detail`, `closure`, `func` and/or `data` the handlers have to match.
---@param signal_id integer # Signal the handlers have to be connected to.
---@param detail GLib.Quark # Signal detail the handlers have to be connected to.
---@param closure? GObject.Closure # The closure the handlers will invoke.
---@param func? userdata # The C closure callback of the handlers (useless for non-C closures).
---@param data? userdata # The closure data of the handlers' closures.
---@return integer # The number of handlers that matched.
function GObject.signal_handlers_unblock_matched(instance, mask, signal_id, detail, closure, func, data) end

--- # function GObject.signal_has_handler_pending()
---
--- Returns whether there are any handlers connected to `instance` for the
--- given signal id and detail.
--- 
--- If `detail` is 0 then it will only match handlers that were connected
--- without detail.  If `detail` is non-zero then it will match handlers
--- connected both without detail and with the given detail.  This is
--- consistent with how a signal emitted with `detail` would be delivered
--- to those handlers.
--- 
--- Since 2.46 this also checks for a non-default class closure being
--- installed, as this is basically always what you want.
--- 
--- One example of when you might use this is when the arguments to the
--- signal are difficult to compute. A class implementor may opt to not
--- emit the signal if no one is attached anyway, thus saving the cost
--- of building the arguments.
---
--- ---
---
---@param instance GObject.Object # the object whose signal handlers are sought.
---@param signal_id integer # the signal id.
---@param detail GLib.Quark # the detail.
---@param may_be_blocked (boolean|nil) # whether blocked handlers should count as match.
---@return (boolean|nil) # `true` if a handler is connected to the signal, `false` otherwise.
function GObject.signal_has_handler_pending(instance, signal_id, detail, may_be_blocked) end

--- # function GObject.signal_is_valid_name()
---
--- Validate a signal name. This can be useful for dynamically-generated signals
--- which need to be validated at run-time before actually trying to create them.
--- 
--- See [canonical parameter names][canonical-parameter-names] for details of
--- the rules for valid names. The rules for signal names are the same as those
--- for property names.
---
--- ---
---
---@param name string # the canonical name of the signal
---@return (boolean|nil) # `true` if `name` is a valid signal name, `false` otherwise.
function GObject.signal_is_valid_name(name) end

--- # function GObject.signal_list_ids()
---
--- Lists the signals by id that a certain instance or interface type
--- created. Further information about the signals can be acquired through
--- `g_signal_query()`.
---
--- ---
---
---@param itype GObject.GType # Instance or interface type.
---@param n_ids integer # Location to store the number of signal ids for `itype`.
---@return unknown[] # Newly allocated array of signal IDs.
function GObject.signal_list_ids(itype, n_ids) end

--- # function GObject.signal_lookup()
---
--- Given the name of the signal and the type of object it connects to, gets
--- the signal's identifying integer. Emitting the signal by number is
--- somewhat faster than using the name each time.
--- 
--- Also tries the ancestors of the given type.
--- 
--- The type class passed as `itype` must already have been instantiated (for
--- example, using `g_type_class_ref()`) for this function to work, as signals are
--- always installed during class initialization.
--- 
--- See `g_signal_new()` for details on allowed signal names.
---
--- ---
---
---@param name string # the signal's name.
---@param itype GObject.GType # the type that the signal operates on.
---@return integer # the signal's identifying number, or 0 if no signal was found.
function GObject.signal_lookup(name, itype) end

--- # function GObject.signal_name()
---
--- Given the signal's identifier, finds its name.
--- 
--- Two different signals may have the same name, if they have differing types.
---
--- ---
---
---@param signal_id integer # the signal's identifying number.
---@return string # the signal name, or `nil` if the signal number was invalid.
function GObject.signal_name(signal_id) end

--- # function GObject.signal_override_class_closure()
---
--- Overrides the class closure (i.e. the default handler) for the given signal
--- for emissions on instances of `instance_type`. `instance_type` must be derived
--- from the type to which the signal belongs.
--- 
--- See `g_signal_chain_from_overridden()` and
--- `g_signal_chain_from_overridden_handler()` for how to chain up to the
--- parent class closure from inside the overridden one.
---
--- ---
---
---@param signal_id integer # the signal id
---@param instance_type GObject.GType # the instance type on which to override the class closure for the signal.
---@param class_closure GObject.Closure # the closure.
---@return nil
function GObject.signal_override_class_closure(signal_id, instance_type, class_closure) end

--- # function GObject.signal_parse_name()
---
--- Internal function to parse a signal name into its `signal_id`
--- and `detail` quark.
---
--- ---
---
---@param detailed_signal string # a string of the form "signal-name::detail".
---@param itype GObject.GType # The interface/instance type that introduced "signal-name".
---@param signal_id_p integer # Location to store the signal id.
---@param detail_p GLib.Quark # Location to store the detail quark.
---@param force_detail_quark (boolean|nil) # `true` forces creation of a `GQuark` for the detail.
---@return (boolean|nil) # Whether the signal name could successfully be parsed and `signal_id_p` and `detail_p` contain valid return values.
function GObject.signal_parse_name(detailed_signal, itype, signal_id_p, detail_p, force_detail_quark) end

--- # function GObject.signal_query()
---
--- Queries the signal system for in-depth information about a
--- specific signal. This function will fill in a user-provided
--- structure to hold signal-specific information. If an invalid
--- signal id is passed in, the `signal_id` member of the `GSignalQuery`
--- is 0. All members filled into the `GSignalQuery` structure should
--- be considered constant and have to be left untouched.
---
--- ---
---
---@param signal_id integer # The signal id of the signal to query information for.
---@param query GObject.SignalQuery # A user provided structure that is filled in with constant values upon success.
---@return nil
function GObject.signal_query(signal_id, query) end

--- # function GObject.signal_remove_emission_hook()
---
--- Deletes an emission hook.
---
--- ---
---
---@param signal_id integer # the id of the signal
---@param hook_id integer # the id of the emission hook, as returned by `g_signal_add_emission_hook()`
---@return nil
function GObject.signal_remove_emission_hook(signal_id, hook_id) end

--- # function GObject.signal_set_va_marshaller()
---
--- Change the `GSignalCVaMarshaller` used for a given signal.  This is a
--- specialised form of the marshaller that can often be used for the
--- common case of a single connected signal handler and avoids the
--- overhead of `GValue`.  Its use is optional.
---
--- ---
---
---@param signal_id integer # the signal id
---@param instance_type GObject.GType # the instance type on which to set the marshaller.
---@param va_marshaller GObject.SignalCVaMarshaller # the marshaller to set.
---@return nil
function GObject.signal_set_va_marshaller(signal_id, instance_type, va_marshaller) end

--- # function GObject.signal_stop_emission()
---
--- Stops a signal's current emission.
--- 
--- This will prevent the default method from running, if the signal was
--- %G_SIGNAL_RUN_LAST and you connected normally (i.e. without the "after"
--- flag).
--- 
--- Prints a warning if used on a signal which isn't being emitted.
---
--- ---
---
---@param instance GObject.Object # the object whose signal handlers you wish to stop.
---@param signal_id integer # the signal identifier, as returned by `g_signal_lookup()`.
---@param detail GLib.Quark # the detail which the signal was emitted with.
---@return nil
function GObject.signal_stop_emission(instance, signal_id, detail) end

--- # function GObject.signal_stop_emission_by_name()
---
--- Stops a signal's current emission.
--- 
--- This is just like `g_signal_stop_emission()` except it will look up the
--- signal id for you.
---
--- ---
---
---@param instance GObject.Object # the object whose signal handlers you wish to stop.
---@param detailed_signal string # a string of the form "signal-name::detail".
---@return nil
function GObject.signal_stop_emission_by_name(instance, detailed_signal) end

--- # function GObject.signal_type_cclosure_new()
---
--- Creates a new closure which invokes the function found at the offset
--- `struct_offset` in the class structure of the interface or classed type
--- identified by `itype`.
---
--- ---
---
---@param itype GObject.GType # the `GType` identifier of an interface or classed type
---@param struct_offset integer # the offset of the member function of `itype`'s class structure which is to be invoked by the new closure
---@return GObject.Closure # a floating reference to a new `GCClosure`
function GObject.signal_type_cclosure_new(itype, struct_offset) end

--- # function GObject.source_set_closure()
---
--- Set the callback for a source as a `GClosure`.
--- 
--- If the source is not one of the standard GLib types, the `closure_callback`
--- and `closure_marshal` fields of the `GSourceFuncs` structure must have been
--- filled in with pointers to appropriate functions.
---
--- ---
---
---@param source GLib.Source # the source
---@param closure GObject.Closure # a `GClosure`
---@return nil
function GObject.source_set_closure(source, closure) end

--- # function GObject.source_set_dummy_callback()
---
--- Sets a dummy callback for `source`. The callback will do nothing, and
--- if the source expects a `gboolean` return value, it will return `true`.
--- (If the source expects any other type of return value, it will return
--- a 0/`nil` value; whatever `g_value_init()` initializes a `GValue` to for
--- that type.)
--- 
--- If the source is not one of the standard GLib types, the
--- `closure_callback` and `closure_marshal` fields of the `GSourceFuncs`
--- structure must have been filled in with pointers to appropriate
--- functions.
---
--- ---
---
---@param source GLib.Source # the source
---@return nil
function GObject.source_set_dummy_callback(source) end

--- # function GObject.strdup_value_contents()
---
--- Return a newly allocated string, which describes the contents of a
--- `GValue`.  The main purpose of this function is to describe `GValue`
--- contents for debugging output, the way in which the contents are
--- described may change between different GLib versions.
---
--- ---
---
---@param value GObject.Value # `GValue` which contents are to be described.
---@return string # Newly allocated string.
function GObject.strdup_value_contents(value) end

--- # function GObject.type_add_class_private()
---
--- Registers a private class structure for a classed type;
--- when the class is allocated, the private structures for
--- the class and all of its parent types are allocated
--- sequentially in the same memory block as the public
--- structures, and are zero-filled.
--- 
--- This function should be called in the
--- type's `get_type()` function after the type is registered.
--- The private structure can be retrieved using the
--- G_TYPE_CLASS_GET_PRIVATE() macro.
---
--- ---
---
---@param class_type GObject.GType # GType of a classed type
---@param private_size integer # size of private structure
---@return nil
function GObject.type_add_class_private(class_type, private_size) end

--- # function GObject.type_add_instance_private()
---
---@param class_type GObject.GType
---@param private_size integer
---@return integer
function GObject.type_add_instance_private(class_type, private_size) end

--- # function GObject.type_add_interface_dynamic()
---
--- Adds `interface_type` to the dynamic `instance_type`. The information
--- contained in the `GTypePlugin` structure pointed to by `plugin`
--- is used to manage the relationship.
---
--- ---
---
---@param instance_type GObject.GType # `GType` value of an instantiatable type
---@param interface_type GObject.GType # `GType` value of an interface type
---@param plugin GObject.TypePlugin # `GTypePlugin` structure to retrieve the `GInterfaceInfo` from
---@return nil
function GObject.type_add_interface_dynamic(instance_type, interface_type, plugin) end

--- # function GObject.type_add_interface_static()
---
--- Adds `interface_type` to the static `instance_type`.
--- The information contained in the `GInterfaceInfo` structure
--- pointed to by `info` is used to manage the relationship.
---
--- ---
---
---@param instance_type GObject.GType # `GType` value of an instantiatable type
---@param interface_type GObject.GType # `GType` value of an interface type
---@param info GObject.InterfaceInfo # `GInterfaceInfo` structure for this (`instance_type`, `interface_type`) combination
---@return nil
function GObject.type_add_interface_static(instance_type, interface_type, info) end

--- # function GObject.type_check_class_is_a()
---
---@param g_class GObject.TypeClass
---@param is_a_type GObject.GType
---@return (boolean|nil)
function GObject.type_check_class_is_a(g_class, is_a_type) end

--- # function GObject.type_check_instance()
---
--- Private helper function to aid implementation of the
--- G_TYPE_CHECK_INSTANCE() macro.
---
--- ---
---
---@param instance GObject.TypeInstance # a valid `GTypeInstance` structure
---@return (boolean|nil) # `true` if `instance` is valid, `false` otherwise
function GObject.type_check_instance(instance) end

--- # function GObject.type_check_instance_is_a()
---
---@param instance GObject.TypeInstance
---@param iface_type GObject.GType
---@return (boolean|nil)
function GObject.type_check_instance_is_a(instance, iface_type) end

--- # function GObject.type_check_instance_is_fundamentally_a()
---
---@param instance GObject.TypeInstance
---@param fundamental_type GObject.GType
---@return (boolean|nil)
function GObject.type_check_instance_is_fundamentally_a(instance, fundamental_type) end

--- # function GObject.type_check_is_value_type()
---
---@param type GObject.GType
---@return (boolean|nil)
function GObject.type_check_is_value_type(type) end

--- # function GObject.type_check_value()
---
---@param value GObject.Value
---@return (boolean|nil)
function GObject.type_check_value(value) end

--- # function GObject.type_check_value_holds()
---
---@param value GObject.Value
---@param type GObject.GType
---@return (boolean|nil)
function GObject.type_check_value_holds(value, type) end

--- # function GObject.type_children()
---
--- Return a newly allocated and 0-terminated array of type IDs, listing
--- the child types of `type`.
---
--- ---
---
---@param type GObject.GType # the parent type
---@param n_children? integer # location to store the length of the returned array, or `nil`
---@return unknown[] # Newly allocated and 0-terminated array of child types, free with `g_free()`
function GObject.type_children(type, n_children) end

--- # function GObject.type_class_adjust_private_offset()
---
---@param g_class? userdata
---@param private_size_or_offset integer
---@return nil
function GObject.type_class_adjust_private_offset(g_class, private_size_or_offset) end

--- # function GObject.type_class_peek()
---
--- This function is essentially the same as `g_type_class_ref()`,
--- except that the classes reference count isn't incremented.
--- As a consequence, this function may return `nil` if the class
--- of the type passed in does not currently exist (hasn't been
--- referenced before).
---
--- ---
---
---@param type GObject.GType # type ID of a classed type
---@return GObject.TypeClass # the `GTypeClass` structure for the given type ID or `nil` if the class does not currently exist
function GObject.type_class_peek(type) end

--- # function GObject.type_class_peek_static()
---
--- A more efficient version of `g_type_class_peek()` which works only for
--- static types.
---
--- ---
---
---@param type GObject.GType # type ID of a classed type
---@return GObject.TypeClass # the `GTypeClass` structure for the given type ID or `nil` if the class does not currently exist or is dynamically loaded
function GObject.type_class_peek_static(type) end

--- # function GObject.type_class_ref()
---
--- Increments the reference count of the class structure belonging to
--- `type`. This function will demand-create the class if it doesn't
--- exist already.
---
--- ---
---
---@param type GObject.GType # type ID of a classed type
---@return GObject.TypeClass # the `GTypeClass` structure for the given type ID
function GObject.type_class_ref(type) end

--- # function GObject.type_default_interface_peek()
---
--- If the interface type `g_type` is currently in use, returns its
--- default interface vtable.
---
--- ---
---
---@param g_type GObject.GType # an interface type
---@return GObject.TypeInterface # the default vtable for the interface, or `nil` if the type is not currently in use
function GObject.type_default_interface_peek(g_type) end

--- # function GObject.type_default_interface_ref()
---
--- Increments the reference count for the interface type `g_type`,
--- and returns the default interface vtable for the type.
--- 
--- If the type is not currently in use, then the default vtable
--- for the type will be created and initialized by calling
--- the base interface init and default vtable init functions for
--- the type (the `base_init` and `class_init` members of `GTypeInfo`).
--- Calling `g_type_default_interface_ref()` is useful when you
--- want to make sure that signals and properties for an interface
--- have been installed.
---
--- ---
---
---@param g_type GObject.GType # an interface type
---@return GObject.TypeInterface # the default vtable for the interface; call `g_type_default_interface_unref()` when you are done using the interface.
function GObject.type_default_interface_ref(g_type) end

--- # function GObject.type_default_interface_unref()
---
--- Decrements the reference count for the type corresponding to the
--- interface default vtable `g_iface`. If the type is dynamic, then
--- when no one is using the interface and all references have
--- been released, the finalize function for the interface's default
--- vtable (the `class_finalize` member of `GTypeInfo`) will be called.
---
--- ---
---
---@param g_iface GObject.TypeInterface # the default vtable structure for an interface, as returned by `g_type_default_interface_ref()`
---@return nil
function GObject.type_default_interface_unref(g_iface) end

--- # function GObject.type_depth()
---
--- Returns the length of the ancestry of the passed in type. This
--- includes the type itself, so that e.g. a fundamental type has depth 1.
---
--- ---
---
---@param type GObject.GType # a `GType`
---@return integer # the depth of `type`
function GObject.type_depth(type) end

--- # function GObject.type_ensure()
---
--- Ensures that the indicated `type` has been registered with the
--- type system, and its `_class_init()` method has been run.
--- 
--- In theory, simply calling the type's `_get_type()` method (or using
--- the corresponding macro) is supposed take care of this. However,
--- `_get_type()` methods are often marked %G_GNUC_CONST for performance
--- reasons, even though this is technically incorrect (since
--- %G_GNUC_CONST requires that the function not have side effects,
--- which `_get_type()` methods do on the first call). As a result, if
--- you write a bare call to a `_get_type()` macro, it may get optimized
--- out by the compiler. Using `g_type_ensure()` guarantees that the
--- type's `_get_type()` method is called.
---
--- ---
---
---@param type GObject.GType # a `GType`
---@return nil
function GObject.type_ensure(type) end

--- # function GObject.type_free_instance()
---
--- Frees an instance of a type, returning it to the instance pool for
--- the type, if there is one.
--- 
--- Like `g_type_create_instance()`, this function is reserved for
--- implementors of fundamental types.
---
--- ---
---
---@param instance GObject.TypeInstance # an instance of a type
---@return nil
function GObject.type_free_instance(instance) end

--- # function GObject.type_from_name()
---
--- Look up the type ID from a given type name, returning 0 if no type
--- has been registered under this name (this is the preferred method
--- to find out by name whether a specific type has been registered
--- yet).
---
--- ---
---
---@param name string # type name to look up
---@return GObject.GType # corresponding type ID or 0
function GObject.type_from_name(name) end

--- # function GObject.type_fundamental()
---
--- Internal function, used to extract the fundamental type ID portion.
--- Use G_TYPE_FUNDAMENTAL() instead.
---
--- ---
---
---@param type_id GObject.GType # valid type ID
---@return GObject.GType # fundamental type ID
function GObject.type_fundamental(type_id) end

--- # function GObject.type_fundamental_next()
---
--- Returns the next free fundamental type id which can be used to
--- register a new fundamental type with `g_type_register_fundamental()`.
--- The returned type ID represents the highest currently registered
--- fundamental type identifier.
---
--- ---
---
---@return GObject.GType # the next available fundamental type ID to be registered, or 0 if the type system ran out of fundamental type IDs
function GObject.type_fundamental_next() end

--- # function GObject.type_get_instance_count()
---
--- Returns the number of instances allocated of the particular type;
--- this is only available if GLib is built with debugging support and
--- the instance_count debug flag is set (by setting the GOBJECT_DEBUG
--- variable to include instance-count).
---
--- ---
---
---@param type GObject.GType # a `GType`
---@return integer # the number of instances allocated of the given type; if instance counts are not available, returns 0.
function GObject.type_get_instance_count(type) end

--- # function GObject.type_get_plugin()
---
--- Returns the `GTypePlugin` structure for `type`.
---
--- ---
---
---@param type GObject.GType # `GType` to retrieve the plugin for
---@return GObject.TypePlugin # the corresponding plugin if `type` is a dynamic type, `nil` otherwise
function GObject.type_get_plugin(type) end

--- # function GObject.type_get_qdata()
---
--- Obtains data which has previously been attached to `type`
--- with `g_type_set_qdata()`.
--- 
--- Note that this does not take subtyping into account; data
--- attached to one type with `g_type_set_qdata()` cannot
--- be retrieved from a subtype using `g_type_get_qdata()`.
---
--- ---
---
---@param type GObject.GType # a `GType`
---@param quark GLib.Quark # a `GQuark` id to identify the data
---@return userdata # the data, or `nil` if no data was found
function GObject.type_get_qdata(type, quark) end

--- # function GObject.type_get_type_registration_serial()
---
--- Returns an opaque serial number that represents the state of the set
--- of registered types. Any time a type is registered this serial changes,
--- which means you can cache information based on type lookups (such as
--- `g_type_from_name()`) and know if the cache is still valid at a later
--- time by comparing the current serial with the one at the type lookup.
---
--- ---
---
---@return integer # An unsigned int, representing the state of type registrations
function GObject.type_get_type_registration_serial() end

--- # function GObject.type_init()
---
--- This function used to initialise the type system.  Since GLib 2.36,
--- the type system is initialised automatically and this function does
--- nothing.
---
--- ---
---
---@return nil
function GObject.type_init() end

--- # function GObject.type_init_with_debug_flags()
---
--- This function used to initialise the type system with debugging
--- flags.  Since GLib 2.36, the type system is initialised automatically
--- and this function does nothing.
--- 
--- If you need to enable debugging features, use the GOBJECT_DEBUG
--- environment variable.
---
--- ---
---
---@param debug_flags GObject.TypeDebugFlags # bitwise combination of `GTypeDebugFlags` values for debugging purposes
---@return nil
function GObject.type_init_with_debug_flags(debug_flags) end

--- # function GObject.type_interface_add_prerequisite()
---
--- Adds `prerequisite_type` to the list of prerequisites of `interface_type`.
--- This means that any type implementing `interface_type` must also implement
--- `prerequisite_type`. Prerequisites can be thought of as an alternative to
--- interface derivation (which GType doesn't support). An interface can have
--- at most one instantiatable prerequisite type.
---
--- ---
---
---@param interface_type GObject.GType # `GType` value of an interface type
---@param prerequisite_type GObject.GType # `GType` value of an interface or instantiatable type
---@return nil
function GObject.type_interface_add_prerequisite(interface_type, prerequisite_type) end

--- # function GObject.type_interface_get_plugin()
---
--- Returns the `GTypePlugin` structure for the dynamic interface
--- `interface_type` which has been added to `instance_type`, or `nil`
--- if `interface_type` has not been added to `instance_type` or does
--- not have a `GTypePlugin` structure. See `g_type_add_interface_dynamic()`.
---
--- ---
---
---@param instance_type GObject.GType # `GType` of an instantiatable type
---@param interface_type GObject.GType # `GType` of an interface type
---@return GObject.TypePlugin # the `GTypePlugin` for the dynamic interface `interface_type` of `instance_type`
function GObject.type_interface_get_plugin(instance_type, interface_type) end

--- # function GObject.type_interface_instantiatable_prerequisite()
---
--- Returns the most specific instantiatable prerequisite of an
--- interface type. If the interface type has no instantiatable
--- prerequisite, %G_TYPE_INVALID is returned.
--- 
--- See `g_type_interface_add_prerequisite()` for more information
--- about prerequisites.
---
--- ---
---
---@param interface_type GObject.GType # an interface type
---@return GObject.GType # the instantiatable prerequisite type or %G_TYPE_INVALID if none
function GObject.type_interface_instantiatable_prerequisite(interface_type) end

--- # function GObject.type_interface_peek()
---
--- Returns the `GTypeInterface` structure of an interface to which the
--- passed in class conforms.
---
--- ---
---
---@param instance_class GObject.TypeClass # a `GTypeClass` structure
---@param iface_type GObject.GType # an interface ID which this class conforms to
---@return GObject.TypeInterface # the `GTypeInterface` structure of `iface_type` if implemented by `instance_class`, `nil` otherwise
function GObject.type_interface_peek(instance_class, iface_type) end

--- # function GObject.type_interface_prerequisites()
---
--- Returns the prerequisites of an interfaces type.
---
--- ---
---
---@param interface_type GObject.GType # an interface type
---@param n_prerequisites? integer # location to return the number of prerequisites, or `nil`
---@return unknown[] # a newly-allocated zero-terminated array of `GType` containing the prerequisites of `interface_type`
function GObject.type_interface_prerequisites(interface_type, n_prerequisites) end

--- # function GObject.type_interfaces()
---
--- Return a newly allocated and 0-terminated array of type IDs, listing
--- the interface types that `type` conforms to.
---
--- ---
---
---@param type GObject.GType # the type to list interface types for
---@param n_interfaces? integer # location to store the length of the returned array, or `nil`
---@return unknown[] # Newly allocated and 0-terminated array of interface types, free with `g_free()`
function GObject.type_interfaces(type, n_interfaces) end

--- # function GObject.type_is_a()
---
--- If `is_a_type` is a derivable type, check whether `type` is a
--- descendant of `is_a_type`. If `is_a_type` is an interface, check
--- whether `type` conforms to it.
---
--- ---
---
---@param type GObject.GType # type to check ancestry for
---@param is_a_type GObject.GType # possible ancestor of `type` or interface that `type` could conform to
---@return (boolean|nil) # `true` if `type` is a `is_a_type`
function GObject.type_is_a(type, is_a_type) end

--- # function GObject.type_name()
---
--- Get the unique name that is assigned to a type ID.  Note that this
--- function (like all other GType API) cannot cope with invalid type
--- IDs. %G_TYPE_INVALID may be passed to this function, as may be any
--- other validly registered type ID, but randomized type IDs should
--- not be passed in and will most likely lead to a crash.
---
--- ---
---
---@param type GObject.GType # type to return name for
---@return string # static type name or `nil`
function GObject.type_name(type) end

--- # function GObject.type_name_from_class()
---
---@param g_class GObject.TypeClass
---@return string
function GObject.type_name_from_class(g_class) end

--- # function GObject.type_name_from_instance()
---
---@param instance GObject.TypeInstance
---@return string
function GObject.type_name_from_instance(instance) end

--- # function GObject.type_next_base()
---
--- Given a `leaf_type` and a `root_type` which is contained in its
--- ancestry, return the type that `root_type` is the immediate parent
--- of. In other words, this function determines the type that is
--- derived directly from `root_type` which is also a base class of
--- `leaf_type`.  Given a root type and a leaf type, this function can
--- be used to determine the types and order in which the leaf type is
--- descended from the root type.
---
--- ---
---
---@param leaf_type GObject.GType # descendant of `root_type` and the type to be returned
---@param root_type GObject.GType # immediate parent of the returned type
---@return GObject.GType # immediate child of `root_type` and ancestor of `leaf_type`
function GObject.type_next_base(leaf_type, root_type) end

--- # function GObject.type_parent()
---
--- Return the direct parent type of the passed in type. If the passed
--- in type has no parent, i.e. is a fundamental type, 0 is returned.
---
--- ---
---
---@param type GObject.GType # the derived type
---@return GObject.GType # the parent type
function GObject.type_parent(type) end

--- # function GObject.type_qname()
---
--- Get the corresponding quark of the type IDs name.
---
--- ---
---
---@param type GObject.GType # type to return quark of type name for
---@return GLib.Quark # the type names quark or 0
function GObject.type_qname(type) end

--- # function GObject.type_query()
---
--- Queries the type system for information about a specific type.
--- This function will fill in a user-provided structure to hold
--- type-specific information. If an invalid `GType` is passed in, the
--- `type` member of the `GTypeQuery` is 0. All members filled into the
--- `GTypeQuery` structure should be considered constant and have to be
--- left untouched.
---
--- ---
---
---@param type GObject.GType # `GType` of a static, classed type
---@param query GObject.TypeQuery # a user provided structure that is filled in with constant values upon success
---@return nil
function GObject.type_query(type, query) end

--- # function GObject.type_register_dynamic()
---
--- Registers `type_name` as the name of a new dynamic type derived from
--- `parent_type`.  The type system uses the information contained in the
--- `GTypePlugin` structure pointed to by `plugin` to manage the type and its
--- instances (if not abstract).  The value of `flags` determines the nature
--- (e.g. abstract or not) of the type.
---
--- ---
---
---@param parent_type GObject.GType # type from which this type will be derived
---@param type_name string # 0-terminated string used as the name of the new type
---@param plugin GObject.TypePlugin # `GTypePlugin` structure to retrieve the `GTypeInfo` from
---@param flags GObject.TypeFlags # bitwise combination of `GTypeFlags` values
---@return GObject.GType # the new type identifier or %G_TYPE_INVALID if registration failed
function GObject.type_register_dynamic(parent_type, type_name, plugin, flags) end

--- # function GObject.type_register_fundamental()
---
--- Registers `type_id` as the predefined identifier and `type_name` as the
--- name of a fundamental type. If `type_id` is already registered, or a
--- type named `type_name` is already registered, the behaviour is undefined.
--- The type system uses the information contained in the `GTypeInfo` structure
--- pointed to by `info` and the `GTypeFundamentalInfo` structure pointed to by
--- `finfo` to manage the type and its instances. The value of `flags` determines
--- additional characteristics of the fundamental type.
---
--- ---
---
---@param type_id GObject.GType # a predefined type identifier
---@param type_name string # 0-terminated string used as the name of the new type
---@param info GObject.TypeInfo # `GTypeInfo` structure for this type
---@param finfo GObject.TypeFundamentalInfo # `GTypeFundamentalInfo` structure for this type
---@param flags GObject.TypeFlags # bitwise combination of `GTypeFlags` values
---@return GObject.GType # the predefined type identifier
function GObject.type_register_fundamental(type_id, type_name, info, finfo, flags) end

--- # function GObject.type_register_static()
---
--- Registers `type_name` as the name of a new static type derived from
--- `parent_type`. The type system uses the information contained in the
--- `GTypeInfo` structure pointed to by `info` to manage the type and its
--- instances (if not abstract). The value of `flags` determines the nature
--- (e.g. abstract or not) of the type.
---
--- ---
---
---@param parent_type GObject.GType # type from which this type will be derived
---@param type_name string # 0-terminated string used as the name of the new type
---@param info GObject.TypeInfo # `GTypeInfo` structure for this type
---@param flags GObject.TypeFlags # bitwise combination of `GTypeFlags` values
---@return GObject.GType # the new type identifier
function GObject.type_register_static(parent_type, type_name, info, flags) end

--- # function GObject.type_set_qdata()
---
--- Attaches arbitrary data to a type.
---
--- ---
---
---@param type GObject.GType # a `GType`
---@param quark GLib.Quark # a `GQuark` id to identify the data
---@param data? userdata # the data
---@return nil
function GObject.type_set_qdata(type, quark, data) end

--- # function GObject.type_test_flags()
---
---@param type GObject.GType
---@param flags integer
---@return (boolean|nil)
function GObject.type_test_flags(type, flags) end

--- # function GObject.value_type_compatible()
---
--- Returns whether a `GValue` of type `src_type` can be copied into
--- a `GValue` of type `dest_type`.
---
--- ---
---
---@param src_type GObject.GType # source type to be copied.
---@param dest_type GObject.GType # destination type for copying.
---@return (boolean|nil) # `true` if `g_value_copy()` is possible with `src_type` and `dest_type`.
function GObject.value_type_compatible(src_type, dest_type) end

--- # function GObject.value_type_transformable()
---
--- Check whether `g_value_transform()` is able to transform values
--- of type `src_type` into values of type `dest_type`. Note that for
--- the types to be transformable, they must be compatible or a
--- transformation function must be registered.
---
--- ---
---
---@param src_type GObject.GType # Source type.
---@param dest_type GObject.GType # Target type.
---@return (boolean|nil) # `true` if the transformation is possible, `false` otherwise.
function GObject.value_type_transformable(src_type, dest_type) end

return GObject

