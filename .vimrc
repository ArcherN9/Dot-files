"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""d
" Maintainer: ArcherN9

" Sets up vim dependency installation through pathogen.
" All packages under ~/.vim/bundle are installed automatically
execute pathogen#infect()

" A list of all plugins installed is mentioned below
" 1. Vim-Airline 	- https://github.com/vim-airline/vim-airline
" 2. onedark.vim 	- https://github.com/joshdick/onedark.vim
" 3. indentLine		- https://github.com/Yggdroot/indentLine
" 4. vim-markdown	- https://github.com/plasticboy/vim-markdown
" 5. vim-json		- https://github.com/elzr/vim-json
" 6. vim-gitgutter	- https://github.com/airblade/vim-gitgutter
" 7. omnisharp-vim	- https://github.com/OmniSharp/omnisharp-vim
" 8. vim-coc        - https://github.com/neoclide/coc.nvim
" 9. vim-grammarous - https://github.com/rhysd/vim-grammarous
" 10. Goyo.vim      - https://github.com/junegunn/goyo.vim
" 11. Limelight     - https://github.com/junegunn/limelight.vim
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
set conceallevel=2			" Enable conceal 
set autoread				" Set to auto read when a file is changed from the outside
set so=7				" Set 7 lines to the cursor - when moving vertically using j/k
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
try
	" Set the colortheme as OneDark
	colorscheme onedark	
catch
endtry

" Set the background as a Dark theme
set background=dark						

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
map <leader>tn :tabnew
map <leader>1 :tabprevious<cr>
map <leader>2 :tabnext<cr>
" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

" Closes vim temporarily to access the shell
" particularly useful if you want to run or check something
" from the same directory. Like checking whats git status
map <leader>t :shell<cr>

" Move the current line around
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>

" Use RegEx search in the current document
map <C-f> /
map <silent><C-f>n :noh<cr>

" Pressing ,ss will toggle and untoggle spell checking
map <leader>sc :setlocal spell!<cr>

" Quickly open a buffer for scribble
map <leader>x :e ~/Desktos/buffer.md<cr>

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

" -----------------------------------------------------------------------
" NERD Tree
"
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
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

" Allow for the TOC window to auto-fit when it's possible for it to shrink. It never increases its default size (half screen), it only shrinks.
let g:vim_markdown_toc_autofit = 1

" Highlight JSON front matter as used by Hugo. | Requires vim-json
let g:vim_markdown_json_frontmatter = 1

" Use filetype name as fenced code block languages for syntax highlighting. If you want to use different name from filetype, you can add it in your .vimrc like so. Default is ['c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini']
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
"
" Enable GitGutter by default for all session
let g:gitgutter_enabled                 = 1                         
" default value (otherwise)
let g:gitgutter_max_signs               = -1                        
" gitGutter default key mappings will not be loaded
let g:gitgutter_map_keys                = 0                         
let g:gitgutter_sign_removed            = '-'
let g:gitgutter_preview_win_floating    = 1
highlight GitGutterChange ctermfg=Yellow
highlight GitGutterDelete ctermfg=Red
highlight GitGutterAdd    ctermfg=Green
nmap <C-g>> <Plug>(GitGutterNextHunk)
nmap <C-g>< <Plug>(GitGutterPrevHunk)
nmap <C-g>p <Plug>(GitGutterPreviewHunk)
nmap <C-g>u <Plug>(GitGutterUndoHunk)

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

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=no
endif

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

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

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

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Grammarous Configuration Optiosn
"
noremap <leader>sg :GrammarousCheck<cr>
" Reset the current check
nmap ge <Plug>(grammarous-reset)
" Fix the error under the cursor automatically
nmap gf <Plug>(grammarous-fixit)
" Move cursor to the next error
nmap gn <Plug>(grammarous-move-to-next-error) 
" Move cursor to the previous error
nmap gp <Plug>(grammarous-move-to-previous-error)
" Open the info window for the error under the cursor
nmap go <Plug>(grammarous-open-info-window)
" Remove the error under the cursor
nmap gr <Plug>(grammarous-remove-error)
" Disable the grammar rule under the cursor
nmap gd <Plug>(grammarous-disable-rule)

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
