return {
  -- highlight color strings
  {
    'norcalli/nvim-colorizer.lua',
    event = 'BufEnter',
    cond = vim.go.termguicolors,
    config = function()
      require('colorizer').setup({ '*' }, {
        names = false,
        rgb_fn = true,
      })
    end,
  },

  -- better start/end matching
  {
    'andymass/vim-matchup',
    dependencies = 'plenary.nvim',
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = 'popup' }
    end,
  },

  -- preserve layout when closing buffers; used for <leader>k
  {
    'moll/vim-bbye',
    event = 'BufEnter',
    config = function()
      vim.keymap.set('n', '<leader>k', '<cmd>Bdelete<cr>')
      vim.keymap.set('n', '<leader>K', '<cmd>Bdelete!<cr>')
    end,
  },

  -- gc for commenting code blocks
  {
    'tpope/vim-commentary',
    event = 'BufEnter',
  },

  -- EditorConfig
  {
    'editorconfig/editorconfig-vim',
    init = function()
      -- Don't let editorconfig set the max line -- it's handled via an
      -- autocommand
      vim.g.EditorConfig_max_line_indicator = 'none'
      vim.g.EditorConfig_disable_rules = {
        'trim_trailing_whitespace',
        'insert_final_newline',
      }
    end,
  },

  -- git utilities
  {
    'tpope/vim-fugitive',
    event = 'BufEnter',
  },

  -- support for repeating mapped commands
  {
    'tpope/vim-repeat',
    event = 'BufEnter',
  },

  -- for manipulating parens and such
  {
    'tpope/vim-surround',
    event = 'BufEnter',
  },

  -- easy vertical alignment of code elements
  {
    'junegunn/vim-easy-align',
    cmd = 'EasyAlign',
  },

  -- show semantic file location (e.g., what function you're in)
  {
    'SmiteshP/nvim-navic',
    dependencies = 'nvim-treesitter',
    config = function()
      require('nvim-navic').setup()
    end,
  },

  -- filetype plugins
  {
    'tpope/vim-markdown',
    ft = 'markdown',
  },
  {
    'mzlogin/vim-markdown-toc',
    ft = 'markdown',
    init = function()
      vim.g.vmt_auto_update_on_save = 0
    end,
  },
  {
    'tpope/vim-classpath',
    ft = 'java',
  },
  {
    'MaxMEllon/vim-jsx-pretty',
    ft = { 'javascriptreact', 'typescriptreact' },
  },
  'vim-scripts/applescript.vim',
  'vim-scripts/Textile-for-VIM',
  'mustache/vim-mustache-handlebars',
  'jwalton512/vim-blade',

  -- native LSP
  {
    'neovim/nvim-lspconfig',
    config = function()
      require('user.lsp').config()
    end,
  },

  -- JSON schemas
  'b0o/schemastore.nvim',

  -- highlight current word
  {
    'tzachar/local-highlight.nvim',
    config = function()
      require('local-highlight').setup({
        cw_hlgroup = 'LocalHighlight',
      })
      vim.api.nvim_set_hl(0, 'LocalHighlight', { link = 'CursorLine' })
    end,
  },

  -- better git diff views
  {
    'sindrets/diffview.nvim',
    cmd = 'DiffviewOpen',
    dependencies = {
      'plenary.nvim',
      'nvim-web-devicons',
    },
    config = function()
      require('diffview').setup()
    end,
  },

  -- better git decorations
  {
    'lewis6991/gitsigns.nvim',
    event = 'BufEnter',
    dependencies = 'plenary.nvim',
    config = function()
      require('gitsigns').setup({
        signs = {
          add = { text = '▋' },
          change = { text = '▋' },
        },
      })
    end,
  },

  -- diagnostics display
  {
    'folke/trouble.nvim',
    event = 'BufEnter',
    dependencies = 'nvim-web-devicons',
    config = function()
      require('trouble').setup()
    end,
  },

  -- Autosave files
  {
    'Pocco81/auto-save.nvim',
    config = function()
      require('auto-save').setup({
        condition = function(buf)
          return vim.api.nvim_buf_is_valid(buf)
            and vim.bo[buf].filetype == 'rust'
        end,
      })
    end,
  },

  -- Better UI
  'stevearc/dressing.nvim',

  {
    'folke/noice.nvim',

		enabled = false,

    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },

    config = function()
      require('noice').setup({
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use
          -- **Treesitter**
          override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
            ['cmp.entry.get_documentation'] = true,
          },
        },

        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
      })
    end,
  },

  -- Auto-set indentation
  {
    'tpope/vim-sleuth',

    config = function()
      -- Disable sleuth for markdown files as it slows the load time
      -- significantly
      vim.g.sleuth_markdown_heuristics = 0
    end,
  },

  -- tig in a float
  {
    dir = '/Users/jason/.config/nvim/lua/tig-lua',

    config = function()
      require('tig-lua').setup()
    end,
  },
}
