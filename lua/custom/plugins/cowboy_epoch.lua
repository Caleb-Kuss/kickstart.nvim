return {
  'cowboy8625/epoc.nvim',
  config = function()
    local wk = require 'which-key'
    wk.register({
      E = {
        name = 'Epoch Time',
        t = { ':EpochTimeConvertToClipboard<CR>', 'Convert to Clipboard' },
        c = { ':EpochTimeCurrentToClipboard<CR>', 'Current to Clipboard' },
        p = { ':EpochTimeConvertAndPopup<CR>', 'Convert and Popup' },
      },
    }, { prefix = '<leader>' })
  end,
}
