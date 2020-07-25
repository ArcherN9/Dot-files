"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Maintainer: ArcherN9
  "
  " Version: This basic vim file is built on top of basic.vm file by Amix 
  "          Install Ultimate Vim configurations
  "
  "          https://github.com/amix/vimrc
  "
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "
  " Set the theme for VIM
  syntax on
  try
      colorscheme onedark
  catch
  endtry

  set background=dark

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Customize the map leader. Wherever <leader> shows up on vimrc
  " this is the key that replaces it when dealing with hot keys
  " With a map leader it's possible to do extra key combinations
  " like <leader>w saves the current file
  let mapleader = "\\" 
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "  Shortcut keys for saving files 
  " Fast saving
  nmap <leader>w :w!<cr>
  " Fast saving and quit
  nmap <leader>wq :wq!<cr>
  " Fast Quit without saving
  nmap <leader>qq :q!<cr>
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Tab management with VIM
  " Useful mappings for managing tabs
  map <leader>tn :tabnew
  map <leader>to :tabonly<cr>
  map <leader>q :tabclose<cr>
  map <leader>tm :tabmove
  map <leader>1 :tabprevious<cr>
  map <leader>2 :tabnext<cr>

  " Opens a new tab with the current buffer's path
  " Super useful when editing files in the same directory
  map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Closes vim temporarily to access the shell
  " particularly useful if you want to run or check something
  " from the same directory. Like checking whats git status
  map <leader>t :shell<cr>
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Delete from current cursor position to the end of line
  map <leader>de :.,$d<cr>
  " Delete from the beginning of the file to the cursor position
  map <leader>ds :1,.d<cr>
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Always show the status line
  set laststatus=2
  set number
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
