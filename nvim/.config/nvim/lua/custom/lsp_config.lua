---
-- Configure LSP servers
---

local plugin_name = 'lsp-zero'
local status_ok1, lsp_zero = pcall(require, plugin_name)
if not status_ok1 then
	print("ERROR: " .. plugin_name .. " plugin")
	return
else
  print("Loading " .. plugin_name .. " plugin")
end

plugin_name = 'mason'
local status_ok2, mason = pcall(require, plugin_name)
if not status_ok2 then
	print("ERROR: " .. plugin_name .. " plugin")
	return
else
  print("Loading " .. plugin_name .. " plugin")
end

plugin_name = 'mason-lspconfig'
local status_ok3, mason_lspconfig = pcall(require, plugin_name)
if not status_ok3 then
	print("ERROR: " .. plugin_name .. " plugin")
	return
else
  print("Loading " .. plugin_name .. " plugin")
end

plugin_name = 'lspconfig'
local status_ok4, lspconfig = pcall(require, plugin_name)
if not status_ok4 then
	print("ERROR: " .. plugin_name .. " plugin")
	return
else
  print("Loading " .. plugin_name .. " plugin")
end

-- See :help lsp-zero.extend_lspconfig()
lsp_zero.preset({})

lsp_zero.extend_lspconfig({
  print('extend_lspconfig...'),
  on_attach = function(client, bufnr)
    print('[e] Setting up keymaps for server' .. client.name .. '[' .. client.id .. '] on buffer ' .. bufnr)
    lsp_zero.default_keymaps({
      buffer = bufnr,
      preserve_mappings = false
    })
  end
})

mason.setup()
mason_lspconfig.setup()

local servers = { "vimls", "pyright", "intelephense", "jsonls", "bashls", "awk_ls", "yamlls", "dockerls",
  "docker_compose_language_service", "marksman", "ruff_lsp", "taplo", "perlnavigator" }
--
-- Automatically installed all required servers
require("mason-lspconfig").setup({
  ensure_installed = servers
})

local custom_attach = lsp_zero.on_attach(
  function(client, bufnr)
    print('[x] Setting up keymaps for server' .. client.name .. '[' .. client.id .. '] on buffer ' .. bufnr)
    lsp_zero.default_keymaps({
      buffer = bufnr,
      preserve_mappings = false
    })
  end
)

-- local get_servers = require('mason-lspconfig').get_installed_servers
for _, server_name in ipairs(servers) do
  lspconfig[server_name].setup({
    print('[l] Configuring lsp server ' .. server_name),
    -- on_attach = lsp_zero.attach,
    flags = {
      debounce_text_changes = 150
    }
  })
end


-- server-specific configuration/overrides
lspconfig.lua_ls.setup({
  print('[c] Configuring lua_ls server...'),
  on_attach = custom_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  },
})

lspconfig.sqlls.setup({
  print('[c] Configuring sqlls server...'),
  on_attach = custom_attach,
  cmd = { os.getenv 'XDG_DATA_HOME' .. '/nvim/mason/bin/sql-language-server', "up", "--method", "stdio" },
  filetypes = { 'sql', 'mysql' },
  root_dir = function()
    return vim.loop.cwd()
  end,
})

---
-- Diagnostic config
---

lsp_zero.set_sign_icons()
vim.diagnostic.config(lsp_zero.defaults.diagnostics({}))

---
-- Snippet config
---

require('luasnip').config.set_config({
  region_check_events = 'InsertEnter',
  delete_check_events = 'InsertLeave'
})

require('luasnip.loaders.from_vscode').lazy_load()

---
-- Other stuff
---

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover,
  { border = 'rounded' }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { border = 'rounded' }
)

