local fn = vim.fn
local packer = require('packer')

packer.startup({
  function(use)
    -- manage the package manager
    use('wbthomason/packer.nvim')

    -- allow Deno for plugins
    use('vim-denops/denops.vim')

    -- devicons are needed by many things
    use({
      'kyazdani42/nvim-web-devicons',
      event = 'VimEnter',
    })

    -- flashy status bar
    use({
      'shadmansaleh/lualine.nvim',
      event = 'VimEnter',
      config = function()
        require('plugins.lualine')
      end,
    })

    -- plenary is a common dependency
    use({
      'nvim-lua/plenary.nvim',
      event = { 'BufReadPre', 'VimEnter' },
    })

    -- popup is a common dependency
    use({
      'nvim-lua/popup.nvim',
      after = 'plenary.nvim',
    })

    -- Useful startup text, menu
    use({
      'mhinz/vim-startify',
      event = 'VimEnter',
      config = function()
        require('plugins.startify')
      end,
    })

    -- highlight color strings
    use({
      'norcalli/nvim-colorizer.lua',
      event = 'VimEnter',
      config = function()
        require('colorizer').setup()
      end,
    })

    -- better start/end matching
    use({
      'andymass/vim-matchup',
      event = 'CursorMoved',
    })

    -- preserve layout when closing buffers; used for <leader>k
    use({
      'moll/vim-bbye',
      cmd = 'Bdelete',
    })

    -- more efficient cursorhold behavior
    -- see https://github.com/neovim/neovim/issues/12587
    use({
      'antoinemadec/FixCursorHold.nvim',
      event = 'VimEnter',
    })

    -- gc for commenting code blocks
    use({ 'tpope/vim-commentary', event = 'VimEnter' })

    -- EditorConfig
    use({
      'editorconfig/editorconfig-vim',
      event = 'BufReadPre',
      setup = function()
        -- Don't let editorconfig set the max line -- it's handled via an
        -- autocommand
        vim.g.EditorConfig_max_line_indicator = 'none'
      end,
    })

    -- git utilities
    use({
      'tpope/vim-fugitive',
      event = 'VimEnter',
    })

    -- support for repeating mapped commands
    use({
      'tpope/vim-repeat',
      event = 'VimEnter',
    })

    -- for manipulating parens and such
    use({
      'tpope/vim-surround',
      event = 'VimEnter',
    })

    -- easy vertical alignment of code elements
    use({
      'junegunn/vim-easy-align',
      cmd = 'EasyAlign',
    })

    -- visualize the undo tree
    use({
      'mbbill/undotree',
      cmd = 'UndotreeToggle',
      config = function()
        require('plugins.undotree')
      end,
    })

    -- support the jsonc filetype
    use({
      'neoclide/jsonc.vim',
      event = { 'BufReadPre', 'VimEnter' },
    })

    -- use treesitter for filetype handling
    use({
      'nvim-treesitter/nvim-treesitter',
      event = 'BufReadPre',
      run = ':TSUpdate',
      config = function()
        require('plugins.nvim-treesitter')
      end,
    })

    -- fuzzy finding
    use({
      'nvim-telescope/telescope-fzf-native.nvim',
      event = 'VimEnter',
      run = 'make',
    })
    use({
      'nvim-telescope/telescope.nvim',
      after = 'telescope-fzf-native.nvim',
      wants = { 'plenary.nvim' },
      config = function()
        require('plugins.telescope')
      end,
    })
    use({
      'nvim-telescope/telescope-symbols.nvim',
      after = 'telescope.nvim',
    })

    -- tree
    use({
      'kyazdani42/nvim-tree.lua',
      -- NvimTree must load at BufReadPre to be able to determine the location of
      -- an initially edited file. It can also be loaded at VimEnter if vim is
      -- opened without a file.
      event = { 'BufReadPre', 'VimEnter' },
      setup = function()
        require('plugins.nvim-tree')
      end,
    })

    -- highlight current word
    use({
      'RRethy/vim-illuminate',
      after = 'nvim-lspconfig',
      config = function()
        require('plugins.illuminate')
      end,
    })

    -- easier movement between vim and tmux panes, and between vim panes
    use({
      'numToStr/Navigator.nvim',
      event = 'VimEnter',
      config = function()
        require('plugins.Navigator')
      end,
    })

    -- filetype plugins
    use({ 'tpope/vim-markdown', ft = { 'markdown' } })
    use({ 'vim-scripts/applescript.vim', ft = { 'applescript' } })
    use({ 'vim-scripts/Textile-for-VIM', ft = { 'textile' } })
    use({ 'mzlogin/vim-markdown-toc', ft = { 'markdown' } })
    use({ 'tpope/vim-classpath', ft = { 'java' } })
    use({ 'lervag/vimtex', ft = { 'tex', 'latex' } })

    -- native LSP
    use({
      'neovim/nvim-lspconfig',
      -- load on BufReadPre so it will be installed before the buffer is
      -- actually loaded; otherwise, the LSP won't be available when the first
      -- buffer is read
      event = 'BufReadPre',
      config = function()
        require('lsp')
      end,
    })
    use({
      'jose-elias-alvarez/nvim-lsp-ts-utils',
      after = 'nvim-lspconfig',
    })
    use({
      'jose-elias-alvarez/null-ls.nvim',
      after = { 'nvim-lspconfig' },
      wants = { 'plenary.nvim' },
      config = function()
        require('plugins.null-ls')
      end,
    })
    use({
      'kabouzeid/nvim-lspinstall',
      after = 'nvim-lspconfig',
      config = function()
        require('plugins.nvim-lspinstall')
      end,
    })
    use({
      'ray-x/lsp_signature.nvim',
      disable = true,
      after = 'nvim-lspconfig',
    })
    use({
      'folke/trouble.nvim',
      after = 'nvim-lspconfig',
      config = function()
        require('plugins.trouble')
      end,
    })
    use({
      'arkav/lualine-lsp-progress',
      after = 'nvim-lspconfig',
    })

    -- completion
    use({
      'hrsh7th/nvim-compe',
      event = { 'BufRead', 'VimEnter' },
      config = function()
        require('plugins.nvim-compe')
      end,
    })

    -- better git diff views
    use({
      'sindrets/diffview.nvim',
      cmd = 'DiffviewOpen',
      config = function()
        require('diffview').setup()
      end,
    })

    -- better git decorations
    use({
      'lewis6991/gitsigns.nvim',
      event = 'BufRead',
      wants = {
        'plenary.nvim',
      },
      config = function()
        require('gitsigns').setup()
      end,
    })

    -- git UI
    use({
      'TimUntersberger/neogit',
      cmd = 'Neogit',
      config = function()
        require('plugins.neogit')
      end,
    })

    -- startup time profiling
    use({ 'dstein64/vim-startuptime', cmd = 'StartupTime' })

    -- show indents
    use({
      'lukas-reineke/indent-blankline.nvim',
      event = 'BufRead',
      config = function()
        vim.g.indent_blankline_char = '│'
        vim.g.indent_blankline_enabled = false
      end,
    })

    -- indent and syntax
    use({
      'sheerun/vim-polyglot',
      event = 'BufReadPre',
      setup = function()
        -- Disable some polyglot options
        vim.g.polyglot_disabled = { 'autoindent', 'ftdetect' }
      end,
    })
  end,

  config = {
    display = {
      open_fn = function()
        -- show packer output in a float
        return require('packer.util').float({ border = 'rounded' })
      end,
    },
  },
})

return packer
