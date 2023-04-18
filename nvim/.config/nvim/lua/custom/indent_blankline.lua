local plugin_name = 'indent_blankline'
local status_ok, indent_blankline = pcall(require, plugin_name)
if not status_ok then
  print("ERROR: " .. plugin_name .. " plugin")
  return
else
  print("Loading " .. plugin_name .. " plugin")
end


indent_blankline.setup {
  char = '┊',
  show_trailing_blankline_indent = true,
}
