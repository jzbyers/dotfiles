" =============================================================================
" Plugins, managed by vim-plug
" =============================================================================
" Specify a directory for plugins
call plug#begin('~/.config/nvim/plugged')

" Language Servers:
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Fuzzy Finder For File Search:
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Git:
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb'

" Themes:
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'gruvbox-community/gruvbox'

" Airline:
Plug 'vim-airline/vim-airline'

" CSV:
Plug 'mechatroner/rainbow_csv'

" Treesitter:
" Remember to use TSInstall to install parsers for different languages
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Initialize plugin system
call plug#end()

" Leader
let mapleader = " "

" ============================================================================
" Plugin Settings 
" ============================================================================

" Airline:
" Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1
" Formatter
let g:airline#extensions#tabline#formatter = 'default'

" Coc:
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" GitGutter:
" Always show the sign column
set signcolumn=yes

" Treesitter:
lua <<EOF
require'nvim-treesitter.configs'.setup { highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true } }
EOF

" ============================================================================
" Neovim Config 
" ============================================================================

" true colors are required for vim in terminal
if (has("termguicolors"))
  set termguicolors
endif

" Set colorscheme (stolen from Michael Paulson)
fun! ColorScheme()
    set background=dark
    colorscheme dracula

    highlight ColorColumn ctermbg=0 guibg=grey
    highlight SignColumn guibg=none
    highlight CursorLineNR guibg=None
    highlight Normal guibg=none
    " highlight LineNr guifg=#ff8659
    " highlight LineNr guifg=#aed75f
    highlight LineNr guifg=#5eacd3
    highlight netrwDir guifg=#5eacd3
    highlight qfFileName guifg=#aed75f
    hi TelescopeBorder guifg=#5eacd3
endfun

" Show relative line number
set number
set relativenumber
set numberwidth=5

" Show horizontal line at cursor
set cursorline
" Clear cursorline highlighting and then make it underline only
highlight clear CursorLine
highlight CursorLine gui=underline cterm=underline

" Use block cursor
set guicursor=i:block

" Make backspace delete the white space at the start of the line, a line
" break, and the character before where Insert mode started.
set backspace=indent,eol,start

" Tabs
set smarttab " tab respects `tabstop`, `shiftwidth`, and `softtabstop`
" tabstop, softtabstop, and shiftwidth can be overriden for each langugae
set tabstop=4 " set the length of the \t character (the visible width of tabs)
set softtabstop=4 " number of spaces in tab when editing
set shiftwidth=4 " number of spaces to use for indent and unindent
set expandtab " tabs are spaces
set shiftround " round indent to a multiple of `shiftwidth`
set autoindent " when a new line is started, it gets the same indent as the previous line
set nowrap
"set nolinebreak
"set textwidth=0
"set wrapmargin=0

" Editing formatted text
"set textwidth=80

" Allows you to open a new file when the current buffer has unsaved changes
set hidden

" Keep 50 commands and 50 search patterns in the history.
set history=50

" Display the Vim mode in the bottom left corner of the Vim window.
set showmode

" Always display the current cursor position in the lower right corner of the
" Vim window.
set ruler

" Display an incomplete command in the lower right corner of the Vim window,
" left of the ruler. For example, when you type "2f", Vim is waiting for you to
" type the character to find and "2f" is displayed. When you press "w" next, the
" "2f" command is executed and the displayed "2f" is removed.
set showcmd

" Display matches for a search pattern while you type (incremental searching).
set incsearch

" Turn syntax highlighting on. `syntax enable` will keep your current color
" settings. This allows using `:highlight` commands to set your preferred colors
" before or after using this command. If you want Vim to overrule your settings
" with the defaults, use `syntax on`.
syntax on

" Make it obvious where column 80 is
set textwidth=80
set colorcolumn=+1
set formatoptions-=tc

" Highlight matches with the last used search pattern.
set hlsearch

" Enable concealing, for example, rendering bold text in Markdown but hiding
" the the asterisks
set conceallevel=2

" Having longer updatetime (default is 4000ms) leads to noticeable delays and
" poor user experience.
set updatetime=50

set mouse=v

" This switches on three mechanisms:
" 1. Filetype detection: used for syntax highlighting and the two items below
" 2. Using filetype plugin files
" 3. Using indent files
filetype plugin indent on

