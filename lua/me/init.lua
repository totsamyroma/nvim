require('me.remap')

-- share buffer clipboard with system clipboard
vim.opt.clipboard:append { 'unnamedplus' }

-- enable numbers and relative line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- show vertical bar at 120 characters
vim.opt.colorcolumn = '120'

-- smart indent
vim.opt.smartindent = true

--  other
-- vim.opt.scrolloff = 10

vim.opt.incsearch = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
