from __future__ import annotations
import io
import re
import sys, os
import xml.etree.ElementTree as ET
from itertools import islice
from xml.parsers import expat
from dataclasses import dataclass

log = ""

target = re.search(r"(\w+)\-([\d\.]+)", sys.argv[1])

if target is None:
	sys.exit(1)

target_namespace = target[1] # "GLib"
target_version   = target[2] # "2.0"

xml = ""
with open(f"/usr/share/gir-1.0/{sys.argv[1]}.gir", "r") as f:
	xml = f.read()

it = ET.iterparse(io.StringIO(xml))
try:
	for _, el in it:
		if '}' in el.tag:
			el.tag = el.tag.split('}', 1)[1]  # strip all namespaces
		for at in list(el.attrib.keys()): # strip namespaces of attributes too
			if '}' in at:
				newat = at.split('}', 1)[1]
				el.attrib[newat] = el.attrib[at]
				del el.attrib[at]
except:
	sys.exit(0)
root = it.root # type: ignore

namespace = root.find("namespace")

reserved_lua_keywords = {
	"and",
	"break",
	"do",
	"else",
	"elseif",
	"end",
	"false",
	"for",
	"function",
	"goto",
	"if",
	"in",
	"local",
	"nil",
	"not",
	"or",
	"repeat",
	"return",
	"then",
	"true",
	"until",
	"while",
}

def make_identifier_name_safe(name):
	if name in reserved_lua_keywords:
		return name + "__"

	if re.match(r"^\d", name):
		return "__" + name

	return name

lua_types_map = {
	# "void": "any",
	# "char*": "string",
	# "gchar*": "string",
	"none":     "nil",
	"None":     "nil",
	"any":      "any",
	"unknown":  "unknown",
	"gboolean": "(boolean|nil)",
	"short":    "integer",
	"int":      "integer",
	"long":     "integer",
	"ushort":   "integer",
	"uint":     "integer",
	"ulong":    "integer",
	"long double": "number",
	"gint":     "integer",
	"guint":    "integer",
	"gshort":   "integer",
	"gushort":  "integer",
	"glong":    "integer",
	"gulong":   "integer",
	"gint8":    "integer",
	"guint8":   "integer",
	"gint16":   "integer",
	"guint16":  "integer",
	"gint32":   "integer",
	"guint32":  "integer",
	"gint64":   "integer",
	"guint64":  "integer",
	"gunichar": "integer",
	"gsize":    "integer",
	"gssize":   "integer",
	"goffset":  "integer",
	"gchar":    "integer",
	"guchar":   "integer",
	"gfloat":   "number",
	"gdouble":  "number",
	"gdouble":  "number",
	"gchar*":   "string",
	"gstring":  "string",
	"utf8":     "string",
	"filename": "string",
	#"ghash":    "table",
	#"glist":    "table<integer, any>",
	#"gslist":   "table<integer, any>",
	"gpointer":       "userdata",
	"gconstpointer":  "userdata",
}

def get_type_for_namespace(t: str, ns: str=target_namespace) -> str:
	if t is None:
		return "unknown"

	if from_dict := lua_types_map.get(t):
		return from_dict

	if t.find(".") == -1:
		return f"{ns}.{t}"
	elif ns is None:
		return f"GLib.{t}"
	else:
		return str(t)

def get_type_from_elem(elem, ns: str=target_namespace) -> str:
	if elem is None:
		return "unknown"

	#if isinstance(elem, str):
	#	return elem

	array_elem = elem.find("array")
	if array_elem is not None:
		return get_type_from_elem(array_elem.find("type"), ns) + "[]" # lua_types_map.get(typename, f"{target_namespace}.{typename}") + "[]"

	type_elem = elem.find("type")
	if type_elem is None:
		return "unknown"

	name = type_elem.attrib["name"]

	if name in ("GLib.Array", "GLib.List", "GLib.SList"):
		return get_type_from_elem(type_elem, ns) + "[]"

	if name in ("GLib.HashTable"):
		kv = type_elem.findall("type")
		key_type   = kv[0].attrib["name"] if len(kv) >= 1 else None
		value_type = kv[1].attrib["name"] if len(kv) >= 2 else None
		#key_type_name   = key_type.attrib["name"]
		#value_type_name = value_type.attrib["name"]
		return f"table<{get_type_for_namespace(key_type, ns)}, {get_type_for_namespace(value_type, ns)}>"

	#global log
	#log += f"{name!r} -> {ret!r}\n"
	return get_type_for_namespace(name, ns)

