"tab stop
set ts=2 

"soft tab stop
set sts=2

"expand tab
set et 

" when indenting with '>', use 2 spaces width
set shiftwidth=2

set number

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

" Initialize plugin system
call plug#end()
