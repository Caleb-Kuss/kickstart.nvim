return {
  'voldikss/vim-floaterm',
  config = function()
    vim.g.floaterm_gitcommit = 'floaterm'
    vim.g.floaterm_autoinsert = 1
    vim.g.floaterm_width = 0.9
    vim.g.floaterm_height = 0.9
    vim.g.floaterm_wintitle = 0
    vim.g.floaterm_autoclose = 1
  end,

  vim.keymap.set('n', '<c-/>', ':FloatermToggle<CR>', { desc = 'Toggle [F]loaterm' }),
  vim.keymap.set('t', '<c-/>', '<c-\\><c-n>:FloatermToggle<CR>', { desc = 'Toggle [F]loaterm' }),
  vim.keymap.set('t', '<Leader>fN', '<c-\\><c-n>:FloatermNew<CR>', { desc = 'New [F]loaterm' }),
  vim.keymap.set('t', '<Leader>fp', '<c-\\><c-n>:FloatermPrev<CR>', { desc = 'Previous [F]loaterm' }),
  vim.keymap.set('t', '<Leader>fn', '<c-\\><c-n>:FloatermNext<CR>', { desc = 'Next [F]loaterm' }),
}
