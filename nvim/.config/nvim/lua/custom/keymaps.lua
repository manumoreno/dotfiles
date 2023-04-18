print('Loading keymaps')

-- local map = vim.api.nvim_set_keymap
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- switch between the last two windows
map("n", "<tab><tab>", "<c-w><c-w>", opts)

-- remove highlighting on escape
vim.cmd('nnoremap <silent> <esc> :nohlsearch<cr>')

-- replace word under cursor, globally, with confirmation
vim.cmd("nnoremap <leader>r :%s/\\<<C-r><C-w>\\>//gc<Left><Left><Left>")
vim.cmd('vnoremap <leader>r y :%s/<C-r>"//gc<Left><Left><Left>')

-- move selected text around
vim.cmd("xnoremap K :move '<-2<CR>gv-gv") -- move up
vim.cmd("xnoremap J :move '>+1<CR>gv-gv") -- move down
map("v", "H", "<gv", opts) -- move left
map("v", "L", ">gv", opts) -- move right

-- configure clipboard (use system clipboard)
-- https://anuragpeshne.github.io/essays/vim/7.html
map("n", "y", '"*y', opts)
map("n", "yy", '"*yy', opts)
map("n", "Y", '"*y$', opts)
map("n", "x", '"*x', opts)
map("n", "dd", '"*dd', opts)
map("n", "D", '"*D', opts)
map("n", "gY", 'gg"+yG', opts) -- copy whole file to system clipboard

-- format text
map("n", "<leader>ff", "<cmd>lua vim.lsp.buf.format({async=true})<CR>", opts)

-- UndoTree toggle
map("n", "<leader>ut", ":UndotreeToggle<cr>", opts)

-- Toggle NeoTree with <leader>nt
map("n", "<leader>nt", ":Neotree toggle<cr>", opts)

-- Toggle tagbar
map("n", "<F7>", ":TagbarToggle<CR>", opts)
