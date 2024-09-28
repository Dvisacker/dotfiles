-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = { noremap = true, silent = true }

-- Set leader key
vim.g.mapleader = " "

-- Escape mappings
vim.keymap.set("i", "kj", "<ESC>", opts)
vim.keymap.set("i", "jk", "<ESC>", opts)
vim.keymap.set("i", "<ESC>", "<nop>", opts)

-- Split window
vim.keymap.set("n", "ss", ":split<CR><C-w>w", opts)
vim.keymap.set("n", "sv", ":vsplit<CR><C-w>w", opts)

-- Move between windows
vim.keymap.set("n", "<space>", "<c-w>w", opts)
vim.keymap.set("n", "sh", "<c-w>h", opts)
vim.keymap.set("n", "sk", "<c-w>k", opts)
vim.keymap.set("n", "sj", "<c-w>j", opts)
vim.keymap.set("n", "sl", "<c-w>l", opts)

-- Disable space in normal mode
vim.keymap.set("n", "<SPACE>", "<Nop>", opts)

-- Custom movement
vim.keymap.set("n", "J", "5j", opts)
vim.keymap.set("n", "K", "5k", opts)
vim.keymap.set("n", "vA", "ggVG", opts)
vim.keymap.set("n", "B", "^", opts)
vim.keymap.set("n", "E", "$", opts)

-- FZF mappings
vim.keymap.set("n", "<leader>p", ":FZF<CR>", opts)
vim.keymap.set("n", "<leader><tab>", "<plug>(fzf-maps-n)", {})
vim.keymap.set("x", "<leader><tab>", "<plug>(fzf-maps-x)", {})
vim.keymap.set("o", "<leader><tab>", "<plug>(fzf-maps-o)", {})

-- Resize windows
vim.keymap.set("n", "<leader>=", ":lua vim.wo.winheight = vim.wo.winheight * 3/2<CR>", opts)
vim.keymap.set("n", "<leader>-", ":lua vim.wo.winheight = vim.wo.winheight * 2/3<CR>", opts)

-- Clipboard operations
vim.keymap.set("v", "<Leader>a", '"ay', opts)
vim.keymap.set("v", "<Leader>A", '"Ay', opts)
vim.keymap.set("n", "<Leader>a", '"ap', opts)

-- Execute current line in shell
vim.keymap.set("n", "<leader><Enter>", "!!zsh<CR>", opts)

-- FZF completion in insert mode
vim.keymap.set("i", "<c-x><c-k>", "<plug>(fzf-complete-word)", {})
vim.keymap.set("i", "<c-x><c-f>", "<plug>(fzf-complete-path)", {})
vim.keymap.set("i", "<c-x><c-l>", "<plug>(fzf-complete-line)", {})

-- Move between windows with control-j,k,h,l
vim.keymap.set("n", "<C-j>", "<C-W>j", opts)
vim.keymap.set("n", "<C-k>", "<C-W>k", opts)
vim.keymap.set("n", "<C-h>", "<C-W>h", opts)
vim.keymap.set("n", "<C-l>", "<C-W>l", opts)

-- Terminal mappings
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", opts)
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", opts)
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", opts)
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", opts)
vim.keymap.set("t", "kj", "<C-\\><C-n>", opts)
vim.keymap.set("t", "jk", "<C-\\><C-n>", opts)

-- Tab operations
vim.keymap.set("n", "<C-t>", ":tabnew<cr>", opts)
vim.keymap.set("n", "<C-x>", ":tabclose<cr>", opts)

-- Buffer navigation
vim.keymap.set("n", "<tab>", ":if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>", opts)
vim.keymap.set(
  "n",
  "<s-tab>",
  ":if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>",
  opts
)

-- Search for visually selected text
vim.keymap.set("v", "//", "y/\\V<C-R>=escape(@\", '/\\')<CR><CR>", opts)

-- Execute visually selected text in shell
vim.keymap.set("v", "<C-s>", "y:! <C-r>0<Home><right>", opts)

-- Keep search results at the center of screen
vim.keymap.set("n", "n", "nzz", opts)
vim.keymap.set("n", "N", "Nzz", opts)
vim.keymap.set("n", "*", "*zz", opts)
vim.keymap.set("n", "#", "#zz", opts)
vim.keymap.set("n", "g*", "g*zz", opts)
vim.keymap.set("n", "g#", "g#zz", opts)
