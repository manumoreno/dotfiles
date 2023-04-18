local plugin_name = 'wilder'
local status_ok, wilder = pcall(require, plugin_name)
if not status_ok then
	print("ERROR: " .. plugin_name .. " plugin")
	return
else
  print("Loading " .. plugin_name .. " plugin")
end


wilder.setup({ modes = { ':', '/', '?' } })

wilder.set_option('pipeline', {
  wilder.branch(
    wilder.cmdline_pipeline({
      fuzzy = 1,
      set_pcre2_pattern = 1,
    }),
    wilder.python_search_pipeline({
      pattern = 'fuzzy',
    })
  ),
})

local gradient = {
  '#f4468f', '#fd4a85', '#ff507a', '#ff566f', '#ff5e63',
  '#ff6658', '#ff704e', '#ff7a45', '#ff843d', '#ff9036',
  '#f89b31', '#efa72f', '#e6b32e', '#dcbe30', '#d2c934',
  '#c8d43a', '#bfde43', '#b6e84e', '#aff05b'
}

for i, fg in ipairs(gradient) do
  gradient[i] = wilder.make_hl('WilderGradient' .. i, 'Pmenu', { { a = 1 }, { a = 1 }, { foreground = fg } })
end

local gradient_highlighters = wilder.highlighter_with_gradient({
  wilder.lua_fzy_highlighter(),
})

-- local other_highlighters = {
--   wilder.pcre2_highlighter(),
--   wilder.lua_fzy_highlighter(),
--   wilder.basic_highlighter(),
-- }

local popupmenu_renderer = wilder.popupmenu_renderer(
  wilder.popupmenu_palette_theme({
    --     -- 'single', 'double', 'rounded' or 'solid'
    --     -- can also be a list of 8 characters, see :h wilder#popupmenu_palette_theme() for more details
    border = 'single',
    max_width = '60%', -- minimum height of the popupmenu, can also be a number
    prompt_position = 'bottom', -- 'top' or 'bottom' to set the location of the prompt
    reverse = 0,                -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
    pumblend = 10,
    highlighter = gradient_highlighters,
    highlights = {
      gradient = gradient,
    },
    left = {
      ' ',
      wilder.popupmenu_devicons(),
      wilder.popupmenu_buffer_flags({
        flags = ' a + ',
        icons = { ['+'] = '', a = '', h = '' },
      }),
    },
    right = {
      ' ',
      wilder.popupmenu_scrollbar(),
    },
  })
)

local wildmenu_renderer = wilder.wildmenu_renderer({
    highlighter = gradient_highlighters,
    highlights = {
      gradient = gradient,
    },
  separator = ' · ',
  left = { ' ', wilder.wildmenu_spinner(), ' ' },
  right = { ' ', wilder.wildmenu_index() },
  reverse = 0
})

wilder.set_option('renderer', wilder.renderer_mux({
  [':'] = popupmenu_renderer,
  ['/'] = wildmenu_renderer,
  substitute = wildmenu_renderer,
}))
