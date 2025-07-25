vim.opt.termguicolors = true
vim.opt.updatetime = 50
vim.opt.swapfile = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.wrap = false
vim.opt.smartindent = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.foldcolumn = "1"

vim.o.ignorecase = true
vim.o.smartcase = true

vim.opt.smoothscroll = true
vim.opt.cursorline = true
vim.opt.colorcolumn = "120"

vim.opt.mouse = "a"

vim.opt.spell = true
vim.opt.spelllang = { "en" }

-- Highlight Search term
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.wo.number = true
vim.wo.relativenumber = true

-- displays white spaces before the first characted in a row
-- vim.opt.list = true
-- vim.opt.listchars = { tab = ">-", trail = "·", lead = "·" }

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_altv = 0
-- vim.g.netrw_winsize = 25

vim.o.splitright = true -- Vertical splits go to the right
vim.o.splitbelow = true -- Horizontal splits go down
