local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require('lazy').setup({
  spec = {
    'tpope/vim-sleuth',
    { import = 'plugins.coding.autopairs' },
    { import = 'plugins.coding.nvim-cmp' },
    { import = 'plugins.coding.lsp-config' },
    { import = 'plugins.coding.todo-comments' },
    { import = 'plugins.coding.treesitter' },
    { import = 'plugins.coding.trouble' },
    { import = 'plugins.coding.comment' },
    { import = 'plugins.editor.git-signs' },
    { import = 'plugins.editor.telescope' },
    { import = 'plugins.editor.indent-blankline' },
    { import = 'plugins.editor.lazy-git' },
    { import = 'plugins.editor.mini' },
    { import = 'plugins.editor.neo-tree' },
    { import = 'plugins.editor.snacks' },
    { import = 'plugins.editor.tmux' },
    { import = 'plugins.editor.which-key' },
    { import = 'plugins.formatting.conform' },
    { import = 'plugins.formatting.prettier' },
    { import = 'plugins.linting.core' },
    { import = 'plugins.ui.colorscheme' },
    { import = 'plugins.ui.dressing' },
    { import = 'plugins.ui.lualine' },
    { import = 'plugins.ui.bufferline' },
    { import = 'plugins.util.mini-hipatterns' },
  },
  defaults = {},
  performance = {
    rtp = {
      disabled_plugins = {
        'gzip',
        'tarPlugin',
        'zipPlugin',
        'netrwPlugin',
        'matchit',
        'matchparen',
        'shada',
        'spellfile',
      },
    },
  },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
