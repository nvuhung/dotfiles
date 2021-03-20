-- Use shift + arrow to resize windows
vim.api.nvim_set_keymap('n', '<S-Up>', '<M-j> :resize -2<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-Down>', '<M-k> :resize +2<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-Left>', '<M-h> :vertical resize -2<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-Right>', '<M-l> :vertical resize +2<CR>', { noremap = true })

-- ESC with kj or jk
vim.api.nvim_set_keymap('i', 'kj', '<esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'jk', '<esc>', { noremap = true, silent = true })

-- Easy CAPS
-- vim.api.nvim_set_keymap('i', '<Leader>u', '<esc>viwUi', { noremap = true })
-- vim.api.nvim_set_keymap('i', '<Leader>l', '<esc>viwu', { noremap = true })

-- Select all
vim.api.nvim_set_keymap('n', '<Leader>a', 'ggVG', { noremap = true })

-- Close all buffers
vim.api.nvim_set_keymap('n', '<C-w><C-k>', ':bufdo :Bdelete<CR>', { noremap = true })
-- Close current buffer
vim.api.nvim_set_keymap('n', '<C-w>', ':Bdelete<CR>', { noremap = true })

-- Toggle relative line number
-- vim.api.nvim_set_keymap('n', '<C-L><C-L>', ':set invrelativenumber<CR>', { noremap = true })

-- Ctrl-s to save
vim.api.nvim_set_keymap('n', '<C-s>', ':w!<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-s>', '<ESC>:w!<CR>', { noremap = true })
-- Ctrl-Shift-s to save all
vim.api.nvim_set_keymap('n', '<CS-s>', ':wa!<CR>', { noremap = true, silent =  true })
vim.api.nvim_set_keymap('i', '<CS-s>', '<ESC>:wa!<CR>', { noremap = true, silent =  true })

-- Tabbing
vim.cmd([[vnoremap < <gv]])
vim.cmd([[vnoremap > >gv]])

-- Window navigation
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true })

-- Clean highlight search
vim.api.nvim_set_keymap('n', '<Esc><Esc>', ':nohlsearch<CR>', { noremap = true })

-- Replace
vim.api.nvim_set_keymap('n', '<C-c>', ':%s//g<Left><Left>', { noremap = true })

-- Move selected line / block of text in visual mode
vim.cmd([[xnoremap K :move '<-2<CR>gv-gv]])
vim.cmd([[xnoremap J :move '>+1<CR>gv-gv]])

-- Paste without yank
-- https://stackoverflow.com/questions/290465/how-to-paste-over-without-overwriting-register
vim.cmd([[xnoremap <silent> p p:let @+=@0<CR>:let @"=@0<CR>]])

-- Quick replace in word
-- vim.api.nvim_set_keymap('n', 'pw', 'viwp', { noremap = true, silent = true })
