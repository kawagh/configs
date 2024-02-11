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
set clipboard=unnamedplus
set splitright
set splitbelow
set termwinkey=<C-k> "terminal-job modeで<C-w>を使う
set backspace=indent,eol,start

call plug#begin(expand('~/.vim/plugged'))
Plug 'tomasr/molokai'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'machakann/vim-highlightedyank'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'mattn/vim-maketable'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'inside/vim-search-pulse'
Plug 'kawagh/popcontexts.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'cohama/lexima.vim'
call plug#end()

colorscheme molokai

let mapleader="\<Space>"
nnoremap <ESC><ESC> :noh<CR>
nnoremap <silent> <C-p> :MarkdownPreviewToggle<CR>
nnoremap <silent><C-e> :NERDTreeToggle<CR>
nnoremap <leader>e :NERDTreeToggle %<CR>
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

let g:airline_theme = 'badwolf'
let g:airline_section_x = airline#section#create([])
let g:airline_section_y = airline#section#create([])
let g:airline_section_z = airline#section#create([])
let g:airline#extensions#tabline#enabled = 1
