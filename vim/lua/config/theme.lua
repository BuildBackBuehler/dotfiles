local base16 = require('base16')
local util = require('util')
local hi = util.hi

_G.theme = {}
local theme = _G.theme

-- apply customizations to the loaded theme
function theme.customize()
  local cmd = vim.cmd
  local g = vim.g

  hi('Normal', { guibg = '', ctermbg = '' })
  hi('Comment', { gui = 'italic' })
  hi('Visual', {
    guibg = g.base16_gui02,
    guifg = g.base16_gui00
  })
  hi('MatchParen', {
    guibg = g.base16_gui02,
    guifg = g.base16_gui01
  })
  hi('MatchParenCur', {
    guibg = g.base16_gui03,
    guifg = g.base16_gui00
  })
  hi('Search', {
    guibg = g.base16_gui0D,
    guifg = g.base16_gui00
  })
  hi('IncSearch', {
    guibg = g.base16_gui0D,
    guifg = g.base16_gui00
  })
  hi('IncSearch', {
    guibg = g.base16_gui0D,
    guifg = g.base16_gui00
  })
  hi('Error', { guibg = '', guifg = g.base16_gui0E })

  -- high visibility cursor
  hi('Cursor', { guibg = 'red' })

  -- no background for diffs (it messes with floating windows)
  hi('DiffAdded', { guibg = '' })
  hi('DiffFile', { guibg = '' })
  hi('DiffNewFile', { guibg = '' })
  hi('DiffLine', { guibg = '' })
  hi('DiffRemoved', { guibg = '' })
  hi('SpellBad', { guifg = g.base16_gui0E })

  hi('htmlItalic', { gui = 'italic', guifg = '', guibg = '' })
  hi('htmlBold', { gui = 'bold', guifg = '', guibg = '' })
  hi('htmlBoldItalic', { gui = 'italic,bold', guifg = '', guibg = '' })

  hi('MatchParen', { guifg = '', guibg = g.base16_gui01 })
  hi('MatchParenCur', { guifg = '', guibg = g.base16_gui01 })

  -- This doesn't currently work
  -- see https://github.com/neovim/neovim/issues/7018
  g.terminal_color_16 = g.base16_gui09
  g.terminal_color_17 = g.base16_gui0F
  g.terminal_color_18 = g.base16_gui01
  g.terminal_color_19 = g.base16_gui02
  g.terminal_color_20 = g.base16_gui04
  g.terminal_color_21 = g.base16_gui06

  hi('LspDiagnosticsWarning', {
    guibg = '',
    guifg = g.base16_gui0F,
    gui = 'italic'
  })
  hi('LspDiagnosticsWarningSign', {
    guibg = g.base16_gui01,
    guifg = g.base16_gui0F,
    gui = 'bold'
  })
  hi('LspDiagnosticsWarningFloating', {
    guibg = '',
    guifg = g.base16_gui0F
  })
  hi('LspDiagnosticsUnderlineWarning', {
    gui = 'undercurl',
    guisp = g.base16_gui0F
  })

  hi('LspDiagnosticsError', {
    guibg = '',
    guifg = g.base16_gui0E,
    gui = 'italic'
  })
  hi('LspDiagnosticsErrorSign', {
    guibg = g.base16_gui01,
    guifg = g.base16_gui0E,
    gui = 'bold'
  })
  hi('LspDiagnosticsErrorFloating', {
    guibg = '',
    guifg = g.base16_gui0E
  })
  hi('LspDiagnosticsUnderlineError', {
    gui = 'undercurl',
    guisp = g.base16_gui0E
  })

  hi('LspDiagnosticsHintSign', {
    guibg = g.base16_gui01,
    guifg = g.base16_gui0B,
    gui = 'bold'
  })
  hi('LspDiagnosticsHint', {
    guibg = '',
    guifg = g.base16_gui02,
    gui = 'italic'
  })
  hi('LspDiagnosticsHintFloating', {
    guibg = '',
    guifg = g.base16_gui0B
  })
  hi('LspDiagnosticsUnderlineHint', {
    gui = 'undercurl',
    guisp = g.base16_gui0B
  })
end

-- set the theme based on the value specified in ~/.vimrc_background
function theme.load_theme()
  local theme_file = util.home .. '/.vimrc_background'
  if util.file_exists(theme_file) then
    local lines = vim.fn.readfile(theme_file, '', 1)
    local words = vim.split(lines[1], '%s')
    local name = util.trim(words[#words], "'"):sub(8)
    base16(base16.themes[name], true)
    vim.g.colors_name = 'base16'
  end
end

-- apply customizations when the color scheme is updated
util.augroup('init_theme', {
  'ColorScheme * call v:lua.theme.customize()',
})

-- set the theme
theme.load_theme()

return theme
