" Use the Solarized Dark theme
set background=dark
" use spaces
set tabstop=2 shiftwidth=2
set expandtab
set autoindent
colorscheme onedark
let g:solarized_termtrans=1

" Syntastic display error
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list = 1 " 1 show
let g:syntastic_auto_loc_list = 0 " 1 show
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:jsx_ext_required = 1 " Allow JSX in normal JS files

" Next error
nnoremap <c-w><c-e> :lnext <CR>
imap <c-w><c-e> :lnext <CR>
noremap <c-w><c-f> :Fixmyjs<CR>

" Auto fix eslint
" configuration for plugin ruanyl/vim-fixmyjs
au BufWritePre *.js :Fixmyjs
au BufWritePre *.jsx :Fixmyjs

" Highlight JSX in .js file
let g:jsx_ext_required = 0
let g:jsx_pragma_required = 1
" Enables syntax highlighting for JSDocs.
let g:javascript_plugin_jsdoc = 1

" Mapping UltiSnips to ctrl-j/k
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Basic options CtrlP
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.yardoc/*,*.exe,*.so,*.dat

" custom ctrlp ignore settings
if exists("g:ctrlp_user_command")
  unlet g:ctrlp_user_command
endif
"let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
\ --ignore .git
\ --ignore .svn
\ --ignore .hg
\ --ignore .DS_Store
\ --ignore .meteor
\ --ignore "**/*.pyc"
\ -g ""'

if exists("g:ctrlp_custom_ignore")
  unlet g:ctrlp_custom_ignore
endif
let g:ctrlp_custom_ignore = {'dir': '\.git$\.meteor$|\.hg$\|\.svn$'}

" Airline config
let g:airline#extensions#tabline#enabled = 1

" Airline theme
let g:airline_powerline_fonts = 1
let g:airline_theme='wombat'

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" reload files when changed on disk, i.e. via `git checkout`
set autoread
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=" "
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
set syntax=whitespace
" Highlight current line
set cursorline
" Show “invisible” characters
" Display extra whitespace
set listchars=tab:▸-,trail:•,extends:>,precedes:<
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
"set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage itself
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'scrooloose/nerdtree'
Plugin 'easymotion/vim-easymotion'
Plugin 'ternjs/tern_for_vim'
Plugin 'scrooloose/syntastic'
Plugin 'ruanyl/vim-fixmyjs'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-surround'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdcommenter'

" Snippets
Plugin 'SirVer/ultisnips'
Plugin 'epilande/vim-react-snippets'

Plugin 'mattn/emmet-vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'uguu-org/vim-matrix-screensaver'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ctrlpvim/ctrlp.vim'

" Syntax highlighting
Plugin 'lepture/vim-css'
Plugin 'sheerun/vim-polyglot'
Plugin 'wavded/vim-stylus'
Plugin 'elzr/vim-json'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'powerline/powerline'
Plugin 'vim-scripts/JavaScript-Indent'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()

" toggle NERDTree easily
nnoremap <Leader><Tab> :NERDTreeToggle<CR>:set nocursorline<CR>
" Mapping to turn off search highlighting and clear any message displayed
nnoremap <silent> <Leader>h :nohl<Bar>:echo<CR>

" Pressing Ctrl-Space leaves insert mode in Vim
imap <C-l> <Esc>

" ------ EasyMotion --------
map <Leader> <Plug>(easymotion-prefix)

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Use relative line numbers
if exists("&relativenumber")
  set relativenumber
  au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
  " Enable file type detection
  filetype on
	filetype plugin on
  " Treat .json files as .js
  autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
  " Treat .md files as Markdown
  autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif
