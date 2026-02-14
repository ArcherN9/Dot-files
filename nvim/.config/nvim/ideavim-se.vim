" ============================================================================
" IdeaVim SE Keyboard Mappings
" ============================================================================
" Purpose: ALT-based prefix mappings for Swedish keyboard layout
" Prefix: M-a (ALT+a) for navigation, M-S (ALT+SHIFT) for special operations
" ============================================================================
"
" ----------------------------------------------------------------------------
" Navigation History Mappings
" ----------------------------------------------------------------------------
" Navigate backward and forward through code navigation history

nnoremap <M-a>[ :action Back<CR>
nnoremap <M-a>] :action Forward<CR>

" ----------------------------------------------------------------------------
" Code Navigation Mappings
" ----------------------------------------------------------------------------
" Quick access to code navigation features

nnoremap <M-d> :action GotoDeclaration<CR>

" ----------------------------------------------------------------------------
" Git VCS Mappings
" ----------------------------------------------------------------------------
" Git operations using IntelliJ's VCS actions with ALT+a+g prefix

nnoremap <M-a>gu :action Vcs.RollbackChangedLines<CR>
nnoremap <M-a>gj :action VcsShowNextChangeMarker<CR>
nnoremap <M-a>gk :action VcsShowPrevChangeMarker<CR>
nnoremap <M-a>gp :action Vcs.Push<CR>
nnoremap <M-a>gf :action Git.Fetch<CR>
nnoremap <M-a>gc :action CheckinFiles<CR>
nnoremap <M-a>gd :action Diff.ShowStandaloneDiff<CR>
nnoremap <M-a>ga :action Annotate<CR>

" ----------------------------------------------------------------------------
" Diff Navigation Mappings
" ----------------------------------------------------------------------------
" Navigate between diff changes with ALT+SHIFT+J/K

nnoremap <M-S-J> :action NextDiff<CR>
nnoremap <M-S-K> :action PreviousDiff<CR>

" ----------------------------------------------------------------------------
" Debug Mappings
" ----------------------------------------------------------------------------
" Debug operations with ALT+SHIFT+d prefix

nnoremap <M-S-d>t :action ToggleLineBreakpoint<CR>
nnoremap <M-S-d>a :action AndroidConnectDebuggerAction<CR>
nnoremap <M-S-d>b :action ViewBreakpoints<CR>

" ----------------------------------------------------------------------------
" Split Management Mappings
" ----------------------------------------------------------------------------
" Manage editor splits with ALT+a prefix

nnoremap <M-a>v :action SplitVertically<CR> :action MoveEditorToOppositeTabGroup<CR> :action CloseContent<CR>
nnoremap <M-a>- :action SplitHorizontally<CR> :action MoveEditorToOppositeTabGroup<CR> :action CloseContent<CR>
nnoremap <M-a>u :action Unsplit<CR>

" ----------------------------------------------------------------------------
" Window and Tab Navigation Mappings
" ----------------------------------------------------------------------------
" Navigate between window splits and tabs with ALT+a prefix

nnoremap <M-a>L :action NextSplitter<CR>
nnoremap <M-a>H :action PrevSplitter<CR>
nnoremap <M-a>l :action NextTab<CR>
nnoremap <M-a>h :action PreviousTab<CR>
