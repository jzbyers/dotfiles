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
          "java", "clojure", "kotlin",
					"python", 
          "rust",
					"c", "cpp", 
					"lua", 
          "zig",
					"javascript", "typescript", "html", "css",
          "haskell", "ocaml", "scala",
          "swift",
          "sql",
          "dockerfile", "bash", "cmake", "vim", "markdown",
          "gitcommit", "git_config", "git_rebase", "gitignore",
          "json", "yaml", "toml",
          "csv", "tsv",
          "graphql"
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

vim.cmd.colorscheme 'catppuccin-latte'

vim.keymap.set('n', '<F7>', vim.diagnostic.goto_prev, {})
vim.keymap.set('n', '<F8>', vim.diagnostic.goto_next, {})

-- Configure Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fm', ':lua vim.lsp.buf.format()<CR>', {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input('Grep > ') });
end)

require('telescope').setup{
  defaults = {
    file_ignore_patterns = { "vendor" },
    layout_strategy = 'vertical',
    layout_config = { 
      horizontal = {
        preview_width = 0.6,    -- Increase the preview window width as a fraction of the total width
        results_width = 0.8,    -- Adjust the results window width
      },
      vertical = {
        width = 0.9,            -- Set the overall width for vertical layout
        height = 0.9,           -- Set the overall height for vertical layout
      },
      height = 0.95,            -- Overall width for any layout
      width=0.95                -- Overall height for any layout
    },
    wrap_results = true,
    -- path_display = { 'smart' },
    truncate_results = false,
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden',
      '--follow',
    },
  }
}