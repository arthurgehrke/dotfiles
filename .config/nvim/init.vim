call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-rooter'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tmux-plugins/tmux-yank'
Plug 'tmux-plugins/vim-tmux'

Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'peitalin/vim-jsx-typescript'
Plug 'maxmellon/vim-jsx-pretty'

Plug 'styled-components/vim-styled-components'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

syntax enable

set termguicolors
set encoding=utf-8
set hidden
set number
set relativenumber
set background=dark
set smarttab
set cindent
set tabstop=2
set shiftwidth=2
set expandtab
set nobackup
set nowritebackup

set nowrap                              

set shortmess+=c
set pumheight=10                        " Makes popup menu smaller

set title
set clipboard=unnamedplus

" open new split panes to right and below
set splitright
set splitbelow

set cursorline
set shortmess+=c             " Don't give ins-completion-menu messages

colorscheme gruvbox


" If vim is resized, resize any splits
autocmd VimResized * wincmd =
" Wrap lines in quickfix windows
autocmd FileType qf setlocal wrap linebreak nolist breakindent breakindentopt=shift:2
" More predictable syntax highlighting
autocmd BufEnter * syntax sync fromstart
" Automatically close preview windows after autocompletion
autocmd CompleteDone * pclose


nnoremap <Space>f :NERDTreeToggle <cr>

nnoremap <Space>h :wincmd h <cr>
nnoremap <Space>j :wincmd j <cr>
nnoremap <Space>k :wincmd k <cr>
nnoremap <Space>l :wincmd l <cr>

inoremap jk <ESC>
inoremap kj <ESC>
inoremap JK <ESC>
inoremap jj <ESC>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" Insert new line without entering insert mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Go to start of line with H and to the end with L
noremap H ^
noremap L $

" Yank and paste to system's clipboard
noremap <Space>y "+y
noremap <Space>p "+p
noremap <Space>P +P""

" space to clear search highlights
noremap <silent> <space> :noh<cr>

" Plugins Config
" NERDTree config
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeIgnore = ['^node_modules$', '\.git$']
let g:NERDTreeShowHidden=1
let g:NERDTreeMinimalUI = 1

autocmd BufWinEnter * setlocal modifiable

" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

autocmd BufRead * call SyncTree()

" coc config
" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nnoremap go <c-o>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" COC-VIM TAB SETTINGS START
" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" coc diagnostics theme
autocmd FileType json syntax match Comment +\/\/.\+$+

highlight Error            ctermbg=161
highlight ErrorMsg         NONE
highlight link ErrorMsg    Error
hi! CocErrorSign guifg=#d1666a

" fix syntax highlight for Coc plugin floating errors
" hi CocErrorFloat guifg=Magenta guibg=Magenta

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>

" Add CoC Prettier if prettier is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

" Add CoC ESLint if ESLint is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" Airline config
let g:airline_theme = 'onedark'
" Always show tabs
set showtabline=2

" Vim commentary
nnoremap <space>/ :Commentary<CR>
vnoremap <space>/ :Commentary<CR>

" Fzf config
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

" ts and jsx config
" vim-jsx
let g:jsx_ext_required = 1

" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" some weird error with Fugitive
let g:fugitive_pty = 0

" Change cursor to solid vertical line
" There are problems with Vim's floating window setting cursor to a solid
" block. So these lines below are resetting it to a solid vertical line.
let &t_SI = "\e[6 q"
let &t_EI = "\e[6 q"

