" .vimrc File
" Procured from: Jeffrey Way
" jeffrey@jeffrey-way.com
"
" Improved by: Garrett Dawson
" killtheliterate@gmail.com
"

"pathogen 실행
"execute pathogen#infect()
"execute pathogen#helptags()

"Forget compatibility with Vi. Who cares.
set nocompatible

"vundle 관련

filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-rails.git'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'scrooloose/nerdtree'

" for vim-snippets
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'

Bundle 'ervandew/supertab'
Bundle 'kien/ctrlp.vim'
Bundle 'epmatsw/ag.vim'
Bundle 'greyblake/vim-preview'

" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'

" vim-instant-markdown
Bundle 'https://github.com/suan/vim-instant-markdown.git'

" .md 확장자 인식 및 markdown syntax 플러그인
Bundle 'https://github.com/tpope/vim-markdown'

" emmet plugin
Bundle "mattn/emmet-vim"

" dash.vim
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'

" nerd-commenter
Bundle 'The-NERD-Commenter' 

" Vim Tmux Navigator
Bundle 'christoomey/vim-tmux-navigator'

" vim-airline
Bundle 'bling/vim-airline'

" solarized color theme
Bundle 'altercation/vim-colors-solarized' 

" vim-fugitive
Bundle 'tpope/vim-fugitive'

" promptline.vim 
Bundle 'edkolev/promptline.vim'

" tmuxline.vim
Bundle 'edkolev/tmuxline.vim'

" DirDiff plugin
Bundle 'vim-scripts/DirDiff.vim'

" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
" git repos on your local machine (ie. when working on your own plugin)
"Bundle 'file:///Users/gmarik/path/to/plugin'
" ...
"


filetype plugin indent on     " required!

"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..ypes

" vundle end

syntax on

"Write the old file out when switching between files.
set autowrite

"Display current cursor position in lower right corner.
set ruler

"Want a different map leader than \
"let mapleader = ","

"Ever notice a slight lag after typing the leader key + command? This lowers
"the timeout.
set timeoutlen=500

"Switch between buffers without saving
set hidden

"Tab stuff
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

"Show command in bottom right portion of the screen
set showcmd

"Show lines numbers
set number

"Indent stuff
set smartindent
set autoindent

"Always show the status line
set laststatus=2

"Prefer a slightly higher line height
set linespace=3

"Better line wrapping 
set wrap
set textwidth=79
set formatoptions=qrn1

"Set incremental searching"
set incsearch

"Highlight searching
set hlsearch

" case insensitive search
set ignorecase
set smartcase

"Hide MacVim toolbar by default
set go-=T

"Hard-wrap paragraphs of text
nnoremap <leader>q gqip

"Enable code folding
set foldenable

"Hide mouse when typing
set mousehide

"Shortcut to fold tags with leader (usually \) + ft
nnoremap <leader>ft Vatzf

"Opens a vertical split and switches over (\v)
nnoremap <leader>v <C-w>v<C-w>l

"Split windows below the current window.
set splitbelow

"Session settings
set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help

"Set up an HTML5 template for all new .html files
"autocmd BufNewFile * silent! 0r $VIMHOME/templates/%:e.tpl

"Load the current buffer in Firefox - Mac specific.
"abbrev ff :! open -a firefox.app %:p<cr>

"Map a change directory to the desktop - Mac specific
nmap ,d :cd ~/Desktop<cr>:e.<cr>

"Shortcut for editing  vimrc file in a new tab
nmap ,ev :tabedit $MYVIMRC<cr>

"Change zen coding plugin expansion key to shift + e
"let g:user_zen_expandabbr_key = '<C-e>'

"Faster shortcut for commenting. Requires T-Comment plugin
map ,c <c-_><c-_>

"Saves time; maps the spacebar to colon
nmap <space> :

"Automatically change current directory to that of the file in the buffer
" autocmd BufEnter * cd %:p:h

"Map code completion to , + tab
imap ,<tab> <C-x><C-o>

" More useful command-line completion
" set wildmenu

"Auto-completion menu
" set wildmode=list:longest

"http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
" set completeopt=longest,menuone
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
"   \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
"   \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

