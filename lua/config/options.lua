local opt = vim.opt

opt.termguicolors = true

opt.number = true
opt.relativenumber = true
opt.cursorline = false
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 10

opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

opt.inccommand = "split"

opt.cmdheight = 1

opt.splitbelow = true
opt.splitright = true

opt.laststatus = 3

opt.swapfile = false
opt.backup = false

opt.clipboard:append("unnamedplus")
opt.isfname:append("@-@")
-- opt.guicursor = ""

opt.signcolumn = "no"

opt.updatetime = 250
opt.timeoutlen = 300

opt.completeopt = { "menuone", "noselect" }

vim.api.nvim_set_hl(0, "YankHighlight", { bg = "#5f2fa4" })

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({
      higroup = "YankHighlight",
      timeout = 200,
    })
  end,
})
