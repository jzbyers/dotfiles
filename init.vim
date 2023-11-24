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
set hidden
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set maxmempattern=10000         " increase amount of mem used for pattern matching

" Yank to system clipboard
set clipboard+=unnamedplus

call plug#begin()
" Fuzzy Finder For File Search:
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Appearance:
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
" Golang:
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Git:
Plug 'tpope/vim-fugitive'
" Copilot
" Plug 'github/copilot.vim'
call plug#end()

syntax enable
set background=dark
set termguicolors
colorscheme dracula

" vim-go settings
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1

augroup filetypedetect
  command! -nargs=* -complete=help Help vertical belowright help <args>
  autocmd FileType help wincmd L
  
  autocmd BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
  autocmd BufNewFile,BufRead .nginx.conf*,nginx.conf* setf nginx
  autocmd BufNewFile,BufRead *.hcl setf conf

  autocmd BufRead,BufNewFile *.gotmpl set filetype=gotexttmpl
  
  autocmd BufNewFile,BufRead *.ino setlocal noet ts=4 sw=4 sts=4
  autocmd BufNewFile,BufRead *.txt setlocal noet ts=4 sw=4
  autocmd BufNewFile,BufRead *.md setlocal noet ts=4 sw=4
  autocmd BufNewFile,BufRead *.html setlocal noet ts=4 sw=4
  autocmd BufNewFile,BufRead *.vim setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.hcl setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.sh setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.proto setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.fish setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.sql setlocal expandtab shiftwidth=2 tabstop=2
  
  autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4
  autocmd FileType lua setlocal expandtab shiftwidth=2 tabstop=2
  autocmd FileType yaml setlocal expandtab shiftwidth=2 tabstop=2
  autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2
  autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
augroup END

let mapleader = " "
inoremap jj <Esc>
nnoremap <leader>pv :Vex<CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>b <C-^>
nnoremap <leader>c :noh<CR>
nnoremap <leader>o :only<CR>
nnoremap <C-p> :Files<CR>
nnoremap <C-n> :cnext<CR>
nnoremap <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

" Create a Go doc comment based on the word under the cursor
fun! s:create_go_doc_comment()
  norm "zyiw
  execute ":put! z"
  execute ":norm I// \<Esc>$"
endfunction
nnoremap <leader>d :<C-u>call <SID>create_go_doc_comment()<CR>

" Configure F8 to run SyntasticToggle, which toggles the location list.
map <F8> <ESC>:call SyntasticToggle()<CR>

let g:syntastic_is_open = 0  
function! SyntasticToggle()
if g:syntastic_is_open == 1
    lclose
    let g:syntastic_is_open = 0 
else
    let g:syntastic_is_open = 1 
endif
endfunction
" End section: reference: https://github.com/vim-syntastic/syntastic/issues/166
