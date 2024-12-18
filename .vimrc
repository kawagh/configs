set number
set hlsearch
set incsearch
set ignorecase
set smartcase
set tabstop=4
set shiftwidth=4
set expandtab "タブを空白文字に置き換え
set laststatus=2
set noswapfile
set wildmenu
set clipboard=unnamed,unnamedplus
set splitright
set splitbelow
set termwinkey=<C-k> "terminal-job modeで<C-w>を使う
set backspace=indent,eol,start
set autoindent

call plug#begin(expand('~/.vim/plugged'))
Plug 'tomasr/molokai'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
" Plug 'scrooloose/nerdtree'
Plug 'lambdalisue/vim-fern'
Plug 'machakann/vim-highlightedyank'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'mattn/vim-maketable'
Plug 'mattn/vim-sonictemplate'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'inside/vim-search-pulse'
Plug 'kawagh/popcontexts.vim'
Plug 'kawagh/somelines.vim'
Plug 'kawagh/ddc-myhandson'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'cohama/lexima.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'sqls-server/sqls.vim'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'vim-denops/denops.vim'
Plug 'Shougo/ddc.vim'
" ddc.ui
Plug 'Shougo/ddc-ui-native'
" ddc.filter
Plug 'Shougo/ddc-filter-matcher_head'
" ddc.sources
Plug 'shun/ddc-source-vim-lsp'
Plug 'delphinus/ddc-source-tmux'
Plug 'LumaKernel/ddc-source-file'
" ddc.sorters
Plug 'Shougo/ddc-filter-sorter_rank'
call plug#end()

call ddc#custom#patch_global('ui', 'native')
call ddc#custom#patch_global('sources', [
            \ 'vim-lsp',
            \ 'tmux',
            \ 'file',
            \ 'myhandson'
            \ ])

call ddc#custom#patch_global('sourceOptions', #{
            \   _: #{
            \     sorters: ['sorter_rank'],
            \   },
            \   vim-lsp: #{
            \     mark: '[LSP]',
            \     forceCompletionPattern: '\.\w*|:\w*|->\w*',
            \     matchers: ['matcher_head'],
            \   },
            \   tmux: #{
            \     mark: '[T]',
            \     matchers: ['matcher_head'],
            \   },
            \   file: #{
            \     mark: '[F]',
            \     forceCompletionPattern: "\\S/\\S*",
            \   },
            \ }
            \ )
call ddc#enable()

" psf/black
autocmd BufWritePost *.py silent! execute ':Black'

let mapleader="\<Space>"
nnoremap <ESC><ESC> :noh<CR>
nnoremap <silent> <C-p> :MarkdownPreviewToggle<CR>
" nnoremap <silent><C-e> :NERDTreeToggle<CR>
" nnoremap <leader>e :NERDTreeToggle %<CR>
nnoremap <silent>gd :LspDefinition<CR>
nnoremap <silent>gr :LspReferences<CR>
nnoremap <silent><C-e> :Fern . -drawer -stay -toggle<CR>
inoremap <Esc> <Esc> :call system('ibus engine "xkb:us::eng"')<CR>
nnoremap <silent> <leader>t :vert terminal<CR>
nnoremap <silent> <leader>j :terminal<CR>
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <leader>s :split<CR>
noremap <leader>v :vsplit<CR>
noremap <leader>f :Files<CR>
nnoremap <leader>c :Pctx<CR>
nnoremap <leader>S :Sisl<CR>
" 検索フォーカス
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <leader>l :ls<CR>:b
nnoremap <leader>n :bnext<CR>
nnoremap <leader>b :b#<CR>
nnoremap <leader>d :bdelete<CR>
nnoremap x "_x
vnoremap x "_x
vnoremap < <gv
vnoremap > >gv

colorscheme molokai
hi MatchParen ctermbg=none ctermfg=208
let g:airline_theme = 'badwolf'
let g:airline_section_b = airline#section#create([])
let g:airline_section_x = airline#section#create([])
let g:airline_section_y = airline#section#create([])
let g:airline_section_z = airline#section#create([])
let g:airline#extensions#tabline#enabled = 1

let g:lsp_diagnostics_virtual_text_enabled = 0
" let g:lsp_diagnostics_virtual_text_align = "after"
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_signs_enabled = 0

let g:sonictemplate_vim_template_dir = [
      \ '~/templates'
      \]
