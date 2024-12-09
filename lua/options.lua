vim.g.mapleader = " "
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=4")
vim.cmd("set signcolumn=no")
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
-- Clear the command line when pressing Esc in command-line mode
vim.api.nvim_set_keymap('c', '<Esc>', '<C-c>', { noremap = true, silent = true })

vim.cmd([[
  augroup CustomHighlights
    autocmd!
    autocmd ColorScheme * hi LineNr guibg=NONE
  augroup END
]])
