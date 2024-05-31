return {
  {
    'b0o/lavi.nvim',
    dependencies = { 'rktjmp/lush.nvim' },
    config = function()
      vim.cmd [[colorscheme lavi]]
    end,
  },
  --  First color scheme.
  -- {
  --   'AlexvZyl/nordic.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('nordic').load()
  --   end,
  -- },
}
