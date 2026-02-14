" ============================================================================
" Terminal-Specific NeoVim Configuration
" ============================================================================
" Purpose: Settings for NeoVim running in a terminal environment.
" This file is NOT sourced by VSCode or IntelliJ.
"
" Structure:
"   1. Common terminal settings (editor behavior, appearance, plugins)
"   2. Keyboard-specific mappings (sourced conditionally)
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
" LSP Navigation Mappings (Common)
" ----------------------------------------------------------------------------
nnoremap <C-d> <cmd>lua vim.lsp.buf.definition()<CR>

" ----------------------------------------------------------------------------
" File Operation Mappings
" ----------------------------------------------------------------------------
lua << EOF
vim.keymap.set('n', '<leader>ww', function()
  local success, err = pcall(function()
    require('conform').format({ timeout_ms = 3000, lsp_fallback = true })
  end)
  if not success then
    print("Format error: " .. tostring(err))
  end
  vim.cmd('w!')
end)
EOF

nnoremap <leader>wq :w!<CR>:q<CR>
nnoremap <leader>q :q<CR>

" ----------------------------------------------------------------------------
" Fuzzy Finding Mappings (FZF)
" ----------------------------------------------------------------------------
" Use fd (respects gitignore automatically)
let $FZF_DEFAULT_COMMAND = 'fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'

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

" ----------------------------------------------------------------------------
" Quick Temp File Creation
" ----------------------------------------------------------------------------
lua << EOF
vim.keymap.set('n', '<leader>pn', function()
  local random = math.random(10000, 99999)
  local tmpfile = '/tmp/temp_' .. random .. '.json'
  vim.cmd('enew')
  vim.cmd('file ' .. tmpfile)
  vim.bo.filetype = 'json'
end)
EOF

" ----------------------------------------------------------------------------
" Source Keyboard-Specific Terminal Mappings
" ----------------------------------------------------------------------------
if g:keyboard_layout == "SE"
    source ~/.config/nvim/terminal-se.vim
elseif g:keyboard_layout == "US"
    source ~/.config/nvim/terminal-us.vim
endif
