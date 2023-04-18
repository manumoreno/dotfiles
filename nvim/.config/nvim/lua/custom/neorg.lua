local plugin = 'neorg'
local status_ok, neorg = pcall(require, plugin)

if not status_ok then
	print("ERROR: " .. plugin .. " plugin")
	return
else
  print("Loading " .. plugin .. " plugin")
end

neorg.setup {
  load = {
    ["core.defaults"] = {},                   -- Loads default behaviour
    ["core.norg.concealer"] = {},             -- Adds pretty icons to your documents
    ["core.norg.dirman"] = {                  -- Manages Neorg workspaces
      config = {
        workspaces = {
          notes = "~/DEV/manumoreno_repo/productivity/neovim/",
        },
      },
    },
  },
}

