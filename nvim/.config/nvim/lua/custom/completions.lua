local plugin_name = 'cmp'
local status_ok, cmp = pcall(require, plugin_name)
if not status_ok then
  print("ERROR: " .. plugin_name .. " plugin")
  return
else
  print("Loading " .. plugin_name .. " plugin")
end


vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'noselect' }
local select_opts = { behavior = cmp.SelectBehavior.Select }
local luasnip = require('luasnip')
local compare = require("cmp.config.compare")
local ts_utils = require('nvim-treesitter.ts_utils')

vim.opt.wildignore = {
  '*.o',
  '*.obj,*~',
  '*.git*',
  '*.meteor*',
  '*vim/backups*',
  '*sass-cache*',
  '*mypy_cache*',
  '*__pycache__*',
  '*cache*',
  '*logs*',
  '*node_modules*',
  '**/node_modules/**',
  '*DS_Store*',
  '*.gem',
  'log/**',
  'tmp/**',
}

vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "Aqua" })
vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "Gray" })
vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "LightCyan" })
vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = "LightGreen" })
vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = "Beige" })
vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "Blue" })
vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "LightMagenta" })
vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "Green" })
vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = "Orange" })
vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "Brown" })
vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "Red" })
vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = "LightBlue" })
vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = "LightRed" })

local lsp_symbols = {
  Text = "   (Text) ",
  Method = "   (Method)",
  Function = "   (Function)",
  Constructor = "   (Constructor)",
  Field = " ﴲ  (Field)",
  Variable = "[] (Variable)",
  Class = "   (Class)",
  Interface = " ﰮ  (Interface)",
  Module = "   (Module)",
  Property = " 襁 (Property)",
  Unit = "   (Unit)",
  Value = "   (Value)",
  Enum = " 練 (Enum)",
  Keyword = "   (Keyword)",
  Snippet = "   (Snippet)",
  Color = "   (Color)",
  File = "   (File)",
  Reference = "   (Reference)",
  Folder = "   (Folder)",
  EnumMember = "   (EnumMember)",
  Constant = " ﲀ  (Constant)",
  Struct = " ﳤ  (Struct)",
  Event = "   (Event)",
  Operator = "   (Operator)",
  TypeParameter = "   (TypeParameter)",
}

cmp.setup({
  -- view = {
  --   'custom' -- 'native', 'custom' or 'wildmenu'
  -- },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  sorting = {
    comparators = {
      compare.exact,
      compare.recently_used,
      compare.kind,
    }
  },
  sources = {
    -- { name = 'nvim_lsp', keyword_length = 1 },
    {
      name = "nvim_lsp",
      keyword_length = 1,
      -- entry_filter = function(entry, context)
      --   local kind = entry:get_kind()
      --   local node = ts_utils.get_node_at_cursor():type()

      --   if node == "arguments" then
      --     if kind == 6 then
      --       return true
      --     else
      --       return false
      --     end
      --   end
      --   return true
      -- end,
    },

    { name = "nvim_lua",                keyword_length = 1 },
    { name = 'path',                    keyword_length = 2 },
    { name = 'buffer',                  keyword_length = 3 },
    { name = 'nvim_lsp_signature_help', keyword_length = 2 },

    --{ name = 'luasnip', keyword_length = 2 },
    { name = "spell" },
    -- { name = "tags" },
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered()
  },
  formatting = {
    fields = { 'abbr', 'kind', 'menu' },
    format = function(entry, item)
      item.kind = lsp_symbols[item.kind] or "[Unknown]"
      item.menu = ({
        nvim_lsp = "[lsp]",
        nvim_lua = "[lua]",
        path = "[path]",
        buffer = "[buffer]",
        nvim_lsp_signature_help = "[signat]",
        ['vim-dadbod-completion'] = '[sql]',
        -- luasnip = "[luasnip]",
        -- treesitter = "[treesitter]",
        -- zsh = "[zsh]",
        look = "[spell]",
        -- cmdline = "[vim cmd]",
        -- calc = "[calc]",
        -- omni = "[omni]",
        -- tags = "[tag]"
      })[entry.source.name]

      item.abbr = item.abbr:match("[^(]+")
      -- local source = entry.source.name
      -- if source == "nvim_lsp" or source == "nvim_lua" then
      --   item.dup = 0
      -- end

      return item
    end,
  },
  mapping = {
    ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
    ['<Down>'] = cmp.mapping.select_next_item(select_opts),
    ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
    ['<C-n>'] = cmp.mapping.select_next_item(select_opts),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.abort(),
    -- ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-f>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<C-b>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      local col = vim.fn.col('.') - 1

      if cmp.visible() then
        cmp.select_next_item(select_opts)
      elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        fallback()
      else
        cmp.complete()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item(select_opts)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
})


-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- dadbod plugin
local autocomplete_group = vim.api.nvim_create_augroup('vimrc_autocompletion', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'sql', 'mysql', 'plsql' },
  callback = function()
    cmp.setup.buffer({ sources = { { name = 'vim-dadbod-completion' } } })
  end,
  group = autocomplete_group,
})
