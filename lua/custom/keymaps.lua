local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Save file and quit
keymap.set('n', '<Leader>w', ':update<Return>', opts)
keymap.set('n', '<Leader>q', ':quit<Return>', opts)
keymap.set('n', '<Leader>Q', ':qa<Return>', opts)

-- Tabs
keymap.set('n', 'te', ':tabedit')
keymap.set('n', 'tn', ':tabnew<Return>', opts)
keymap.set('n', '<tab>', ':tabnext<Return>', opts)
keymap.set('n', '<s-tab>', ':tabprev<Return>', opts)
keymap.set('n', 'tw', ':tabclose<Return>', opts)

-- Split window
keymap.set('n', 'ss', ':split<Return>', opts)
keymap.set('n', 'sv', ':vsplit<Return>', opts)

-- Move window
keymap.set('n', 'sh', '<C-w>h')
keymap.set('n', 'sk', '<C-w>k')
keymap.set('n', 'sj', '<C-w>j')
keymap.set('n', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', '<C-S-h>', '<C-w><')
keymap.set('n', '<C-S-l>', '<C-w>>')
keymap.set('n', '<C-S-k>', '<C-w>+')
keymap.set('n', '<C-S-j>', '<C-w>-')

-- Move Line up or down
keymap.set('v', 'J', ":m '>+1<CR>gv=gv'")
keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Delete No Name Buffer
vim.api.nvim_create_user_command('DeleteNoNameBuffers', function()
  vim.cmd [[
    bufdo if getbufvar(bufnr('%'), '&buftype') == '' && getbufvar(bufnr('%'), '&modified') == 0 && bufname('%') == '' | bdelete | endif
  ]]
end, {})

-- Diagnostics
vim.keymap.set('n', '<leader>ne', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>pe', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
