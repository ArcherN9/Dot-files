" ============================================================================
" Shared Mappings Configuration
" ============================================================================
" Purpose: Core NeoVim navigation and editing mappings compatible with both
"          IdeaVim (IntelliJ) and VSCode NeoVim extension
"
" Constraints:
"   - Uses only standard NeoVim/Vim commands
"   - No editor-specific actions (e.g., no :action commands)
"   - Must work in IdeaVim, VSCode NeoVim extension, and standalone NeoVim
"
" Dependencies:
"   - keyboard-layout.vim (for mapleader configuration)
" ============================================================================

" ----------------------------------------------------------------------------
" Navigation Remaps
" ----------------------------------------------------------------------------
" Remap navigation keys for more efficient movement
" K -> previous paragraph, J -> next paragraph
" L -> forward word, H -> backward word

nnoremap K {
nnoremap J }
nnoremap L w
nnoremap H b

" ----------------------------------------------------------------------------
" Window Navigation
" ----------------------------------------------------------------------------
" Navigate between split windows using leader + hjkl
" These mappings work with standard Vim window commands

nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l