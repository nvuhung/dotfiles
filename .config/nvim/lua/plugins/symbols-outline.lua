return function()
  -- mappings
  local opts = { noremap = true, silent = true }
  vim.api.nvim_set_keymap('n', '<space>o', '<cmd>SymbolsOutline<CR>', opts)

  vim.g.symbols_outline = {
    highlight_hovered_item = true,
    show_guides = false,
    auto_preview = false,
  }
end
