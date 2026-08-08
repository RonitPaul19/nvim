vim.g.mapleader = " "
vim.g.maplocalleader = " "

local set = vim.keymap.set

-- Save
set("n", "<leader>s", "<cmd>w<CR>")

-- Delete and paste without yanking
set("x", "p", [["_dP]], { desc = "Paste without yanking" })
set({ "n", "v" }, "d", [["_d]], { desc = "Delete without yanking" })

-- Redo
set("n", "U", "<C-r>")

-- nohl
set("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true })

-- skip folds
set("n", "j", "gj", { noremap = true, silent = true })
set("n", "k", "gk", { noremap = true, silent = true })

-- quit
set("n", "<leader>q", "<cmd>q<CR>")
set("n", "<leader>qq", "<cmd>q!<CR>")

-- centered page up-down
set("n", "<C-d>", "<C-d>zz", { noremap = true })
set("n", "<C-u>", "<C-u>zz", { noremap = true })

-- centered next and Previous search
set("n", "n", "nzzzv", { desc = "Next search result cursor centered" })
set("n", "N", "Nzzzv", { desc = "Previous search result cursor centered" })

-- restart neovim
set("n", "<leader>rw", "<cmd>restart<CR>", { desc = "restart neovim" })

-- visual block mode
set("n", "<leader>v", "<C-v>", { desc = "Visual Block Mode" })

-- buffer movement
set("n", "<leader>nb", "<cmd>bn<CR>")
set("n", "<leader>pb", "<cmd>bp<CR>")
set("n", "<leader>cb", "<cmd>bd<CR>")

-- window management
set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- Moving between splits
set("n", "<C-h>", "<C-w>h")
set("n", "<C-j>", "<C-w>j")
set("n", "<C-k>", "<C-w>k")
set("n", "<C-l>", "<C-w>l")

-- Creating indents
set("v", "<", "<gv")
set("v", ">", ">gv")

-- moving blocks up-down
set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

-- keep the cursor at the same position while joining lines
vim.keymap.set("n", "J", "mzJ`z")
