let g:airline_theme='wombat'
" let g:airline_theme = 'iceberg'
" let g:airline_theme = 'onedark'
" 
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Disable statusline in order to use lualine
let g:airline_disable_statusline = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_close_button = 0 
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_highlighting_cache = 1

let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

let g:airline#extensions#tabline#tabs_label = ''       
let g:airline#extensions#tabline#buffers_label = ''  
 
" disable file paths in the tab 
let g:airline#extensions#tabline#fnamemod = ':t'

" minimum of 2 tabs needed to display the tabline 
let g:airline#extensions#tabline#tab_min_count = 2

let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_splits = 1
" let g:airline#extensions#tabline#show_splits = 0 
let g:airline#extensions#tabline#show_tab_type = 0  
let g:airline#extensions#tabline#show_tab_nr = 0 

let g:airline#extensions#wordcount#enabled = 0

let g:airline_skip_empty_sections = 1

let g:airline_exclude_preview = 0
