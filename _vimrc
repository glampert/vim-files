
" =================================================================================================
"
" My .vimrc script
"
" Author:  Guilherme R. Lampert
" License: Public Domain
"
" Suggested plugins:
" - NERDTree
" - SuperTab
" - SnipMate
"
" =================================================================================================

" Load ftplugins and indent files:
filetype plugin on
filetype indent on

" Default color scheme:
colorscheme kalisi
set background=dark

" Enable syntax highlighting:
syntax on

" Enable spell checking:
set spell

" Set language to English US:
set spelllang=en_us

" Enable features that are incompatible with VI:
set nocompatible

" Avoid unnecessary backups:
set nobackup

" Line spacing:
set linespace=3

" Number of columns when re-indenting (<< or >>) and auto-indent:
set shiftwidth=4

" Number of columns in a TAB:
set tabstop=4

" TABs as spaces:
set expandtab

" Enable auto-indent for source code files:
set autoindent

" Show line numbers:
set number

" Show line+column and percentage within the buffer:
set ruler

" Enable highlight and incremental search:
set hlsearch
set incsearch

" Default file encoding as UTF-8:
set encoding=utf-8

" Show options for command completion in a small menu:
set wildmenu

" Don't wrap lines longer than the window:
set wrap!

" Enable a bottom scroll bar for gvim:
set guioptions+=b

" Make sure to enable a right-hand scroll bar for gvim:
set guioptions+=r

" Removes the top toolbar of gvim:
set guioptions-=T

" Set the terminal's title:
set title

" Show current mode down the bottom:
set showmode

" Reload files changed outside automatically:
set autoread

" Store lots of cmdline history:
set history=1000

" Remove whitespaces from the end of lines:
function! <SID>removeWhitespaces()
    let l = line(".")
    let c = col(".")
    execute '%s/\s\+$//e'
    call cursor(l, c)
endfunction

" Automatically remove whitespaces before saving a buffer:
autocmd BufWritePre * :call <SID>removeWhitespaces()

" Mapping to remove whitespaces [SHIFT] + [SPACE]:
nnoremap <silent> <S-Space> :call <SID>removeWhitespaces()<CR>

" Set font according to OS:
if has("gui_macvim")
    set guifont=Menlo:h13
elseif has("gui_gtk") || has("gui_gtk2")
    set guifont=Ubuntu\ Mono:h15
elseif has("gui_win32")
    set guifont=Consolas:h15
else
    set guifont=Courier\ New:h15
endif

" Enables the Rust lang plugin
" (must be already installed into the syntax/ dir):
filetype on
au BufNewFile,BufRead *.rs set filetype=rust

" Enables clang-format, mapped to CTRL-K.
" Assumes the file clang-format.py is at the home directory.
map <C-K> :pyf ~/clang-format.py<cr>
imap <C-K> <c-o>:pyf ~/clang-format.py<cr>

