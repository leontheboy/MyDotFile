-- leader key 为空格
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 本地变量
local map = vim.api.nvim_set_keymap
local opt = {
  noremap = true,
  silent = true
}
local opt2 = {noremap = true}

map("i", "kj", "<ESC>", opt)

-- ctrl u / ctrl + d  只移动9行，默认移动半屏
map("n", "<C-u>", "9k", opt)
map("n", "<C-d>", "9j", opt)
map("n", "<C-j>", "4j", opt)
map("n", "<C-k>", "4k", opt)

--=== Insert Mode ===
map("i", "<C-f>", "<C-R>=execute('norm! l')<CR>", opt)
map("i", "<C-b>", "<C-R>=execute('norm! h')<CR>", opt)
map("i", "<C-n>", "<C-R>=execute('norm! j')<CR>", opt)
map("i", "<C-p>", "<C-R>=execute('norm! k')<CR>", opt)
map("i", "<C-a>", "<ESC>I", opt)
map("i", "<C-e>", "<ESC>A", opt)
map("i", "<C-j>", "<C-R>=execute('norm! o')<CR>", opt)

--=== Command Mode ===
map("n", "<M-x>", ":", opt2)

-- === Visual Mode ===
-- 缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)

-- magic search
map("n", "/", "/\\v", { noremap = true , silent = false})
map("v", "/", "/\\v", { noremap = true , silent = false})

------------------------------------------------------------------
--File Manager Mapping
map("n", "<leader>fs", ":w<CR>", opt2)


--=== Buffer Window Tab Mapping ===
-- Buffer
map("n", "<leader>bd", ":bd<CR>", opt)
map("n", "<leader>bh", ":bprevious<CR>", opt)
map("n", "<leader>bl", ":bnext<CR>", opt)


-- Windows 分屏快捷键
map("n", "<leader>q", ":q<CR>", opt)
map("n", "<leader>Q", ":q!<CR>", opt2)

map("n", "<leader>wv", ":vsp<CR>", opt)
map("n", "<leader>ws", ":sp<CR>", opt)

-- 关闭当前
map("n", "<leader>wc", "<C-w>c", opt)
-- 关闭其他
map("n", "<leader>wo", "<C-w>o", opt) -- close others

-- 比例控制
map("n", "<leader>w<left>", ":vertical resize +20<CR>", opt)
map("n", "<leader>w<right>", ":vertical resize -20<CR>", opt)
map("n", "<leader>w=", "<C-w>=", opt)
map("n", "<leader>w<down>", ":resize +10<CR>", opt)
map("n", "<leader>w<up>", ":resize -10<CR>", opt)

-- hjkl 窗口之间跳转
map("n", "<leader>wh", "<C-w>h", opt)
map("n", "<leader>wj", "<C-w>j", opt)
map("n", "<leader>wk", "<C-w>k", opt)
map("n", "<leader>wl", "<C-w>l", opt)

-- Tab
map("n", "<leader><tab>n", ":tab split<CR>", opt)
map("n", "<leader><tab>h", ":tabnext<CR>", opt)
map("n", "<leader><tab>l", ":tabprevious<CR>", opt)

--------------------------------------------------------------------
-- 插件快捷键
-- NerdTree
map('n', '<leader>ft', ':NERDTreeToggle<CR>', opt)

-- bufferline 左右Tab切换
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
map("n", "<C-w>", ":bd<CR>", opt)

-- nvim-treesitter 代码格式化
--map("n", "<leader>i", "gg=G", opt)

-- Telescope
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
-- map("n", "<leader>f", ":Telescope find_files<CR>", opt)
map("n", "<leader>g", ":Telescope live_grep<CR>", opt)


local pluginKeys = {}

-- 代码注释插件
-- see ./lua/plugin-config/comment.lua
pluginKeys.comment = {
  toggler = {
    line = 'gcc',
    block = 'gbc',
  },
  opleader = {
    line = 'gc',
    bock = 'gb'
  }
}

-- ctrl + /
map("n", "<C-_>", "gcc", {noremap = false})
map("v", "<C-_>", "gcc", {noremap = false})

-- lsp 回调函数快捷键设置
pluginKeys.maplsp = function(mapbuf)
  -- rename
  mapbuf('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opt)
  -- code action
  mapbuf('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opt)

  -- go xx
  mapbuf('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
  mapbuf('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opt)
  mapbuf('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opt)
  mapbuf('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
  mapbuf('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opt)
  -- diagnostic
  mapbuf('n', 'go', '<cmd>lua vim.diagnostic.open_float()<CR>', opt)
  mapbuf('n', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opt)
  mapbuf('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opt)
  -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
  mapbuf('n', '<gk>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opt)
  -- leader + =
  mapbuf('n', '<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>', opt)
  -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
  -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end


return pluginKeys
