require('nvim-treesitter.configs').setup {
  auto_install = vim.env.GIT_WORK_TREE == nil, -- otherwise auto-install fails on git commit -a
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
  matchup = {
    enable = true
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil
  },
  autotag = {
    enable = true,
  }
}

-- require'nvim-treesitter.configs'.setup({
--   ensure_installed = {
--     "javascript",
--     "typescript",
--     "json",
--     "graphql",
--     "tsx",
--     "html",
--     "jsdoc",
--     "css",
--     "bash",
--     "lua"
--   },
--   context_commentstring = {
--     -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
--     enable = true
--   },
--   indent = {
--     enable = true
--   },
--   highlight = {
--     enable = true,
--     use_languagetree = true
--   },
--   refactor = {
--     highlight_definitions = {
--       enable = true
--     },
--     -- highlight_current_scope = {
--     --   enable = true
--     -- }
--   },
--   textobjects = {
--     enable=true,
--     select = {
--       enable = true,
--       keymaps = {
--         -- You can use the capture groups defined in textobjects.scm
--         ["af"] = "@function.outer",
--         ["if"] = "@function.inner",
--         ["aC"] = "@class.outer",
--         ["iC"] = "@class.inner",
--         ["ac"] = "@conditional.outer",
--         ["ic"] = "@conditional.inner",
--         ["is"] = "@statement.inner",
--         ["as"] = "@statement.outer",
--         ["ad"] = "@lhs.inner",
--         ["id"] = "@rhs.inner",
--         ["am"] = "@call.outer",
--         ["im"] = "@call.inner",
--         ["al"] = "@loop.outer",
--         ["il"] = "@loop.inner",
--         ["at"] = "@block.outer",
--         ["it"] = "@block.inner",
--       },
--     },
--     swap = {
--       enable = true,
--       swap_next = {
--         ["<leader>al"] = "@parameter.inner",
--       },
--       swap_previous = {
--         ["<leader>ah"] = "@parameter.inner",
--       },
--     },
--     move = {
--       enable = true,
--       goto_next_start = {
--         ["]m"] = "@function.outer",
--         ["]]"] = "@class.outer",
--       },
--       goto_next_end = {
--         ["]M"] = "@function.outer",
--         ["]["] = "@class.outer",
--       },
--       goto_previous_start = {
--         ["[m"] = "@function.outer",
--         ["[["] = "@class.outer",
--       },
--       goto_previous_end = {
--         ["[M"] = "@function.outer",
--         ["[]"] = "@class.outer",
--       },
--     },
--   },
-- })
