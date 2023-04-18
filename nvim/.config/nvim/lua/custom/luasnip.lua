local plugin_name = 'luasnip'
local status_ok, luasnip = pcall(require, plugin_name)
if not status_ok then
	print("ERROR: " .. plugin_name .. " plugin")
	return
else
  print("Loading " .. plugin_name .. " plugin")
end

-- some shorthands...
local snip = luasnip.snippet
local node = luasnip.snippet_node
local text = luasnip.text_node
local insert = luasnip.insert_node
local func = luasnip.function_node
local choice = luasnip.choice_node
local dynamicn = luasnip.dynamic_node

local date = function() return {os.date('%Y-%m-%d')} end

luasnip.add_snippets(nil, {
    all = {
        snip({
            trig = "date",
            namr = "Date",
            dscr = "Date in the form of YYYY-MM-DD",
        }, {
            func(date, {}),
        }),
    },
})
