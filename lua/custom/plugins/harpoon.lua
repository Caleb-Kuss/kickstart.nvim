return {
  'theprimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('harpoon'):setup()
  end,
  keys = {
    {
      '<leader>A',
      function()
        require('harpoon'):list():add()
      end,
      desc = 'harpoon file',
    },
    {
      '<leader>D',
      function()
        require('harpoon'):list():remove()
      end,
      desc = 'harpoon delete',
    },
    {
      '<leader>a',
      function()
        local harpoon = require 'harpoon'
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = 'harpoon quick menu',
    },
  },
}
