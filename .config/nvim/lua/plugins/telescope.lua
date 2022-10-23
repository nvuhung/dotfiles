return function()
  -- mappings
  vim.api.nvim_set_keymap('n', '<C-P>', '<cmd>lua require("telescope.builtin").find_files()<cr>', { noremap = true })
  -- nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
  vim.api.nvim_set_keymap('n', '<C-F>', '<cmd>lua require("telescope.builtin").live_grep()<cr>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<C-S-F>', '<cmd>lua require("telescope.builtin").resume()<cr>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<C-B>', '<cmd>lua require("telescope.builtin").buffers()<cr>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>', { noremap = true })
  -- https://github.com/nvim-telescope/telescope-frecency.nvim
  vim.api.nvim_set_keymap("n", "<leader><leader>", "<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>", {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<leader>o", ':Telescope aerial<CR>', {noremap = true, silent = true})

  vim.o.termguicolors = true
  local actions = require('telescope.actions')

  require('telescope').setup {
    extensions = {
      fzf = {
        fuzzy = true, 
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
      },
      aerial = {
        -- Display symbols as <root>.<parent>.<symbol>
        show_nesting = {
          ['_'] = false, -- This key will be the default
          json = true,   -- You can set the option for specific filetypes
          javascript = true,   -- You can set the option for specific filetypes
          typescript = true,   -- You can set the option for specific filetypes
          yaml = true,
        }
      }
    },
    pickers = {
      live_grep = {
        debounce = 10,
        -- on_input_filter_cb = function(prompt)
        --   -- AND operator for live_grep like how fzf handles spaces with wildcards in rg
        --   return { prompt = prompt:gsub("%s", ".*") }
        -- end,
      },
    },
    defaults = {
      mappings = {
        i = {
          ["<esc>"] = actions.close,
        },
        n = {
          ["<esc>"] = actions.close,
        },
      },
      vimgrep_arguments = {
        'rg',
        '--hidden',
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case'
      },
      prompt_prefix = "> ",
      entry_prefix = "  ",
      selection_caret = "> ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "descending",
      layout_strategy = "horizontal",
      layout_config = {
        width = 0.75,
        -- results_height = 1,
        -- results_width = 0.8,
        prompt_position = "bottom",
        preview_cutoff = 60,
        horizontal = {
          mirror = false,
        },
        vertical = {
          mirror = false,
        },
      },
      file_sorter =  require'telescope.sorters'.get_fuzzy_file,
      file_ignore_patterns = {
        ".cache", 
        ".umi", 
        "_next", 
        ".next", 
        ".svg",
        "yarn.lock", 
        "autoload/.*", 
        "node_modules/.*", 
        "plugged/.*", 
        "android/.*", 
        "ios/.*", 
        "build/.*", 
        "dist/.*", 
        ".git/.*", 
        "yarn-error.log",
        "npm-debug.log",
        "CHANGELOG.md", 
        "tf-tiniapp.render.js"
      },
      generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
      -- path_display = true,
      winblend = 0,
      border = {},
      borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
      color_devicons = true,
      use_less = true,
      set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
      file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
      grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
      qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
  
      -- Developer configurations: Not meant for general override
      buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
    }
  }
  require('telescope').load_extension('fzf')
  require('telescope').load_extension('aerial')
end
