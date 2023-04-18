require("notebook")
local api = require("notebook.api")
local settings = require("notebook.settings")

local opts = { noremap = true, silent = true }

function _G.define_cell(extmark)
    if extmark == nil then
        local line = vim.api.nvim__buf_stats(0).current_lnum
        extmark, _ = api.current_extmark(line)
    end
    local start_line = extmark[1] + 1
    local end_line = extmark[3].end_row
    pcall(function() vim.fn.MagmaDefineCell(start_line, end_line) end)
end

function _G.define_all_cells()
    local buffer = vim.api.nvim_get_current_buf()
    local extmarks = settings.extmarks[buffer]
    for id, cell in pairs(extmarks) do
        local extmark = vim.api.nvim_buf_get_extmark_by_id(
            0, settings.plugin_namespace, id, { details = true }
        )
        if cell.cell_type == "code" then
            define_cell(extmark)
        end
    end
end

vim.api.nvim_create_autocmd(
    { "BufRead", },
    { pattern = { "*.ipynb" }, command = "MagmaInit" }
)
vim.api.nvim_create_autocmd(
     "User",
    {pattern = {"MagmaInitPost", "NBPostRender"}, callback = _G.define_all_cells }
)


vim.keymap.set('n', '<Leader>ml', '<cmd>MagmaEvaluateLine<CR>', opts)
vim.keymap.set('v', '<Leader>mv', '<cmd>MagmaEvaluateVisual<CR>', opts)
vim.keymap.set('n', '<Leader>mr', '<cmd>MagmaReevaluateCell<CR>', opts)
vim.keymap.set('n', '<Leader>md', '<cmd>MagmaDelete<CR>', opts)
vim.keymap.set('n', '<Leader>ms', '<cmd>MagmaShowOutput<CR>', opts)

vim.g.magma_automatically_open_output = false
-- vim.g.magma_image_provider = "ueberzug"