def format_doc(doc: str) -> str:
	if not doc:
		return ""

	doc = re.sub(r"%NULL", r"`nil`", doc)
	doc = re.sub(r"%TRUE", r"`true`", doc)
	doc = re.sub(r"%FALSE", r"`false`", doc)

	doc = re.sub(r"(@|#)([a-zA-Z_][a-zA-Z0-9_]*)", r"`\2`", doc)
	doc = re.sub(r"([a-z_]+\(\))", r"`\1`", doc)

	return doc.strip()


def format_long_doc(doc: str) -> str:
	if not doc:
		return ""

	# |[<!-- language="C" -->
	# ...
	# ]|
	doc = re.sub(r'''\|\[<!-- language="(.+?)" -->''', lambda matches: rf"```{matches[1].lower()}", doc)
	doc = doc.replace(r"|[", r"```c") # We just assume that the code examples are probably goind to be written in C unless stated otherwise
	doc = doc.replace(r"]|", r"```")

	doc = doc.replace("\n", "\n--- ")

	return "--- " + format_doc(doc)


fold_spaces_pattern = re.compile(r"\s+")
def fold_spaces(s: str) -> str:
	return fold_spaces_pattern.sub(" ", s)


def format_inline_doc(doc: str) -> str:
	if not doc:
		return ""

	doc = fold_spaces(doc)

	return " # " + format_doc(doc)


def get_doc_from_element(elem):
	if elem is None:
		return ""

	raw_doc = elem.find("doc")

	if raw_doc is None:
		return ""

	doc = raw_doc.text

	if not doc:
		return ""

	return doc


def format_hints_as_table(fn: Function) -> str:
	result = ""

	#

	return result

@dataclass
class Function:
	doc: str
	name: str
	parameters: list[FunctionParameter]
	return_value: ReturnValue|None
	namespace: str|None
	is_static: bool|None = True

	def __str__(self):
		if not self.is_static:
			self.parameters[0].name = "self"
		prefix = f"{self.namespace}{'.' if self.is_static else ':'}" if self.namespace else ""
		arglist = ", ".join(param.name for param in islice(self.parameters, (0 if self.is_static else 1), None))
		#prefix = f"{self.namespace}{'.' if self.is_static else ':'}" if self.namespace else ""

		return (
			(f"--- # {'function' if self.is_static else 'method'} {prefix}{self.name}()\n---\n") +
			(f"{format_long_doc(self.doc)}\n---\n--- ---\n---\n" if self.doc else "") +
			#format_hints_as_table(self) +
			(("\n".join(str(param) for param in self.parameters) + "\n") if self.parameters else "") +
			(str(self.return_value) + "\n" if self.return_value is not None else "") +
			f"function {prefix}{make_identifier_name_safe(self.name)}({arglist}) end"
		)

@dataclass
class ReturnValue:
	doc: str
	type: str

	def __str__(self):
		return f"---@return {self.type}" + format_inline_doc(self.doc)

def create_return_value_from_elem(elem):
	returninfo = elem.find("return-value")
	#returninfo_type = returninfo.find("type")
	returninfo_typename = get_type_from_elem(returninfo) # returninfo_type.attrib["name"] if returninfo_type is not None else "unknown"
	return_doc = returninfo.find("doc")

	doc = ""

	if return_doc is not None:
		return_doc = return_doc.text
		if return_doc is not None:
			doc = return_doc

	return ReturnValue(
		doc=doc,
		type=returninfo_typename # lua_types_map.get(returninfo_typename, f"{target_namespace}.{returninfo_typename}")
	)

@dataclass
class FunctionParameter:
	doc: str
	name: str
	nilable: bool
	type: str

	def __str__(self):
		return f"---@param {self.name}{'?' if self.nilable else ''} {self.type}" + format_inline_doc(self.doc)

def get_doc(elem):
	doc = elem.find("doc")

	if doc is None:
		return ""

	doc_text = doc.text	

	if doc_text is None:
		return ""
	
	return doc_text

