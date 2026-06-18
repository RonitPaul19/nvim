vim.g.mapleader = " "

vim.keymap.set('n', '<leader>s', '<cmd>w<CR>')
vim.keymap.set('x', 'p', [["_dP]])
vim.keymap.set('n', 'U', '<C-r>')
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { silent = true })
vim.keymap.set('n', 'j', 'gj', { noremap = true, silent = true })
vim.keymap.set('n', 'k', 'gk', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>v", "<C-v>", { desc = "Visual Block Mode" })

local opts = { noremap = true, silent = true }
local mappings = {
  -- word navigation
  { 'n', 'w',           'cursorWordPartRight' },
  { 'n', 'b',           'cursorWordPartLeft' },
  { 'v', 'w',           'cursorWordPartRightSelect' },
  { 'v', 'b',           'cursorWordPartLeftSelect' },

  -- Code Navigation
  { 'n', 'gd',          'editor.action.revealDefinition' },
  { 'n', 'gi',          'editor.action.goToDeclaration' },
  { 'n', 'gr',          'editor.action.goToReferences' },
  { 'n', '<leader>gs',  'workbench.action.gotoSymbol' },
  { 'n', '<leader>gl',  'workbench.action.gotoLine' },
  { 'n', '<leader>lel', 'workbench.action.navigateToLastEditLocation' },

  -- Quick Search & Peek Actions
  { 'n', '<leader>ss',  'workbench.action.showAllSymbols' },
  { 'n', '<leader>cp',  'workbench.action.showCommands' },
  { 'n', '<leader>pf',  'workbench.action.quickOpen' },
  { 'n', '<leader>vd',  'editor.action.peekDefinition' },
  { 'n', '<leader>vi',  'editor.action.peekImplementation' },
  { 'n', '<leader>vt',  'editor.action.peekTypeDefinition' },
  { 'n', 'gh',          'editor.action.showHover' },
  { 'n', '<leader>fr',  'references-view.findReferences' },
  { 'n', '<leader>sr',  'editor.action.referenceSearch.trigger' },

  -- Find, Replace & Refactoring
  { 'n', '<leader>ff',  'actions.find' },
  { 'n', '<leader>fra', 'editor.action.startFindReplaceAction' },
  { 'n', '<leader>pg',  'workbench.action.findInFiles' },
  { 'n', '<leader>rg',  'workbench.action.replaceInFiles' },
  { 'n', '<leader>re',  'editor.action.rename' },
  { 'n', '<leader>rf',  'editor.action.refactor' },
  { 'n', '<leader>qf',  'editor.action.quickFix' },
  { 'n', '<leader>sg',  'editor.action.triggerSuggest' },

  -- Line Editing & Code Maintenance
  { 'n', '<leader>lu',  'editor.action.copyLinesUpAction' },
  { 'n', '<leader>ld',  'editor.action.copyLinesDownAction' },
  { 'n', '<leader>mu',  'editor.action.moveLinesUpAction' },
  { 'n', '<leader>md',  'editor.action.moveLinesDownAction' },
  { 'n', '<leader>fc',  'editor.action.formatDocument' },
  { 'n', '<leader>oi',  'editor.action.organizeImports' },

  -- File & Workspace Management
  { 'n', '<leader>rc',  'workbench.action.openRecent' },
  { 'n', '<leader>cf',  'workbench.action.closeActiveEditor' },
  { 'n', '<leader>fa',  'workbench.action.closeAllEditors' },
  { 'n', '<leader>of',  'workbench.action.files.openFile' },
  { 'n', '<leader>rw',  'workbench.action.reloadWindow' },
  { 'n', '<leader>os',  'workbench.action.openSettingsJson' },

  -- Window Management
  { 'n', '<leader>sv',  'workbench.action.splitEditor' },
  { 'n', '<leader>sh',  'workbench.action.splitEditorDown' },
  { 'n', '<leader>sj',  'workbench.action.joinTwoGroups' },
  { 'n', '<leader>se',  'workbench.action.evenEditorWidths' },

  -- open file explorer
  { 'n', '<leader>e',   'workbench.view.explorer' },

  -- code-runner
  { 'n', '<leader>r',   'code-runner.run' },
}
for _, mapping in ipairs(mappings) do
  local mode, key, command = mapping[1], mapping[2], mapping[3]

  vim.keymap.set(mode, key, function() vim.fn.VSCodeNotify(command) end, opts)
end
