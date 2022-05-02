filetype on 
filetype plugin on
filetype indent on
syntax enable

set number
set nowrap
set ignorecase
set smartcase
set incsearch

set clipboard+=unnamedplus
set nobackup
set noswapfile

set autoindent
set smartindent
set expandtab tabstop=2 shiftwidth=2 softtabstop=2 

let mapleader=";"

" Save on write 
autocmd TextChanged,TextChangedI *
    \ if &buftype ==# '' || &buftype == 'acwrite' |
    \     silent write |
    \ endif

:command Cheat split ~/notes/cheatsheet.md  

call plug#begin('~/.config/nvim/plugged')

" Small plugins

Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

Plug 'kyazdani42/nvim-web-devicons'

Plug 'itchyny/lightline.vim'

Plug 'ggandor/lightspeed.nvim'

Plug 'tpope/vim-commentary'

" Big plugins

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

nnoremap <leader>f <cmd>lua require('telescope.builtin').fd()<cr>
nnoremap <leader>g <cmd>lua require('telescope.builtin').live_grep()<cr>

" Plug 'github/copilot.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}


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

" Applying codeAction to the selected region.
xmap <buffer> <leader>a  <Plug>(coc-codeaction-selected)j
nmap <buffer> <leader>a  <Plug>(coc-codeaction-selected)j

call plug#end()

set termguicolors
set background=dark
colorscheme tokyonight

set noshowmode

let g:lightline = {
      \ 'colorscheme': 'tokyonight',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'filename' ] ],
      \   'right': [ [ 'percent' ],
      \              [ 'coc_info'],
      \              [ 'coc_hint'],
      \              [ 'coc_warning'],
      \              [ 'coc_error'] ]
      \ },
      \ 'component_expand': {
      \   'coc_warning': 'CocWarnings',
      \   'coc_error': 'CocErrors',
      \   'coc_info'         : 'CocInfos',
      \   'coc_hint'         : 'CocHints',
      \ },
      \ }


let g:lightline.component_type = {
\   'coc_error'        : 'error',
\   'coc_warning'      : 'warning',
\   'coc_info'         : 'tabsel',
\   'coc_hint'         : 'middle',
\ }

function! s:get_coc_diagnostic(kind, sign) abort
  let info = get(b:, 'coc_diagnostic_info', 0)
  if empty(info) || get(info, a:kind, 0) == 0
    return ''
  endif
  return printf('%s%d', a:sign, info[a:kind])
endfunction

function! CocErrors() abort
  return s:get_coc_diagnostic('error', 'E')
endfunction
function! CocWarnings() abort
  return s:get_coc_diagnostic('warning', 'W')
endfunction
function! CocInfos() abort
  return s:get_coc_diagnostic('information', 'I')
endfunction
function! CocHints() abort
  return s:get_coc_diagnostic('hint', 'H')
endfunction

autocmd User CocDiagnosticChange call lightline#update()
