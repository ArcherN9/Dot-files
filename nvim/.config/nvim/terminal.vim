" ============================================================================
" Terminal-Specific NeoVim Configuration
" ============================================================================
" Purpose: Settings for NeoVim running in a terminal environment.
" This file is NOT sourced by VSCode or IntelliJ.
" ============================================================================

" ----------------------------------------------------------------------------
" Basic Editor Behavior
" ----------------------------------------------------------------------------
syntax on
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
colorscheme catppuccin-mocha

" ----------------------------------------------------------------------------
" Git Signs Configuration
" ----------------------------------------------------------------------------
lua << EOF
require('gitsigns').setup()
EOF
