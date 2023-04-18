print("Loaing autocommands")

-- remove trailing white spaces
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})


-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  group = highlight_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- use osc52 plugin to copy/paste into/from system clipboard
-- addresses known issue while editing remote files
local function copy()
  if vim.v.event.operator == 'y' and vim.v.event.regname == '+' then
    require('osc52').copy_register('+')
  end
end
vim.api.nvim_create_autocmd('TextYankPost', {callback = copy})

-- Format on save
-- local format_group = vim.api.nvim_create_augroup('LspFormatting', { clear = true })
-- vim.api.nvim_create_autocmd('BufWritePost', {
--   group = format_group,
--   buffer = bufnr,
--   callback = function()
--     vim.lsp.buf.format({ async = false })
--   end
-- })


-- Launch NeoTree on startup
-- local neotree_group = vim.api.nvim_create_augroup("NeotreeStart", { clear = true })
-- vim.api.nvim_create_autocmd("VimEnter", {
--   group = neotree_group,
--   callback = function(args)
--      if vim.fn.expand "%:p" ~= "" then
--     vim.api.nvim_del_autocmd(args.id)
--     vim.cmd "noautocmd NeoTreeShow"
--     vim.schedule(function()
--       vim.cmd "wincmd p"
--     end)
--      end
--   end,
--   desc = "Open Neo-Tree on startup with directory",
-- })
