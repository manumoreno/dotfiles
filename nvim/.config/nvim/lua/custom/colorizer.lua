local plugin = 'colorizer'
local status_ok, colorizer = pcall(require, plugin)
if not status_ok then
	print("ERROR: " .. plugin .. " plugin")
	return
else
  print("Loading " .. plugin .. " plugin")
end

colorizer.setup()
