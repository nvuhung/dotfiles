" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Themes
    " Plug 'joshdick/onedark.vim'
    Plug 'mhartington/oceanic-next'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " Colorizer
    Plug 'norcalli/nvim-colorizer.lua'
    " Coc
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
    " Comment
    Plug 'tpope/vim-commentary'
    " Git
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'
    " Snippets
    Plug 'honza/vim-snippets'
    " Have the file system follow you around
    Plug 'airblade/vim-rooter'
    " FZF
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    " Easymotion
    " Plug 'easymotion/vim-easymotion'
    " Cool Icons
    Plug 'ryanoasis/vim-devicons'
    " Closetags
    Plug 'alvan/vim-closetag'
    " Smooth scroll
    Plug 'psliwka/vim-smoothie'
    " editorconfig
    " Plug 'editorconfig/editorconfig-vim'
    " Surround
    Plug 'tpope/vim-surround'
    " Sneak
    Plug 'justinmk/vim-sneak'
    " Text Navigation
    Plug 'unblevable/quick-scope' 
    " Better tabline
    Plug 'mg979/vim-xtabline'
    " Auto change html tags
    Plug 'AndrewRadev/tagalong.vim'   
    " Bbye (Buffer Bye)
    Plug 'moll/vim-bbye'
    " Find and replace
    " Plug 'brooth/far.vim'
    " Vim Go
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    " Ranger
    Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}

call plug#end()
