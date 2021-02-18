" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use shift + arrow to resize windows
nnoremap <S-Up> <M-j>    :resize -2<CR>
nnoremap <S-Down> <M-k>    :resize +2<CR>
nnoremap <S-Left> <M-h>    :vertical resize -2<CR>
nnoremap <S-Right> <M-l>    :vertical resize +2<CR>

" Use with ESC
inoremap jk <Esc>
inoremap kj <Esc>

" Easy CAPS
" inoremap <Leader>u <ESC>viwUi
" nnoremap <Leader>l viwu<Esc>

" Select all
nnoremap <Leader>a ggVG<CR>

" TAB in general mode will move to text buffer
" nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
" nnoremap <S-TAB> :bprevious<CR>
" Close all buffers
nnoremap <C-w><C-k> :bufdo :Bdelete<CR>
" Close current buffer
nnoremap <C-w> :Bdelete<CR>

" Toggle relative line number
nmap <C-L><C-L> :set invrelativenumber<CR>

" Ctrl-s to save
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<cr>
" Alternate way to save all
nnoremap <silent> <CS-s> :wa<CR>
" Alternate way to quit
" nnoremap <C-Q> :wq!<CR>
" Use control-c instead of escape
" nnoremap <C-c> <Esc>
" <TAB>: completion.
" inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Clean highlight search
nnoremap <Esc><Esc> :nohlsearch<CR>

" Replace
nnoremap <C-c> :%s//g<Left><Left>

" Move selected line / block of text in visual mode
" shift + k to move up
" shift + j to move down
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv


" shift+arrow selection
" nmap <S-Up> v<Up>
" nmap <S-Down> v<Down>
" nmap <S-Left> v<Left>
" nmap <S-Right> v<Right>
" vmap <S-Up> <Up>
" vmap <S-Down> <Down>
" vmap <S-Left> <Left>
" vmap <S-Right> <Right>
" imap <S-Up> <Esc>v<Up>
" imap <S-Down> <Esc>v<Down>
" imap <S-Left> <Esc>v<Left>
" imap <S-Right> <Esc>v<Right>

" Plugins
" map <C-P> :Files<CR>
" map <C-B> :Buffers<CR>
" map <C-F> :Rg<CR>
" map <C-G> :Ag<CR>
" nnoremap <leader>ff <cmd>Telescope find_files<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" nnoremap <leader>fb <cmd>Telescope buffers<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" nnoremap <leader>fl <cmd>Telescope git_files<cr>

" Snips
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
" inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
" nmap        t   <Plug>(vsnip-select-text)
" xmap        t   <Plug>(vsnip-select-text)
" nmap        T   <Plug>(vsnip-cut-text)
" xmap        T   <Plug>(vsnip-cut-text)

" Bufferline
nnoremap <TAB> :BufferLineCycleNext<CR>
nnoremap <S-TAB> :BufferLineCyclePrev<CR>
nnoremap gb :BufferLinePick<CR>
