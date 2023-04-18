local plugin_name = 'notify'
local status_ok, notify = pcall(require, plugin_name)
if not status_ok then
	print("ERROR: " .. plugin_name .. " plugin")
	return
else
  print("Loading " .. plugin_name .. " plugin")
end

vim.notify = notify
