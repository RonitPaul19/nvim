vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Save
vim.keymap.set("n", "<leader>s", "<cmd>w<CR>")

-- Delete and paste without yanking
vim.keymap.set("x", "p", [["_dP]], { desc = "Paste without yanking" })
vim.keymap.set({ "n", "v" }, "d", [["_d]], { desc = "Delete without yanking" })

-- Redo
vim.keymap.set("n", "U", "<C-r>")

-- nohl
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true })

-- skip folds
vim.keymap.set("n", "j", "gj", { noremap = true, silent = true })
vim.keymap.set("n", "k", "gk", { noremap = true, silent = true })

-- quit
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>")
vim.keymap.set("n", "<leader>qq", "<cmd>q!<CR>")

-- centered page up-down
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })

-- centered next and Previous search
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result cursor centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result cursor centered" })

-- restart neovim
vim.keymap.set("n", "<leader>rw", "<cmd>restart<CR>", { desc = "restart neovim" })

-- visual block mode
vim.keymap.set("n", "<leader>v", "<C-v>", { desc = "Visual Block Mode" })

-- buffer movement
vim.keymap.set("n", "<leader>nb", "<cmd>bn<CR>")
vim.keymap.set("n", "<leader>pb", "<cmd>bp<CR>")
vim.keymap.set("n", "<leader>cb", "<cmd>bd<CR>")

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- Creating indents
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- moving blocks up-down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep the cursor at the same position while joining lines
vim.keymap.set("n", "J", "mzJ`z")
