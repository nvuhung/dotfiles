-- https://github.com/sainnhe/sonokai
local cmd = vim.cmd

vim.o.termguicolors = true
vim.g.sonokai_style = 'maia'
vim.g.sonokai_enable_italic = 1
vim.g.sonokai_disable_italic_comment = 1

cmd "colorscheme sonokai"
-- cmd [[
--   silent! colorscheme sonokai
--   hi Normal guibg=0x273136 guifg=0x273136
-- ]]
