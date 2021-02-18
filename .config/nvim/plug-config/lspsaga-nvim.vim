nnoremap <silent> gh :Lspsaga lsp_finder<CR>
nnoremap <C-e> :Lspsaga code_action<CR>
vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>

lua << EOF

local saga = require 'lspsaga'
saga.init_lsp_saga({
  -- debug = true
})

EOF

