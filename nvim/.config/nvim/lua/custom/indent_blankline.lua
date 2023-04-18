local plugin_name = 'indent_blankline'
local status_ok, indent_blankline = pcall(require, plugin_name)
if not status_ok then
  print("ERROR: " .. plugin_name .. " plugin")
  return
else
  print("Loading " .. plugin_name .. " plugin")
end


indent_blankline.setup {
  -- context is off by default, use this to turn it on
  show_current_context = true,
  show_current_context_start = true,
  char = '┊',
  show_trailing_blankline_indent = true,
}
