vim.g.mapleader = " "

local o = vim.opt
o.number = true
o.relativenumber = true
o.expandtab = true
o.shiftwidth = 4
o.tabstop = 4
o.ignorecase = true
o.smartcase = true
o.termguicolors = true
o.scrolloff = 8
o.undofile = true
o.signcolumn = "yes"

vim.keymap.set("n", "<leader>w", "<cmd>write<cr>")
vim.keymap.set("n", "<leader>q", "<cmd>quit<cr>")
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>")
