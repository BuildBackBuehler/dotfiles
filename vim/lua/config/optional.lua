local util = require('util')

if vim.env.TMUX then
  vim.cmd('packadd! vim-tmux-navigator')
end

util.augroup(
  'init_optional_packages', {
    'Filetype markdown packadd! vim-markdown',
    'Filetype markdown packadd! vim-markdown-toc',
    'Filetype toml packadd! vim-package-info',
    'Filetype applescript packadd! applescript.vim',
    'Filetype textile packadd! Textile-for-VIM',
    'Filetype java packadd! vim-classpath',
    'Filetype tex,latex packadd! vimtex',
    'BufRead,BufNewFile package.json packadd! vim-package-info',
    'BufRead,BufNewFile requirements.txt,Pipfile packadd! vim-package-info'
  }
)

if vim.g.use_native_lsp then
  vim.cmd('packadd! nvim-lspconfig')
  vim.cmd('packadd! nvim-lspinstall')
  vim.cmd('packadd! nvim-compe')
else
  vim.cmd('packadd! coc.nvim')
  vim.cmd('packadd! coc-fzf')
end
