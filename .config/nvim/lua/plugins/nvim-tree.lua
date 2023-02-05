-- mappings
vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>l", ":NvimTreeRefresh<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>>", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })

vim.g.nvim_tree_side               = 'left'
vim.g.nvim_tree_width              = 50
vim.g.nvim_tree_width_allow_resize = 0

local list = {
  -- { key = {"<CR>", "o" }, cb = ":lua some_func()<cr>", mode = "n"}
  { key = "h", action = "edit" },
  { key = "<s-cr>", action = "close_node" },
  { key = "<BS>", action = "close_node" },
  { key = "l", action = "edit" },
  { key = "<cr>", action = "edit" },
  { key = "o", action = "edit" },
}

local status, tree = pcall(require, "nvim-tree")

if (not status) then return end
tree.setup({
  -- disables netrw completely
  disable_netrw = true,
  -- hijack netrw window on startup
  hijack_netrw  = true,
  -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
  open_on_tab   = false,
  -- hijack the cursor in the tree to put it at the start of the filename
  hijack_cursor = false,
  -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
  update_cwd    = false,
  -- show lsp diagnostics in the signcolumn
  diagnostics   = {
    enable = false
  },

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
          untracked = "★",
          deleted = "",
          ignored = "◌"

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

local function open_nvim_tree()
  -- always open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
