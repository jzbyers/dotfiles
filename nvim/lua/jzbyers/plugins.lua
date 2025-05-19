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

  -- Color schemes
  { 
      "catppuccin/nvim", 
      name = "catppuccin", 
      priority = 1000,
  },
  { 
    "EdenEast/nightfox.nvim",
    name = "nightfox"
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
  
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup {
        -- reveals the file in the tree when buffer changes
        update_focused_file = {
          enable = true,
          update_cwd = true,
        },
      }
    end,
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

vim.cmd.colorscheme 'catppuccin'
--vim.cmd.colorscheme 'terafox'

vim.keymap.set('n', '<F7>', vim.diagnostic.goto_prev, {})
vim.keymap.set('n', '<F8>', vim.diagnostic.goto_next, {})

-- Configure Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Telescope git commands
vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'Telescope git commits with diff' })
vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = 'Telescope git status with diff' })

-- LSP tools
vim.keymap.set('n', '<leader>ds', builtin.lsp_document_symbols, { desc = 'Telescope LSP definitions' })

-- Vim pickers
vim.keymap.set('n', '<leader>gm', builtin.marks, { desc = 'Telescope goto mark' })
vim.keymap.set('n', '<leader>qf', builtin.quickfix, { desc = 'Telescope list items in the quickfix list' })

vim.keymap.set('n', '<leader>fm', ':lua vim.lsp.buf.format()<CR>', {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input('Grep > ') });
end)

require('telescope').setup{
  defaults = {
    file_ignore_patterns = { "vendor" },
    layout_strategy = "center",
    sorting_strategy = "ascending",
    layout_config = {
      bottom_pane = {
        height = 25,
        preview_cutoff = 120,
        prompt_position = "top"
      },
      center = {
        height = 0.5,
        preview_cutoff = 40,
        prompt_position = "top",
        width = 0.5
      },
      cursor = {
        height = 0.9,
        preview_cutoff = 40,
        width = 0.8
      },
      horizontal = {
        height = 0.9,
        preview_cutoff = 120,
        prompt_position = "bottom",
        width = 0.8
      },
      vertical = {
        height = 0.9,
        preview_cutoff = 40,
        prompt_position = "bottom",
        width = 0.8
      }
    },
  }
}

require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = false, -- disables setting the background color.
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
})

