" ============================================================================
" NeoVim Main Configuration Entry Point
" ============================================================================
" Purpose: Load shared and environment-specific configurations.
" Sourced by: Terminal NeoVim, VSCode NeoVim Extension
" ============================================================================

" ----------------------------------------------------------------------------
" Plugin Management (vim-plug)
" ----------------------------------------------------------------------------
" Install vim-plug if not present
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged') " directory for plugins

" ----------------------------------------------------------------------------
" Plugins
" ----------------------------------------------------------------------------
Plug 'catppuccin/nvim' " Catppuccin colorscheme
Plug 'lewis6991/gitsigns.nvim' " Git gutter signs
Plug 'preservim/vim-markdown' " Markdown syntax highlighting
Plug 'tpope/vim-commentary' " Comment toggling with gcc
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate', 'branch': 'master'}
Plug 'morhetz/gruvbox' " Gruvbox colorscheme
Plug 'loctvl842/monokai-pro.nvim' " Monokai Pro colorscheme
Plug 'junegunn/fzf' " Enable FZF Base within neovim
Plug 'junegunn/fzf.vim' " Enables neovim specific key bindings for FZF
Plug 'preservim/vimux' " Tmux integration
Plug 'williamboman/mason.nvim' " LSP installer
Plug 'neovim/nvim-lspconfig' " LSP configuration

call plug#end() " end of plugin management

" ----------------------------------------------------------------------------
" LSP Setup
" ----------------------------------------------------------------------------
lua << EOF
require('mason').setup()

vim.lsp.config['kotlin_language_server'] = {
  cmd = { 'kotlin-language-server' },
  filetypes = { 'kotlin' },
  root_markers = { 'settings.gradle.kts', 'settings.gradle', 'build.gradle.kts', 'build.gradle', '.git' },
}

vim.lsp.enable('kotlin_language_server')
EOF

" Go to definition keybinding
nnoremap <C-d> <cmd>lua vim.lsp.buf.definition()<CR>

" ----------------------------------------------------------------------------
" Source Shared Configurations (for all environments)
" ----------------------------------------------------------------------------
source ~/.config/nvim/keyboard-layout.vim
source ~/.config/nvim/shared-mappings.vim

" ----------------------------------------------------------------------------
" Source Terminal-Specific Configuration
" ----------------------------------------------------------------------------
" Only load these settings when NOT running inside VSCode.
" The 'g:vscode' variable is set by the vscode-neovim extension.
if !exists('g:vscode')
  source ~/.config/nvim/terminal.vim
endif

