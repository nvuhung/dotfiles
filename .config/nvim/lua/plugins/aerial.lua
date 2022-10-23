return function()
  require('aerial').setup({
    on_attach = function(bufnr)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>n', '<cmd>AerialToggle!<CR>', {})
    end
  })
end
