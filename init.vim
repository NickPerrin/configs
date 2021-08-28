" vim-plug config
call plug#begin('~/.local/share/nvim/plugged')

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }             " go support
Plug 'scrooloose/nerdTree'                                     " directory tree
Plug 'bling/vim-airline'                                       " better tab line
"Plug 'racer-rust/vim-racer'                                    " rust auto-complete
"Plug 'rust-lang/rust.vim'                                      " rust support
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }  " code completion
Plug 'rstacruz/vim-closer'                                     " Auto close brackets on enter
Plug 'neovim/nvim-lspconfig'                                   " lsp client configs
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}    " treesitter :TSInstall <lanugage>
Plug 'nvim-lua/plenary.nvim'                                   "telescope and dependency
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

" Tabs as 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab
 
" Disable arrow keys
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

" line numbers
set number
highlight LineNr ctermfg=darkgrey

" Color Column
set colorcolumn=120
highlight ColorColumn ctermbg=darkgrey


" Open NerdTree with <C-n>
nmap <C-n> :NERDTreeToggle<CR> 

" vim-racer config
"set hidden
"let g:racer_cmd = "/home/user/.cargo/bin/racer"

" rust configuration
"let g:rustfmt_autosave = 1

" Deoplete
let g:deoplete#enable_at_startup = 1

" vim-go
"let g:go_highlight_function_calls = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_functions = 1
"let g:go_highlight_function_parameters = 1
"let g:go_highlight_types = 1

" telescope
nnoremap <space>ff <cmd>Telescope find_files<cr>
nnoremap <space>fg <cmd>Telescope live_grep<cr>
nnoremap <space>fb <cmd>Telescope buffers<cr>
nnoremap <space>fh <cmd>Telescope help_tags<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { }, -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  --buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
end

-- python
nvim_lsp.pyright.setup {
    on_attach = on_attach
}

-- elixir
nvim_lsp.elixirls.setup {
    on_attach = on_attach,
    cmd = { "/usr/bin/lsp_client/elixir/language_server.sh" },
}

EOF
