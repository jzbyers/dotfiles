local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.6',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
		'Mofiqul/dracula.nvim',
		priority = 1000,
	},
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function () 
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { 
					"go", 
					"python", 
                    "rust",
					"c", 
					"cpp", 
					"lua", 
					"javascript", 
                    "typescript",
					"html"
				},
				sync_install = false,
                auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },  
			})
		end
	},

    -- Auto-create pairs like parens, quotes, etc.
    "jiangmiao/auto-pairs",

    -- LSP config
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",

    -- Git
    "tpope/vim-fugitive",
    "airblade/vim-gitgutter",
    "tpope/vim-rhubarb",

    -- Copilot
    "github/copilot.vim",

    -- Database
    "tpope/vim-dadbod",
    "kristijanhusak/vim-dadbod-ui"
}, {})

-- Not sure if this should go here or elsewhere...
require('dracula').setup {
  colors = {
    bg = "#282A36",
    fg = "#F8F8F2",
    selection = "#44475A",
    comment = "#6272A4",
    red = "#FF5555",
    orange = "#FFB86C",
    yellow = "#F1FA8C",
    green = "#50fa7b",
    purple = "#BD93F9",
    cyan = "#8BE9FD",
    pink = "#FF79C6",
    bright_red = "#FF6E6E",
    bright_green = "#69FF94",
    bright_yellow = "#FFFFA5",
    bright_blue = "#D6ACFF",
    bright_magenta = "#FF92DF",
    bright_cyan = "#A4FFFF",
    bright_white = "#FFFFFF",
    menu = "#21222C",
    visual = "#3E4452",
    gutter_fg = "#4B5263",
    nontext = "#3B4048",
    white = "#ABB2BF",
    black = "#191A21",
  },
  transparent_bg = true,
  italic_comment = false,
  show_end_of_buffer = false,
  overrides = {},
}

--vim.cmd.colorscheme 'dracula'
vim.cmd.colorscheme 'catppuccin'

-- Configure Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fm', ':lua vim.lsp.buf.format()<CR>', {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input('Grep > ') });
end)

vim.keymap.set('n', '<F7>', vim.diagnostic.goto_prev, {})
vim.keymap.set('n', '<F8>', vim.diagnostic.goto_next, {})

require('telescope').setup{
    defaults = {
        file_ignore_patterns = { "vendor" },
        layout_strategy = 'vertical',
        layout_config = { height = 0.95, width=0.95 },
    }
}
