" These commands will navigate through buffers in order regardless of which mode you are using
" e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
" nnoremap <silent><C-]> :BufferLineCycleNext<CR>
" nnoremap <silent><C-[> :BufferLineCyclePrev<CR>
" nnoremap <silent>gb :BufferLinePick<CR>


" These commands will move the current buffer backwards or forwards in the bufferline
nnoremap <silent><C-S-]> :BufferLineMoveNext<CR>
nnoremap <silent><C-S-[> :BufferLineMovePrev<CR>

lua << EOF
require'bufferline'.setup{
  options = {
    numbers = "ordinal"
  }
}
EOF
