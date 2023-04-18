local plugin_name = 'dapui'
local status_ok1, dapui = pcall(require, plugin_name)
if not status_ok1 then
	print("ERROR: " .. plugin_name .. " plugin")
	return
else
  print("Loading " .. plugin_name .. " plugin")
end

plugin_name = 'dap-python'
local status_ok2, dap_python = pcall(require, plugin_name)
if not status_ok2 then
	print("ERROR: " .. plugin_name .. " plugin")
	return
else
  print("Loading " .. plugin_name .. " plugin")
end


-- dap-python way
dapui.setup()
dap_python.setup('~/DEV/py_venvs/debugpy/bin/python')
require('dap-python').test_runner = 'pytest'

vim.keymap.set('n', '<leader>dn', '<cmd>lua require("dap-python").test_method()<CR>')
vim.keymap.set('n', '<leader>df', '<cmd>lua require("dap-python").test_class()<CR>')
vim.keymap.set('n', '<leader>ds', '<cmd>lua require("dap-python").debug_selection()<CR>')

vim.keymap.set('n', '<leader>dcc', function() require('dap').continue() end)
vim.keymap.set('n', '<leader>dso', function() require('dap').step_over() end)
vim.keymap.set('n', '<leader>dsi', function() require('dap').step_into() end)
vim.keymap.set('n', '<leader>dsO', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>dtb', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>dsb', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>dlp',
function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>ddr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>ddl', function() require('dap').run_last() end)
vim.keymap.set({ 'n', 'v' }, '<Leader>ddh', function() require('dap.ui.widgets').hover() end)
vim.keymap.set({ 'n', 'v' }, '<Leader>ddp', function() require('dap.ui.widgets').preview() end)
vim.keymap.set('n', '<Leader>ddf',
function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>dds',
function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)


-- using DAP/DAPUI
-- local dap, dapui = require("dap"), require("dapui")
--
-- dap.configurations.python = {
--   {
--     type = 'python',
--     request = 'launch',
--     name = "Launch file",
--     program = "${file}",
--     pythonPath = function()
--       return 'python3'
--     end,
--   },
-- }
--
-- require("neodev").setup({
--   library = { plugins = { "nvim-dap-ui" }, types = true },
--   ...
-- })
--
-- dap.listeners.after.event_initialized["dapui_config"] = function()
--   dapui.open()
-- end
-- dap.listeners.before.event_terminated["dapui_config"] = function()
--   dapui.close()
-- end
-- dap.listeners.before.event_exited["dapui_config"] = function()
--   dapui.close()
-- end




-- using DAP-PYTHON
-- local dap = require('dap')
-- dap.adapters.python = {
--   type = 'executable',
--   command = os.getenv('VIRTUAL_ENV') .. 'bin/python',
--   args = { '-m', 'debugpy.adapter' },
-- }
--
-- dap.configurations.python = {
--   {
--     -- The first three options are required by nvim-dap
--     type = 'python', -- the type here established the link to the adapter definition: `dap.adapters.python`
--     request = 'launch',
--     name = "Launch file",
--     -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options
--
--     program = "${file}", -- This configuration will launch the current file if used.
--     pythonPath = os.getenv('VIRTUAL_ENV') .. 'bin/python'
--     -- pythonPath = function()
--     --   -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
--     --   -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
--     --   -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
--     --   local cwd = vim.fn.getcwd()
--     --   if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
--     --     return cwd .. '/venv/bin/python'
--     --   elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
--     --     return cwd .. '/.venv/bin/python'
--     --   else
--     --     return '/usr/bin/python'
--     --   end
--     -- end,
--   },
-- }
