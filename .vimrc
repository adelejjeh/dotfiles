" Gotta be first
set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" ----- Making Vim look good ------------------------------------------
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'dracula/vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'bling/vim-bufferline'
"""Plugin 'tomasr/molokai'
"Plugin 'arzg/vim-colors-xcode'
"Plugin 'sainnhe/edge'
"Plugin 'arcticicestudio/nord-vim'
"Plugin 'ulwlu/elly.vim'
"Plugin 'romainl/apprentice'
Plugin 'gruvbox-community/gruvbox'

" ----- Vim as a programmer's text editor -----------------------------
Plugin 'preservim/nerdtree'
"Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'wincent/command-t'
"""""Plugin 'vim-syntastic/syntastic'
"Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-easytags'
"Plugin 'majutsushi/tagbar'
"Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/a.vim'
"Plugin 'c.vim'
Plugin 'valloric/youcompleteme'
Plugin 'xuyuanp/nerdtree-git-plugin'
"Plugin 'rdnetto/ycm-generator'
Plugin 'ryanoasis/vim-devicons'
Plugin 'andrewradev/linediff.vim'
Plugin 'scrooloose/nerdcommenter'

" ----- Working with Git ----------------------------------------------
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
" Plugin 'lambdalisue/gina.vim'

" ----- Other text editing features -----------------------------------
Plugin 'Raimondi/delimitMate'

" ----- Syntax plugins ------------------------------------------------
Plugin 'petrushka/vim-opencl'
Plugin 'tommyvagbratt/vim-llvm'
"""""Plugin 'rhysd/vim-llvm'
"""""Plugin 'garious/vim-llvm'


" ----- TMUX plugins ------------------------------------------------
"Plugin 'christoomey/vim-tmux-navigator'

call vundle#end()

filetype plugin indent on

" --- General settings ---

set backspace=indent,eol,start " allow backspacing over everything in insert mode

set history=1000       " keep 1000 lines of command line history
set number             " line numbers
set ruler              " show the cursor position all the time
set showcmd            " display incomplete commands
set incsearch          " do incremental searching
set hlsearch
set linebreak          " wrap lines on 'word' boundaries
set scrolloff=3        " don't let the cursor touch the edge of the viewport
set splitright         " Vertical splits use right half of screen
set splitbelow         " Horizontal splits  use  bottom half  of screen
set fillchars+=fold:\ , " get rid of obnoxious '-' characters in folds
set tildeop            " use ~ to toggle case as an operator, not a motion
if exists('&breakindent')
  set breakindent      " Indent wrapped lines up to the same level
endif

" Tab settings
set expandtab          " Expand tabs into spaces
set tabstop=2          " default to 2 spaces for a hard tab
set softtabstop=2      " default to 2 spaces for the soft tab
set shiftwidth=2       " for when <TAB> is pressed at the beginning of a line

syntax on

set mouse=a
set ttymouse=sgr

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
" set clipboard=unnamedplus
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Don’t add empty newlines at the end of files
"set binary
"set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Highlight current line
set cursorline
" Ignore case of searches
set ignorecase
set smartcase
" Respect modeline in files
set modeline
set modelines=4
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title

set autoindent
set confirm

set autoread

" open new buffers in new tabs by default
set switchbuf+=newtab 

" Fix term colors and enable debugger
packadd termdebug
hi Terminal ctermbg=black ctermfg=white guibg=black guifg=white
let g:termdebug_wide=1

"nnoremap <leader>vimrc :tabe ~/.vimrc<cr>
"autocmd bufwritepost .vimrc source $MYVIMRC

nmap <C-J> <C-w><C-j>
nmap <C-k> <C-w><C-k>
nmap <C-l> <C-w><C-l>
nmap <C-h> <C-w><C-h>

nmap <C-Down> <C-w><C-j>
nmap <C-Up> <C-w><C-k>
nmap <C-Left> <C-w><C-h>
nmap <C-Right> <C-w><C-l>
" We need this for plugins like Syntastic and vim-gitgutter which put symbols
" in the sign column.
hi clear SignColumn

if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" ----- Plugin-Specific Settings --------------------------------------

" ----- altercation/vim-colors-solarized settings -----
"set background=light
set background=dark

