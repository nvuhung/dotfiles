return function()
  -- mappings
  vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<leader>l", ":NvimTreeRefresh<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<leader>>", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })

  vim.o.termguicolors = true
  
  vim.g.nvim_tree_side = 'left'
  vim.g.nvim_tree_width = 50
  -- vim.g.nvim_tree_ignore = {".git", ".DS_Store", ".cache", "node_modules"}
  -- vim.g.nvim_tree_auto_open = 1
  -- vim.g.nvim_tree_auto_close = 0
  vim.g.nvim_tree_quit_on_open = 0
  vim.g.nvim_tree_indent_markers = 0
  -- vim.g.nvim_tree_hide_dotfiles = 0
  vim.g.nvim_tree_git_hl = 1
  vim.g.nvim_tree_root_folder_modifier = ':~'
  -- vim.g.nvim_tree_tab_open = 1
  vim.g.nvim_tree_width_allow_resize  = 0
  vim.g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
  }

  vim.g.nvim_tree_icons = {
      default = "",
      symlink = "",
      git = {
          unstaged = "",
          staged = "",
          unmerged = "",
          renamed = "➜",
          untracked = "★"
      },
      folder = {
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = ""
      }
  }
  
  local tree_cb = require'nvim-tree.config'.nvim_tree_callback

  local list = {
    -- { key = {"<CR>", "o" }, cb = ":lua some_func()<cr>", mode = "n"}
    { key = "h",                          action = "close_node" },
    { key = "<s-cr>",                     action = "close_node" },
    { key = "<BS>",                       action = "close_node" },
    { key = "l",                          action = "edit" },
    { key = "<cr>",                       action = "edit" },
    { key = "o",                          action = "edit" },
  }
  
  require('nvim-tree').setup({
    -- disables netrw completely
    disable_netrw       = true,
    -- hijack netrw window on startup
    hijack_netrw        = true,
    -- open the tree when running this setup function
    open_on_setup       = true,
    -- will not open on setup if the filetype is in this list
    ignore_ft_on_setup  = {},
    -- closes neovim automatically when the tree is the last **WINDOW** in the view
    auto_close          = false,
    -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
    open_on_tab         = false,
    -- hijacks new directory buffers when they are opened.
    update_to_buf_dir   = {
      -- enable the feature
      enable = true,
      -- allow to open the tree if it was previously closed
      auto_open = true,
    },
    -- hijack the cursor in the tree to put it at the start of the filename
    hijack_cursor       = false,
    -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually) 
    update_cwd          = false,
    -- show lsp diagnostics in the signcolumn
    diagnostics = {
      enable = false
    },
    -- configuration options for the system open command (`s` in the tree by default)
    system_open = {
      -- the command to run this, leaving nil should work in most cases
      cmd  = nil,
      -- the command arguments as a list
      args = {}
    },

    ignore_ft_on_setup = {".git", ".DS_Store", ".cache", "node_modules"},

    filters = {
      dotfiles = false,
      custom = {}
    },

    view = {
      -- width of the window, can be either a number (columns) or a string in `%`
      width = 50,
      -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
      side = 'left',
      -- if true the tree will resize itself after opening a file
      auto_resize = true,
      mappings = {
        -- custom only false will merge the list with the default mappings
        -- if true, it will only use your list to set the mappings
        custom_only = false,
        -- list of mappings to set on the tree manually
        list = list
      }
    }
  })
end
