local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

-- Only required if you have packer in your `opt` pack
vim.cmd('packadd packer.nvim')

-- vim.cmd [[ autocmd BufWritePost packed.lua PackerCompile ]]

return require('packer').startup(
  function()
    use {'wbthomason/packer.nvim', opt = true}

    -- Theme
    use {'sainnhe/sonokai'};

    -- Icons
    use {'ryanoasis/vim-devicons'}
    use {'kyazdani42/nvim-web-devicons', config = require('plugins.nvim-web-devicons')}

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

    -- Sneak
    use {'justinmk/vim-sneak', config = require'plugins.vim-sneak'};

    -- Text Navigation
    use {'unblevable/quick-scope', config = require'plugins.quick-scope'};

    -- Bbye (Buffer Bye)
    use {'moll/vim-bbye'};

    -- Ranger
    use {'kevinhwang91/rnvimr', config = require'plugins.rnvimr'};

    -- Buffer tab
    use {'akinsho/nvim-bufferline.lua', config = require'plugins.nvim-bufferline'};

    -- Status line
    use {'famiu/feline.nvim', config = require'plugins.feline'};

    -- Telescope
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

    -- Snippets
    use {"hrsh7th/vim-vsnip", requires = "hrsh7th/vim-vsnip-integ", config = require"plugins.vim-vsnip"}

    -- Completion
    use {'hrsh7th/nvim-compe', config = require'plugins.nvim-compe'}

    -- File explorer
    use {'kyazdani42/nvim-tree.lua', config = require'plugins.nvim-tree'}

    -- Smooth scroll
    use {'psliwka/vim-smoothie'}

    -- Outline
    use {'simrat39/symbols-outline.nvim', config = require('plugins.symbols-outline')}
  end
)
