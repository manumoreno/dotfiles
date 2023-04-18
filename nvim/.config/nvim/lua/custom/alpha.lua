local plugin_name = 'alpha'
local status_ok, alpha = pcall(require, plugin_name)
if not status_ok then
	print("ERROR: " .. plugin_name .. " plugin")
	return
else
  print("Loading " .. plugin_name .. " plugin")
end


local theme_ok, alpha_theme = pcall(require, "alpha.themes.startify")
if not theme_ok then
	return
end

alpha.setup(alpha_theme.config)
