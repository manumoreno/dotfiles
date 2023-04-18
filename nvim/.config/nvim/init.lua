-- core plugins
require("custom.options")
require("custom.keymaps")
require("custom.packer")
require("custom.lsp_config")
require("custom.completions")
require("custom.treesitter")
require("custom.bufferline")    -- functional. Has a separatator issue; due to terminal support?
require("custom.trouble")
require("custom.noice")         -- a bit noisy; tweak!

-- non critical plugins
require("custom.dap")           -- works but may need further tweaks
require("custom.catppuccin")
require("custom.lualine")
require("custom.neotree")
require("custom.gitsigns")
require("custom.diagnostics")
require("custom.autocommands")  -- osc52 plugin stuff needs cleanup
require("custom.alpha")
require("custom.toggleterm")
require("custom.osc52")         -- works great; especially over ssh sessions in tmux; needs cleanup
require("custom.colorizer")
require("custom.indent_blankline")
require("custom.trail_whitespace")
require("custom.neorg")         -- mappings not in place yet; in progress
-- require("custom.notebook")   -- along with magma plugin
--require("custom.wilder")      -- superseded by noice plugin and/or cmp
