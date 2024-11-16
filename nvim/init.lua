local vim = vim
local Plug = vim.fn["plug#"]

vim.call("plug#begin")

Plug("https://github.com/tomasr/molokai.git")
Plug("junegunn/fzf")
Plug("junegunn/fzf.vim")
Plug("nvim-treesitter/nvim-treesitter")
vim.call("plug#end")

vim.cmd("colorscheme habamax")

vim.opt.number = true
vim.g.mapleader = " "
vim.api.nvim_set_keymap("n", "<Leader>f", ":Files<CR>", { noremap = true, silent = true })
