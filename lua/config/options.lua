local opt = vim.opt
local g = vim.g

opt.mouse = ""

g.netrw_banner = 0

opt.number = true
opt.relativenumber = true

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.wrap = false
opt.smartindent = true
opt.inccommand = "split"

opt.splitbelow = true
opt.splitright = true

opt.ignorecase = true
opt.smartcase = true
opt.laststatus = 3

opt.swapfile = false
opt.backup = false

opt.clipboard:append("unnamedplus")
opt.isfname:append("@-@")
opt.guicursor = ""
opt.scrolloff = 8

opt.signcolumn = "yes"

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
