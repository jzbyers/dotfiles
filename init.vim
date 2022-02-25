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

" ======================
" Airline:
" ======================
" Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1
" Formatter
let g:airline#extensions#tabline#formatter = 'default'

" ======================
" Coc:
" ======================

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" ======================
" GitGutter:
" ======================
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
autocmd FileType css setlocal ts=2 sts=2 sw=2
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

" BO deletes all the buffers except the current/named buffer. Without any
" arguments, the current buffer is kept. With an argument, the buffer
" name/number supplied is kept.
command! -nargs=? -complete=buffer -bang BO
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
