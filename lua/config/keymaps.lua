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

local opts = { noremap = true, silent = true }

local mappings = {
  -- Word Navigation
  { 'n', 'w', 'cursorWordPartRight' },
  { 'n', 'b', 'cursorWordPartLeft' },
  { 'v', 'w', 'cursorWordPartRightSelect' },
  { 'v', 'b', 'cursorWordPartLeftSelect' },

  -- Code Navigation
  { 'n', '<leader>gd', 'editor.action.revealDefinition' },
  { 'n', '<leader>gy', 'editor.action.goToTypeDefinition' },
  { 'n', '<leader>gi', 'editor.action.goToImplementation' },
  { 'n', '<leader>gr', 'editor.action.goToReferences' },
  { 'n', '<leader>gs', 'workbench.action.gotoSymbol' },
  { 'n', '<leader>gl', 'workbench.action.gotoLine' },
  { 'n', '<leader>nf', 'workbench.action.navigateForward' },
  { 'n', '<leader>nb', 'workbench.action.navigateBack' },
  { 'n', '<leader>je', 'workbench.action.navigateToLastEditLocation' },

  -- Quick Search & Peek Actions
  { 'n', '<leader>ss', 'workbench.action.showAllSymbols' },
  { 'n', '<leader>sa', 'workbench.action.showCommands' },
  { 'n', '<leader>sf', 'workbench.action.quickOpen' },
  { 'n', '<leader>vd', 'editor.action.peekDefinition' },
  { 'n', '<leader>vi', 'editor.action.peekImplementation' },
  { 'n', '<leader>vt', 'editor.action.peekTypeDefinition' },
  { 'n', '<leader>vh', 'editor.action.showHover' },
  { 'n', '<leader>fr', 'references-view.findReferences' },
  { 'n', '<leader>sr', 'editor.action.referenceSearch.trigger' },

  -- Find, Replace & Refactoring
  { 'n', '<leader>ff', 'actions.find' },
  { 'n', '<leader>fr', 'editor.action.startFindReplaceAction' },
  { 'n', '<leader>fg', 'workbench.action.findInFiles' },
  { 'n', '<leader>rg', 'workbench.action.replaceInFiles' },
  { 'n', '<leader>re', 'editor.action.rename' },
  { 'n', '<leader>rf', 'editor.action.refactor' },
  { 'n', '<leader>qf', 'editor.action.quickFix' },
  { 'n', '<leader>sg', 'editor.action.triggerSuggest' },

  -- Line Editing & Code Maintenance
  { 'n', '<leader>lu', 'editor.action.copyLinesUpAction' },
  { 'n', '<leader>ld', 'editor.action.copyLinesDownAction' },
  { 'n', '<leader>mu', 'editor.action.moveLinesUpAction' },
  { 'n', '<leader>md', 'editor.action.moveLinesDownAction' },
  { 'n', '<leader>fm', 'editor.action.formatDocument' },
  { 'n', '<leader>oi', 'editor.action.organizeImports' },
  { 'n', '<leader>en', 'editor.action.marker.next' },
  { 'n', '<leader>ep', 'editor.action.marker.prev' },

  -- File & Workspace Management
  { 'n', '<leader>cp', 'copyFilePath' },
  { 'n', '<leader>cr', 'copyRelativeFilePath' },
  { 'n', '<leader>rl', 'workbench.action.openRecent' },
  { 'n', '<leader>nf', 'workbench.action.files.newUntitledFile' },
  { 'n', '<leader>cf', 'workbench.action.closeActiveEditor' },
  { 'n', '<leader>fa', 'workbench.action.closeAllEditors' },
  { 'n', '<leader>of', 'workbench.action.files.openFile' },
  { 'n', '<leader>rw', 'workbench.action.reloadWindow' },
  { 'n', '<leader>os', 'workbench.action.openSettingsJson' },

  -- Window Management
  { 'n', '<leader>wv', 'workbench.action.splitEditor' },
  { 'n', '<leader>wh', 'workbench.action.splitEditorDown' },
  { 'n', '<leader>ww', 'workbench.action.joinTwoGroups' },
  { 'n', '<leader>wa', 'workbench.action.evenEditorWidths' },
}

for _, mapping in ipairs(mappings) do
  local mode, key, command = mapping[1], mapping[2], mapping[3]

  vim.keymap.set(mode, key, function() vim.fn.VSCodeNotify(command) end, opts)
end
