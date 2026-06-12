return {
  'nvim-telescope/telescope.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')

    telescope.setup({})

    vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Search Files' })
    vim.keymap.set('n', '<leader>pg', builtin.live_grep, { desc = 'Find in Global' })
  end,
}
