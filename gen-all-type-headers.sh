#!/usr/bin/env bash
cd "${0%/*}" || exit 1

GIR_DIR='/usr/share/gir-1.0'

function strip_version() {
	sed 's/\-[0-9\.]*$//' <<< "${1}"
}

[[ -d "types" ]] || mkdir "types"

core_libs=('GObject-2.0' 'GLib-2.0' 'Gio-2.0' 'Atk-1.0' 'Gtk-3.0' 'Gdk-3.0')
libs=( "${@:-"${core_libs[@]}"}" )

#all_files=( "${@:-"$GIR_DIR"/*.gir}" )
all_files=()
for i in "${libs[@]}"; do
	all_files+=( "${GIR_DIR}/$i" )
done; unset i
all_files_len="${#all_files[@]}"

echo '---@meta lgi

--- # LGI
---
--- Use GObject-based libraries from Lua using GObject Introspection.
---
--- ---
---
---@class lgi' > "types/init.lua"

declare -i i=0
basename=$(basename "${all_files[0]}")
modulename="${basename%.gir}"
prev_modulename_nover=$(strip_version "$modulename")
for file in "${all_files[@]}"; do
	((i++))
	printf '\033[1K\r%d/%d Processing file "%s"...' "$i" "$all_files_len" "$basename"
	basename=$(basename "$file")
	modulename="${basename%.gir}"
	python gen-type-header.py "$modulename" | tee "types/${modulename}.lua" > /dev/null
	if [[ "${PIPESTATUS[0]}" -ne 0 ]]; then
		printf '\nSomething went wrong while processing file %d/%d!\n' "$i" "$all_files_len"
		exit 1
	fi

	modulename_nover=$(strip_version "$modulename")
	if [[ "$prev_modulename_nover" != "$modulename_nover" ]]; then
		echo "---@field ${prev_modulename_nover} ${prev_modulename_nover}" >> "types/init.lua"
	fi
	prev_modulename_nover="$modulename_nover"
done

# shellcheck disable=SC2016
echo 'local lgi = {}

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
' >> "types/init.lua"

echo
echo "All done!"
