local uname = vim.loop.os_uname()
if uname.sysname == 'Darwin' then
  -- Disable newlines at the end of files
  vim.opt.binary = true
  vim.opt.eol = false
end
vim.opt.fixendofline = false

-- Relative line numbers (used with absolute `number` for hybrid numbering)
vim.opt.relativenumber = true
