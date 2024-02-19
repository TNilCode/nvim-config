call plug#begin()

" Add sonokai theme
Plug 'sainnhe/sonokai'

" Add autosave
Plug 'Pocco81/AutoSave.nvim'

" Add LSP
Plug 'neovim/nvim-lspconfig'

" Add LSP completion
Plug 'hrsh7th/nvim-compe'

" Add Telescope
Plug 'nvim-lua/popup.nvim' " Required for telescope
Plug 'nvim-lua/plenary.nvim' " Required for telescope
Plug 'nvim-telescope/telescope.nvim' " Telescope

call plug#end()

" Settings
colorscheme sonokai       " Set colorscheme
set number                " Show line numbers
set colorcolumn=80
set tabstop=2
set clipboard+=unnamedplus

" AutoSave settings
let g:auto_save = 1
let g:auto_save_events = ['InsertLeave', 'TextChanged']


" nvim-compe settings
lua << EOF
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    spell = true;
    tags = true;
    snippets_nvim = true;
  };
}

local lspconfig = require('lspconfig');

-- JavaScript and TypeScript
lspconfig.tsserver.setup{}

-- Rust
lspconfig.rust_analyzer.setup{}

-- Java
lspconfig.jdtls.setup{}

-- Python
lspconfig.pyright.setup{}

-- Golang
lspconfig.gopls.setup{}

-- C++ and C
lspconfig.clangd.setup{}
EOF

" Key mappings for Telescope
nnoremap <Leader>f :Telescope find_files<CR>
nnoremap <Leader>g :Telescope live_grep<CR>
nnoremap <Leader>b :Telescope buffers<CR>
nnoremap <Leader>h :Telescope help_tags<CR>

" Key mappings for nvim-compe
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

