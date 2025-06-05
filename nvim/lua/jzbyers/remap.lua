vim.g.mapleader = " "

local keyset = vim.keymap.set

keyset("i", "jj", "<Esc>")

-- Moving lines with J and K
keyset("v", "J", ":m '>+1<CR>gv=gv")
keyset("v", "K", ":m '<-2<CR>gv=gv")

-- Allow half-page jumping to keep cursor in the middle (less disorienting)
keyset("n", "<C-d>", "<C-d>zz")
keyset("n", "<C-u>", "<C-u>zz")

-- Keep cursor in the middle when cycling through search results
keyset("n", "n", "nzzzv")
keyset("n", "N", "Nzzzv")

-- Better paste
keyset("x", "p", "\"_dP")

-- Yank to clipboard
keyset("n", "<leader>y", "\"+y")
keyset("v", "<leader>y", "\"+y")

-- Format using LSP
keyset('n', '<leader>f', ':lua vim.lsp.buf.format()<CR>', {noremap = true, silent = true})

-- Switching between splits
keyset('n', '<C-h>', '<C-w>h', {silent = true})
keyset('n', '<C-l>', '<C-w>l', {silent = true})

-- Make Git fugitive easier to use
keyset("n", "<leader>gb", "<cmd>Git blame<CR>")
keyset("n", "<leader>gd", ":Gdiff<cr>", {silent = true})

-- Toggle Copilot
keyset("n", "<leader>cd", ":Copilot disable<CR>")
keyset("n", "<leader>ce", ":Copilot enable<CR>")

-- Quick save and suspend
keyset("n", "<leader>w", "<cmd>w<CR>")
keyset('n', '<leader>s', ':silent suspend<CR>', { noremap = true, silent = true })

-- Easy folding:
-- zR: decreases the foldlevel to zero -- all folds will be open.
-- zM: increases the foldlevel to the maximum -- all folds will be closed.
keyset('n', '<leader>fo', 'zR', {noremap = true, silent = true})
keyset('n', '<leader>fc', 'zM', {noremap = true, silent = true})

-- Close buffer with <leader>bd
keyset("n", "<leader>bd", ":bd<CR>")

-- Resize splits with arrow keys
keyset("n", "<down>", ":resize +1<cr>")
keyset("n", "<up>", ":resize -1<cr>")
keyset("n", "<right>", ":vertical resize +1<cr>")
keyset("n", "<left>", ":vertical resize -1<cr>")

function smart_cycle_next()
  if vim.fn.empty(vim.fn.getqflist()) == 0 then
    local success, err = pcall(vim.cmd, "cnext")
    if not success then
      vim.cmd("cfirst")
    end
  elseif vim.fn.empty(vim.fn.getloclist(0)) == 0 then
    local success, err = pcall(vim.cmd, "lnext")
    if not success then
      vim.cmd("lfirst")
    end
  else
    vim.cmd("normal! 5j")
  end
end

function smart_cycle_prev()
  if vim.fn.empty(vim.fn.getqflist()) == 0 then
    local success, err = pcall(vim.cmd, "cprev")
    if not success then
      vim.cmd("clast")
    end
  elseif vim.fn.empty(vim.fn.getloclist(0)) == 0 then
    local success, err = pcall(vim.cmd, "lprev")
    if not success then
      vim.cmd("llast")
    end
  else
    vim.cmd("normal! 5k")
  end
end

-- Map Ctrl+j and Ctrl+k to smart cycling functions
keyset("n", "<C-j>", ":lua smart_cycle_next()<CR>", { silent = true })
keyset("n", "<C-k>", ":lua smart_cycle_prev()<CR>", { silent = true })

-- Close quickfix list
keyset('n', '<leader>q', ':cclose<CR>', { noremap = true, silent = true })

function ReloadConfig()
  vim.cmd('source ~/.config/nvim/init.lua')
  print('Reloaded config!')
end

-- Reload Neovim config
keyset("n", "<leader>r", ":lua ReloadConfig()<CR>")

-- Close all buffers except the current one with :BufOnly
vim.api.nvim_create_user_command('BufOnly', function()
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if bufnr ~= vim.api.nvim_get_current_buf() then
      vim.api.nvim_buf_delete(bufnr, {})
    end
  end
end, {})

keyset("n", "<leader>bo", ":BufOnly<CR>")

-- Use <leader>lf to list functions in the current buffer
keyset('n', '<leader>lf', ":lua require('telescope.builtin').lsp_document_symbols({ symbols={'function', 'method'} })<CR>", { noremap = true, silent = true })

function ListFunctionsAndMethods()
  require('telescope.builtin').lsp_document_symbols({
    symbols = { 'function', 'method' },
    entry_maker = function(entry)
      vim.notify(vim.inspect(entry), vim.log.levels.DEBUG)
      local formatted = string.format("%s [line %d]", entry.text, entry.lnum)
      return {
        value = entry,
        valid = true,
        ordinal = entry.text,
        display = formatted,
        lnum = entry.lnum,
        kind = entry.kind,
        col = entry.col,
        filename = entry.filename,
      }
    end
  })
end

