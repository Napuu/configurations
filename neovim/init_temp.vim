call plug#begin('~/.vim/plugged')

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

" color theme
Plug 'altercation/vim-colors-solarized'

Plug 'majutsushi/tagbar'
nmap <Leader>b :TagbarToggle<CR>
Plug 'kien/ctrlp.vim'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
nnoremap <leader>t :CtrlPTag<cr>

Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

imap ii <Esc>
" misc

set tabstop=2
set shiftwidth=2
set expandtab
call plug#end()

" color theme things outside plug
syntax enable
set background=dark
colorscheme solarized
