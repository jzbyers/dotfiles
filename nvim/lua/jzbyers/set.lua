vim.opt.guicursor = ""          

vim.opt.nu = true        
vim.opt.relativenumber = true  

vim.opt.tabstop = 4 
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.hlsearch = false            
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8   
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

vim.opt.cursorline = true
vim.opt.colorcolumn = "80"

vim.opt.ignorecase = true -- search case insensitive
vim.opt.smartcase = true -- search case sensitive if there is a capital letter
vim.opt.inccommand = "split"

vim.opt.undofile = true

local keyset = vim.keymap.set
keyset("n", "<down>", ":resize +1<cr>")
keyset("n", "<up>", ":resize -1<cr>")
keyset("n", "<right>", ":vertical resize +1<cr>")
keyset("n", "<left>", ":vertical resize -1<cr>")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "sql",
  callback = function()
    vim.opt.foldmethod = "indent"
    vim.opt.foldcolumn = "0"
    vim.opt.foldnestmax = 20 
  end,
})
