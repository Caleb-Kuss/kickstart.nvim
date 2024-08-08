return {
  'cowboy8625/epoc.nvim',
  config = function()
    vim.api.nvim_set_keymap(
      'n',
      '<leader>Et',
      ':lua require("epoc").EpochTimeConvertToClipboard()<CR>',
      { noremap = true, silent = true, desc = 'EpochTimeConvertToClipboard' }
    )
    vim.api.nvim_set_keymap(
      'n',
      '<leader>Ec',
      ':lua require("epoc").EpochTimeCurrentToClipboard()<CR>',
      { noremap = true, silent = true, desc = 'EpochTimeCurrentToClipboard' }
    )
    vim.api.nvim_set_keymap(
      'n',
      '<leader>Ep',
      ':lua require("epoc").EpochTimeConvertAndPopup()<CR>',
      { noremap = true, silent = true, desc = 'EpochTimeConvertAndPopup' }
    )
  end,
}
