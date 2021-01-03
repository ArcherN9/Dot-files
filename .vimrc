"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""d
" Maintainer: ArcherN9

" Sets up vim dependency installation through pathogen.
" All packages under ~/.vim/bundle are installed automatically
execute pathogen#infect()

"  A list of all plugins installed is mentioned below
"  Vim-Airline 	        - https://github.com/vim-airline/vim-airline
"  onedark.vim 	        - https://github.com/joshdick/onedark.vim
"  indentLine		    - https://github.com/Yggdroot/indentLine
"  vim-markdown	        - https://github.com/plasticboy/vim-markdown
"  vim-json		        - https://github.com/elzr/vim-json
"  vim-gitgutter	    - https://github.com/airblade/vim-gitgutter
"  omnisharp-vim	    - https://github.com/OmniSharp/omnisharp-vim
"  vim-coc              - https://github.com/neoclide/coc.nvim
"  Goyo.vim             - https://github.com/junegunn/goyo.vim
"  Limelight            - https://github.com/junegunn/limelight.vim
"  fern-renderer-nerdfont.vim    - https://github.com/lambdalisue/fern-renderer-nerdfont.vim
"  glyph-palette        - https://github.com/lambdalisue/glyph-palette.vim
"  Fern.vim             - https://github.com/lambdalisue/fern.vim
"  dart-vim-plugin      - https://github.com/dart-lang/dart-vim-plugin
"  Coc-Fzf              - https://github.com/antoinemadec/coc-fzf
"  vim-commentary       - https://github.com/tpope/vim-commentary
"  kotlin-vim           - https://github.com/udalov/kotlin-vim
"  neomake              - https://github.com/neomake/neomake
"  vim-floaterm         - https://github.com/voldikss/vim-floaterm
" -----------------------------------------------------------------------
" Standard configurations from Vim that are supported OTB. No plugins required

syntax enable 				" Turn on syntax highlighting.
filetype plugin on                      " Enable vim to recognize different file types
filetype indent on			" Unknown import - From omnisharp Vim
set showcmd                             " Display an incomplete command on the bottom right corner
set number                              " Show line numbers.
set relativenumber                      " Show relative line numbers
set cursorline                          " Highlight current line
set laststatus=2			" The height of the status bar on the bottom
set numberwidth=3			" The width of the bar on the left edge
set autoread				" Set to auto read when a file is changed from the outside
set so=7				    " Set 7 lines to the cursor - when moving vertically using j/k
set mouse=a                 " Allow to scroll in the preview mode
set backspace=eol,start,indent		" Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l
set ignorecase				" Ignore case when searching
set smartcase				" When searching try to be smart about cases
set hlsearch				" Highlight search results
set incsearch				" Makes search act like search in modern browsers
set lazyredraw				" Don't redraw while executing macros (good performance config)
set magic				" For regular expressions turn magic on
set showmatch				" Show matching brackets when text indicator is over them
set noerrorbells			" No annoying sound on errors
set novisualbell
set t_vb=
set tm=500
set nobackup				" Turn backup off, since most stuff is in SVN, git etc. anyway
set nowb
set noswapfile
set ai 					" Auto indent
set si 					" Smart indent
let g:loaded_ctrlp = 1 			" Disables the defauly fuzzy finder plugin ctrlp.vim
set tabstop=4				" Sets the indentation to 4 spaces and not a tab character
set shiftwidth=4
set expandtab
set encoding=utf8       " UTF8 is required to show glyphs
try
	colorscheme nord
catch
endtry
let g:vim_markdown_conceal = 0          " Disable conceal. Though a feature to inherently assist to easily read files, I find it difficult to edit markdown elements using this feature.
let g:vim_markdown_conceal_code_blocks = 0

" Set the background as a Dark theme
set background=dark						
" Setup a similar theme for Airline too
let g:airline_theme='base16_nord'

" Customize the map leader. Wherever <leader> shows up on vimrc
" this is the key that replaces it when dealing with hot keys
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file

let mapleader = "\\"

"  Shortcut keys for saving files
" Fast saving
nmap <silent><leader>w :w!<cr>
" Fast saving and quit
nmap <silent><leader>wq :wq!<cr>
" Fast Quit without saving
nmap <silent><leader>qq :q!<cr>

" Tab management with VIM
" Useful mappings for managing tabs
map <leader>q :tabclose<cr>
map <leader>1 :tabprevious<cr>
map <leader>2 :tabnext<cr>

" Move the current line around
nnoremap <S-Down> :m+<CR>
nnoremap <S-Up> :m-2<CR>

