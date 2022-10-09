-- Only required if you have packer in your `opt` pack
vim.cmd('packadd packer.nvim')

return require('packer').startup(
  function()
    use {'wbthomason/packer.nvim', opt = true}

    -- Theme
    use {'sainnhe/sonokai'};
    use "EdenEast/nightfox.nvim"

    -- Icons
    use {'ryanoasis/vim-devicons'}
    use {'nvim-tree/nvim-web-devicons', config = require('plugins.nvim-web-devicons')}

    -- Auto pairs for '(' '[' '{'
    use {"windwp/nvim-autopairs", config = require'plugins.nvim-autopairs'}

    -- Colorizer
    use {'norcalli/nvim-colorizer.lua', config = require'plugins.nvim-colorizer'}

    -- Comment
    use {'JoosepAlviste/nvim-ts-context-commentstring'}
    use {'tpope/vim-commentary'};

    -- Git
    use {'lewis6991/gitsigns.nvim', config = require'plugins.gitsigns'}
    use {'tpope/vim-fugitive'};

    -- LSP
    use {'neovim/nvim-lspconfig', config = require'plugins.nvim-lspconfig'};
    
    -- Surround
    use {'tpope/vim-surround'};

    -- Text Navigation
    use {
      'phaazon/hop.nvim',
      branch = 'v2', -- optional but strongly recommended
      config = require('plugins.hop')
    }

    -- Bbye (Buffer Bye)
    use {'moll/vim-bbye'};

    -- Ranger
    use {'kevinhwang91/rnvimr', config = require'plugins.rnvimr'};

    -- Buffer tab
    use {'akinsho/nvim-bufferline.lua', config = require'plugins.nvim-bufferline'};

    -- Status line
    use {'famiu/feline.nvim', config = require'plugins.feline'};

    -- Telescope
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use {
      "nvim-telescope/telescope-frecency.nvim",
      config = function()
        require"telescope".load_extension("frecency")
      end,
      requires = {"kkharji/sqlite.lua"}
    }
    use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
      config = require'plugins.telescope'
    }

    -- Auto close and rename tag
    use {'windwp/nvim-ts-autotag', config = require'plugins.nvim-ts-autotag'}

    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter-refactor'}
    use {'nvim-treesitter/nvim-treesitter-textobjects'}
    use {'nvim-treesitter/nvim-treesitter', 
      run = ':TSUpdate', 
      config = require'plugins.nvim-treesitter'
    }

    -- Indent
    use {'lukas-reineke/indent-blankline.nvim', branch = 'master'}

    -- Completion
    -- use {'hrsh7th/nvim-compe', config = require'plugins.nvim-compe'}
    -- NOTE: nvm-cmp error when enter in block code {
    use { 
      'hrsh7th/nvim-cmp', 
      requires = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
      },
      config = require'plugins.nvim-cmp'
    }
    use {"hrsh7th/cmp-vsnip"}

    -- Snippets
    use {"hrsh7th/vim-vsnip", requires = "hrsh7th/vim-vsnip-integ", config = require"plugins.vim-vsnip"}

    -- File explorer
    use {'nvim-tree/nvim-tree.lua', config = require'plugins.nvim-tree'}

    -- Smooth scroll
    use {'psliwka/vim-smoothie'}

    -- Outline
    use {'simrat39/symbols-outline.nvim', config = require('plugins.symbols-outline')}

    --- Highlighting
    use {'RRethy/vim-illuminate', config = require('plugins.vim-illuminate')}
  end
)
