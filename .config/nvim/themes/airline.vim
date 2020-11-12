" Switch to your current theme
let g:airline_theme = 'onedark'

let g:airline_extensions = ['branch', 'hunks', 'coc']

let g:airline#extensions#coc#enabled = 1

let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'z', 'warning', 'error']]

let g:airline_section_c = airline#section#create([''])

" Enable powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

let g:airline#extensions#hunks#enabled=0

" We don't need to see things like -- INSERT -- anymore
" set noshowmode
