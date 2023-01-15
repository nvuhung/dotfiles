return {
  -- Theme
  {'sainnhe/sonokai'},

  -- Icons
  {'ryanoasis/vim-devicons'},
  {'nvim-tree/nvim-web-devicons', config = function () require('plugins/nvim-web-devicons') end},

  -- Auto pairs for '(' '[' '{'
  {"windwp/nvim-autopairs", config = function() require'plugins.nvim-autopairs' end},

  -- Colorizer
  {'norcalli/nvim-colorizer.lua', config = function() require'plugins.nvim-colorizer' end},

  -- Comment
  {'JoosepAlviste/nvim-ts-context-commentstring'},
  {'tpope/vim-commentary'},

  -- Git
  {'lewis6991/gitsigns.nvim', config = function() require'plugins.gitsigns' end},
  {'tpope/vim-fugitive'},

  -- LSP
  {'neovim/nvim-lspconfig', config = function() require'plugins.nvim-lspconfig' end},
  
  -- Surround
  {'tpope/vim-surround'},

  -- Text Navigation
  {'ggandor/leap.nvim', config = function() require'plugins.leap' end},
  {'ggandor/flit.nvim', config = function() require'plugins.flit' end},

  -- Bbye (Buffer Bye)
  {'moll/vim-bbye'},

  -- Ranger
  {'kevinhwang91/rnvimr', config = function() require'plugins.rnvimr' end},

  -- Buffer tab
  {'akinsho/nvim-bufferline.lua', config = function() require'plugins.nvim-bufferline' end},

  -- Status line
  {'famiu/feline.nvim', config = function() require('plugins.feline') end},

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/popup.nvim', 
      'nvim-lua/plenary.nvim', 
      'axkirillov/telescope-changed-files',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = "make"}
    },
    config = function()
      require("plugins.telescope")
    end
  },

  -- Auto close and rename tag
  {'windwp/nvim-ts-autotag', config = require'plugins.nvim-ts-autotag'},

  -- Treesitter
  {'nvim-treesitter/nvim-treesitter-refactor'},
  {'nvim-treesitter/nvim-treesitter-textobjects'},
  {
    'nvim-treesitter/nvim-treesitter', 
    build = ':TSUpdate', 
    config = function() require('plugins.nvim-treesitter') end,
  },

  -- Indent
  {'lukas-reineke/indent-blankline.nvim', branch = 'master'},

  { 
    'hrsh7th/nvim-cmp', 
    dependencies = {
     'hrsh7th/cmp-nvim-lsp',
     'hrsh7th/cmp-buffer',
     'hrsh7th/cmp-path',
     'hrsh7th/cmp-cmdline',
    },
    config = function() require'plugins.nvim-cmp' end
  },
  {'hrsh7th/cmp-vsnip'},

  -- Snippets
  {'hrsh7th/vim-vsnip', dependencies = {'hrsh7th/vim-vsnip-integ'}, config = function() require'plugins.vim-vsnip' end},

  -- File explorer
  {'nvim-tree/nvim-tree.lua', config = function() require'plugins.nvim-tree' end},

  -- Smooth scroll
  {'psliwka/vim-smoothie'},

  -- Outline
  -- {'simrat39/symbols-outline.nvim', config = require('plugins.symbols-outline')}
  {'stevearc/aerial.nvim', config = function() require'plugins.aerial' end, event = "VeryLazy"},

  --- Highlighting
  {'RRethy/vim-illuminate', config = function() require('plugins.vim-illuminate') end},

  -- Wakatime,
  {'wakatime/vim-wakatime', event = "VeryLazy"}
}
