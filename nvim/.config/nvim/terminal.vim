" ============================================================================
" Terminal-Specific NeoVim Configuration
" ============================================================================
" Purpose: Settings for NeoVim running in a terminal environment.
" This file is NOT sourced by VSCode or IntelliJ.
" ============================================================================

" ----------------------------------------------------------------------------
" Basic Editor Behavior
" ----------------------------------------------------------------------------
set number
set relativenumber
set clipboard=unnamedplus  " Use system clipboard
set mouse=a                " Enable mouse support
set scrolloff=8            " Keep 8 lines of context around the cursor
set sidescrolloff=8
set termguicolors          " Enable 24-bit RGB color
set ignorecase             " Ignore case when searching
set smartcase              " Override ignorecase if search pattern has uppercase
set incsearch              " Show matches as you type
set showmatch              " Highlight matching brackets
set foldmethod=expr
set foldexpr=v:lua.vim.treesitter.foldexpr()
set foldlevelstart=99      " Start with all folds open

filetype plugin indent on  " Enables vim's filetype detection to load language specific indentation rules

" ----------------------------------------------------------------------------
" Indentation
" ----------------------------------------------------------------------------
set expandtab
set tabstop=4
set shiftwidth=4
set smartindent

" ----------------------------------------------------------------------------
" Appearance
" ----------------------------------------------------------------------------
set background=dark
colorscheme gruvbox

" ----------------------------------------------------------------------------
" Git Signs Configuration
" ----------------------------------------------------------------------------
lua << EOF
require('gitsigns').setup()
EOF

" ----------------------------------------------------------------------------
" Tree-sitter Configuration
" ----------------------------------------------------------------------------
lua << EOF
require('nvim-treesitter.configs').setup {
  ensure_installed = { "kotlin", "java", "javascript", "typescript", "vim", "yaml", "xml", "json", "json5", "jsonc" },
  highlight = {
    enable = true,
  },
}
EOF

" ----------------------------------------------------------------------------
" File Operation Mappings
" ----------------------------------------------------------------------------
nnoremap <leader>ww :w<CR>
nnoremap <leader>wq :w<CR>:q<CR>
nnoremap <leader>q :q<CR>

" ----------------------------------------------------------------------------
" Fuzzy Finding Mappings (FZF)
" ----------------------------------------------------------------------------
nnoremap <leader>pf :Files<CR>
nnoremap <leader>pb :Buffers<CR>
nnoremap <leader>pt :Rg<CR>

" ----------------------------------------------------------------------------
" Vimux Configuration
" ----------------------------------------------------------------------------
let g:VimuxHeight = "15"
let g:VimuxOrientation = "v"
let g:VimuxUseNearest = 0

" ----------------------------------------------------------------------------
" Project Runner (Gradle/Command Execution)
" ----------------------------------------------------------------------------
lua << EOF
vim.keymap.set('n', '<leader>pr', function()
  vim.ui.input({ prompt = 'Command: ' }, function(input)
    if input then
      vim.fn.VimuxRunCommand(input)
    end
  end)
end)
EOF
