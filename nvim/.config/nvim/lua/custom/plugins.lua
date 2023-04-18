print('Installing/loading plugins')

return function(use)
  -- our theme
  use 'folke/tokyonight.nvim'
  use "EdenEast/nightfox.nvim"
  use { "catppuccin/nvim", as = "catppuccin" }
  use "rebelot/kanagawa.nvim"

  -- file browser
  use({
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      "s1n7ax/nvim-window-picker",
    }
  })

  -- status bar
  use 'nvim-lualine/lualine.nvim'

  -- persist changes over time
  use 'mbbill/undotree'

  -- Fuzzy Finder (files, lsp, etc)
  use({
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  })

  -- LSP config
  use({
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig'
  })

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }
  -- Autocompletion
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "onsails/lspkind-nvim" },
      { "hrsh7th/cmp-nvim-lua" },
      { "L3MON4D3/LuaSnip" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-nvim-lsp-signature-help" },
      -- { "hrsh7th/cmp-git" },
      -- { "hrsh7th/cmp-omni" },
      -- { "hrsh7th/cmp-calc" },
      -- { "hrsh7th/cmp-emoji" },
    },
  })

  -- Bufferline
  use({
    'akinsho/bufferline.nvim',
    tag = "v3.*",
    requires = 'nvim-tree/nvim-web-devicons'
  })

  -- nicer wild/popup menu
  -- use({
  --   "gelguy/wilder.nvim",
  --   run = { ":UpdateRemotePlugins", },
  --   requires = { "kyazdani42/nvim-web-devicons", "sharkdp/fd", "romgrk/fzy-lua-native" },
  -- })

  use({
    'roxma/nvim-yarp',
    -- run =  { 'pip install -r requirements.txt' }
  })

  -- Add indentation guides even on blank lines
  use 'lukas-reineke/indent-blankline.nvim'

  -- Trouble
  use {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
  }

  -- sql language server
  use({
    'nanotee/sqls.nvim'
  })

  -- splash screen
  use({
    'goolord/alpha-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
  })

  -- gitsings
  use 'lewis6991/gitsigns.nvim'
  use 'kdheepak/lazygit.nvim'

  -- toggleterm
  use "akinsho/toggleterm.nvim"

  -- Packer
  use({
    "folke/noice.nvim",
    requires = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  })

  use 'lukoshkin/trailing-whitespace'

  use "VonHeikemen/lsp-zero.nvim"

  -- use osc52 to enable remote copy/paste
  use { 'ojroques/nvim-osc52' }

  -- DAP
  use { "mfussenegger/nvim-dap-python",
    requires = { "mfussenegger/nvim-dap-ui", "mfussenegger/nvim-dap" }
  }

  -- jupyter stuff
  use { 'dccsillag/magma-nvim', run = ':UpdateRemotePlugins' }
  use { "meatballs/notebook.nvim" }

  -- java lsp
  use 'mfussenegger/nvim-jdtls'

  -- show colors
  use 'norcalli/nvim-colorizer.lua'

  -- SQL plugin
  use {
    "kristijanhusak/vim-dadbod-ui",
    requires = "tpope/vim-dadbod",
  }
  use "kristijanhusak/vim-dadbod-completion"

  -- program outline
  use "preservim/tagbar"

  -- orgmode
  use { "nvim-neorg/neorg",
    run = ":Neorg sync-parsers",
    requires = "nvim-lua/plenary.nvim"
  }
end
