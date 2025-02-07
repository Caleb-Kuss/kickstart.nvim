local uname = vim.loop.os_uname()
if uname.sysname == 'Darwin' then
  -- Disable newlines at the end of files
  vim.opt.binary = true
  vim.opt.eol = false
end
vim.opt.fixendofline = false
