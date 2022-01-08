set number

call plug#begin('~/.vim/plugged')

"syntastic syntax checker
Plug'https://github.com/vim-syntastic/syntastic.git'

"Latex support
Plug'https://github.com/lervag/vimtex.git'

"Rust support
Plug'https://github.com/rust-lang/rust.vim.git'
call plug#end()


"github told me to add this ->
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"<- github told me to add this

syntax enable

filetype plugin indent on
