vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.o.number = true
vim.o.relativenumber = true

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

vim.diagnostic.config({ severity_sort = true })

-- Split windows
vim.o.splitright = true
vim.o.splitbelow = true
