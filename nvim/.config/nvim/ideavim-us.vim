" ============================================================================
" IdeaVim US Keyboard Mappings
" ============================================================================
" Purpose: CTRL-based prefix mappings for US keyboard layout (no ALT key)
" Prefix: C-a (CTRL+a) for navigation, C-S (CTRL+SHIFT) for special operations
" ============================================================================
"
" ----------------------------------------------------------------------------
" Navigation History Mappings
" ----------------------------------------------------------------------------
" Navigate backward and forward through code navigation history

nnoremap <C-a>[ :action Back<CR>
nnoremap <C-a>] :action Forward<CR>

" ----------------------------------------------------------------------------
" Code Navigation Mappings
" ----------------------------------------------------------------------------
" Quick access to code navigation features

nnoremap <C-d> :action GotoDeclaration<CR>

" ----------------------------------------------------------------------------
" Git VCS Mappings
" ----------------------------------------------------------------------------
" Git operations using IntelliJ's VCS actions with CTRL+a+g prefix

nnoremap <C-a>gu :action Vcs.RollbackChangedLines<CR>
nnoremap <C-a>gj :action VcsShowNextChangeMarker<CR>
nnoremap <C-a>gk :action VcsShowPrevChangeMarker<CR>
nnoremap <C-a>gp :action Vcs.Push<CR>
nnoremap <C-a>gf :action Git.Fetch<CR>
nnoremap <C-a>gc :action CheckinFiles<CR>
nnoremap <C-a>gd :action Diff.ShowStandaloneDiff<CR>
nnoremap <C-a>ga :action Annotate<CR>

" ----------------------------------------------------------------------------
" Diff Navigation Mappings
" ----------------------------------------------------------------------------
" Navigate between diff changes with CTRL+SHIFT+J/K

nnoremap <C-S-J> :action NextDiff<CR>
nnoremap <C-S-K> :action PreviousDiff<CR>

" ----------------------------------------------------------------------------
" Debug Mappings
" ----------------------------------------------------------------------------
" Debug operations with CTRL+SHIFT+d prefix

nnoremap <C-S-d>t :action ToggleLineBreakpoint<CR>
nnoremap <C-S-d>a :action AndroidConnectDebuggerAction<CR>
nnoremap <C-S-d>b :action ViewBreakpoints<CR>

" ----------------------------------------------------------------------------
" Split Management Mappings
" ----------------------------------------------------------------------------
" Manage editor splits with CTRL+a prefix

nnoremap <C-a>v :action SplitVertically<CR> :action MoveEditorToOppositeTabGroup<CR> :action CloseContent<CR>
nnoremap <C-a>- :action SplitHorizontally<CR> :action MoveEditorToOppositeTabGroup<CR> :action CloseContent<CR>
nnoremap <C-a>u :action Unsplit<CR>

" ----------------------------------------------------------------------------
" Window and Tab Navigation Mappings
" ----------------------------------------------------------------------------
" Navigate between window splits and tabs with CTRL+a prefix

nnoremap <C-a>L :action NextSplitter<CR>
nnoremap <C-a>H :action PrevSplitter<CR>
nnoremap <C-a>l :action NextTab<CR>
nnoremap <C-a>h :action PreviousTab<CR>
