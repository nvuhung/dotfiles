"---- vim-plug setup  ----
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
if has('win32')&&!has('win64')
  let curl_exists=expand('C:\Windows\Sysnative\curl.exe')
else
  let curl_exists=expand('curl')
endif

if !filereadable(vimplug_exists)
  if !executable(curl_exists)
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!"curl_exists" -fLo " . shellescape(vimplug_exists) . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Plugins
call plug#begin('~/.config/nvim/autoload/plugged')

    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Themes
    Plug 'sainnhe/sonokai'
    " Colorizer
    Plug 'norcalli/nvim-colorizer.lua'
    " Comment
    Plug 'tpope/vim-commentary'
    " Git
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'
    " Icons
    Plug 'ryanoasis/vim-devicons'
    Plug 'kyazdani42/nvim-web-devicons' " for file icons
    " Closetags
    Plug 'alvan/vim-closetag'
    " Smooth scroll
    Plug 'psliwka/vim-smoothie'
    " Surround
    Plug 'tpope/vim-surround'
    " Sneak
    Plug 'justinmk/vim-sneak'
    " Text Navigation
    Plug 'unblevable/quick-scope' 
    " Auto change html tags
    Plug 'AndrewRadev/tagalong.vim'   
    " Bbye (Buffer Bye)
    Plug 'moll/vim-bbye'
    " Find and replace
    " Plug 'ChristianChiarulli/far.vim'
    Plug 'brooth/far.vim'
    " Ranger
    Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
    " Bufferline
    Plug 'akinsho/nvim-bufferline.lua'
    " LSP
    Plug 'neovim/nvim-lspconfig'
    " Completion
    Plug 'hrsh7th/nvim-compe'
    " Code actions
    Plug 'glepnir/lspsaga.nvim'
    Plug 'kosayoda/nvim-lightbulb'
    " Snippets
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'
    " Fuzzy finder
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    " Syntax
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    " File explorer
    Plug 'kyazdani42/nvim-tree.lua'
    " Status line
    Plug 'glepnir/galaxyline.nvim'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
