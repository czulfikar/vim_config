set exrc
set secure

set clipboard+=unnamed
syntax enable

set nocompatible
set mouse=a

set nobackup
set nowritebackup
set noswapfile
set history=1000

set ruler
set showcmd
set showmode
"set showmatch

set incsearch
set hlsearch
set smartcase
set ignorecase

set hidden
set wrap
set linebreak
set nolist "list disables linebreak
set backspace=indent,eol,start

set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

"set number
set timeout timeoutlen=1000 ttimeoutlen=100
set laststatus=2
set statusline=%f\ %m\ %=L:%l/%L\ C:%c\ (%p%%)
set encoding=utf-8

set autoread
set splitbelow                                                                                                                                                                                
set splitright
set cursorline
set visualbell
set lazyredraw

set dictionary=/usr/shar/dict/words
set grepprg=ag\ --nogroup\ --nocolor

set makeprg=mkdir\ -p\ build\ &&\ cd\ build\ &&\ cmake\ ..\ &&\ make

set tags=~/cpp/lotdd/code/tags

map <F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

filetype off      " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" plugin for plugin management
Plugin 'VundleVim/Vundle.vim'

" plugin for file search
Plugin 'ctrlp.vim'

" plugins for IDE setup
Plugin 'scrooloose/nerdtree'
"Plugin 'scrooloose/nerdcommenter'
"Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'minibufexpl.vim'
Plugin 'bufkill.vim'
Plugin 'ack.vim'
Plugin 'a.vim'
Plugin 'Tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Lokaltog/vim-powerline'

" plugins for editor setup
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'farmergreg/vim-lastplace'
Plugin 'Syntastic'
"Plugin 'EasyMotion'

" plugins for tag management
"Plugin 'cscope.vim'

" plugins for code completion
Plugin 'surround.vim'
Plugin 'OmniCppComplete'

" plugins for git integration
Plugin 'fugitive.vim'
Plugin 'idanarye/vim-merginal'

" All of your Plugins must be added before the following line
call vundle#end()            " required

"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Put your non-Plugin stuff after this line

" NERDTree configuration
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

map <F6> :NERDTreeToggle<CR>
let g:NERDTreeIgnore=['\.o$', '\.lo$']
let g:NERDTreeHighlightCursorline=1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeQuitOnClose = 1
let g:NERDTreeMouseMode = 3
let g:NERDTreeChDirMode = 2

" buffer explorer
let g:bufExplorerSplitVertSize=60

let g:c_space_errors = 1
let g:c_no_tab_space_error = 1
let g:c_curly_error = 1

" Tagbar configuration
map <F7> :TagbarToggle<CR>

let g:tagbar_width = 40
let g:tagbar_sort = 0       " sort tags by order/name
let g:tagbar_compact = 0    " remove extra info if 1
let g:tagbar_indent = 2     " indentation on the side
let g:tagbar_autofocus = 0  " focus on tagbar when opened

" Syntastic configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_cpp_compiler = 'gcc'
let g:syntastic_cpp_compiler_options = '-std=c++11'
let g:syntastic_error_symbol = "x"
let g:syntastic_warning_symbol = "W"
let g:syntastic_style_error_symbol = "sE"
let g:syntastic_enable_balloons = 1

"Make it available only on demand
let g:syntastic_mode_map = { "mode": "passive" }
map <F9> :SyntasticCheck<CR>
map <F8> :SyntasticReset<CR>

"OmniCppComplete
set omnifunc=omni#cpp#complete#Main
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest "commented out option ,preview

let OmniCpp_NamespaceSearch = 2
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
let OmniCpp_SelectFirstItem = 2 "select first file but don't insert

" Search down the subfolders recursively
" Provides tab completion for files related tasks
"set path+=~/**
set path+=**

" Display all matching files for tab completion
set wildmenu
set wildmode=longest:list,full

" powerline configuration
let g:Powerline_symbols = "fancy"

"airline configuration
" Tabline support
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_buffers=0
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline#extensions#tabline#tab_nr_type = 0 " splits and tab number
let g:airline#extensions#tabline#show_tab_nr = 1

let g:airline_powerline_fonts = 1
let g:bufferline_echo = 0
let g:airline#extensions#bufferline#enabled = 1
let g:airline_theme='powerlineish'
" branch support
"let g:airline_section_b='%{fugitive#statusline()}'
let g:airline#extensions#branch#enabled=1                     " show branch name
let g:airline#extensions#branch#empty_message = 'no branch'
let g:airline#extensions#branch#format = 2                    "f/a/develop
let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]' " donnt display it if it mathes
"tagbar support
let g:airline#extensions#tagbar#flags = ''
"airline end

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_user_command = 'find %s -type f -name *.cc -o -name *.hh -o -name *.h -o -name *.c -o -name *.txt -o -name *.xml '

" a.vim
"let g:alternateSearchPath = "'sfr:../source,sfr:../src,sfr:../include,sfr:../inc,sfr:../../utils,sfr:../utils'
"let g:alternateNoDefaultAlternate = 1
"let g:alternateRelativeFiles = 0
