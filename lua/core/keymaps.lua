
------------------------
--  General Mappings  --
------------------------

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", {})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-----------------
-- Normal Mode --
-----------------
-- Mappings for splits
keymap("n", "<A-h>", "<C-w>h", {})
keymap("n", "<A-j>", "<C-w>j", {})
keymap("n", "<A-k>", "<C-w>k", {})
keymap("n", "<A-l>", "<C-w>l", {})

-- resize current buffer by +/- 5
keymap ("n", "<C-h>", ":vertical resize -5<cr>", {})
keymap ("n", "<C-j>", ":resize +5<cr>", {})
keymap ("n", "<C-k>", ":resize -5<cr>", {})
keymap ("n", "<C-l>", ":vertical resize +5<cr>", {})

-- Mappings for scrolling up And down
keymap ("n", "<A-k>", "<C-u>k", {})
keymap ("n", "<A-j>", "<C-d>j", {})

-- TAB SHIFT-TAB will go back
keymap("n", "<TAB>", ":bnext<CR>", {})
keymap("n", "<S-TAB>", ":bprevious<CR>", {})

-- Alternate way to save and quit nvim
keymap ("n", "<A-w>", ":w<CR>", {})
keymap ("n", "<A-q>", ":q<CR>", {})
keymap ("n", "<A-1>", ":q!<CR>",{})

-- Nvim Comment
keymap("n", "<leader>c", ":CommentToggle<CR>", {})          -- Comment One Line
keymap("x", "<leader>c", ":'<,'>CommentToggle<CR>", {})     -- Comment Multiple Lines In Visual Mode
keymap("n", "<leader>p", "vip:CommentToggle<CR>", {})       -- Comment A Paragraph

-- Better tabbing
keymap ("n", "<", "<gv", {})
keymap ("n", ">", ">gv", {})

-- Don't accidently create macros when trying to quit
keymap('n', 'Q', 'q', {})
keymap('n', 'q', '<nop>', {})

-- Preview Hunks With Git
keymap('n', "<leader>h", ":Gitsigns preview_hunk<CR>", {})

-- Toggle NvimTree
keymap("n", "<leader>n", ":NvimTreeToggle<CR>", {})

-- Terminal
keymap("n", "<leader>t", ":vnew term://zsh<CR>", {})

-- yank entire line
keymap ("n", "yie", ":<C-u>%y<CR>", {})

-- Packer Update
keymap("n", "<leader>u", ":PackerUpdate<CR>", {})

-- Packer Sync
keymap("n", "<leader>s", ":PackerSync<CR>", {})

-- Packer Install
keymap("n", "<leader>i", ":PackerInstall<CR>", {})

-- -- improve scroll
-- vim.cmd([[noremap <expr> <C-b> max([winheight(0) - 2, 1]) . "\<C-u>" . (line('.') < 1         + winheight(0) ? 'H' : 'L')
-- noremap <expr> <C-f> max([winheight(0) - 2, 1]) . "\<C-d>" . (line('.') > line('$') - winheight(0) ? 'L' : 'H')
-- noremap <expr> <C-y> (line('w0') <= 1         ? 'k' : "\<C-y>")
-- noremap <expr> <C-e> (line('w$') >= line('$') ? 'j' : "\<C-e>")
-- ]])

-- -- Mappings For Tabs
-- keymap ("n", "o<Leader>1", "<Plug>lightline#bufferline#go(1)", {})
-- keymap ("n", "o<Leader>2", "<Plug>lightline#bufferline#go(2)", {})
-- keymap ("n", "o<Leader>3", "<Plug>lightline#bufferline#go(3)", {})
-- keymap ("n", "o<Leader>4", "<Plug>lightline#bufferline#go(4)", {})
-- keymap ("n", "o<Leader>5", "<Plug>lightline#bufferline#go(5)", {})
-- keymap ("n", "o<Leader>6", "<Plug>lightline#bufferline#go(6)", {})
-- keymap ("n", "o<Leader>7", "<Plug>lightline#bufferline#go(7)", {})
-- keymap ("n", "o<Leader>8", "<Plug>lightline#bufferline#go(8)", {})
-- keymap ("n", "o<Leader>9", "<Plug>lightline#bufferline#go(9)", {})
-- keymap ("n", "o<Leader>0", "<Plug>lightline#bufferline#go(10)", {})

-----------------
-- Insert Mode --
-----------------
-- Map Escape Key To KJ
keymap("i", "kj", "<ESC>", {})

-- Fix One [Car] behind
keymap ("i", "<Esc>", "<Esc>`^", {})

-- center screen after search
vim.cmd([[
nnoremap n nzzzv
nnoremap N Nzzzv
]])

-- Auto Pairs
vim.cmd([[
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>0
inoremap {;<CR> {<CR>};<ESC>0
nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap " ""<left>
inoremap ' ''<left>
]])

-----------------
-- Visual Mode --
-----------------
-- Move Text Up And Down
vim.cmd([[
nnoremap <C-A-J> :m .+1<CR>==
nnoremap <C-A-K> :m .-2<CR>==
inoremap <C-A-J> <Esc>:m .+1<CR>==gi
inoremap <C-A-K> <Esc>:m .-2<CR>==gi
vnoremap <C-A-J> :m '>+1<CR>gv=gv
vnoremap <C-A-K> :m '<-2<CR>gv=gv
]])
