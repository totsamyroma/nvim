vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- exit to file explorer
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- move lines up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