" Remap jump configurations
" remaps "Jump to previous vacant line" from { to K (Shift + K) 
nnoremap K {
" Remaps "Jump to next vacant line" from } to J (Shift + J)
nnoremap J }
" Remaps jump to next word from Shift --> to L (Shift + L)
nnoremap L <S-Right>
" Remaps jump to end of previous word from Shift <-- to H (Shift + H)
nnoremap H <S-Left>

" Use RegEx search in the current document
map <C-f> /
map <silent><C-f>n :noh<cr>

" Pressing ,ss will toggle and untoggle spell checking
map <leader>sc :setlocal spell!<cr>

" Enable termguicolors if enabled during compilation
" Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
" If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
" (see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
	if (has("nvim"))
             "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
             let $NVIM_TUI_ENABLE_TRUE_COLOR=1
         endif
	"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
	"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
	" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
	if (has("termguicolors"))
              set termguicolors
        endif
endif

" The following maps is related to Window management. Specifically moving the
" focus around when dealing with multiple windows 

" Moves the current focus to the window on the left
nnoremap <C-h> <C-w>h
" Moves the current focus to the window below
nnoremap <C-j> <C-w>j
" Moves the current focus to the window up
nnoremap <C-k> <C-w>k
" Moves the current focus to the window on the right
nnoremap <C-l> <C-w>l
" -----------------------------------------------------------------------
" Vim-Airline configuration options

" Smarter Tabline: Automatically displays all buffers when there's only one tab open
let g:airline#extensions#tabline#enabled = 0 

" -----------------------------------------------------------------------
"  Vim-Indentline Configuration options
"
" Enable indent markings on files
let g:indentLine_char = '¦'
" -----------------------------------------------------------------------
"  Vim-Markdown configuration options
"
" Folding is enabled by default. Disable the folding configuration
let g:vim_markdown_folding_disabled = 1	

" Allow for the TOC window to auto-fit when it's possible for it to shrink. It never 
" increases its default size (half screen), it only shrinks.
let g:vim_markdown_toc_autofit = 1

" Highlight JSON front matter as used by Hugo. | Requires vim-json
let g:vim_markdown_json_frontmatter = 1

" Use filetype name as fenced code block languages for syntax highlighting. If you 
" want to use different name from filetype, you can add it in your .vimrc like so. Default is ['c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini']
let g:vim_markdown_fenced_languages = ['csharp=cs', 'gradle=gradle']

" Strikethrough uses two tildes
let g:vim_markdown_strikethrough = 1

" If you follow a link like this [link text](link-url) using the ge shortcut, this option will automatically save any edits you made before moving you
let g:vim_markdown_autowrite = 1

" Automatically inserting bulletpoints can lead to problems when wrapping text, so it can be disabled:
let g:vim_markdown_auto_insert_bullets = 1

" In that case, you probably also want to set the new list item indent to 0 as well, or you will have to remove an indent each time you add a new list item:
" let g:vim_markdown_new_list_item_indent = 4
" -----------------------------------------------------------------------
"  Vim-JSON configuration options
"
" We don't want concealing on JSON. We'll disable it
let g:vim_json_syntax_conceal = 0

" -----------------------------------------------------------------------
" git-Gutter Configuration Options
"
" Enable GitGutter by default for all session
let g:gitgutter_enabled                 = 1                         
" default value (otherwise)
let g:gitgutter_max_signs               = -1                        
" gitGutter default key mappings will not be loaded
let g:gitgutter_map_keys                = 0                         
" Modify the sign that is used to depict deleted lines from a hunk
let g:gitgutter_sign_removed            = '-'
" Enable floating windows to display GitGutter values rather than a separate
" window at the bottom of the screen
let g:gitgutter_preview_win_floating    = 1
highlight GitGutterChange ctermfg=Yellow
highlight GitGutterDelete ctermfg=Red
highlight GitGutterAdd    ctermfg=Green

" Displays GitDiff in a popup floating window below the currently selected
" line. 
nmap <C-g>p <Plug>(GitGutterPreviewHunk)

" Deletes the modifications carried out to a hunk when the cursor is hovering
" over a modified hunk.
nmap <C-g>u <Plug>(GitGutterUndoHunk)

" At times, it is important to just view Modifications made in a file. Using
" this section, a user may iteratively jump to different hunks within a file.
nmap <C-g><Down> <Plug>(GitGutterNextHunk)
nmap <C-g><Up> <Plug>(GitGutterPrevHunk)

" To use this, place the editor in Visual mode, select the code section that
" is to be staged and stage the changes.
" This lets a file be staged incrementally to accommodate multiple changes
" within a file with different commit messageds
nmap <C-g>s <Plug>(GitGutterStageHunk)

" -----------------------------------------------------------------------
" Omnisharp Configuration Options
"
" Use the stdio version of OmniSharp-roslyn - this is the default
let g:OmniSharp_server_stdio = 1

