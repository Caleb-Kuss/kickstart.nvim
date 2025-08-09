return {
  'stevearc/oil.nvim',
  dependencies = {
    {
      'echasnovski/mini.icons',
      opts = {},
    },
  },
  config = function()
    require('oil').setup()
  end,
  keys = {
    { '<leader>o', '<cmd>Oil<cr>' },
  },
}
