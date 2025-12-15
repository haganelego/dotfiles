local wezterm = require("wezterm")
package.path = package.path .. ";" .. wezterm.home_dir .. "/.config/wezterm/?.lua"
local M = {}

M.file_exists = function(name)
	local full_path = package.searchpath(name, package.path)
	if not full_path then
		return false
	end
	local f = io.open(full_path, "r")
	if f then
		io.close(f)
		return true
	else
		return false
	end
end

M.table_contains = function(table, element)
	for _, value in pairs(table) do
		if value == element then
			return true
		end
	end
	return false
end

return M
