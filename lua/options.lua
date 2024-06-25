vim.g.mapleader = " "
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set signcolumn=no")
vim.opt.relativenumber = true

vim.cmd([[
  augroup CustomHighlights
    autocmd!
    autocmd ColorScheme * hi LineNr guibg=NONE
  augroup END
]])