def process_static_function(elem):
	if elem.attrib.get("shadowed-by"):
		return

	params = []

	if elem is None:
		# print(f"\x1b[1;31m{i} is None\x1b[0m")
		return

	parameters = elem.find("parameters")

	if parameters is not None:
		for parameter in parameters:
			paramname = parameter.attrib["name"]
			paramtype = get_type_from_elem(parameter)

			params.append(FunctionParameter(
				doc=get_doc(parameter),
				name=make_identifier_name_safe(paramname),
				nilable=((parameter.attrib.get("nullable") == "1") or (parameter.attrib.get("allow-none") == "1")),
				type=paramtype
			))

	return_value = create_return_value_from_elem(elem)	

	return Function(
		doc=get_doc_from_element(elem),
		name=elem.attrib.get("shadows") or elem.attrib["name"],
		parameters=params,
		return_value=return_value,
		namespace=target_namespace,
		is_static=True
	)

@dataclass
class Record:
	name: str
	fields: list # Non-callable fields only
	doc: str|None
	type: str # Either "record" or "class"
	construct_on_call: bool # True if the record has a constructor with the name `new`
	functions: list # Static functions
	methods: list # Instance methods
	parents: list # Super classes and implemented interfaces
	namespace: str|None

	def __str__(self) -> str:
		prefix = f"{self.namespace}." if self.namespace is not None else ""
		full_name = prefix + self.name

		return (
			(f"--- # {self.type} {full_name}\n---\n") +
			(f"{format_long_doc(self.doc)}\n---\n--- ---\n---\n" if self.doc else "") +
			(f"---@class {full_name}" + (" : " + ", ".join(self.parents) if self.parents else "")) + "\n" +
			# ((" : " + ", ".join([str(parent) for parent in self.parents if parent is not None])) if self.parents else "") +
			("\n".join("---@field " + str(field) for field in self.fields if field is not None) + ("\n" if self.fields else "")) +
			((f"---@operator call: {full_name}\n") if self.construct_on_call else "") +
			(f"{full_name} = {{}}") +
			(("\n\n" + "\n\n".join([str(method) for method in self.methods if method is not None])) if self.methods else "") +
			(("\n\n" + "\n\n".join([str(function) for function in self.functions if function is not None])) if self.functions else "")
		)

@dataclass
class RecordField:
	name: str
	type: str
	doc: str

	@classmethod
	def from_elem(cls, elem):
		name = make_identifier_name_safe(elem.attrib["name"])
		type = get_type_from_elem(elem)
		doc  = elem.find("doc")
		if doc is not None:
			doc = doc.text

		return cls(
			name=name,
			type=type,
			doc=doc
		)

	def __str__(self) -> str:
		return (
			f"{self.name} {self.type}" + format_inline_doc(self.doc)
		)

@dataclass
class RecordMethod(Function):
	is_static: bool

	@classmethod
	def from_elem(cls, elem, namespace: str=target_namespace, is_static: bool=True):
		if elem.attrib.get("introspectable") == "0":
			return

		if elem.attrib.get("shadowed-by"):
			return

		params = []

		if elem is None:
			# print(f"\x1b[1;31m{i} is None\x1b[0m")
			return

		parameters = elem.find("parameters")

		if parameters is not None:
			for parameter in parameters:
				paramname = parameter.attrib["name"]
				paramtype = get_type_from_elem(parameter)

				params.append(FunctionParameter(
					doc=get_doc(parameter),
					name=make_identifier_name_safe(paramname),
					nilable=((parameter.attrib.get("nullable") == "1") or (parameter.attrib.get("allow-none") == "1")),
					type=paramtype
				))

		return_value = create_return_value_from_elem(elem)	

		return cls(
			doc=get_doc_from_element(elem),
			name=make_identifier_name_safe(elem.attrib.get("shadows") or elem.attrib.get("name")),
			parameters=params,
			return_value=return_value,
			namespace=namespace,
			is_static=is_static,
		)

