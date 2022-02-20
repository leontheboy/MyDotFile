lua require('basic')
lua require('keybindings')

"" === Plugins ===
call plug#begin()

Plug 'glepnir/zephyr-nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'liuchengxu/eleline.vim'
Plug 'tpope/vim-surround'

"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'akinsho/bufferline.nvim'

Plug 'numToStr/Comment.nvim'
Plug 'windwp/nvim-autopairs'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
            \ 'coc-snippets',
            \ 'coc-prettier',
            \ 'coc-json',
            \ 'coc-vimlsp',
            \ 'coc-translator'
            \ ]

call plug#end()

"coc-translation
nmap <leader>tt <Plug>(coc-translator-p)
vmap <leader>tt <Plug>(coc-translator-pv)

lua require('plugin-config/bufferline')
lua require('plugin-config/comment')
lua require('plugin-config/nvim-autopairs')

" 皮肤设置
" https://github.com/ellisonleao/gruvbox.nvim
set background=dark " or light if you want light mode
colorscheme zephyr
