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

-- Quickfix list
--vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
--vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- FormatGo
vim.keymap.set('n', '<leader>f', ':lua vim.lsp.buf.format()<CR>', {noremap = true, silent = true})

-- Switching between splits
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {silent = true})

-- Quickly peak at Git blame
vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<CRe")

-- Quick save
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")

-- Easy folding:
-- zR: decreases the foldlevel to zero -- all folds will be open.
-- zM: increases the foldlevel to the maximum -- all folds will be closed.
vim.keymap.set('n', '<leader>fo', 'zR', {noremap = true, silent = true})
vim.keymap.set('n', '<leader>fc', 'zM', {noremap = true, silent = true})
