vim.g.mapleader = " "

-- Normal mode remaps
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

vim.keymap.set("i", "jj", "<Esc>")

-- Moving lines with J and K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Allow half-page jumping to keep cursor in the middle (less disorienting)
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep cursor in the middle when cycling through search results
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Better paste
vim.keymap.set("x", "p", "\"_dP")

-- Yank to clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")

-- Format using LSP
vim.keymap.set('n', '<leader>f', ':lua vim.lsp.buf.format()<CR>', {noremap = true, silent = true})

-- Switching between splits
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {silent = true})
--vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {silent = true})
--vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {silent = true})

-- Make Git fugitive easier to use
vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<CR>")
vim.keymap.set("n", "<leader>gd", ":Gdiff<cr>", {silent = true})

-- Toggle Copilot
vim.keymap.set("n", "<leader>cd", ":Copilot disable<CR>")
vim.keymap.set("n", "<leader>ce", ":Copilot enable<CR>")

-- Quick save
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")
-- Suspend
vim.api.nvim_set_keymap('n', '<leader>s', ':silent suspend<CR>', { noremap = true, silent = true })

vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>zz", {silent = true})
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>zz", {silent = true})

-- Easy folding:
-- zR: decreases the foldlevel to zero -- all folds will be open.
-- zM: increases the foldlevel to the maximum -- all folds will be closed.
vim.keymap.set('n', '<leader>fo', 'zR', {noremap = true, silent = true})
vim.keymap.set('n', '<leader>fc', 'zM', {noremap = true, silent = true})

-- Close buffer with <leader>bd
vim.keymap.set("n", "<leader>bd", ":bd<CR>")

function ReloadConfig()
  vim.cmd('source ~/.config/nvim/init.lua')
  print('Reloaded config!')
end

-- Reload Neovim config
vim.keymap.set("n", "<leader>r", ":lua ReloadConfig()<CR>")

-- Close all buffers except the current one with :BufOnly
vim.api.nvim_create_user_command('BufOnly', function()
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if bufnr ~= vim.api.nvim_get_current_buf() then
      vim.api.nvim_buf_delete(bufnr, {})
    end
  end
end, {})

vim.keymap.set("n", "<leader>bo", ":BufOnly<CR>")

-- Use <leader>lf to list functions in the current buffer
vim.api.nvim_set_keymap('n', '<leader>lf', ":lua require('telescope.builtin').lsp_document_symbols({ symbols={'function', 'method'} })<CR>", { noremap = true, silent = true })

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

-- Mapping to open nvim-tree and find the current file
vim.keymap.set('n', '<leader>e', ':NvimTreeFindFile<CR>', { desc = 'Open Nvim-tree on current buffer' })
-- Use - to toggle NvimTree too
vim.keymap.set('n', '-', ':NvimTreeFindFile<CR>', { desc = 'Open Nvim-tree on current buffer' })

--vim.api.nvim_set_keymap('n', '<leader>lf', 
--  ":lua ListFunctionsAndMethods()<CR>", 
--  { noremap = true, silent = true }
--)

