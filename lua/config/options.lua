vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_matchit = 1

vim.opt.termguicolors = true

vim.opt.shell = "pwsh.exe"
vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
vim.opt.shellquote = ""
vim.opt.shellxquote = ""

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 10

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.inccommand = "split"

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.laststatus = 3
vim.opt.ruler = false
vim.opt.showcmd = false
vim.opt.cmdheight = 1

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.clipboard:append("unnamedplus")
vim.opt.isfname:append("@-@")
-- vim.opt.guicursor = ""

vim.opt.signcolumn = "yes"

vim.opt.updatetime = 300
vim.opt.timeoutlen = 400

vim.opt.completeopt = { "menuone", "noselect" }

vim.api.nvim_set_hl(0, "YankHighlight", { bg = "#5f2fa4" })

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({
			higroup = "YankHighlight",
			timeout = 200,
		})
	end,
})

vim.opt.fillchars = {
	eob = " ",
}

vim.opt.smoothscroll = true

vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("state") .. "/undo"
