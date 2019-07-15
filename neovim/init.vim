call plug#begin('~/.vim/plugged')
colo delek

let mapleader = ","
" typescript stuff
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/denite.nvim'
let g:deoplete#enable_at_startup = 1

" prettier
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

Plug 'posva/vim-vue'

" easy commenting
Plug 'scrooloose/nerdcommenter'

noremap ccl <C-w>h :q <CR>

" go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
autocmd FileType .go |
  noremap <Leader>bb :GoBuild <CR> |
  noremap <Leader>rr :GoRun <CR>

" misc

set tabstop=2
set shiftwidth=2
set expandtab
call plug#end()
