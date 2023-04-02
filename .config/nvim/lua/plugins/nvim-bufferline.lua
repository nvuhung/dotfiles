-- mappings
vim.api.nvim_set_keymap("n", "<TAB>", ":BufferLineCycleNext<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "gb", ":BufferLinePick<CR>", { noremap = true })

vim.opt.termguicolors = true
require "bufferline".setup {
  options = {
    buffer_close_icon = '',
    close_icon = '',
  }
}