" Uncomment the next line if your terminal is not configured for solarized
"let g:solarized_termcolors=16
"let g:solarized_termcolors=256
"let g:solarized_visibility = "high"
"let g:solarized_contrast = "high"
"let g:dracula_colorterm = 1
"let g:edge_style = 'neon'
"let g:edge_enable_italic = 1
"let g:edge_disable_italic_comment = 1
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_undercurl=0

colorscheme gruvbox
"colorscheme apprentice
"colorscheme elly
"colorscheme nord 
"colorscheme edge
"colorscheme xcodedarkhc 
"colorscheme dracula
"colorscheme solarized


" ----- bling/vim-airline settings -----
" Always show statusbar
set laststatus=2

" Fancy arrow symbols, requires a patched font
let g:airline_powerline_fonts = 1

" Show PASTE if in paste mode
"let g:airline_detect_paste=1

" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamecollapse = 1

" Branch extension for airline
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#displayed_head_limit = 10
let g:airline#estensions#branch#format = 2

"let g:bufferline_pathshorten = 0
"let g:airline#extensions#bufferline#enabled = 0
"let g:airline#extensions#bufferline#overwrite_variables = 0

"let g:airline_extensions = [] 

let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline_section_warning = ''
let g:airline_section_error = ''
let g:airline_section_z = '%p%% %l/%L:%v'
  let g:airline_mode_map = {
      \ '__'     : '-',
      \ 'c'      : 'C',
      \ 'i'      : 'I',
      \ 'ic'     : 'I',
      \ 'ix'     : 'I',
      \ 'n'      : 'N',
      \ 'multi'  : 'M',
      \ 'ni'     : 'N',
      \ 'no'     : 'N',
      \ 'R'      : 'R',
      \ 'Rv'     : 'R',
      \ 's'      : 'S',
      \ 'S'      : 'S',
      \ ''     : 'S',
      \ 't'      : 'T',
      \ 'v'      : 'V',
      \ 'V'      : 'V',
      \ ''     : 'V',
      \ }
" Use the solarized teme for the Airline status bar
"let g:airline_theme=dracula'
let g:airline_theme='gruvbox'
"let g:airline_theme=nord'
let g:airline_stl_path_style = 'short'
let g:airline#extensions#fugitiveline#enabled = 0
" ----- NERDTree Settngs -----
let NERDTreeShowHidden=1
"let NERDTreeQuitOnOpen=1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
nnoremap <silent> <leader>nt :NERDTreeToggle<CR>
nnoremap <silent> <leader>nf :NERDTreeFind<CR>
"nmap <C-n> :NERDTreeoggle<CR>

" ----- scrooloose/syntastic settings -----
"set runtimepath-=~/.vim/bundle/syntastic
"let g:syntastic_error_symbol = '?'
"let g:syntastic_warning_symbol = "?"
"augroup mySyntastic
"  au!
"  au FileType tex let b:syntastic_mode = "passive"
"augroup END

" ----- airblade/vim-gitgutter settings -----
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1
let g:gitgutter_sign_priority = 0
let g:gitgutter_max_signs = 2000

" ----- Raimondi/delimitMate settings -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

"" ----- c.vim settings -----
"let  g:C_UseTool_cmake    = 'yes'
"let  g:C_UseTool_doxygen = 'yes'

" ----- youcompleteme settings -----
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/youcompleteme/.ycm_extra_conf.py"
let g:ycm_goto_buffer_command = "split-or-existing-window"
let g:ycm_max_diagnostics_to_display = 100
let g:ycm_auto_hover=''
nmap <leader>D <plug>(YCMHover)

nnoremap <C-g> :vertical YcmCompleter GoTo<CR>
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <leader>gi :YcmCompleter GoToInclude<CR>
nnoremap <leader>f :YcmCompleter Format<CR>

" ----- fugitive settings -----
command -nargs=* Glg Git! log --graph --pretty=format:'\%h - (\%ad)\%d \%s <\%an>' --abbrev-commit --date=local <args>

" ----- commandT settings -----
let g:CommandTMaxFiles=1000000
let g:CommandTFileScanner='git'

" automatically open quickfix
augroup myvimrc
  autocmd!
  autocmd QuickFixCmdPost [^l]* cwindow
  autocmd QuickFixCmdPost l*    lwindow
augroup END
