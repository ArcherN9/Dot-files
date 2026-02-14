" ============================================================================
" Terminal NeoVim US Keyboard Mappings
" ============================================================================
" Purpose: CTRL-based prefix mappings for US keyboard layout
" Prefix: C-g (CTRL+g) for git operations
" ============================================================================

" ----------------------------------------------------------------------------
" Git Signs Mappings
" ----------------------------------------------------------------------------
lua << EOF
require('gitsigns').setup({
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns
    
    vim.keymap.set('n', '<C-g>j', gs.next_hunk, { buffer = bufnr })
    vim.keymap.set('n', '<C-g>k', gs.prev_hunk, { buffer = bufnr })
    vim.keymap.set('n', '<C-g>u', gs.reset_hunk, { buffer = bufnr })
    vim.keymap.set('n', '<C-g>d', gs.preview_hunk, { buffer = bufnr })
    vim.keymap.set('n', '<C-g>a', gs.blame_line, { buffer = bufnr })
  end
})
EOF
