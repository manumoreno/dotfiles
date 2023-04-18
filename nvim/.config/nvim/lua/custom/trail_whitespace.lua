local plugin_name = 'trailing-whitespace'
local status_ok, trailing_whitespace = pcall(require, plugin_name)
if not status_ok then
	print("ERROR: " .. plugin_name .. " plugin")
	return
else
  print("Loading " .. plugin_name .. " plugin")
end


trailing_whitespace.setup {
  patterns = { '\\s\\+$' },
  palette = { markdown = 'RosyBrown' },
  default_color = 'PaleVioletRed',
}
