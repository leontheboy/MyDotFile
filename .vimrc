""Personal Config
set nu
set nocompatible

set autoindent
set smartindent
set cindent
set backspace=indent,eol,start

set softtabstop=4 "缩进长度
set shiftwidth=4 "缩进长度
set tabstop=4 "tab键长度
set expandtab "tab设为空格
set softtabstop=4 "缩进长度

set wildmenu

set ttyfast
set lazyredraw

"the cursor can move to the end of the line
set ve+=onemore

set mouse=r
set whichwrap=b,s,<,>,[,] " 光标从行首和行末时可以跳到另一行去
"set scrolloff=3 "光标移动到上下两端,保持3行距离

"set termguicolors
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

syntax enable

set cursorline
set ignorecase
set smartcase

set backupdir=~/.vim/backup/


" TextEdit might fail if hidden is not set.
set hidden

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
else
    set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" === === Personal Mapping === === "
let mapleader = "\<space>"
imap kj <ESC>
nnoremap <leader>, <HOME>
nnoremap <leader>. <END>l

inoremap <silent><C-f> <C-R>=execute('norm! l')<CR>
inoremap <silent><C-b> <C-R>=execute('norm! h')<CR>
inoremap <silent><C-n> <C-R>=execute('norm! j')<CR>
inoremap <silent><C-p> <C-R>=execute('norm! k')<CR>
inoremap <silent><C-a> <C-R>=execute('norm! ^')<CR>
inoremap <silent><C-e> <C-R>=execute('norm! $l')<CR>
inoremap <silent><C-j> <C-R>=execute('norm! o')<CR>

"Command Mode Cursor Movement
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-w> <S-Right>

nmap <leader>rc :e $HOME/.vimrc<CR>

nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gt <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)

"File Manager Mapping
nnoremap <silent> <leader>ft :NERDTreeToggle<cr>
nnoremap <leader>fs :w<CR>

"Buffer Window Tab Mapping
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q!<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <leader>bh :bprevious<CR>
nnoremap <leader>bl :bnext<CR>

nnoremap <leader>wj <C-W><C-J>
nnoremap <leader>wk <C-W><C-K>
nnoremap <leader>wl <C-W><C-L>
nnoremap <leader>wh <C-W><C-H>
nnoremap <leader>ws :sp<CR>
nnoremap <leader>wv :vs<CR>
nnoremap <leader>wo <C-W>o

nnoremap <leader><tab>n :tab split<CR>
nnoremap <leader><tab>h :tabnext<CR>
nnoremap <leader><tab>l :tabprevious<CR>

"=== === Plug Config === ==="
let NERDTreeShowHidden=1
highlight NERDTreeFile ctermfg=14

let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
let g:EasyMotion_smartcase = 1
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:tmuxcomplete#trigger = 'completefunc'

let g:snips_author = 'Leon'

set background=dark
colorscheme deus

"Snippets Config
inoremap <silent><expr> <TAB>
            \ pumvisible() ? coc#_select_confirm() :
            \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()

let g:coc_snippet_next = '<tab>'

call plug#begin()
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'skywind3000/vim-terminal-help'
Plug 'jiangmiao/auto-pairs'
Plug 'chiel92/vim-autoformat'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
Plug 'rrethy/vim-illuminate'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ajmwagar/vim-deus'
Plug 'liuchengxu/eleline.vim'
Plug 'ryanoasis/vim-devicons'

Plug 'yggdroot/indentline'
Plug 'liuchengxu/vim-which-key'
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'honza/vim-snippets'
Plug 'wellle/tmux-complete.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
            \ 'coc-snippets',
            \ 'coc-prettier',
            \ 'coc-json',
            \ 'coc-vimlsp',
            \ 'coc-translator'
            \ ]
call plug#end()

function! SetPluginOptions()
    "vim-airline
    if exists(":AirlineExtensions")
        :execute "AirlineTheme deus"
    endif

    "fzf.vim"
    if exists(":FZF")
        nnoremap <silent> <leader>ff :FZF<CR>
    endif
    "Rg
    if exists(":Rg")
        nnoremap <silent> <leader>fr :Rg<CR>
    endif

    "autoformat"
    if exists(":Autoformat")
        nnoremap <leader>af :Autoformat<CR>
    endif

    "coc-translation
    nmap <Leader>tt <Plug>(coc-translator-p)
    vmap <Leader>tt <Plug>(coc-translator-pv)

    "vim-easymotion
    nmap <leader>j <Plug>(easymotion-s2)
endfunction

autocmd VimEnter * call SetPluginOptions()
autocmd BufWritePost $MYVIMRC source $MYVIMRC
