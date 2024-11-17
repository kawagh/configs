local vim = vim
local Plug = vim.fn["plug#"]

vim.call("plug#begin")

Plug("https://github.com/tomasr/molokai")
Plug("https://github.com/junegunn/fzf")
Plug("https://github.com/junegunn/fzf.vim")
Plug("https://github.com/nvim-treesitter/nvim-treesitter")
Plug("https://github.com/machakann/vim-highlightedyank")
Plug("https://github.com:lambdalisue/vim-fern")
Plug("https://github.com/lewis6991/gitsigns.nvim")
Plug("https://github.com/akinsho/bufferline.nvim")
Plug("https://github.com/nvim-tree/nvim-web-devicons")
Plug("https://github.com/iamcco/markdown-preview.nvim")
Plug("https://github.com/mattn/vim-maketable")
Plug("https://github.com/mattn/vim-sonictemplate")
Plug("https://github.com/tpope/vim-surround")
Plug("https://github.com/tpope/vim-commentary")
Plug("https://github.com/tpope/vim-fugitive")
Plug("https://github.com/tpope/vim-rhubarb")
Plug("https://github.com/shumphrey/fugitive-gitlab.vim")
Plug("https://github.com/inside/vim-search-pulse")
Plug("https://github.com/cohama/lexima.vim")
Plug("https://github.com/neovim/nvim-lspconfig")
Plug("https://github.com/williamboman/mason.nvim")
Plug("https://github.com/vim-denops/denops.vim")
Plug("https://github.com/Shougo/ddc.vim")
Plug("https://github.com/Shougo/ddc-ui-native")
Plug("https://github.com/LumaKernel/ddc-source-file")
Plug("https://github.com/delphinus/ddc-source-tmux")
Plug("https://github.com/Shougo/ddc-source-lsp")
Plug("https://github.com/Shougo/ddc-filter-matcher_head")
Plug("https://github.com/Shougo/ddc-filter-sorter_rank")
Plug("https://github.com/matsui54/denops-popup-preview.vim")
Plug("https://github.com/ckipp01/stylua-nvim")

vim.call("plug#end")

vim.fn["ddc#custom#patch_global"]({
    ui = "native",
    sources = {
        "lsp",
        "file",
        "tmux",
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

vim.api.nvim_create_augroup("lua", {})
vim.api.nvim_create_autocmd("BufWritePre", {
    group = "lua",
    pattern = { "*.lua" },
    callback = function()
        require("stylua-nvim").format_file()
    end,
})
vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.clipboard:append("unnamedplus")
vim.opt.laststatus = 0
vim.g.mapleader = " "
vim.api.nvim_set_keymap("n", "<Leader>f", "<cmd>GFiles<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>F", "<cmd>Rg<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Tab>", "<cmd>bnext<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", "<cmd>bprevious<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-e>", "<cmd>Fern . -drawer -stay -toggle<CR>", { noremap = true })

require("bufferline").setup({})
require("gitsigns").setup()
require("mason").setup()
require("lspconfig").pyright.setup({})
