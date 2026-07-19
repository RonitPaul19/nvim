vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local set = vim.keymap.set

-- paste and delete without overwriting
set('x', 'p', [["_dP]], { desc = "Paste without yanking" })
set({ 'n', 'v' }, 'd', [["_d]], { desc = "Delete without yanking" })

-- save
set("n", "<leader>s", "<cmd>w<CR>")

-- redo
set("n", "U", "<C-r>")

-- clear search highlighting
set("n", "<Esc>", "<cmd>nohl<CR>")

-- skip folds (down, up)
vim.cmd('nmap j gj')
vim.cmd('nmap k gk')

-- center pageup and pagedown
set('n', '<C-d>', '<C-d>zz', { noremap = true })
set('n', '<C-u>', '<C-u>zz', { noremap = true })

-- centered n and N
set("n", "n", "nzzzv", { desc = "Next search result cursor centered" })
set("n", "N", "Nzzzv", { desc = "Previous search result cursor centered" })

-- visual block mode
set("n", "<leader>v", "<C-v>", { desc = "Visual Block Mode" })

-- indentation
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
  { 'n', 'gd', 'editor.action.revealDefinition' },
  { 'n', 'gy', 'editor.action.goToTypeDefinition' },
  { 'n', 'gi', 'editor.action.goToImplementation' },
  { 'n', 'gr', 'editor.action.goToReferences' },
  { 'n', '<leader>gs', 'workbench.action.gotoSymbol' },
  { 'n', '<leader>gl', 'workbench.action.gotoLine' },
  { 'n', '<leader>lel', 'workbench.action.navigateToLastEditLocation' },

  -- Quick Search & Peek Actions
  { 'n', '<leader>ss', 'workbench.action.showAllSymbols' },
  { 'n', '<leader>cp', 'workbench.action.showCommands' },
  { 'n', '<leader>pf', 'workbench.action.quickOpen' },
  { 'n', '<leader>vd', 'editor.action.peekDefinition' },
  { 'n', '<leader>vi', 'editor.action.peekImplementation' },
  { 'n', '<leader>vt', 'editor.action.peekTypeDefinition' },
  { 'n', 'gh', 'editor.action.showHover' },
  { 'n', '<leader>fr', 'references-view.findReferences' },
  { 'n', '<leader>sr', 'editor.action.referenceSearch.trigger' },

  -- Find, Replace & Refactoring
  { 'n', '<leader>ff', 'actions.find' },
  { 'n', '<leader>fra', 'editor.action.startFindReplaceAction' },
  { 'n', '<leader>pg', 'workbench.action.findInFiles' },
  { 'n', '<leader>rg', 'workbench.action.replaceInFiles' },
  { 'n', '<leader>re', 'editor.action.rename' },
  { 'n', '<leader>rf', 'editor.action.refactor' },
  { 'n', '<leader>qf', 'editor.action.quickFix' },
  { 'n', '<leader>sg', 'editor.action.triggerSuggest' },

  -- Line Editing & Code Maintenance
  { 'n', '<leader>cu', 'editor.action.copyLinesUpAction' },
  { 'n', '<leader>cd', 'editor.action.copyLinesDownAction' },
  { 'n', '<leader>mu', 'editor.action.moveLinesUpAction' },
  { 'n', '<leader>md', 'editor.action.moveLinesDownAction' },
  { 'n', '<leader>fc', 'editor.action.formatDocument' },
  { 'n', '<leader>oi', 'editor.action.organizeImports' },
  { 'n', '<leader>ne', 'editor.action.marker.next' },
  { 'n', '<leader>pe', 'editor.action.marker.prev' },

  -- File & Workspace Management
  { 'n', '<leader>rc', 'workbench.action.openRecent' },
  { 'n', '<leader>nf', 'workbench.action.files.newUntitledFile' },
  { 'n', '<leader>cf', 'workbench.action.closeActiveEditor' },
  { 'n', '<leader>ca', 'workbench.action.closeAllEditors' },
  { 'n', '<leader>of', 'workbench.action.files.openFile' },
  { 'n', '<leader>rw', 'workbench.action.reloadWindow' },
  { 'n', '<leader>os', 'workbench.action.openSettingsJson' },

  -- Open file explorer
  { 'n', '<leader>e', 'workbench.view.explorer'},

  -- run code
  { 'n', '<leader>r', 'code-runner.run' },

  -- Window Management
  { 'n', '<leader>sv', 'workbench.action.splitEditor' },
  { 'n', '<leader>sh', 'workbench.action.splitEditorDown' },
  { 'n', '<leader>sw', 'workbench.action.joinTwoGroups' },
  { 'n', '<leader>sa', 'workbench.action.evenEditorWidths' },
}

for _, mapping in ipairs(mappings) do
  local mode, key, command = mapping[1], mapping[2], mapping[3]

  vim.keymap.set(mode, key, function() vim.fn.VSCodeNotify(command) end, opts)
end
