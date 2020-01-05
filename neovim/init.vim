call plug#begin('~/.vim/plugged')
colo delek

let mapleader = ","

" easy commenting
Plug 'scrooloose/nerdcommenter'

noremap ccl <C-w>h :q <CR>

" go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
autocmd FileType .go |
  noremap <Leader>bb :GoBuild <CR> |
  noremap <Leader>rr :GoRun <CR>

" autocomplete
Plug 'Valloric/YouCompleteMe'

" table formatter
Plug 'dhruvasagar/vim-table-mode'

" misc

set tabstop=2
set shiftwidth=2
set expandtab
call plug#end()
