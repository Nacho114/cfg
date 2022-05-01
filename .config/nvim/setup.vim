" For coc, set location 
let g:python_host_prog = "/usr/bin/python2"
let g:python3_host_prog = "/usr/bin/python3"

call plug#begin('~/.config/nvim/plugged')

Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

Plug 'kyazdani42/nvim-web-devicons'

Plug 'itchyny/lightline.vim'

Plug 'ggandor/lightspeed.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'tpope/vim-commentary'

" Plug 'github/copilot.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" Recommended coc setup

:nmap <space>e <Cmd>CocCommand explorer<CR>

set hidden
set updatetime=300
set shortmess+=c
set signcolumn=number

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>rn <Plug>(coc-rename)

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

command! -nargs=0 Format   :call CocAction('format')
command! -nargs=0 Prettier :call CocAction('prettier.formatFile')
command! -nargs=0 OR       :call CocAction('runCommand', 'editor.action.organizeImport')

" Other plug in binding

let g:lightline = {'colorscheme': 'tokyonight'}

" Settings

let mapleader=";"

" Copy paste with system
set clipboard+=unnamedplus

" make Backspace work like Delete
" set backspace=indent,eol,start

" don't create `filename~` backups
set nobackup

" don't create temp files
set noswapfile

" Tab key enters 2 spaces
" To enter a TAB character when `expandtab` is in effect,
" CTRL-v-TAB
set expandtab tabstop=2 shiftwidth=2 softtabstop=2 

" Indent new line the same as the preceding line
set autoindent
set smartindent

filetype on 
filetype plugin on
filetype indent on
syntax enable

set number
set nowrap
set ignorecase
set smartcase
set incsearch

set termguicolors
set background=dark
colorscheme tokyonight

" save on write only if in file (avoid tree issue)
autocmd TextChanged,TextChangedI *
    \ if &buftype ==# '' || &buftype == 'acwrite' |
    \     silent write |
    \ endif

" Leader related mappings
let mapleader=";"

nnoremap <leader>f <cmd>lua require('telescope.builtin').fd()<cr>
nnoremap <leader>g <cmd>lua require('telescope.builtin').live_grep()<cr>
