" ============================================================================
" Keyboard Layout Configuration
" ============================================================================
" Purpose: Centralized keyboard layout selection and key mapping configuration
"
" This file provides a single source of truth for keyboard layout selection.
" Supported layouts: SE (Swedish), US (United States)
"
" Usage:
"   1. Set g:keyboard_layout to "SE" or "US" below
"   2. Restart your editor or run: :source ~/.config/nvim/keyboard-layout.vim
"   3. All dependent mappings will automatically use the correct keys
" ============================================================================

" Configuration: Set your keyboard layout here
" Valid values: "SE" or "US"
let g:keyboard_layout = "US"

" Apply layout-specific settings
if g:keyboard_layout == "SE"
    " Swedish keyboard layout
    let mapleader = "å"
    
    " Map € (Euro sign on SE keyboard) to move to end of line
    " This provides an ergonomic alternative to $ for SE keyboard users
    nnoremap € $
    vnoremap € $
    
    echo "Keyboard layout: SE (Leader: å, End of line: €)"
elseif g:keyboard_layout == "US"
    " US keyboard layout
    let mapleader = "["
    
    " $ is already the standard Vim end-of-line key, no remapping needed
    
    echo "Keyboard layout: US (Leader: [, End of line: $)"
else
    " Invalid layout specified, fall back to US
    echo "Warning: Invalid keyboard layout '" . g:keyboard_layout . "'. Defaulting to US."
    echo "Valid options: 'SE' or 'US'"
    let mapleader = "["
endif
