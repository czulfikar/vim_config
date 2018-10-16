set nocompatible

" use .vimrc if present in local directory
set exrc
set secure

set mouse=a

set nobackup
set nowritebackup
set noswapfile
set history=1000

set ruler
set showcmd
set showmode

set incsearch
set hlsearch
set smartcase
set ignorecase

set hidden
set wrap
set linebreak
set nolist "list disables linebreak
set backspace=indent,eol,start

" set tab width
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

"set paste toggle to disable auto indentation
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

set timeout timeoutlen=1000 ttimeoutlen=100
set laststatus=2
set statusline=%f\ %m\ %=L:%l/%L\ C:%c\ (%p%%)
set encoding=utf-8

set autoread
set splitbelow
set splitright
set cursorline
set lazyredraw

" highlight when to break line
"set colorcolumn=100
"highlight ColorColumn ctermbg=darkgray

" treat C files differently from C++ files
augroup project
	autocmd!
	autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END

" set path variable to look for header files
let &path.="src/include"

filetype off

" set runtime path to include Vundle and initialize
" alternatively, pass a path where Vundle should install plugin using:
" call vundle#begin('~/some/path/here')
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let vundle manage vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Rip-Rip/clang_complete'
Plugin 'scrooloose/nerdtree'
Plugin 'justinmk/vim-dirvish'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'qpkorr/vim-bufkill'
Plugin 'ervandew/screen'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/a.vim'

call vundle#end()

filetype plugin on
filetype plugin indent off

" YCM Configuration
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

" clang_complete configuration
let g:clang_library_path='/usr/lib/llvm-3.8/lib'

" ctags configuration
set tags=./tags;/

" screen configuration
autocmd VimEnter * nested ScreenShell
let g:ScreenShellQuitOnVimExit = 1

" nerdtree configuration
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * nested NERDTree
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
""let g:NERDTreeWinSize=50

" tagbar configuration
autocmd VimEnter * nested TagbarOpen
map <F7> :TagbarToggle<CR>
let g:tagbar_width = 50
let g:tagbar_sort = 0
let g:tagbar_compact = 0
let g:tagbar_indent = 2
let g:tagbar_autofocus = 0
let g:tagbar_autoclose = 0
let g:tagbar_usearrows = 1
let g:tagbar_autoshowtag = 1

" cpp-enhanced-highlight configuration
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let c_no_curly_error = 1

" buffkill configuration
map <C-c> :BD<CR>

" vim-airline configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_solarized_bg = 'dark'
let g:airline_powerline_fonts = 1

