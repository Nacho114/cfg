call plug#begin('~/.vim/plugged')

Plug 'asvetliakov/vim-easymotion'

endif

call plug#end()

" define leader for easy-motion
nnoremap <SPACE> <Nop>
let mapleader=" "

" Better Navigation
nnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
xnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
nnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
xnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
nnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
xnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
nnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>
xnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>

" switch tabs (same as gt & gT)
nnoremap <Leader><tab> :call VSCodeNotify('workbench.action.previousEditor')<CR>
nnoremap <Tab> :call VSCodeNotify('workbench.action.nextEditor')<CR>

" Commentary (if in neovim would use vim-commentary)
xmap gc  <Plug>VSCodeCommentary
nmap gc  <Plug>VSCodeCommentary
omap gc  <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine

" Needed for quickfix? but nut sure why, recommende dy the neovim doc
nnoremap z= <Cmd>call VSCodeNotify('keyboard-quickfix.openQuickFix')<CR>

" Use system copy with vim
set clipboard^=unnamed,unnamedplus " use the clipboards of vim and win
set paste               " Paste from a windows or from vim
