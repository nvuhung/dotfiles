return function()
  -- mappings
  vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<leader>l", ":NvimTreeRefresh<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<leader>>", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })

  vim.o.termguicolors = true
  
  vim.g.nvim_tree_side = 'left'
  vim.g.nvim_tree_width = 50
  vim.g.nvim_tree_width_allow_resize  = 0
  
  local tree_cb = require'nvim-tree.config'.nvim_tree_callback

  local list = {
    -- { key = {"<CR>", "o" }, cb = ":lua some_func()<cr>", mode = "n"}
    { key = "h",                          action = "edit" },
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
    -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
    open_on_tab         = false,
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

    update_focused_file = {
      enable      = true,
      update_cwd  = false,
      ignore_list = {}
    },

    view = {
      -- width of the window, can be either a number (columns) or a string in `%`
      width = 50,
      -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
      side = 'left',
      mappings = {
        -- custom only false will merge the list with the default mappings
        -- if true, it will only use your list to set the mappings
        custom_only = false,
        -- list of mappings to set on the tree manually
        list = list
      }
    },
    actions = {
      change_dir = {
        enable = true,
        global = false,
      },
      open_file = {
        quit_on_open = false,
        resize_window = false,
        window_picker = {
          enable = true,
          chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
          exclude = {
            filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame", },
            buftype  = { "nofile", "terminal", "help", },
          }
        }
      }
    },
    renderer = {
      highlight_git = true,
      icons = {
        glyphs = {
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
      },
    }
  })
end