" ============================================================================
" Filetype specific settings 
" 
" Note: For all formatting settings down below, you can open files, select
" text you want to reformat, and do so with `gq`.
" ============================================================================

" Do not expand tabs to spaces for these files
autocmd FileType go set noexpandtab

" Tabs:
""" ts: number of spaces that \t in file use
""" sts: number of spaces that new \t uses
""" sw: number of spaces for autoindent
autocmd FileType go setlocal ts=4 sts=4 sw=4
autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType typescript setlocal ts=2 sts=2 sw=2
autocmd FileType javascriptreact setlocal ts=2 sts=2 sw=2
autocmd FileType typescriptreact setlocal ts=2 sts=2 sw=2
autocmd FileType python setlocal ts=4 sts=4 sw=4
autocmd FileType ruby setlocal ts=2 sts=2 sw=2
autocmd FileType json setlocal ts=2 sts=2 sw=2
autocmd FileType cpp setlocal ts=2 sts=2 sw=2
autocmd FileType yaml setlocal ts=2 sts=2 sw=2
autocmd FileType yml setlocal ts=2 sts=2 sw=2
autocmd FileType sql setlocal ts=2 sts=2 sw=2

" ============================================================================
" Simple mappings
" ============================================================================

" Add parentheses around a word by typing \p
map \p i(<Esc>ea)<Esc>

" Add quotes around a word by typing \q
map \q i"<Esc>ea"<Esc>

" Add curly braces around a word by typing \c
map \c i{<Esc>ea}<Esc>

" Remap jj to Esc
inoremap jj <Esc>

" ============================================================================
" Movement 
" ============================================================================

" Cursor Movement:
nnoremap <C-j> 5j
nnoremap <C-k> 5k

" View Movement:
nnoremap <C-e> 5<c-e>
nnoremap <C-y> 5<c-y>

" Window Movement:
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>h <C-w>h
nnoremap <Leader>l <C-w>l

" Buffer Movement: 
nnoremap <C-h> :bprev<CR>
nnoremap <C-l> :bnext<CR>
"nnoremap <C-w> :bd<CR>

" ============================================================================
" Fancy shit that might not work well... copied from the Internet 
" ============================================================================

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Map Ctrl + p to open fuzzy find (FZF) for file search
nnoremap <c-p> :Files<cr>

" Save:
nnoremap <Leader>s :w<CR>

" Quicker Commands For The Quickfix Menu:
" Close the menu
nnoremap <Leader>c :ccl<cr>
nnoremap <Leader>o :copen<cr>

" ============================================================================
" Commands 
" ============================================================================

" BufOnly deletes all the buffers except the current/named buffer. Without any
" arguments, the current buffer is kept. With an argument, the buffer
" name/number supplied is kept.
command! -nargs=? -complete=buffer -bang BufOnly
    \ :call BufOnly('<args>', '<bang>')


" ============================================================================
" Functions 
" ============================================================================

" BufOnly (from Christian J. Robinson) deletes all the buffers except the
" current/named buffer.
function! BufOnly(buffer, bang)
	if a:buffer == ''
		" No buffer provided, use the current buffer.
		let buffer = bufnr('%')
	elseif (a:buffer + 0) > 0
		" A buffer number was provided.
		let buffer = bufnr(a:buffer + 0)
	else
		" A buffer name was provided.
		let buffer = bufnr(a:buffer)
	endif

	if buffer == -1
		echohl ErrorMsg
		echomsg "No matching buffer for" a:buffer
		echohl None
		return
	endif

	let last_buffer = bufnr('$')

	let delete_count = 0
	let n = 1
	while n <= last_buffer
		if n != buffer && buflisted(n)
			if a:bang == '' && getbufvar(n, '&modified')
				echohl ErrorMsg
				echomsg 'No write since last change for buffer'
							\ n '(add ! to override)'
				echohl None
			else
				silent exe 'bdel' . a:bang . ' ' . n
				if ! buflisted(n)
					let delete_count = delete_count+1
				endif
			endif
		endif
		let n = n+1
	endwhile

	if delete_count == 1
		echomsg delete_count "buffer deleted"
	elseif delete_count > 1
		echomsg delete_count "buffers deleted"
	endif

endfunction

call ColorScheme()
