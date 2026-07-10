vim.g.mapleader = " "
vim.g.maplocalleader = " "

local set = vim.keymap.set

set('n', '<leader>s', '<cmd>w<CR>')

set('x', 'p', [["_dP]], { desc = "Paste without yanking" })
set({ 'n', 'v' }, 'd', [["_d]], { desc = "Delete without yanking" })

set('n', 'U', '<C-r>')
set('n', '<Esc>', '<cmd>nohlsearch<CR>', { silent = true })
set('n', 'j', 'gj', { noremap = true, silent = true })
set('n', 'k', 'gk', { noremap = true, silent = true })
set('n', '<leader>pv', '<cmd>Ex<CR>')
set('n', '<leader>q', '<cmd>q<CR>')

-- set('n', '<C-d>', '<C-d>zz', { noremap = true })
-- set('n', '<C-u>', '<C-u>zz', { noremap = true })

set("n", "n", "nzzzv", { desc = "Next search result cursor centered" })
set("n", "N", "Nzzzv", { desc = "Previous search result cursor centered" })

set('n', '<leader>rw', '<cmd>restart<CR>', { desc = "restart neovim" })

-- visual block mode
set("n", "<leader>v", "<C-v>", { desc = "Visual Block Mode" })

-- buffer movement
set('n', '<leader>nb', '<cmd>bn<CR>')
set('n', '<leader>pb', '<cmd>bp<CR>')
set('n', '<leader>cb', '<cmd>bd<CR>')

-- window management
set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })     -- split window vertically
set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })   -- split window horizontally
set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })      -- make split windows equal width & height
set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

set("v", "<", "<gv")
set("v", ">", ">gv")