"Map escape key to jj -- much faster
imap jj <esc>

"Delete all buffers (via Derek Wyatt)
nmap <silent> ,da :exec "1," . bufnr('$') . "bd"<cr>

"Bubble single lines (kicks butt)
"http://vimcasts.org/episodes/bubbling-text/
nmap <C-Up> ddkP
nmap <C-Down> ddp

"Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" Source the vimrc file after saving it. This way, you don't have to reload
" Vim to see the changes.
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif
"
" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"------------------------"
"NERDTREE PLUGIN SETTINGS
"------------------------"
"Shortcut for NERDTreeToggle
"nmap <leader> :NERDTreeToggle<cr>
"map <F2> :NERDTreeToggle
"
"silent! nmap <C-p> :NERDTreeToggle<CR>
"silent! map <F3> :NERDTreeFind<CR>
silent! nmap <F3> :NERDTreeToggle<CR>

"let g:NERDTreeMapActivateNode="<F3>"
"let g:NERDTreeMapPreview="<F4>"

"Show hidden files in NerdTree
let NERDTreeShowHidden=1


"Helpeful abbreviations
iab lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
iab llorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 

"Spelling corrects. Just for example. Add yours below.
iab teh the
iab Teh The

"--------------------------"
" PERSONAL SETTINGS 
" -------------------------"

"For autocompletion of Snipmate plugin
let g:acp_behaviorSnipmateLength = 1

" Snipmate
:filetype plugin on

" Scrollbar junk
set guioptions=aAce

" Colors and fonts
syntax enable

let g:solarized_termtrans = 1
let g:solarized_termcolors=256
colorscheme solarized
"colorscheme idleFingers
if has('gui_running')
  "Using a cool patched font for powerline
  set guifont=Menlo:h14
  "set background transparency and solarized style 
  set background=dark
  "autopen NERDTree and focus cursor in new document
  autocmd VimEnter * NERDTree
  autocmd vimenter * wincmd p
else
  set background=dark
  "set mouse=a
endif

" Yank text to the OS X clipboard
" lion에서는 동작안하는 것 같다.
set clipboard=unnamed
noremap <leader>y "+y
noremap <leader>yy "+yy

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" FuzzyFInder
map <leader>ff :FufFile **/
map <leader>fb :FufBuffer

" A fancy status bar
" 이거 키면 키보드 입력이 너무 느려짐 
"let g:Powerline_symbols = 'fancy'

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" ctrl-x for cut
vmap <C-x> :!pbcopy<cr>
" ctrl-c for copy
vmap <C-c> :w !pbcopy<cr><cr>

" vim-instant-markdown plugin
let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 1

" vim-instant-markdown preview 오류 수정 
" http://stackoverflow.com/questions/10553875/alter-path-in-vim-macvim-so-as-to-find-the-right-ruby-binary
set shell=bash\ -i

" command+t plugin
" command+t plugin 종료를 위한 ESC키가 먹지않아서 Ctrl+C로 변경 
let g:CommandTCancelMap=['<ESC>','<C-c>']

" zencoding plugin
"let g:user_zen_expandabbr_key = '<c-y>' 
"let g:use_zen_complete_tag = 1

" ctrlp plugin

" emmet plugin
" Enable just for html/css
"let g:user_emmet_install_global = 0
"autocmd FileType html,css EmmetInstall
"let g:user_emmet_leader_key='<C-y>'

" vim-airline plugin
let g:airline_powerline_fonts = 1
let g:airline_theme='dark'

" colorscheme
"colo delek

" crontab: temp file must be edited in place 오류 막기  
" http://drawohara.com/post/6344279/crontab-temp-file-must-be-edited-in-place
:if $VIM_CRONTAB == "true"
:set nobackup
:set nowritebackup
:endif

set colorcolumn=80

" enable 256 colors
set t_Co=256

let g:airline#extensions#tmuxline#enabled = 0

let g:tmuxline_preset = 'full'

" vim-instant-markdown 동작을 위해서 OSX에서 필요 
" https://github.com/suan/vim-instant-markdown/issues/41
set shell=bash\ -i
