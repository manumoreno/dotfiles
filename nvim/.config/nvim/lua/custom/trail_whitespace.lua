local plugin_name = 'trailing-whitespace'
local status_ok, twhitespace = pcall(require, plugin_name)
if not status_ok then
	print("ERROR: " .. plugin_name .. " plugin")
	return
else
  print("Loading " .. plugin_name .. " plugin")
end


twhitespace.setup {
  patterns = { '\\s\\+$' },
  palette = { markdown = 'RosyBrown' },
  default_color = 'PaleVioletRed',
}
