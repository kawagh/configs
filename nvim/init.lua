local vim = vim
local Plug = vim.fn["plug#"]

vim.call("plug#begin")

Plug("https://github.com/tomasr/molokai.git")
Plug("junegunn/fzf")
Plug("https://github.com/junegunn/fzf.vim.git")
Plug("https://github.com/nvim-treesitter/nvim-treesitter.git")
Plug("https://github.com/machakann/vim-highlightedyank.git")
Plug("https://github.com:lambdalisue/vim-fern.git")
Plug("https://github.com/airblade/vim-gitgutter.git")
Plug("https://github.com/akinsho/bufferline.nvim.git")
Plug("nvim-tree/nvim-web-devicons")

vim.call("plug#end")

vim.cmd("colorscheme habamax")

vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.clipboard:append("unnamedplus")
vim.g.mapleader = " "
vim.api.nvim_set_keymap("n", "<Leader>f", "<cmd>Files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Tab>", "<cmd>bnext<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", "<cmd>bprevious<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-e>", "<cmd>Fern . -drawer -stay -toggle<CR>", { noremap = true })

require("bufferline").setup({})
