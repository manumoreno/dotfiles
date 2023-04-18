local plugin_name = 'lualine'
local status_ok, lualine = pcall(require, plugin_name)
if not status_ok then
	print("ERROR: " .. plugin_name .. " plugin")
	return
else
  print("Loading " .. plugin_name .. " plugin")
end

local icons = require("custom.icons")

local components = {
  filename = {
    "filename",
  },
  branch = {
    "branch",
    icons_enabled = true,
    icon = "",
  },
  diff = {
    "diff",
    colored = true,
    diff_color = {
      added = { fg = "#99c794" },
      modified = { fg = "#5bb7b8" },
      removed = { fg = "#ec5f67" },
    },
    symbols = { added = icons.git.Add .. " ", modified = icons.git.Mod .. " ", removed = icons.git.Remove .. " " }, -- changes diff symbols
  },
  diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = { error = " ", warn = " ", info = " ", hint = " " },
  },
  treesitter = {
    function()
      local b = vim.api.nvim_get_current_buf()
      if next(vim.treesitter.highlighter.active[b]) then
        return ""
      end
      return ""
    end,
  },
  location = { "location" },
  encoding = {
    "o:encoding",
    fmt = string.upper,
  },
  filetype = { "filetype" },
}

lualine.setup({
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = " • ", right = " • " },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline", "toggleterm" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", components.filename },
    lualine_c = { components.diff, components.diagnostics },
    lualine_x = { components.treesitter, components.encoding, "fileformat", components.filetype },
    lualine_y = { "progress" },
    lualine_z = { components.location },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = { components.filename },
    lualine_c = {},
    lualine_x = { components.location },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = { "quickfix" },
})
