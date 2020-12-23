"
" vim-plug config
"
call plug#begin('~/.local/share/nvim/plugged')

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }             " go support
Plug 'scrooloose/nerdTree'                                     " directory tree
Plug 'bling/vim-airline'                                       " better tab line
Plug 'racer-rust/vim-racer'                                    " rust auto-complete
Plug 'rust-lang/rust.vim'                                      " rust support
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }  " code completion
Plug 'rstacruz/vim-closer'                                     " Auto close brackets on enter

call plug#end()

"
" Tabs as 4 spaces
"
set tabstop=4
set shiftwidth=4
set expandtab
 
"
" Disable arrow keys
"
inoremap <C-k>   <up>
inoremap <C-j>   <down>

noremap <up>     <nop>
noremap <down>   <nop>
noremap <left>   <nop>
noremap <right>  <nop>

inoremap <up>    <nop>
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>

"
" Enable absolute line numbers
"
set number

"
" Change line number color
"
highlight LineNr ctermfg=6


"
" Open NerdTree with <C-n>
"
nmap <C-n> :NERDTreeToggle<CR> 

"
" vim-racer config
"
set hidden
let g:racer_cmd = "/home/user/.cargo/bin/racer"

"
" rust configuration
"
let g:rustfmt_autosave = 1

"
" Deoplete
"
let g:deoplete#enable_at_startup = 1

"
" vim-go
"
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_types = 1
