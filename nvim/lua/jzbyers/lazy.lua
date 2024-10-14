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
    -- Fuzzy finder
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},

    -- Color scheme
    { 
        "catppuccin/nvim", 
        name = "catppuccin", 
        priority = 1000,
        opts = {
            transparent_background = true,
        }
    },

    -- Syntax highlighting
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

    -- The best plugin ever?
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },

    -- LSP config
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",

    -- Completion and snippets
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",

    -- Git
    "tpope/vim-fugitive",
    --"airblade/vim-gitgutter",
    "tpope/vim-rhubarb",

    -- Copilot
    "github/copilot.vim",

    -- Markdown preview, install with yarn or npm
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },

}, {})

vim.cmd.colorscheme 'catppuccin-mocha'
--vim.cmd.colorscheme 'oden'
--vim.cmd('LuciusBlackLowContrast')

vim.keymap.set('n', '<F7>', vim.diagnostic.goto_prev, {})
vim.keymap.set('n', '<F8>', vim.diagnostic.goto_next, {})

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

require('telescope').setup{
    defaults = {
        file_ignore_patterns = { "vendor" },
        layout_strategy = 'vertical',
        layout_config = { height = 0.95, width=0.95 },
    }
}
