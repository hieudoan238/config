vim.g.mapleader = " " 
vim.keymap.set("n", "-", vim.cmd.Ex)
vim.keymap.set('n', '<leader>cv', ':w!<CR>:VimtexCompile<CR>', { noremap = true, silent = true })



