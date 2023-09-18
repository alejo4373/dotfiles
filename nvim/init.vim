"tab stop
set ts=2 

"soft tab stop
set sts=2

"expand tab
set et 

" when indenting with '>', use 2 spaces width
set shiftwidth=2

set number

filetype plugin indent on

" Load global configs
lua require("globals")

" Load other custom (mine) configs
lua require("other")
