vim.keymap.set('n', '<leader>s', '<cmd>w<CR>')
vim.keymap.set('n', '\'', ';')
vim.keymap.set('v', 'p', 'P')
vim.keymap.set('n', 'U', '<C-r>')
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { silent = true })
vim.keymap.set('n', 'j', 'gj', { noremap = true, silent = true })
vim.keymap.set('n', 'k', 'gk', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>pv', '<cmd>Ex<CR>')
vim.keymap.set('n', '<leader>q', '<cmd>q<CR>')

-- buffer movement
vim.keymap.set('n', '<leader>nb', '<cmd>bn<CR>')
vim.keymap.set('n', '<leader>pb', '<cmd>bp<CR>')
vim.keymap.set('n', '<leader>cb', '<cmd>bd<CR>')


-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })     -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })   -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })      -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
