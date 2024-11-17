local vim = vim
local Plug = vim.fn["plug#"]

vim.call("plug#begin")

Plug("https://github.com/tomasr/molokai.git")
Plug("junegunn/fzf")
Plug("https://github.com/junegunn/fzf.vim.git")
Plug("https://github.com/nvim-treesitter/nvim-treesitter.git")
Plug("https://github.com/machakann/vim-highlightedyank.git")
Plug("https://github.com:lambdalisue/vim-fern.git")
Plug("https://github.com/lewis6991/gitsigns.nvim.git")
Plug("https://github.com/akinsho/bufferline.nvim.git")
Plug("https://github.com/nvim-tree/nvim-web-devicons.git")
Plug("https://github.com/iamcco/markdown-preview.nvim.git")
Plug("https://github.com/mattn/vim-maketable.git")
Plug("https://github.com/mattn/vim-sonictemplate.git")
Plug("https://github.com/tpope/vim-surround.git")
Plug("https://github.com/tpope/vim-commentary.git")
Plug("https://github.com/tpope/vim-fugitive.git")
Plug("https://github.com/tpope/vim-rhubarb.git")
Plug("https://github.com/shumphrey/fugitive-gitlab.vim.git")
Plug("https://github.com/inside/vim-search-pulse.git")
Plug("https://github.com/cohama/lexima.vim.git")
Plug("https://github.com/neovim/nvim-lspconfig.git")
Plug("https://github.com/williamboman/mason.nvim.git")
Plug("https://github.com/vim-denops/denops.vim.git")
Plug("https://github.com/Shougo/ddc.vim.git")
Plug("https://github.com/Shougo/ddc-ui-native.git")
Plug("https://github.com/LumaKernel/ddc-source-file.git")
Plug("https://github.com/delphinus/ddc-source-tmux.git")
Plug("https://github.com/Shougo/ddc-source-lsp.git")
Plug("https://github.com/Shougo/ddc-filter-matcher_head.git")
Plug("https://github.com/Shougo/ddc-filter-sorter_rank.git")
Plug("https://github.com/matsui54/denops-popup-preview.vim")

vim.call("plug#end")

vim.fn["ddc#custom#patch_global"]({
	ui = "native",
	sources = {
		"lsp",
		"tmux",
		"file",
	},
	sourceOptions = {
		_ = {
			sorters = { "sorter_rank" },
		},
		lsp = {
			mark = "[LSP]",
			forceCompletionPattern = "\\.\\w*|:\\w*|->\\w*",
		},
		tmux = {
			mark = "[T]",
			forceCompletionPattern = "\\S/\\S*",
			matchers = { "matcher_head" },
		},
		file = {
			mark = "[F]",
			forceCompletionPattern = "\\S/\\S*",
		},
	},
})
vim.fn["ddc#enable"]()
vim.fn["popup_preview#enable"]()
vim.cmd("colorscheme habamax")

vim.cmd([[
  augroup FormatLua
    autocmd!
    autocmd BufWritePre *.lua silent! execute '%!stylua -'
  augroup END
]])

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
require("gitsigns").setup()
require("mason").setup()
require("lspconfig").pyright.setup({})
