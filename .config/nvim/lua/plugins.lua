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
    -- use {'jiangmiao/auto-pairs'};
    use {"windwp/nvim-autopairs", config = require'plugins.nvim-autopairs'}

    -- Colorizer
    use {'norcalli/nvim-colorizer.lua', config = require'plugins.nvim-colorizer'}

    -- Comment
    use {'tpope/vim-commentary'};

    -- Git
    use {'airblade/vim-gitgutter'};
    use {'tpope/vim-fugitive'};
    use {'tpope/vim-rhubarb'};
    use {'junegunn/gv.vim'};

    -- LSP
    use {'neovim/nvim-lspconfig', 
      commit = '73691999f77db352823c0e92e7cb083582127dd8',
      config = require'plugins.nvim-lspconfig'};
    
    -- Surround
    use {'tpope/vim-surround'};

    -- Closetags
    -- FIXME
    use {'alvan/vim-closetag', config = require'plugins.vim-closetag'};

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
    use {'glepnir/galaxyline.nvim', branch = 'main', config = require'plugins.galaxyline'};

    -- Telescope
    use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
      config = require'plugins.telescope'
    }

    -- Auto change html tags
    use {'andrewradev/tagalong.vim'}

    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter-refactor'}
    use {'nvim-treesitter/nvim-treesitter-textobjects'}
    use {'nvim-treesitter/nvim-treesitter', 
      commit = 'df81a91ba9e6ae29a70e168b49e21dc1835c0948',
      run = ':TSUpdate', 
      config = require'plugins.nvim-treesitter'
    }

    -- Snippets
    use {"hrsh7th/vim-vsnip", requires = "hrsh7th/vim-vsnip-integ", config = require"plugins.vim-vsnip"}

    -- Completion
    use {'hrsh7th/nvim-compe', config = require'plugins.nvim-compe'}

    -- File explorer
    use {'kyazdani42/nvim-tree.lua', config = require'plugins.nvim-tree'}

    -- Smooth scroll
    use {'psliwka/vim-smoothie'}
  end
)