def process_record(elem, elem_type: str="record"):
	record_name = elem.attrib["name"]
	record_doc  = elem.find("doc")
	if record_doc is not None:
		record_doc = record_doc.text

	record_fields = []
	for field in elem.findall("field"):
		if field.attrib.get("introspectable") == "0":
			continue

		cb = field.find("callback")
		if cb is not None:
			f = process_callback(cb, minimal=True)
			# print(f"# Found callback field -> {f = !r}")
			record_fields.append(f)
			continue

		f = RecordField.from_elem(field)
		if f and f.name:
			record_fields.append(f)

	record_functions = []
	for field in elem.findall("function"):
		if field.attrib.get("introspectable") == "0":
			continue

		f = RecordMethod.from_elem(field, namespace=f"{target_namespace}.{record_name}", is_static=True)
		if f and f.name:
			record_functions.append(f)

	record_constructors = []
	for field in elem.findall("constructor"):
		if field.attrib.get("introspectable") == "0":
			continue

		f = RecordMethod.from_elem(field, namespace=f"{target_namespace}.{record_name}", is_static=True)
		if f and f.name:
			record_constructors.append(f)

	record_methods = []
	for field in elem.findall("method"):
		if field.attrib.get("introspectable") == "0":
			continue

		f = RecordMethod.from_elem(field, namespace=f"{target_namespace}.{record_name}", is_static=False)
		if f and f.name:
			record_methods.append(f)

	construct_on_call = False
	all_funs = record_functions + record_constructors
	for fun in all_funs:
		if fun.name == "new":
			construct_on_call = True
			break

	record_parents = []

	parent = elem.attrib.get("parent")
	if parent:
		record_parents.append(parent)

	interfaces = elem.findall("implements")
	if interfaces is not None:
		for interface in interfaces:
			interface_name = interface.attrib["name"]
			record_parents.append(f"{target_namespace}.{interface_name}")

	processed_parents = []
	for parent in record_parents:
		if parent.find(".") == -1:
			processed_parents.append(f"{target_namespace}.{parent}")
		else:
			processed_parents.append(parent)

	return Record(
		name=record_name,
		fields=record_fields,
		doc=record_doc,
		type=elem_type,
		construct_on_call=construct_on_call,
		functions=all_funs,
		methods=record_methods,
		parents=processed_parents,
		namespace=target_namespace,
	)

def process_callback(elem, minimal: bool=False):
	if elem is None:
		return ""

	cbname = elem.attrib["name"]

	params = []

	if elem is None:
		return

	parameters = elem.find("parameters")

	if parameters is not None:
		for parameter in parameters:
			paramname = parameter.attrib["name"]
			paramtype = get_type_from_elem(parameter)

			params.append(f"{paramname}: {paramtype}")

	return_elem = elem.find("return-value")
	return_type = get_type_from_elem(return_elem)
	return_suffix = ""
	if return_type:
		return_suffix = f": {return_type}"

	if minimal:
		return f"{cbname} fun({', '.join(params)}){return_suffix}"
	
	return f"---@alias {target_namespace}.{cbname} fun({', '.join(params)}){return_suffix}"

def process_enumeration(elem):
	if elem is None:
		return ""

	enumname = elem.attrib["name"]

	return (
		f"---@enum {target_namespace}.{enumname}\n" +
		f"{target_namespace}.{enumname} = {{}}"
	)

def process_alias(elem):
	if elem is None:
		return ""

	aliasname = elem.attrib["name"]

	aliastype = elem.find("type").attrib["name"]
	aliastype = get_type_for_namespace(aliastype, namespace)

	return f"---@alias {target_namespace}.{aliasname} {aliastype}"

module_str = f"""---@meta {target_namespace}

---@class {target_namespace}
local {target_namespace} = {{}}

"""

module_children = []

for elem in namespace:
	if elem is None:
		continue

	if elem.attrib.get("introspectable") == "0":
		continue

	elem_type = elem.tag

	#if elem.attrib["name"] != "AppInfo":
	#	continue

	match elem_type:
		case "alias":
			alias = process_alias(elem)
			module_children.append(alias)
		case "enumeration"|"bitfield":
			enum = process_enumeration(elem)
			module_children.append(enum)
		case "callback":
			cb = process_callback(elem)
			module_children.append(cb)
		case "function":
			fun = process_static_function(elem)
			module_children.append(fun)
		case "record"|"class"|"union"|"interface":
			record = process_record(elem, elem_type)
			module_children.append(record)

module_str += "\n\n".join([str(child) for child in module_children if child is not None]) + f"\n\nreturn {target_namespace}\n"

print(module_str)

#sys.stderr.write("\n\n----------------------------------------------------\n\n")
#sys.stderr.write(log)
#sys.stderr.write("\n")
