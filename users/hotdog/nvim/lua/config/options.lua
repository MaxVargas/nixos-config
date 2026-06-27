-- Options are automatically loaded before lazy.nvim startup
-- Think about looking here for some options: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

vim.cmd("colorscheme melange")

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.linebreak = true
vim.opt.showbreak = "++++"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

--vim.cmd("set vb t_vb=[?5h$<100>[?5]")
vim.opt.visualbell = true
vim.opt.textwidth = 120
vim.opt.showmatch = true
vim.opt.matchtime = 3
vim.opt.termguicolors = true

vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99
vim.opt.smartindent = true

vim.opt.smoothscroll = true
vim.opt.splitright = true
vim.opt.splitbelow = false

vim.cmd("iabbrev teh the") -- use iabbrev for just insert mode. abbreviate for insert and command-line
vim.cmd("iabbrev hellp hello")

-- Markdown recommended settings
vim.g.markdown_recommended_style = 0

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

