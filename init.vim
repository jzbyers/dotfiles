set scrolloff=8                 " scroll before cursor hits top or bottom
set number                      " display line numbers
set relativenumber              " use relative line numbers
set guicursor=                  " disable cursor styling (use terminal's)
set encoding=utf-8              " set default encoding to UTC-8
set backspace=indent,eol,start  " makes backspace key more powerful
set incsearch                   " shows the match while typing
set hlsearch                    " highlight matches 
set mouse=a                     " enable mouse mode
set noerrorbells                " no beeps
set showcmd                     " show me what I'm typing
set splitright                  " split vertical windows right to the current windows
set splitbelow                  " split horizontal windows below to the current windows
set autowrite                   " automatically save before :next, :make etc.
set ignorecase                  " search case insensitive...
set smartcase                   " ... but not if it begins with upper case 
set completeopt=menu,menuone
set nocursorcolumn              " speed up syntax highlighting
set nocursorline
set updatetime=300
set pumheight=10                " completion window max size
set conceallevel=2              " concealed text is completely hidden
set cursorline                  " horizontal line where cursor is located
set textwidth=80
set colorcolumn=+1              " vertical line at textwidth
set hidden
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent


call plug#begin()
" Fuzzy Finder For File Search:
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Themes:
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'gruvbox-community/gruvbox'
" Golang:
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Git:
Plug 'tpope/vim-fugitive'
call plug#end()

set background=dark
set termguicolors
colorscheme dracula
syntax on

let mapleader = " "
inoremap jj <Esc>
nnoremap <leader>pv :Vex<CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <leader>s :w<CR>
nnoremap <leader>b <C-^>
nnoremap <leader>c :noh<CR>
nnoremap <C-p> :GFiles<CR>
" Quickfix List remaps:
nnoremap <C-n> :cnext<CR>
nnoremap <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" Create a Go doc comment based on the word under the cursor
fun! s:create_go_doc_comment()
  norm "zyiw
  execute ":put! z"
  execute ":norm I// \<Esc>$"
endfunction
nnoremap <leader>d :<C-u>call <SID>create_go_doc_comment()<CR>

