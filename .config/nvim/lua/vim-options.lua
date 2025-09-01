vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.updatetime = 50

-- General settings
vim.opt.wrap = false
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.autoread = true
vim.opt.mouse = "a"

-- Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Scrolling
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.opt.smoothscroll = true

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- UI
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.foldcolumn = "1"
vim.opt.cursorline = true
vim.opt.colorcolumn = "120"
vim.opt.winborder = "single" -- only in Neovim

-- Split windows
vim.o.splitright = true
vim.o.splitbelow = true

-- Spell checking
-- vim.opt.spell = true
-- vim.opt.spelllang = { "en" }

-- Netrw settings
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_altv = 0
-- vim.g.netrw_winsize = 25

-- displays white spaces before the first character in a row
-- vim.opt.list = true
-- vim.opt.listchars = { tab = ">-", trail = "·", lead = "·" }
