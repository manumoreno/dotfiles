local plugin_name = 'telescope'
local status_ok, telescope = pcall(require, plugin_name)
if not status_ok then
	print("ERROR: " .. plugin_name .. " plugin")
	return
else
  print("Loading " .. plugin_name .. " plugin")
end


local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

telescope.setup({
	defaults = {
		mappings = {
			i = {
				['<C-u>'] = false,
				['<C-d>'] = false,
				["<C-t>"] = trouble.open_with_trouble,
			},
			n = { ["<C-t>"] = trouble.open_with_trouble },
		},
        actions = actions,
		theme = "ivy",
		border = true,
		layout_strategy = "bottom_pane",
		layout_config = {
			height = 0.50,
			width = 1.00,
		},
		path_display = { "shorten" },
		sorting_strategy = "ascending",
	},
})

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
