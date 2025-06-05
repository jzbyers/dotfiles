vim.opt.guicursor = ""
vim.opt.mousescroll = "ver:1,hor:1"

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

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

vim.opt.cursorline = true
vim.opt.colorcolumn = "80,100"
vim.cmd([[ highlight CursorLine guibg=#2e3440 ]])

vim.opt.ignorecase = true -- search case insensitive
vim.opt.smartcase = true -- search case sensitive if there is a capital letter
vim.opt.inccommand = "split"

vim.opt.undofile = true


-- Set up tab size configuration
vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = {
    "javascript", 
    "typescript", 
    "javascriptreact", 
    "typescriptreact",
    "lua",
    "python",
    "bash",
    "sh"
  },
  callback = function()
    vim.bo.shiftwidth = 2    -- Set the number of spaces for each indentation
    vim.bo.tabstop = 2       -- Set the number of spaces that a tab character represents
    vim.bo.expandtab = true  -- Use spaces instead of tabs
  end
})

--------------------------------------------------------------------------------
-- Sometimes I really like folding, sometimes I really don't
--------------------------------------------------------------------------------

-- Configure folding using treesitter
-- vim.opt.foldmethod = 'expr'
-- vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
-- Only fold the outermost indents
-- vim.opt.foldmethod = 'indent'
-- vim.opt.foldnestmax = 1
--
--vim.api.nvim_create_autocmd("FileType", {
--  pattern = "sql",
--  callback = function()
--    vim.opt.foldmethod = "indent"
--    vim.opt.foldcolumn = "0"
--    vim.opt.foldnestmax = 20 
--  end,
--})
