" ============================================================================
" Terminal NeoVim SE Keyboard Mappings
" ============================================================================
" Purpose: ALT-based prefix mappings for Swedish keyboard layout
" Prefix: M-g (ALT+g) for git operations
" ============================================================================

" ----------------------------------------------------------------------------
" Git Signs Mappings
" ----------------------------------------------------------------------------
lua << EOF
require('gitsigns').setup({
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns
    
    vim.keymap.set('n', '<M-g>j', gs.next_hunk, { buffer = bufnr })
    vim.keymap.set('n', '<M-g>k', gs.prev_hunk, { buffer = bufnr })
    vim.keymap.set('n', '<M-g>u', gs.reset_hunk, { buffer = bufnr })
    vim.keymap.set('n', '<M-g>d', gs.preview_hunk, { buffer = bufnr })
    vim.keymap.set('n', '<M-g>a', gs.blame_line, { buffer = bufnr })
  end
})
EOF
