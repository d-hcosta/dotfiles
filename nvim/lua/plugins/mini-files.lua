return {
  'echasnovski/mini.files',
  version = '*',
  config = function()
    require('mini.files').setup {
      windows = {
        preview = false, -- Habilita preview de arquivos
        width_focus = 30,
        width_nofocus = 15,
      },
      mappings = {
        close = 'q', -- Fecha o mini.files
        go_in = '<CR>', -- Entra na pasta ou abre arquivo
        go_out = '<BS>', -- Sobe um nível
        reset = '<C-r>', -- Reseta a navegação
        show_help = 'g?', -- Mostra ajuda
      },
    }

    -- Mapeamento para abrir o mini.files
    vim.keymap.set('n', '<leader>m', function()
      require('mini.files').open(vim.api.nvim_buf_get_name(0), false)
    end, { desc = 'Abrir Mini Files' })
  end,
}
