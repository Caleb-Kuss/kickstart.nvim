return {
  -- {
  --   'b0o/lavi.nvim',
  --   dependencies = { 'rktjmp/lush.nvim' },
  --   config = function()
  --     vim.cmd [[colorscheme lavi]]
  --   end,
  -- },
  --  First color scheme.
  -- {
  --   'AlexvZyl/nordic.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('nordic').load()
  --   end,
  -- },
  {
    'neanias/everforest-nvim',
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require('everforest').setup {
        -- Your config here
      }
    end,
  },
}
