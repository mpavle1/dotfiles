" Syntax highlighting
syntax on
filetype on

" Tab and indentation settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Disable swap file
set noswapfile

" Wrapping and indentation settings
set nowrap
set smartindent

" Scrolling options
set scrolloff=10
set sidescrolloff=10

" Sign column
set signcolumn=yes

" Update time
set updatetime=50

" Cursor and mouse settings
set cursorline
set mouse=a

" Spell check language
set spelllang=en

" Color and terminal settings
set termguicolors
set smoothscroll
colorscheme elflord

" Search settings
set nohlsearch
set incsearch

" Color column
set colorcolumn=120

" Leader key mappings
let mapleader=" "
let maplocalleader="\\"

" Line numbers
set number
set relativenumber

" netrw settings
let g:netrw_browse_split = 0
let g:netrw_banner = 0
let g:netrw_altv = 0

" Better indenting (reselect the visual block after shifting)
vnoremap < <gv
vnoremap > >gv

" Line jump stays in the middle of the screen
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Search term stays in the middle and open folds
nnoremap n nzzzv
nnoremap N Nzzzv

" Yoink (yank) to system clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+Y

" Open netrw (:Ex) with <leader>-
nnoremap <leader>- :Ex<CR>