" On Mac OS, using Mono is a requirement
let g:OmniSharp_server_use_mono = 1
" -----------------------------------------------------------------------
" CoC Configuration Options
"
" Disables startup warning that Coc could not find plugin configuration files
let g:coc_disable_startup_warning = 1

" Sample configuration fetched from CoC
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it gets difficult to see which line
" number needs to be jumped to while performing edits to multiple lines
" in a file
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <control-space> to trigger completion.
inoremap <silent><expr> <c-@> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Tab management with VIM
" Useful mappings for managing tabs
map <leader>q :tabclose<cr>
map <leader>1 :tabprevious<cr>
map <leader>2 :tabnext<cr>

" GoTo code navigation.
nmap <silent> gk <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap keys for applying codeAction to the current buffer.
nmap <silent><c-@> <Plug>(coc-codeaction)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Goyo Vim configurations
let g:goyo_width = 150

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Limelight configuration
augroup Limelight
    autocmd! 
    autocmd user GoyoEnter Limelight
    autocmd user GoyoLeave Limelight!
augroup end
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" glyph-palette configuration

augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fern.vim configuration

nnoremap <C-n> :Fern -drawer . -reveal=% <CR>

" fern-renderer-nerdfont plugin configuration
let g:fern#renderer = "nerdfont"

" The following section auto executes bindings when the user is within the
" fern window
function! s:init_fern() abort
  " Use 'select' instead of 'edit' for default 'open' action
  nmap <buffer> <Plug>(fern-action-open) <Plug>(fern-action-open:select)
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Dart-vim-plugin configuration
" 
" Enable HTML syntax highlighting inside Dart strings
let dart_html_in_string=v:true

" Enable DartFmt execution on buffer save
let g:dart_format_on_save = 1

" Enable Dart style guide syntax but with 4 space indentation
let g:dart_style_guide = 2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Coc-FZF configurations
" 
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

nmap <C-o> :FZF <CR>
imap <C-o> :FZF <CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim FZF Configuration
"
" If installed using Homebrew, Enable FZF to run inside Vim
set rtp+=/usr/local/opt/fzf

" With the FZF integration for CoC, CoCList commands are circumvented to
" use CocFzfList instead. This shows previews in an FZF preview window
" alongwith FZF style fuzzy completion
nnoremap <silent> <c-p> :<C-u>CocFzfList commands<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " Vim auto commands for Kotlin using Floaterm
 " The Kotlin Autocommand group deals with setting up a development
 " environment for Kotlin projects/singluar kotlin files.
 " It contains hotkeys to toggle QuickFix, compile and execute the program
 " And opening up a Kotlin REPL
augroup kotlin
   autocmd!
   " Declare kotlin compiler for any filetype ending with Kotlin. This is used
   " with :compiler and declared manually in /usr/local/share/vim/vim82/compiler/
   autocmd Filetype kotlin compiler kotlinc
   " A keymap to Toggle the Quickix window.
   autocmd Filetype kotlin nnoremap <F1> :call <SID>QFixToggle() <CR>
   " A Keymap to compile the pgram asynchornously through Neomake
   autocmd FileType kotlin nnoremap <F3> :Neomake! <CR>
   " A keymap to execute the program
   autocmd FileType kotlin nnoremap <F4> :call <SID>KotlinExecute() <CR>
   " No Keymap for REPL | Just a command
   autocmd FileType kotlin command! REPL :FloatermNew --title=REPL($1/$2) --autoclose=2 kotlinc
augroup END

" A function that toggles The quickfix window 
function! s:QFixToggle()
  if exists("g:qfix_win")
    cclose
    unlet g:qfix_win
  else
    copen 10
    let g:qfix_win = bufnr("$")
  endif
endfunction

" The function is executed from augroup Kotlin.
" It is designed to execute the current Kotlin file being worked on through
" vim-floaterm.
function! s:KotlinExecute()
    execute 'FloatermNew! --title=Executing\ '.expand('%').'\ ($1/$2) --autoclose=1
                \ GREEN="\033[0;32m" && 
                \ YELLOW="\033[1;33m" &&
                \ L_GREY="\033[0;248m" &&
                \ clear &&
                \ echo \\\n\\\n${GREEN}\[Executing\]${YELLOW} '.expand('%:p').'
                \ \\\n${L_GREY}----------------------------------- &&
                \ java -jar '.expand('%').'.jar'
endfunction
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-Floaterm configuration
"
" Opens up a float term window when the user presses <\-t>
let g:floaterm_keymap_toggle = '<leader>t'

" Define a new Title for the terminal that opens up
let g:floaterm_title = "Terminal ($1/$2)"

" Whether to close floaterm window once the job gets finished.
let g:floaterm_autoclose = 2
