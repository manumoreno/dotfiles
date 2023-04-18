-- [[ Setting options ]]

print('Loading options')

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader                 = ' '
vim.g.maplocalleader            = ' '
-- NEVER use netrw (default file manager)
vim.g.loaded_netrw              = 0
vim.g.loaded_netrwPlugin        = 0
vim.g.loaded_perl_provider      = 0

vim.g.border_style              = "rounded"
vim.g.markdown_fenced_languages = { "bash=sh", "python=py", }
vim.g.session_autoload          = "no" -- autoload session?
vim.g.session_autosave          = "no" -- autosave session?
vim.g.python3_host_prog         = os.getenv 'PYTHON_HOME' .. '/bin/python'

local options                   = {
  path = { ".", "**" },
  -- wildignore = { "*.pyc" },                                    -- this is set in completion.lua
  mouse = "a",                                                    --enable the mouse
  backup = false,                                                 --creates a backup file
  clipboard = { "unnamed", "unnamedplus" },                       --don't use clipboard
  cmdheight = 1,                                                  --more space in cmd line for displaying messages
  inccommand = "split",                                           --show preview of changes
  complete = ".,w,b,u,t,i",                                       --where to look for options (buffers, files, tags)
  completeopt = { "menu", "noselect", "preview" },
  conceallevel = 0,                                               --so that `` is visible in markdown files
  cursorline = true,                                              --highlight the current line
  expandtab = true,                                               --convert tabs to spaces
  fileencoding = "utf-8",                                         --the encoding written to a file
  foldexpr = "nvim_treesitter#foldexpr()",                        --set to "nvim_treesitter#foldexpr()"
  foldmethod = "manual",                                          --folding set to "expr" for treesitter based folding
  hidden = true,                                                  --required to keep multiple buffers and open multiple buffers
  hlsearch = true,                                                --highlight all matches on previous search pattern
  incsearch = true,                                               --set highlight on search
  ignorecase = true,                                              --ignore case in search patterns
  list = false,                                                   --show hidden symbols
  listchars = "tab:│.,trail:·,eol:¬,nbsp:+,precedes:<,extends:>", --hidden symbols
  fillchars = "vert:│",                                           --window vertical split symbol
  matchpairs = vim.opt.matchpairs + "<:>",                        --augment matchpairs
  showtabline = 2,                                                --always show tabs
  pumheight = 15,                                                 --pop up menu height
  scrolloff = 4,                                                  --is one of my fav
  sidescrolloff = 4,
  shiftwidth = 2,                                                 --the number of spaces inserted for each indentation
  showmode = true,                                                --we don't need to see things like -- INSERT -- anymore
  number = true,                                                  --set numbered lines
  relativenumber = true,                                          --set relative numbered lines
  signcolumn = "yes:1",
  numberwidth = 4,
  smartindent = true,                                             --make indenting smarter again
  breakindent = true,                                             --enable break indent
  spell = true,                                                   --disable spell checking
  spelllang = "en_us",                                            --language for spell checking
  spellfile = "en.utf-8.add",                                     --to save custom words
  splitbelow = true,                                              --force all horizontal splits to go below current window
  splitright = true,                                              --force all vertical splits to go to the right of current window
  swapfile = false,                                               --creates a swapfile
  tabstop = 4,                                                    --insert 2 spaces for a tab
  termguicolors = true,                                           --set term gui colors (most terminals support this)
  guifont = "FiraCode Nerd Font Mono:h14",                        -- set font
  title = true,                                                   --set the title of window to the value of the title string
  titlestring = "%<%F - nvim",                                    --what the title of the window will be set to
  shada = "!,'1000,f1,<50,s10,h",                                 -- save 1000 entries
  undofile = true,                                                --enable persistent undo
  undodir = vim.fn.stdpath("state") .. "/undo",                   -- where to save the undo files
  timeoutlen = 500,                                               --timeout length
  updatetime = 100,                                               --faster completion
  wrap = true,                                                    --display lines as one long line
  showbreak = "...",                                              --indicate that line continues
  writebackup = false,                                            -- if true, only allow one client to edit file
  laststatus = 2,                                                 --hide statusline
  backspace = { "indent", "eol", "start" },                       --hidden symbols
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd [[set complete+=kspell]]
-- vim.cmd[[set iskeyword+=-]]            -- treat hyphenated words as one
